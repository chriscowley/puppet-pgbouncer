require 'spec_helper'

describe 'pgbouncer' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "pgbouncer class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('pgbouncer::params') }
          it { is_expected.to contain_class('pgbouncer::install').that_comes_before('pgbouncer::config') }
          it { is_expected.to contain_class('pgbouncer::config') }
          it { is_expected.to contain_class('pgbouncer::service').that_subscribes_to('pgbouncer::config') }

          it { is_expected.to contain_service('pgbouncer') }
          it { is_expected.to contain_package('pgbouncer').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'pgbouncer class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('pgbouncer') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end

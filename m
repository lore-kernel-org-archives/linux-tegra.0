From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Add NVIDIA Jetson Nano Developer Kit support
Date: Tue, 19 Mar 2019 10:16:49 +0000
Message-ID: <2b4ec55b-d9f3-3c09-5590-f586609f0b3e@nvidia.com>
References: <20190318232313.24270-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190318232313.24270-1-thierry.reding@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 18/03/2019 23:23, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Jetson Nano Developer Kit is a Tegra X1 based development board. It
> is similar to Jetson TX1 but it is not pin compatible. It features 4 GB
> of LPDDR4, an SPI NOR flash for early boot firmware and an SD card slot
> used for storage.
> 
> HDMI 2.0 or DP 1.2 are available for display, four USB ports (3 USB 2.0
> and 1 USB 3.0) can be used to attach a variety of peripherals and a PCI
> Ethernet controller provides onboard network connectivity.
> 
> A 40-pin header on the board can be used to extend the capabilities and
> exposed interfaces of the Jetson Nano.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> This patch, along with some related patches can be found in the p3450
> branch in the following repository:
> 
> 	https://github.com/thierryreding/linux
> 
>  arch/arm64/boot/dts/nvidia/Makefile           |    1 +
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 1911 +++++++++++++++++
>  2 files changed, 1912 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> 
> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
> index 6b8ab5568481..bcd018c3162b 100644
> --- a/arch/arm64/boot/dts/nvidia/Makefile
> +++ b/arch/arm64/boot/dts/nvidia/Makefile
> @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-2180.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2571.dtb
> +dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p3450-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-smaug.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2894-0050-a08.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p2771-0000.dtb
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> new file mode 100644
> index 000000000000..b1d8a49ca8c4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -0,0 +1,1911 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/mfd/max77620.h>
> +
> +#include "tegra210.dtsi"
> +
> +/ {
> +	model = "NVIDIA Jetson Nano Developer Kit";
> +	compatible = "nvidia,p3450-0000", "nvidia,tegra210";

I am just curious but any reason why we do not have a dtsi file for the
Nano module that we include for the developer kit? Or is there no point
because the module and kit will never be separate in this case?

The developer kit user guide lists both the module (p3448) and carrier
board (p3449) and so was just curious.

> +
> +	aliases {
> +		ethernet = "/pcie@1003000/pci@2,0/ethernet@0,0";
> +		rtc0 = "/i2c@7000d000/pmic@3c";
> +		rtc1 = "/rtc@7000e000";
> +		serial0 = &uarta;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x1 0x0>;
> +	};
> +
> +	pcie@1003000 {
> +		status = "okay";
> +
> +		hvddio-pex-supply = <&vdd_1v8>;
> +		dvddio-pex-supply = <&vdd_pex_1v05>;
> +		vddio-pex-ctl-supply = <&vdd_1v8>;
> +
> +		pci@1,0 {
> +			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-1}>,
> +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>,
> +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-3}>,
> +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
> +			phy-names = "pcie-0", "pcie-1", "pcie-2", "pcie-3";
> +			nvidia,num-lanes = <4>;
> +			status = "okay";
> +		};
> +
> +		pci@2,0 {
> +			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>;
> +			phy-names = "pcie-0";
> +			status = "okay";
> +
> +			ethernet@0,0 {
> +				reg = <0x000000 0 0 0 0>;
> +				mac-address = [ 00 00 00 00 00 00 ];
> +			};
> +		};
> +	};
> +
> +	host1x@50000000 {
> +		dpaux@54040000 {
> +			status = "okay";
> +		};
> +
> +		sor@54580000 {
> +			status = "okay";
> +
> +			avdd-io-supply = <&avdd_1v05>;
> +			vdd-pll-supply = <&vdd_1v8>;
> +			hdmi-supply = <&vdd_hdmi>;
> +
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(CC, 1)
> +					   GPIO_ACTIVE_LOW>;
> +			nvidia,xbar-cfg = <0 1 2 3 4>;
> +		};
> +	};
> +
> +	gpu@57000000 {
> +		vdd-supply = <&vdd_gpu>;
> +		status = "okay";
> +	};
> +
> +	pinmux: pinmux@700008d4 {
> +		pinctrl-names = "boot";
> +		pinctrl-0 = <&state_boot>;
> +
> +		state_boot: pinmux {
> +			pex_l0_rst_n_pa0 {
> +				nvidia,pins = "pex_l0_rst_n_pa0";
> +				nvidia,function = "pe0";
> +				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
> +				nvidia,io-hv = <TEGRA_PIN_DISABLE>;
> +			};
> +			pex_l0_clkreq_n_pa1 {
> +				nvidia,pins = "pex_l0_clkreq_n_pa1";
> +				nvidia,function = "pe0";
> +				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
> +				nvidia,io-hv = <TEGRA_PIN_DISABLE>;
> +			};
> +			pex_wake_n_pa2 {
> +				nvidia,pins = "pex_wake_n_pa2";
> +				nvidia,function = "pe";
> +				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
> +				nvidia,io-hv = <TEGRA_PIN_DISABLE>;
> +			};
> +			pex_l1_rst_n_pa3 {
> +				nvidia,pins = "pex_l1_rst_n_pa3";
> +				nvidia,function = "pe1";
> +				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
> +				nvidia,io-hv = <TEGRA_PIN_DISABLE>;
> +			};
> +			pex_l1_clkreq_n_pa4 {
> +				nvidia,pins = "pex_l1_clkreq_n_pa4";
> +				nvidia,function = "pe1";
> +				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
> +				nvidia,io-hv = <TEGRA_PIN_DISABLE>;
> +			};
> +			sata_led_active_pa5 {
> +				nvidia,pins = "sata_led_active_pa5";
> +				nvidia,pull = <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
> +			};
> +			pa6 {
> +				nvidia,pins = "pa6";
> +				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
> +			};
> +			dap1_fs_pb0 {
> +				nvidia,pins = "dap1_fs_pb0";
> +				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				nvidia,open-drain = <TEGRA_PIN_DISABLE>;

I am guessing this is generated by the pinmux spreadsheet, but any
reason why there is no 'nvidia,function' for some pins? Some that are
not used have the function defined as 'rsvd1', however, the above pin
does not, but AFAIK it is not used.

Otherwise looks good to me!

Cheers
Jon

-- 
nvpublic

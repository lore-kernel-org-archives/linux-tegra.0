From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: pcie: Enable PCIe controller on Cardhu
Date: Wed, 08 May 2013 11:04:22 -0600
Message-ID: <518A8596.7070702@wwwdotorg.org>
References: <1368010660-31465-1-git-send-email-jagarwal@nvidia.com> <1368010660-31465-4-git-send-email-jagarwal@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368010660-31465-4-git-send-email-jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/08/2013 04:57 AM, Jay Agarwal wrote:
> - Enable PCIe controller on Cardhu
> - Only port 2 is connected on this board
> - Add regulators required for Tegra30
> - Patch is based on remotes/gitorious_thierryreding_linux/tegra/next
> - and should be applied on top of this.

> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi

> +	pcie-controller {
> +		status = "okay";
> +		pex-clk-supply = <&pex_hvdd_3v3_reg>;
> +		vdd-supply = <&ldo1_reg>;
> +		avdd-supply = <&ldo2_reg>;
> +
> +		pci@3,0 {
> +			status = "okay";
> +		};
> +	};

So, if I apply this series, I do see the PCIe bridge and Ethernet device
get enumerated, but I don't see the USB3 controller get enumerated. I
believe that is a PCIe device behind the same bridge on the same Tegra
PCIe port. Shouldn't this device show up?

The Ethernet interface gets an IP address by DHCP, so some amount of
data must be flowing. However, I cannot ping anything. If I run the same
kernel on a Tegra20 TrimSlice board, which has the same Ethernet chip,
then everything works as expected. Have you fully tested network
connectivity with these patches applied? Perhaps this is related to the
next problem:

According to the Cardhu schematics, the PCIe link to the dock is a
single lane. Hence, I believe that the Cardhu DT should describe a 411
port configuration. However, the Cardhu DT doesn't describe any
particular link configuration, but just inherits the default from
tegra30.dtsi, which describes a 222 link configuration. I would have
expected the following in the Cardhu DT:

		pci@1,0 {
			nvidia,num-lanes = <4>;
		};

		pci@2,0 {
			nvidia,num-lanes = <1>;
		};

		pci@3,0 {
			status = "okay";
			nvidia,num-lanes = <1>;
		};

However, if I put that there, no PCIe links are detected at all. Why
does the driver work with the wrong link configuration, but fail with
the correct one?

Related, I notice that in Thierry's patches which you're building on,
tegra_pcie_get_xbar_config() still has a bug where a zero return value
is treated as an error, even though it's a valid HW register value.
Perhaps this is related?

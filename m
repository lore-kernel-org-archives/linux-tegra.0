From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: pcie: Enable PCIe controller on Cardhu
Date: Wed, 08 May 2013 11:53:24 -0600
Message-ID: <518A9114.1040201@wwwdotorg.org>
References: <1368010660-31465-1-git-send-email-jagarwal@nvidia.com> <1368010660-31465-4-git-send-email-jagarwal@nvidia.com> <518A8596.7070702@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <518A8596.7070702-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/08/2013 11:04 AM, Stephen Warren wrote:
> On 05/08/2013 04:57 AM, Jay Agarwal wrote:
>> - Enable PCIe controller on Cardhu
>> - Only port 2 is connected on this board
>> - Add regulators required for Tegra30
>> - Patch is based on remotes/gitorious_thierryreding_linux/tegra/next
>> - and should be applied on top of this.
> 
>> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> 
>> +	pcie-controller {
>> +		status = "okay";
>> +		pex-clk-supply = <&pex_hvdd_3v3_reg>;
>> +		vdd-supply = <&ldo1_reg>;
>> +		avdd-supply = <&ldo2_reg>;
>> +
>> +		pci@3,0 {
>> +			status = "okay";
>> +		};
>> +	};
...
> According to the Cardhu schematics, the PCIe link to the dock is a
> single lane. Hence, I believe that the Cardhu DT should describe a 411
> port configuration. However, the Cardhu DT doesn't describe any
> particular link configuration, but just inherits the default from
> tegra30.dtsi, which describes a 222 link configuration. I would have
> expected the following in the Cardhu DT:
> 
> 		pci@1,0 {
> 			nvidia,num-lanes = <4>;
> 		};
> 
> 		pci@2,0 {
> 			nvidia,num-lanes = <1>;
> 		};
> 
> 		pci@3,0 {
> 			status = "okay";
> 			nvidia,num-lanes = <1>;
> 		};
> 
> However, if I put that there, no PCIe links are detected at all. Why
> does the driver work with the wrong link configuration, but fail with
> the correct one?

I take this back. Fixing the DT as shown above to represent the correct
4/1/1 configuration does still yield a working system. Please
incorporate this into a future patch revision.

The issue is more that PCIe enumeration is only reliable after a cold
power cycle of the dock (the dock appears to be powered solely by its
power cable and never the battery in Cardhu, and hence isn't affected by
the main tablet PMIC's power on/off state like most of the board is). Is
there some reset signal to the dock that the bootloader or kernel should
be driving to solve this?

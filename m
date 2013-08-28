From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: tegra: Add host1x, dc and hdmi to Tegra114 device
 tree
Date: Wed, 28 Aug 2013 15:41:35 +0300
Message-ID: <521DEFFF.90507@nvidia.com>
References: <1377686459-16634-1-git-send-email-mperttunen@nvidia.com> <1377686459-16634-5-git-send-email-mperttunen@nvidia.com> <20130828122529.GB32254@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130828122529.GB32254@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/28/2013 03:25 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Wed, Aug 28, 2013 at 01:40:58PM +0300, Mikko Perttunen wrote:
>> Add host1x, dc (display controller) and hdmi devices to Tegra114
>> device tree.
>
> "DC" and "HDMI".

Will fix.

>
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/tegra114.dtsi | 43 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>> index 2905145..ce5a95c 100644
>> --- a/arch/arm/boot/dts/tegra114.dtsi
>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>> @@ -27,6 +27,49 @@
>>   			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>>   	};
>>
>> +	host1x {
>> +		compatible = "nvidia,tegra114-host1x", "nvidia,tegra30-host1x",
>
> I don't think that's correct. The Tegra114 host1x is not backwards
> compatible with the Tegra30 host1x.
>
> That said, I have a local patch that is a bit more complete in that it
> adds other host1x devices as listed in the TRM as well. But I'll leave
> it up to Stephen how he prefers to handle that. It should be fine to
> defer adding nodes for additional hardware blocks when the supporting
> drivers are merged. We've done it for other devices as well.

Ok. Will need to add tegra114-host1x to the host1x driver compat 
strings, then, but I guess that's better than having it wrong in the DT.

>
>> +				"simple-bus";
>> +		reg = <0x50000000 0x00028000>;
>> +		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
>> +				<GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
>
> I think this should be indented with the previous line. Also other SoC
> .dtsi files use a single entry, as in:
>
> 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH
> 			      GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
>

Will fix.

>> +		hdmi {
>> +			compatible = "nvidia,tegra114-hdmi";
>> +			reg = <0x54280000 0x00040000>;
>> +			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&tegra_car TEGRA114_CLK_HDMI>,
>> +				    <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
>
> Any reason why we can't use pll_d2_out0 here, like we do on Tegra30?

I have this set to PLL_D because I don't have panel support so disp1 
will be the HDMI DC. However, it doesn't seem to matter which one is 
specified here. I have also tested HDMI with disp2 and that works too.

>
> Thierry
>
> * Unknown Key
> * 0x7F3EB3A1
>

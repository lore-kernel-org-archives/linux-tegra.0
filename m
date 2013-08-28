From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: tegra: Add hdmi to Tegra114 Dalmore device tree
Date: Wed, 28 Aug 2013 15:49:45 +0300
Message-ID: <521DF1E9.7050504@nvidia.com>
References: <1377686459-16634-1-git-send-email-mperttunen@nvidia.com> <1377686459-16634-6-git-send-email-mperttunen@nvidia.com> <20130828123008.GC32254@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130828123008.GC32254@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/28/2013 03:30 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Wed, Aug 28, 2013 at 01:40:59PM +0300, Mikko Perttunen wrote:
>> Add hdmi node to Dalmore device tree to supply Dalmore-specific
>
> s/hdmi/HDMI/

Will fix.

>
>> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> [...]
>> +	host1x {
>> +		hdmi {
>> +			status = "okay";
>> +
>> +			vdd-supply = <&vdd_hdmi_reg>;
>> +			pll-supply = <&palmas_smps3_reg>;
>> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
>
> I prefer to use a blank line to separate "standard" from
> "vendor-specific" properties.

Will fix.

>
>> +			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
>
> Other .dts files split this so it doesn't exceed 80 characters. I'm not
> sure how useful that is as a general rule for DT source files, though.

Will fix. I guess check_patch.pl doesn't check for line length in *.dts.

>
>>   	i2c@7000d000 {
>>   		status = "okay";
>>   		clock-frequency = <400000>;
>> @@ -1169,6 +1184,8 @@
>>   			regulator-min-microvolt = <5000000>;
>>   			regulator-max-microvolt = <5000000>;
>>   			enable-active-high;
>> +			regulator-always-on;
>> +			regulator-boot-on;
>
> This warrants at least a mention in the commit message.

Hmm, yeah. Looks like the HDMI driver only enables the Vdd in 
tegra_output_hdmi_enable, which is too late at least for DDC. I guess a 
better patch would be to enable it earlier. In _probe?

>
> Thierry
>
> * Unknown Key
> * 0x7F3EB3A1
>

From: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: modify Tegra30 USB2 default phy_type
 to UTMI
Date: Thu, 19 Dec 2013 18:03:21 -0800
Message-ID: <52B3A569.7090106@nvidia.com>
References: <1387331565-3994-1-git-send-email-ebrower@nvidia.com> <52B21079.6030201@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52B21079.6030201-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/18/2013 01:15 PM, Stephen Warren wrote:
> On 12/17/2013 06:52 PM, Eric Brower wrote:
>> Modify Tegra30 default USB2 phy_type to UTMI; this matches
>> power-on-reset defaults and is expected to be the common case.
>>
>> The current implementation is likely an incorrect
>> carry-over from Tegra20, where USB2 does default to ULPI.
>
>> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
>
>>   	phy2: usb-phy@7d004000 {
>>   		compatible = "nvidia,tegra30-usb-phy";
>> -		reg = <0x7d004000 0x4000>;
>> -		phy_type = "ulpi";
>> +		reg = <0x7d004000 0x4000 0x7d004000 0x4000>;
>
> Are you sure the second entry in the reg property is correct here? In
> Tegra20, the UTMI pad registers are in the USB1 (USBD) register space
> for both USB controllers, and I would guess the same applies for all 3
> controllers on Tegra30, since both USB1 and USB3 on Tegra30 already
> point this reg entry at USBD's reg space, plus you've listed USBD as the
> clock entry for utmi-pads, rather than USB2, which would be consistent
> with the reg value.
>
> Still, this patch does seem to work for me...
>

The second entry in the reg property is indeed incorrect-- I'll send a 
new version of the series.

Though each controller has UTMIP BIAS pad registers, bias pad settings 
must be configured via USB1 only; the USB2 and USB3 BIAS pad registers 
are a no-connect-- this explains why it works as-is (USB1 configures 
bias pad settings), but is not correct for the dtsi.

Thanks for the catch!
Eric

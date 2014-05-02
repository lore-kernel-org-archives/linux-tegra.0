From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add Tegra Note 7 device tree
Date: Fri, 2 May 2014 14:37:20 +0900
Message-ID: <CAAVeFuK2dLYniekFzrN5OtkBJ_Z4RZZFOqe5yd-bzYtoyTkyZw@mail.gmail.com>
References: <1398928217-32629-1-git-send-email-acourbot@nvidia.com> <53628566.1070602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53628566.1070602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 2, 2014 at 2:33 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/01/2014 01:10 AM, Alexandre Courbot wrote:
>> Tegra Note 7 is a consumer tablet embedding a Tegra 4 SoC with 1GB RAM
>> and a 720p panel.
>>
>> The following features are enabled by this device tree: UART, eMMC, USB
>> (needs external power), PMIC, backlight, DSI panel, keys.
>>
>> SD card, HDMI, charger, self-powered USB, audio, wifi, bluetooth are not
>> yet supported but might be by future patches (likely in that order).
>
>> diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
>
>> +     chosen {
>> +             /* TN7's bootloader's arguments need to be overridden */
>> +             bootargs = "console=ttyS0,115200n8 console=tty1 gpt cma=128M fbcon=rotate:2";
>
> Do we still need the cma argument at all now? The default is now 64M in
> tegra_defconfig, and 128M seems quite large.

I have omitted that parameter and my TN7 seems to be happy about it,
so removed as you suggested.

>
>> +     host1x@50000000 {
>> +             hdmi@54280000 {
>> +                     status = "okay";
>> +
>> +                     hdmi-supply = <&vdd_5v0_hdmi>;
>> +                     vdd-supply = <&vdd_3v3_hdmi>;
>> +                     pll-supply = <&vdd_1v05_pll>;
>> +
>> +                     nvidia,ddc-i2c-bus = <&hdmi_ddc>;
>> +                     nvidia,hpd-gpio =
>> +                             <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
>> +             };
>
> If HDMI doesn't work yet (per commit description), should we leave it
> out of the DT for now?

Indeed.

>
>> +     serial@70006300 {
>> +             status = "okay";
>> +     };
>
> Is there actually an accessible UART on the board? I guess this is for
> people lucky enough to have internal boards with the debug connector. If
> so, this is probably fine.

Yes, you need to rework your tablet to get access to a serial line. It
is possible though, and as you mentioned the dev boards we use
internally have this rework already which makes debugging much easier.
I'd keep that one if you don't mind.

Thanks,
Alex.

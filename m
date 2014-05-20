From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Tue, 20 May 2014 13:37:07 -0700
Message-ID: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 20, 2014 at 11:31 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/20/2014 12:24 PM, Stephen Warren wrote:
>> On 05/19/2014 08:35 PM, Dylan Reid wrote:
>>> Add a device node for the HDA controller found on Tegra124.
>>
>>> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
>>
>>> +    hda@0,70030000 {
>>> +            compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
>>> +            reg = <0x0 0x70030000 0x0 0x10000>;
>>> +            interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
>>> +            clocks = <&tegra_car TEGRA124_CLK_HDA>,
>>> +                     <&tegra_car TEGRA124_CLK_HDA2HDMI>,
>>> +                     <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
>>> +            clock-names = "hda", "hda2hdmi", "hdacodec_2x";
>>
>> I think that should be "hda2codec_2x". Same for the reset-names property
>> below. This fix also needs to be propagated into the DT binding
>> documentation.
>
> Even after fixing that, I can't play audio on Venice2:
>
> root@localhost:~# speaker-test -Dhw:0,3 -c 2
>
> speaker-test 1.0.27.1
>
> Playback device is hw:0,3
> Stream parameters are 48000Hz, S16_LE, 2 channels
> Using 16 octaves of pink noise
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 64 to 16384
> Period size range from 32 to 8192
> Using max buffer size 16384
> Periods = 4
> was set period_size = 4096
> was set buffer_size = 16384
>  0 - Front Left
> Write error: -32,Broken pipe
> Write error: -32,Broken pipe
> Write error: -32,Broken pipe
> ^C 1 - Front Right
> Time per period = 1.799791
>

Thanks for checking Stephen.  I'll fix the reset name.

This is the state of the tree I used when I tested on Venice2 just now:
* ae57dbf - (HEAD) ARM: tegra: venice2 - Enable HDA (2 minutes ago)
* 6224524 - ARM: tegra: Add Tegra124 HDA support (2 minutes ago)
* 468ca57 - ALSA: hda - Add driver for Tegra SoC HDA (2 minutes ago)
* 928099e - ALSA: hda/hdmi - Add Nvidia Tegra124 HDMI support (2 minutes ago)
* 701eac4 - clk: tegra124: Enable hda to hdmi clocks (3 minutes ago)
* 6b6ba7b - (next-20140520, linux-next/master) Add linux-next specific
files for 20140520 (11 hours ago)

My speaker-test output is similar to yours, minus the errors, and I
hear noise from the attached monitor.

I tried with the reset name fixed to hda2codec_2x as well and it still
works for me.

Were you testing on one of your public trees?  I couldn't get your
github tree to boot.

Dylan

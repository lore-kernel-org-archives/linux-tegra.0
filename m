From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: u-boot-flasher fails with current u-boot
Date: Fri, 9 Jun 2017 06:28:13 -0600
Message-ID: <CAPnjgZ2+1RetR_Qv91nfK180-XyHzViHppe5OOGGGgSaAEH7_g@mail.gmail.com>
References: <84tw3sk7sq.wl-Peter.Chubb@data61.csiro.au> <CAPnjgZ08jAH7OgTwQj6m5E1R26AqkwBiZEnPxHwWr==K=f9oWQ@mail.gmail.com>
 <848tl430qh.wl-Peter.Chubb@data61.csiro.au> <84vao7uvsz.wl-Peter.Chubb@data61.csiro.au>
 <CAPnjgZ3GhGGq8SrtXNOQyh5V7Xm2X_pfKcrrbHkyVNXcfvWCjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ3GhGGq8SrtXNOQyh5V7Xm2X_pfKcrrbHkyVNXcfvWCjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chubb <Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

On 7 June 2017 at 21:11, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi Peter,
>
> On 7 June 2017 at 19:12,  <Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org> wrote:
>>>>>>> "Peter" == Peter Chubb <Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org> writes:
>>>>>>> "Simon" == Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> writes:
>>
>> Simon> Oh dear. I cannot find my board but will see if I can repeat
>> Simon> this on a beaver.
>>
>> Peter> If there's any additional logging you'd like me to collect on
>> Peter> the Jetson, let me know.
>>
>> I tried to reproduce this this morning.  Today, even trying to exec
>> the U-Boot without flashing fails.
>
> The good news is I found my Jetson-TK1 and I can repeat your problem.
>
>>
>> So,
>>         ./tegra-uboot-flasher exec  jetson-tk1
>> with a current u-boot gives an inoperative eMMC.
>>
>> In the boot header I see:
>>
>> U-Boot 2017.05-00769-g0e513e788f (Jun 08 2017 - 09:26:27 +1000)
>>
>> TEGRA124
>> Model: NVIDIA Jetson TK1
>> Board: NVIDIA Jetson TK1
>> DRAM:  2 GiB
>> MMC:   sdhci@700b0400: 1, sdhci@700b0600: 0
>>
>> Then:
>>
>> Tegra124 (Jetson TK1) # mmc rescan
>
> Why are you running 'mmc rescan'? Is this because the MMC has changed?
>
> This command does not seem to work since it does not re-probe the
> driver. It looks like the driver assumes that the controller is reset
> each time. I'll send a patch which seems to fix it for me.
>
>> tegra_mmc_send_cmd_bounced: MMC Timeout
>>     Interrupt status        0x00000001
>>     Interrupt status enable 0xffff003b
>>     Interrupt signal enable 0xffff0002
>>     Present status          0x01fb02f6
>> mmc_init: -1, time 8042

OK thanks for that. Just to close the loop I sent a patch to fix it:

http://patchwork.ozlabs.org/patch/772771/

Regards,
Simon

From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1 device
 tree
Date: Tue, 19 Jan 2016 18:16:34 +0100
Message-ID: <569E6F72.1000702@ramses-pyramidenbau.de>
References: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453209155-6213-3-git-send-email-ralf@ramses-pyramidenbau.de>
 <569E652E.5020907@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <569E652E.5020907-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thanks for review, Stephen.

On 01/19/16 17:32, Stephen Warren wrote:
> On 01/19/2016 06:12 AM, Ralf Ramsauer wrote:
>> This patch enables the APB DMA high speed UARTs of the Jetson TK1.
>
> In the cover letter, you mentioned that these ports are exposed on the
> expansion connector. It'd be useful to mention that fact here too,
> since the cover letter doesn't make it into the git commit log.
Good point.
>
> However, given that, I don't think we should apply this patch. We
> can't know ahead of time what hardware is connected to the expansion
> header; the pins aren't dedicated to be serial ports (they could be
> GPIOs and probably other functions too depending on the pinmux
> settings), and different people will connect different hardware or
> none at all. Hence, the default DT should not enable IO controllers
> for the pins on the expansion connector. The best approach these days
> is to use DT overlays. You may need to add some "hooks" into the Tegra
> base DT files to allow overlays to be used; they weren't written with
> overlays in mind.
If the argument is that those pins could also differently be used, then
the same would also apply to I2C busses, which are apparently _all_
exported in the current device tree, even if no hardware is connected by
default. Those pins are also available on the expansion headers.

You are right that those pins of the CPU can generally be used as GPIOs,
but regarding the Jetson TK1 board, the meaning of those pins on the
expansion header is the UART functionality. This is also what the
official documentation of Nvidia states on those pins [2]. So if you do
want to have a special non-UART setup, then you should have to disable
them on your own, by default they should be enabled.

On the Jetson TK1 board, only GPIO_PU* and GPIO_PH* should be used as
GPIOs [2].

  Ralf

[1]
http://developer.download.nvidia.com/embedded/jetson/TK1/2014-03-24/JetsonTK1_ModuleSpecification_PM375_V1.0.pdf
[2] http://elinux.org/Jetson/GPIO#Jetson_TK1_GPIO_pinouts
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Ralf Ramsauer
GPG: 0x8F10049B

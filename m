From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1
 device tree
Date: Tue, 26 Jan 2016 20:35:38 +0100
Message-ID: <56A7CA8A.5030109@ramses-pyramidenbau.de>
References: <1453827558-10954-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453827558-10954-3-git-send-email-ralf@ramses-pyramidenbau.de>
 <56A7C8B6.6090405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56A7C8B6.6090405-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 01/26/16 20:27, Stephen Warren wrote:
> On 01/26/2016 09:59 AM, Ralf Ramsauer wrote:
>> This patch enables the APB DMA high speed UARTs of the Jetson TK1. So
>> far, they were only enabled in NVidia's official BSP.
>>
>> Those additional UARTs are exposed on the expansion connector J3A2:
>>
>>   UART1:
>>    Pin 41: BR_UART1_TXD
>>    Pin 44: BR_UART1_RXD
>>
>>   UART2:
>>    Pin 65: UART2_RXD
>>    Pin 68: UART2_TXD
>>    Pin 71: UART2_CTS_L
>>    Pin 74: UART2_RTS_L
>
> The series,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
>
> As an aside, this is perfectly OK, but I wonder why you chose to use
> compatible=nvidia,tegra124-hsuart rather than
> compatible=nvidia,tegra124-uart. The -hsuart driver has had less
> testing upstream, whereas the regular -uart driver is heavily used for
> the main serial console. I assume you tested the new driver when
> enabling the ports:-)
Let me explain it, this is how I found the typos :-)

tegra124.dtsi states:
    /*
     * There are two serial driver i.e. 8250 based simple serial
     * driver and APB DMA based serial driver for higher baudrate
     * and performace. To enable the 8250 based driver, the compatible
     * is "nvidia,tegra124-uart", "nvidia,tegra20-uart" and to enable
     * the APB DMA based serial driver, the compatible is
     * "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart".
     */

There's nothing written about the upstream stability of the hsuart
driver. So I didn't even try to use the non-hs uart driver. Nevertheless
I successfully tested both additional uarts using the hsuart driver
against 4.5-rc1 and some uart-speaking device.

  Ralf

-- 
Ralf Ramsauer
GPG: 0x8F10049B

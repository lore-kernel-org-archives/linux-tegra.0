From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1
 device tree
Date: Tue, 26 Jan 2016 12:27:50 -0700
Message-ID: <56A7C8B6.6090405@wwwdotorg.org>
References: <1453827558-10954-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453827558-10954-3-git-send-email-ralf@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453827558-10954-3-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/26/2016 09:59 AM, Ralf Ramsauer wrote:
> This patch enables the APB DMA high speed UARTs of the Jetson TK1. So
> far, they were only enabled in NVidia's official BSP.
>
> Those additional UARTs are exposed on the expansion connector J3A2:
>
>   UART1:
>    Pin 41: BR_UART1_TXD
>    Pin 44: BR_UART1_RXD
>
>   UART2:
>    Pin 65: UART2_RXD
>    Pin 68: UART2_TXD
>    Pin 71: UART2_CTS_L
>    Pin 74: UART2_RTS_L

The series,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


As an aside, this is perfectly OK, but I wonder why you chose to use 
compatible=nvidia,tegra124-hsuart rather than 
compatible=nvidia,tegra124-uart. The -hsuart driver has had less testing 
upstream, whereas the regular -uart driver is heavily used for the main 
serial console. I assume you tested the new driver when enabling the 
ports:-)

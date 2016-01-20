From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1 device
 tree
Date: Wed, 20 Jan 2016 15:54:35 -0700
Message-ID: <56A0102B.2040208@wwwdotorg.org>
References: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453209155-6213-3-git-send-email-ralf@ramses-pyramidenbau.de>
 <569E652E.5020907@wwwdotorg.org> <569E6F72.1000702@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <569E6F72.1000702-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/19/2016 10:16 AM, Ralf Ramsauer wrote:
> Thanks for review, Stephen.
>
> On 01/19/16 17:32, Stephen Warren wrote:
>> On 01/19/2016 06:12 AM, Ralf Ramsauer wrote:
>>> This patch enables the APB DMA high speed UARTs of the Jetson TK1.
>>
>> In the cover letter, you mentioned that these ports are exposed on the
>> expansion connector. It'd be useful to mention that fact here too,
>> since the cover letter doesn't make it into the git commit log.
> Good point.
>>
>> However, given that, I don't think we should apply this patch. We
>> can't know ahead of time what hardware is connected to the expansion
>> header; the pins aren't dedicated to be serial ports (they could be
>> GPIOs and probably other functions too depending on the pinmux
>> settings), and different people will connect different hardware or
>> none at all. Hence, the default DT should not enable IO controllers
>> for the pins on the expansion connector. The best approach these days
>> is to use DT overlays. You may need to add some "hooks" into the Tegra
>> base DT files to allow overlays to be used; they weren't written with
>> overlays in mind.
 >
> If the argument is that those pins could also differently be used, then
> the same would also apply to I2C busses, which are apparently _all_
> exported in the current device tree, even if no hardware is connected by
> default. Those pins are also available on the expansion headers.
>
> You are right that those pins of the CPU can generally be used as GPIOs,
> but regarding the Jetson TK1 board, the meaning of those pins on the
> expansion header is the UART functionality. This is also what the
> official documentation of Nvidia states on those pins [2]. So if you do
> want to have a special non-UART setup, then you should have to disable
> them on your own, by default they should be enabled.
>
> On the Jetson TK1 board, only GPIO_PU* and GPIO_PH* should be used as
> GPIOs [2].

Sorry, you're correct for this board. On other board I've dealt with 
(e.g. RPi, and NVIDIA's more recent Jetson TX1) the designers have been 
more careful not to commit any of the expansion pins to a particular use 
without end-user configuration.

I'll go back and re-review this commit with this in mind.

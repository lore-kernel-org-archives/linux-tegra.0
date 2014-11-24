From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: tegra: Add support for nyan board
Date: Mon, 24 Nov 2014 10:21:20 -0700
Message-ID: <54736910.6010000@wwwdotorg.org>
References: <1416759162-25445-1-git-send-email-sjg@chromium.org>	<1416759162-25445-4-git-send-email-sjg@chromium.org> <CAPnjgZ290n57H1QWmCVqeb4g_A3FZBmbVcHQ5i0A=oVa582csQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ290n57H1QWmCVqeb4g_A3FZBmbVcHQ5i0A=oVa582csQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/23/2014 10:02 AM, Simon Glass wrote:
> Hi,
>
> On 23 November 2014 at 09:12, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>
>> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Nyan is a Tegra124 clamshell board that is very similar to venice2, but it
>> has a different panel, the sdcard cd and wp sense are flipped, and it has
>> a different revision of the AS3722 PMIC.
>>
>> This is the Acer Chromebook 13 CB5-311-T7NN (13.3-inch HD, NVIDIA
>> Tegra K1, 2GB). The display is not currently supported, so it should
>> boot on other nyan-based Chromebooks also, but only the device tree for
>> nyan-big is provided here.
>>
>> The device tree file is from Linux but with features removed which are
>> unlikely to be supported in U-Boot soon (regulators, pinmux). Also the
>> addresses are updated to 32-bit.
>>
>> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> (rebase, change to 'nyan', fix pinmux that resets nyan)
>>
>> ---
>>
>> Changes in v3:
>> - Rename to nyan from norrin
>> - Bring in device tree file from Linux v3.18-rc5
>> - Generate pinmux file from tegra-pinmux-scripts
>
> I should say that I'm not thrilled with this approach, particularly as
> the files it generate have no mentioned that they are auto-generated.
> Here we have a case where Nyan and Norrin apparently different by one
> pixmux setting but there is no way to exploit this commonality.
>
> I think this was discussed a while ago (the idea of static pinmux
> being set up at start of day). If I recall I expressed my objections
> at the time. If U-Boot headed this way in general it would be
> unfortunate. You get a whole load of pinmux settings with no idea what
> they are for, and no idea how to change them for your board. It almost
> feels similar to a 'binary blob'.

That's the entire point; people should not be randomly fiddling with the 
pinmux data in U-Boot for any reason.

The model for Tegra boards is that whoever designs the boards fills out 
a spreadsheet to define the pinmux for the board. That spreadsheet is 
coded to detect and avoid a lot of mistakes (such as multiple pins muxed 
to/from the same signal, redundant pull-ups enabled on board and SoC, 
pins used for purposes incompatible with what the SoC supports, etc.). 
Any pinmux changes should be made in that spreadsheet, and all SW should 
use the values exported from or derived from the spreadsheet. There's no 
reason to modify the values afterwards.

This is similar to a binary blob in that the data shouldn't be modified.

This is quite different from a binary blob in that it's quite obvious 
exactly what the data represents semantically; it's a quite "plain-text" 
format. with non-obfuscated code to implement it, which directly maps to 
reasonably well documented hardware.

> I recently saw a patch to (from what I can tell) remove all the pinmux
> information from the device tree in Linux, presumably on the
> assumption it can never be changed except very early in the boot. If
> this is a limitation of Tegra then it seems unfortunate to me.

It's to avoid redundant work. Bootloaders are expected to set up 100% of 
the pinmux[1]. Given that, there's no point the kernel repeating the 
process of setting up the exact same configuration.

[1] This is the only sane way to avoid conflicts between mux settings of 
different pins. Only partially programming the pinmux can leave other 
pins muxed to the same controller/signal for example. Resolving that 
requires hit-and-miss testing or complex table lookups to reprogram pins 
that conflict that otherwise wouldn't be programmed. That approach could 
cause undesired glitches on pins as they're continually reprogrammed 
between different states to avoid conflicts. The simplest and only 100% 
guaranteed way to avoid this is to simply program everything directly to 
the desired final configuration. This issue isn't anything Tegra 
specific either, but applies to any pinmux controller where the same 
signal can be routed to multiple pins/pads. I believe the only reason 
this hasn't been so explicitly addressed before is that people just 
haven't thought it through at this level.

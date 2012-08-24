From: "andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org"
	<andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org>
Subject: Re: Debugging U-Boot standalone apps on Tegra 2 board
Date: Fri, 24 Aug 2012 08:42:32 -0700
Message-ID: <5037A0E8.9080209@convergeddevices.net>
References: <50365CA3.6000103@gmail.com> <50366B2A.7080306@wwwdotorg.org> <5FBF8E85CA34454794F0F7ECBA79798F379DE7253E@HQMAIL04.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5FBF8E85CA34454794F0F7ECBA79798F379DE7253E-wAPRp6hVlRhDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Tom,

You happen to mention a very sore subject for me Flyswatter and Harmony, 
so now that we are on the subject I would like to ask you a couple of 
questions :-)

What software do you use with Flyswatter? Is is OpenOCD? If so what are 
the board files that you use and would it be possible for you to share 
them? The reason I ask is because three month ago or so I tried to use 
the aforementioned combo as a JTAG debugger on my Harmony board(with 
intent to use it on our Harmony based design later) and I failed miserably.

I do have Lauterbach, but the experience of trying to make it work(and 
failing to do so) made me decide not to use that wunderwaffe ever again, 
unless my parents are being held hostage or something.


On 08/23/2012 10:47 AM, Tom Warren wrote:
> The main Harmony PC board (1162) connects via ribbon cable to a debug board (1137) w/20-pin JTAG, RS-232 serial port, etc. if I remember correctly (haven't touched my Harmony in a long time).
>
> Once you have the debug board, any JTAG dongle will connect - we use the Flyswatter from TinCanTools, and/or the parallel-port JTAG adapters, as well as the Lauterbach.
>
> As Stephen says - whoever gave you the Harmony originally should be able to help you get the debug board to go with it.
>
> HTH,
>
> Tom
>
>> -----Original Message-----
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Thursday, August 23, 2012 10:41 AM
>> To: Nuno Santos; Tom Warren; Allen Martin
>> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: Debugging U-Boot standalone apps on Tegra 2 board
>>
>> On 08/23/2012 10:38 AM, Nuno Santos wrote:
>>> Hi
>>>
>>> I'm currently running U-Boot on the Tegra2 Harmony board and I'd
>>> appreciate some help on how to debug U-Boot standalone applications.
>>> I'm currently stuck with some nasty bugs and without a debugger it
>>> will be extremely painful to fix them.
>>>
>>> I read that using a JTAG device seems to be the best option. According
>>> to the technical specs of the Harmony board, JTAG is supported and
>>> looking at the board, there's apparently a debug port (J10). However,
>>> this port looks too tiny to be a regular JTAG interface.
>>>
>>> Do you have any idea if a JTAG debugger is indeed supported? If so,
>>> could you please recommend me one that is compatible with this board?
>>> Otherwise, are you aware of an alternative approach for debugging the
>>> system?
>>>
>>> I really appreciate your help on this. Thanks in advance.
>> I've CC'd a couple of people more involved in U-Boot and JTAG debugging.
>> For Harmony, I believe you need an external debug board to expose the JTAG
>> connector in a standard form-factor. I don't know if these are available;
>> it's probably best to ask whoever you got your Harmony from.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

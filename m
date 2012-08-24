From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Debugging U-Boot standalone apps on Tegra 2 board
Date: Fri, 24 Aug 2012 10:07:30 -0600
Message-ID: <5037A6C2.6020600@wwwdotorg.org>
References: <50365CA3.6000103@gmail.com> <50366B2A.7080306@wwwdotorg.org> <5FBF8E85CA34454794F0F7ECBA79798F379DE7253E@HQMAIL04.nvidia.com> <5037A0E8.9080209@convergeddevices.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5037A0E8.9080209-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org" <andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org>
Cc: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/24/2012 09:42 AM, andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org wrote:
> Hi Tom,
> 
> You happen to mention a very sore subject for me Flyswatter and Harmony,
> so now that we are on the subject I would like to ask you a couple of
> questions :-)
> 
> What software do you use with Flyswatter? Is is OpenOCD? If so what are
> the board files that you use and would it be possible for you to share
> them? The reason I ask is because three month ago or so I tried to use
> the aforementioned combo as a JTAG debugger on my Harmony board(with
> intent to use it on our Harmony based design later) and I failed miserably.

I have a FlySwatter 2 and used it with some random git version of
OpenOCD quite a while ago. This worked somewhat on our Springbank board,
although there were some stability issues, although Allen recently
pointed out that /might/ have been due to attempts to access CPU cores
that weren't powered up. Anyway, it was enough to do something useful at
least on the AVP CPU if not the A9s. I mention this because I tried the
exact same setup on Harmony, and also couldn't get OpenOCD to connect at
all IIRC. I'm afraid I haven't investigated this. So, at least we're in
the same boat.

> I do have Lauterbach, but the experience of trying to make it work(and
> failing to do so) made me decide not to use that wunderwaffe ever again,
> unless my parents are being held hostage or something.

I believe most JTAG use within NVIDIA is with a Lauterbach:-(

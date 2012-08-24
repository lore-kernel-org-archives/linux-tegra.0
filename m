From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Debugging U-Boot standalone apps on Tegra 2 board
Date: Fri, 24 Aug 2012 12:26:30 -0600
Message-ID: <5037C756.4030802@wwwdotorg.org>
References: <50365CA3.6000103@gmail.com> <50366B2A.7080306@wwwdotorg.org> <5FBF8E85CA34454794F0F7ECBA79798F379DE7253E@HQMAIL04.nvidia.com> <5037B83A.4010002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5037B83A.4010002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/24/2012 11:22 AM, Nuno Santos wrote:
> On 8/23/12 7:47 PM, Tom Warren wrote:
>> As Stephen says - whoever gave you the Harmony originally should be
>> able to help you get the debug board to go with it.
> Thank you very much for all your contributions!
> 
> I've just contacted NVIDIA, from whom I bough my Harmony board, and
> asked for the external debug board. Unfortunately, the only way to
> acquire / get assistance on these products is through their developer
> portal, which has been under maintenance for the past two months...
> 
> Do you have any idea about alternative hardware manufacturers or
> distributors that commercialize the debug board for Harmony? Otherwise,
> it seems that I'll have to change hardware platform...

Sorry, I sincerely doubt the board is available through anyone but
NVIDIA. I'll ask internally and see if the board is available for
external purchase.

I believe Peter De Schrijver has used JTAG on the TrimSlice, but again
you need a (different) debug board, and I have no idea if Compulab make
those available. I CC'd Peter to see if he knows.

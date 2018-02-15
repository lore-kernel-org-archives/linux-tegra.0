From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: How to test new bootloaders on Jetson TX1?
Date: Thu, 15 Feb 2018 14:25:16 +0100
Message-ID: <8320e1df-774c-65c1-28ae-96e1b90ad178@suse.de>
References: <5ff3ffde-653c-ea50-490c-efcc6dccecc2@suse.de>
 <2089c895-7992-9741-a471-fae5b410d4b7@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2089c895-7992-9741-a471-fae5b410d4b7-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-IBi9RG/b67k@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mikko,

Am 15.02.2018 um 08:56 schrieb Mikko Perttunen:
> In the cboot + U-Boot combination, cboot loads U-Boot from the usual
> kernel partition (LNX or kernel depending on system), so flashing U-Boot
> there should do the trick. I believe this did indeed change in some L4T
> version, so the wiki page needs to be updated. Tom should know more
> about this.

Thanks for explaining.

The LNX partition is getting a boot.img - what is the relation to the
four U-Boot files? flash.sh source is not really helping here.

Might any changes to RP1 and/or DTB partitions be necessary to match my
newer U-Boot, or does U-Boot use an internal .dtb these days?

Is there any more efficient way to flash just U-Boot? -k LNX possibly?

I had played with the -L option before (which mentions u-boot-dtb.bin),
but recall it ran into some form of checksum error on boot when passing
it my file...

> I expect Varun to know the details about ATF, but I'll check if I can
> find some answer myself.

Thanks again for your efforts.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)

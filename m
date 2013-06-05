From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra114: Fix msenc clock register
Date: Wed, 5 Jun 2013 09:27:34 +0300
Message-ID: <op.wx6z781wpdlnwf@mperttunen-lnx>
References: <1370345143-4885-1-git-send-email-mperttunen@nvidia.com>
 <51AE0F1B.20602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51AE0F1B.20602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Ah, sorry about that. I did actually use get_maintainer.pl, and it listed  
you
on the first line :) It looks like only drivers/clk/clk-* is assigned to  
Mike
according to MAINTAINERS, and the tegra/ subdirectory isn't.

On Tue, 04 Jun 2013 19:00:27 +0300, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>  
wrote:

> On 06/04/2013 05:25 AM, Mikko Perttunen wrote:
>> The msenc clock's register was set to the usb3 clock's register.
>
> drivers/clk changes should be sent to Mike Turquette (CC'd here). See
> the output of ./scripts/get_maintainer.pl and/or the MAINTAINERS file.
>
> Hopefully he can pick this up from the ARM mailing list - if not, I'm
> sure he'll let you know to resend it.

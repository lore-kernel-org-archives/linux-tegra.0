From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V1 2/3] Documentation: gpio: Add details of open-drain
 configuration
Date: Thu, 16 Feb 2012 13:58:47 +0530
Message-ID: <4F3CBE3F.1090604@nvidia.com>
References: <1329114588-15430-1-git-send-email-ldewangan@nvidia.com>	<1329114588-15430-3-git-send-email-ldewangan@nvidia.com>	<20120213211809.GI11077@ponder.secretlab.ca> <CACRpkdZzcN5oi0ejeTQn3BNJ_w6XHsBQ_RoQMvpf8Lt2bOARAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZzcN5oi0ejeTQn3BNJ_w6XHsBQ_RoQMvpf8Lt2bOARAg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, "dunlap@xenotime.net" <dunlap@xenotime.net>, "lrg@ti.com" <lrg@ti.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thursday 16 February 2012 03:55 AM, Linus Walleij wrote:
>> Have you though about support for lines that are pulled low instead of
>> high?  Those aren't as common, but it is conceivable that some
>> hardware would need it.
> So if the idea is (if I get it correctly) that this thing is an input
> sometimes and open drain/collector output sometimes, then
> open source/emitter for the inverse situation is an equally valid
> case right? In that case I think it'd be best to add both.
>
> The COH901 driver for U300 supports open source/emitter
> BTW.
>

Yes, I can add the open source also but like to be in incremental 
change. Not together with open drain.
We can go with:
- open drain core driver support.
- open drain sysfs interface support
- open source core driver support
- open source sysfs interface.

I have already changes for the first 2 which we can review/apply,
Meanwhile I will work on open source support.

Does it look good?

> Yours,
> Linus Walleij


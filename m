From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1 2/3] Documentation: gpio: Add details of open-drain configuration
Date: Thu, 16 Feb 2012 21:00:28 +0100
Message-ID: <CACRpkdaFyxU-gq5ETnNc4LonTo98PbUs09CmvsPUqzyt0Mg2Cg@mail.gmail.com>
References: <1329114588-15430-1-git-send-email-ldewangan@nvidia.com>
	<1329114588-15430-3-git-send-email-ldewangan@nvidia.com>
	<20120213211809.GI11077@ponder.secretlab.ca>
	<CACRpkdZzcN5oi0ejeTQn3BNJ_w6XHsBQ_RoQMvpf8Lt2bOARAg@mail.gmail.com>
	<4F3CBE3F.1090604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4F3CBE3F.1090604@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, "dunlap@xenotime.net" <dunlap@xenotime.net>, "lrg@ti.com" <lrg@ti.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 16, 2012 at 9:28 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Yes, I can add the open source also but like to be in incremental change.
> Not together with open drain.
> We can go with:
> - open drain core driver support.
> - open drain sysfs interface support
> - open source core driver support
> - open source sysfs interface.
>
> I have already changes for the first 2 which we can review/apply,
> Meanwhile I will work on open source support.
>
> Does it look good?

Well as a patch concept it is OK but I have real bad feelings about
patch  [2/4] and [4/4] adding sysfs.

What the GPIO subsystem really needs is to get rid of sysfs
interfaces, have them deprecated and replaced with a
per-gpiochip /dev/gpioN with ioctl()s or similar instead. The sysfs
interface is just ... it won't scale.

Yours,
Linus Walleij

From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: Tegra+WM903 machine: Set the
 new fully_routed flag
Date: Wed, 23 Nov 2011 22:06:50 +0000
Message-ID: <20111123220648.GC32201@opensource.wolfsonmicro.com>
References: <1322077326-5538-1-git-send-email-swarren@nvidia.com>
 <1322077326-5538-2-git-send-email-swarren@nvidia.com>
 <20111123213220.GA8149@sirena.org.uk>
 <74CDBE0F657A3D45AFBB94109FB122FF174F08C81E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174F08C81E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 23, 2011 at 01:56:14PM -0800, Stephen Warren wrote:

> * Documents the review process in git, potentially giving some insight
>   into reasoning behind parts of the patch.

If this is an issue write better changelogs (with similar reasoning to
why we don't merge incremental versions of the code either; besides
without knowing what the old versions were it's generally not so useful).
The lkml-reference: stuff looks a lot more useful if you really do want
to do that as it'll show the older versions and discussions.

> * Allows confirmation that the correct version was checked in.
>   (rarely an issue, but occasionally, albeit I haven't seen it in ASoC)

Diff is useful for that (especially if people do what I do when I notice
this stuff and manually strip the noise).

> It's been mentioned a couple of times briefly on various lists before,
> and while I'm sure it's not standard practice or anything, at least
> there are some people supporting it. However, if you prefer, I'll try
> to remember to move the changelog for ASoC patches.

I've genuinely never seen this before except where it looked like an
error on the part of the sender.

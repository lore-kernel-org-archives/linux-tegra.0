From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V2] gpio: tps65910: Add sleep control support
Date: Wed, 1 Feb 2012 17:15:08 -0700
Message-ID: <20120202001508.GD15343@ponder.secretlab.ca>
References: <1328078344-11670-1-git-send-email-ldewangan@nvidia.com>
 <CACRpkdbNxTe928p=7XdZVbqqfC5k0s1fqE=8DNa5zmg40pjwrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbNxTe928p=7XdZVbqqfC5k0s1fqE=8DNa5zmg40pjwrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 01, 2012 at 01:30:54PM +0100, Linus Walleij wrote:
> On Wed, Feb 1, 2012 at 7:39 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > The device tps65910/tps65911 supports the sleep
> > functionality in some of gpios. If gpio is configured
> > in output mode and sleep is enabled then during device
> > sleep state, the output of gpio becomes LOW regardless
> > of non-sleep output value.
> > Such gpio can be used to control regulator switch such
> > that output of regulator is off in device sleep state.
> >
> > Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes from V1:
> > Taken care of review comments from Linus Walleij's
> > - Remove magic numbers and added macro for defining them.
> > - Used bool type for the platform's gpio sleep control data.
> 
> Thanks, looks good!
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

g.

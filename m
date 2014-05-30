From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH] clk: flatten clk tree in debugfs
Date: Fri, 30 May 2014 11:10:43 +0300
Message-ID: <20140530081043.GO5961@tbergstrom-lnx.Nvidia.com>
References: <1400842772-4862-1-git-send-email-pdeschrijver@nvidia.com>
 <537FCAA0.6080106@codeaurora.org>
 <20140526111453.GE5961@tbergstrom-lnx.Nvidia.com>
 <53862142.8080006@codeaurora.org> <20140528185210.10062.16299@quantum>
 <538656C1.3090402@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <538656C1.3090402-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Saravana Kannan <skannan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> >>
> >> Mike, others,
> >>
> >> Any objections to this idea? If there's not much opposition, then maybe
> >> Peter can actually spend time fixing and testing this patch?
> >
> > Idea seems fine. I had actually considered removing the hiearchal
> > directory structure completely with the advent of clk_dump and
> > clk_summary, but if there is value in the flattened directory structure
> > then I'm all for it.
> I think the additional value of the flattened directory probably comes 
> from internal tree patches that would add set rate capability to clocks, 
> etc that would be helpful with testing.
> 

Yes. Eg. I posted a patch to dump a clocks registers for Tegra.

> Agree with all the comments so far.
> 
> Peter,
> 
> Looks like there's some support and no opposition so far. So do you want 
> to send out a real patch that's been tested and with the comments above 
> taken care of?

Yes. I will do that.

Cheers,

Peter.

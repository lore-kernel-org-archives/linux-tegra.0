From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: export clock names for debugging
Date: Fri, 27 Jun 2014 15:19:54 +0300
Message-ID: <20140627121954.GR3679@tbergstrom-lnx.Nvidia.com>
References: <1403797705-26910-1-git-send-email-pdeschrijver@nvidia.com>
 <53AC41B0.40307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53AC41B0.40307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 26, 2014 at 05:52:16PM +0200, Stephen Warren wrote:
> On 06/26/2014 09:48 AM, Peter De Schrijver wrote:
> > When writing a module for testing or debugging purposes, there is no way to
> > get hold of clk handles. This patch solves this by exposing all valid clocks
> > as clkdev's for the virtual device tegra-clk-debug.
> 
> This is to support clk_get_sys()?
> 

Yes.

> I guess this seems fine, so feel free to apply it, but I slightly wonder
> why not just include this change as part of the presumably local and
> never-to-be-upstreamed test/dev module?

The idea is to allow local debug modules to get hold of the struct clk *. I
don't think that's possible without using clk_get_sys()?

Cheers,

Peter.

From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: fix driver to match DT binding
Date: Wed, 13 Feb 2013 15:00:15 -0800
Message-ID: <20130213230015.11471.46669@quantum>
References: <1360697642-22620-1-git-send-email-swarren@wwwdotorg.org>
 <20130213155313.GA24119@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130213155313.GA24119-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2013-02-13 07:53:13)
> On Tue, Feb 12, 2013 at 12:34:02PM -0700, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > enum tegra*_clk is intended to match the IDs listed in the Tegra clock
> > bindings. There are a few mismatches, which this patch fixes:
> > 
> > 1) pll_s and cop were left out of the Tegra20 enum.
> > 
> > 2) spdif_in and spdif_out were swapped relative to the Tegra30 binding.
> > 
> > 3) i2cslow was misnamed as i2c_slow, and a duplicate i2cslow clock added
> >    to the Tegra30 enum.
> > 
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk-tegra20.c |    4 ++--
> >  drivers/clk/tegra/clk-tegra30.c |    6 +++---
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> Looks good to me and I haven't seen any regressions, so:
> 
> Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Tested-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Hurray for testing.  If this hasn't already been sent to Arnd & Olof:

Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: fix SS control on PLL enable/disable
Date: Thu, 4 May 2017 10:42:26 +0300
Message-ID: <20170504074226.GR30730@tbergstrom-lnx.Nvidia.com>
References: <1492691989-30539-1-git-send-email-pdeschrijver@nvidia.com>
 <20170422023848.GJ7065@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170422023848.GJ7065-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 21, 2017 at 07:38:48PM -0700, Stephen Boyd wrote:
> On 04/20, Peter De Schrijver wrote:
> > PLL SS was only controlled when setting the PLL rate, not when the PLL
> > itself is enabled or disabled. This means that if the PLL rate was set
> > before the PLL is enabled, SS will not be enabled, even when configured.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Fixes tag? Or this isn't a problem right now, just future fix?
> 

This isn't a problem right now, at least noone complained about it.

Peter.

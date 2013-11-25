From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: tegra: Fix clock rate computation
Date: Mon, 25 Nov 2013 16:09:10 +0200
Message-ID: <20131125140910.GI26617@tbergstrom-lnx.Nvidia.com>
References: <1384787499-26994-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384787499-26994-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 18, 2013 at 04:11:35PM +0100, Thierry Reding wrote:
> The PLL output frequency is multiplied during the P-divider computation,
> so it needs to be divided by the P-divider again before returning.
> 
> This fixes an issue where clk_round_rate() would return the multiplied
> frequency instead of the real one after the P-divider.
> 

Series Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
I will squash the Tegra124 fixes in the Tegra124 series.

Cheers,

Peter.

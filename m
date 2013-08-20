From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/5] clk: tegra: Fix vde/2d/3d clock src offset
Date: Tue, 20 Aug 2013 11:47:29 +0300
Message-ID: <20130820084729.GQ18810@tbergstrom-lnx.Nvidia.com>
References: <1375874709-10438-1-git-send-email-markz@nvidia.com>
 <1375874709-10438-3-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1375874709-10438-3-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 07, 2013 at 01:25:07PM +0200, Mark Zhang wrote:
> In Tegra114, vde/gr_2d/gr_3d have 3 bits for clock source selection.
> So change the clock init macro for these clocks from
> "TEGRA_INIT_DATA_INT" to "TEGRA_INIT_DATA_INT8".
> 
> Besides, no one uses "TEGRA_INIT_DATA_INT" after this change, so
> remove this macro.
> 
> Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

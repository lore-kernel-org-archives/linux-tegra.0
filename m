From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/5] clk: tegra: Fix vde/2d/3d clock src offset
Date: Wed, 07 Aug 2013 11:00:08 -0600
Message-ID: <52027D18.5040106@wwwdotorg.org>
References: <1375874709-10438-1-git-send-email-markz@nvidia.com> <1375874709-10438-3-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375874709-10438-3-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/07/2013 05:25 AM, Mark Zhang wrote:
> In Tegra114, vde/gr_2d/gr_3d have 3 bits for clock source selection.
> So change the clock init macro for these clocks from
> "TEGRA_INIT_DATA_INT" to "TEGRA_INIT_DATA_INT8".
> 
> Besides, no one uses "TEGRA_INIT_DATA_INT" after this change, so
> remove this macro.

Patches 3-5 look fine as far as I'm concerned, although I'd like Peter
or Prashant to ack them too.

Patches 3-5,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

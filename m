From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fixup post dividers on Tegra210
Date: Fri, 5 Feb 2016 11:36:54 -0500
Message-ID: <56B4CFA6.8090301@nvidia.com>
References: <1454689052-25289-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454689052-25289-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2/5/2016 11:17 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Commit 86c679a52294 ("clk: tegra: pll: Fix _pll_ramp_calc_pll logic and
> _calc_dynamic_ramp_rate") changed the PLL divider computation logic to
> consistently use P-divider values from tables as real dividers rather
> than the hardware values. Unfortunately for some reason many of the
> Tegra210 clocks didn't have their tables updated (most likely an over-
> sight by me when applying the patches). This commit fixes them all up.
> 
> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 94 ++++++++++++++++++++--------------------
>  1 file changed, 47 insertions(+), 47 deletions(-)
> 

Acked-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


-- 
nvpublic

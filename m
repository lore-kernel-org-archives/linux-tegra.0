From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] regulator: Rail is said to be enable only if this and
 supply rails are enabled.
Date: Tue, 3 Jan 2012 20:16:24 +0000
Message-ID: <20120103201624.GC2843@opensource.wolfsonmicro.com>
References: <1325570983-3700-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325570983-3700-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 03, 2012 at 11:39:43AM +0530, Laxman Dewangan wrote:
> From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The given rail is said to be enabled only if this rail is eanbled
> along with supply rail.
> Adding check for the supply rail whether it is enabled or not when
> query about rail enabled.

This feels wrong - the code in general assumes that the parents will all
be enabled for an enabled child (and does the required stuff on enable
and disable).  Doing the check isn't unreasonable but if it fails we
really ought to be complaining loudly as we're probably confused and
things might be going wrong elsewhere.

We should also look at the bootstrapping code, we're not really making
much effort to verify that the hardware configuration on boot is sane
(though realistically it's unlikely that it won't be).

> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> When consumer of any rails query about whether rail is enabled
> or not, the function regulator_is_enabled() should return enabled
> only if this rail and supply rail (both) are enabled.
> if any one of rail, whether the given rail or supply rail, is enabled
> then function should return as not enabled.

Please just put things in the changelog if they're useful.

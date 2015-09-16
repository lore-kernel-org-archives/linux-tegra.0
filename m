From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: dfll: add missing rcu_read_unlock() for
 error path
Date: Wed, 16 Sep 2015 15:15:31 -0700
Message-ID: <20150916221531.GN23081@codeaurora.org>
References: <1442384094-22144-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442384094-22144-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vince.h-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/16, Vince Hsu wrote:
> From: Vince Hsu <vince.h-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The commit e770940218028c6a5927fda45f2ca9db5d9b35e0 ("clk: tegra: dfll:
> Properly protect OPP list") added the rcu_read_{lock,unlock} but missed
> one in the error path. So add the missing one.
> 
> Signed-off-by: Vince Hsu <vince.h-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

I think we'll just squash this into the original patch from
Thierry.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

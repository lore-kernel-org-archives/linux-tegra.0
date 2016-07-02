From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.8-rc1
Date: Fri, 1 Jul 2016 17:30:20 -0700
Message-ID: <20160702003020.GH27880@codeaurora.org>
References: <20160701150056.26537-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160701150056.26537-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/01, Thierry Reding wrote:
> Hi Michael, Stephen,
> 
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.8-clk
> 
> for you to fetch changes up to 15d68e8c2e95e8b62465c7cb3bc642784365ee1b:
> 
>   clk: tegra: Initialize UTMI PLL when enabling PLLU (2016-06-30 17:43:17 +0200)
> 

Pulled but please fix these types of errors next time.

ERROR: code indent should use tabs where possible
#470: FILE: drivers/clk/tegra/clk-pll.c:2568:
+^I         PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |$

ERROR: code indent should use tabs where possible
#471: FILE: drivers/clk/tegra/clk-pll.c:2569:
+^I         PLLU_HW_PWRDN_CFG0_USE_LOCKDET;$

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

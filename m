From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 09/10] clk: tegra: make clk-tegra124-dfll-fcpu explicitly
 non-modular
Date: Fri, 4 Nov 2016 13:33:13 -0700
Message-ID: <20161104203313.GI16026@codeaurora.org>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-10-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160704211220.5685-10-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/04, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> arch/arm/mach-tegra/Kconfig:config ARCH_TEGRA_124_SOC
> arch/arm/mach-tegra/Kconfig:    bool "Enable support for Tegra124 family"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tags etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

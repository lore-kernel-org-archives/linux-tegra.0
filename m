From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.7-rc1
Date: Mon, 9 May 2016 15:42:19 -0700
Message-ID: <20160509224219.GY3492@codeaurora.org>
References: <1461945596-24090-1-git-send-email-thierry.reding@gmail.com>
 <20160503000248.GB3492@codeaurora.org>
 <20160509051946.GA18753@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160509051946.GA18753-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/09, Thierry Reding wrote:
>
> I'm not aware of any API that would fit in this case. Power domains
> would be misleading because power management isn't involved. One other
> alternative that I had thought about is to make it a "virtual" reset,
> but that is equally misleading because nothing is really being reset
> here.
> 
> Yet another option might be to make it a "virtual" clock, though it'd
> have to be somewhat hacky because we need two steps (one to enable HW
> control and another to start the HW sequencer). That could be
> implemented using ->prepare() and ->enable(), respectively, but it's
> really not a clock either.
> 
> I welcome any ideas on how to turn this into something generic, though.
> 

I suggested power domains because it looks like SoC glue code
that we need to do when the device is powered on and off? Unless
I totally misread how it was used. And I suppose I should have
said generic power domains (genpd) instead of power domains,
because I agree it's not actual power management, just some SoC
runtime PM stuff it seems. But who knows, I probably misread it
all.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

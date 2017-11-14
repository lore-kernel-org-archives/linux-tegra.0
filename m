From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [GIT PULL v2] clk: tegra: Changes for v4.15-rc1
Date: Tue, 14 Nov 2017 09:55:26 -0800
Message-ID: <20171114175526.GZ11955@codeaurora.org>
References: <20171107152532.13918-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171107152532.13918-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/07, Thierry Reding wrote:
> Hi Michael, Stephen,
> 
> The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:
> 
>   Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.15-clk-2
> 
> for you to fetch changes up to 22ef01a203d27fee8b7694020b7e722db7efd2a7:
> 
>   clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_init() (2017-11-01 15:00:07 +0100)
> 
> Note that this pulls in parts from two other tags that are going to go
> in via the ARM SoC tree. Those are needed to a couple of resolve build
> dependencies.
> 
> This is the follow-up pull request that includes Jon's fix for the pclk
> issue.

Thanks. Pulled into clk-next.

> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> clk: tegra: Changes for v4.15-rc1
> 
> This contains cleanups and minor fixes for the Tegra clock driver.
> 

Please try to be a bit more descriptive here. I use these tag
messages for the overall PR to linus and it makes it easier if I
don't have to dig through all the commits to summarize up.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

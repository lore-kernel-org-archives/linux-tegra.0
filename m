From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/4] clk: tegra: Fix sor1_out clock implementation
Date: Thu, 2 Nov 2017 01:16:56 -0700
Message-ID: <20171102081656.GM11011@codeaurora.org>
References: <20170901145343.19890-1-thierry.reding@gmail.com>
 <20170901145343.19890-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170901145343.19890-4-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09/01, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This clock was previously called sor1_src and was modelled as an input
> to the sor1 module clock. However, it's really an output clock that can
> be fed either from the safe, the sor1_pad_clkout or the sor1 module
> clocks. sor1 itself can take input from either of the display PLLs.
> 
> The same implementation for the sor1_out clock is used on Tegra186, so
> this nicely lines up both SoC generations to deal with this clock in a
> uniform way.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

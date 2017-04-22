From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: tegra: fix SS control on PLL enable/disable
Date: Fri, 21 Apr 2017 19:38:48 -0700
Message-ID: <20170422023848.GJ7065@codeaurora.org>
References: <1492691989-30539-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492691989-30539-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/20, Peter De Schrijver wrote:
> PLL SS was only controlled when setting the PLL rate, not when the PLL
> itself is enabled or disabled. This means that if the PLL rate was set
> before the PLL is enabled, SS will not be enabled, even when configured.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>

Fixes tag? Or this isn't a problem right now, just future fix?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

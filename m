From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: tegra30: fix cclk_lp divisor register
Date: Thu, 2 Nov 2017 01:17:10 -0700
Message-ID: <20171102081710.GN11011@codeaurora.org>
References: <f54b8ff896d3dcbae51741b817d65a7e9a21987a.1505789180.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f54b8ff896d3dcbae51741b817d65a7e9a21987a.1505789180.git.mirq-linux@rere.qmqm.pl>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09/19, Michał Mirosław wrote:
> According to comments in code and common sense, cclk_lp uses its
> own divisor, not cclk_g's.
> 
> Fixes: b08e8c0ecc42 ("clk: tegra: add clock support for Tegra30")
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

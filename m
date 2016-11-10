From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH -next] clk: tegra: dfll: Use builtin_platform_driver to
 simplify the code
Date: Thu, 10 Nov 2016 14:08:49 -0800
Message-ID: <20161110220849.GH16026@codeaurora.org>
References: <1478791224-21510-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478791224-21510-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/10, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Use the builtin_platform_driver() macro to make the code simpler.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

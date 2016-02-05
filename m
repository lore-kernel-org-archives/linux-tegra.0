From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Fix divider settings for Tegra210 pll_a
Date: Fri, 5 Feb 2016 11:03:04 -0500
Message-ID: <56B4C7B8.4090402@nvidia.com>
References: <1454680897-9464-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454680897-9464-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 2/5/2016 9:01 AM, Jon Hunter wrote:
> When setting the pll_a frequency, to what should be 368639844 Hz, the
> actual output frequency of the pll is 737279687 Hz (as reported by the
> debugfs clk_summary entry), which is double the expect frequency. The
> calculations for the pll frequency appear to be correct and the problem
> is caused by incorrect divider settings for the pll_a in the look-up
> table of multipliers and dividers. The P dividers for all entries in the
> table are all one less than they should be. Fix this by increasing the
> value of the P dividers by 1 to get the expected rates.
> 
> The rates in the table have been verified using the following equations:
> 
> 1. Integer NDIV (SDM_DIN = 0)
>    fout = (fref * n) / (m * p)
> 
> 2. Fractional NDIV
>    fout = (fref * (n + 0.5 + (SDM_DIN/8192))) / (m * p)
> 
> Where SDM_DIN is a signed 16-bit value between 0xf000 and 0x1000.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> 
> Thierry, Rhyland, please note that after this change, the pll_a settings
> match those in the nvidia downstream 3.18 kernel for Tegra210.
> 
>

This was an issue we had before/around merging T210 driver. The tegra
clock code was inconsistent in how it treated the pdiv. In some places
it stored the direct HW value in the frequency table entry struct (like
in the predefined frequencies like what you changed). Some places stored
the translated (=_hw_to_p_div()). This is most commonly a difference in
a factor of 2.

I found when initially doing the T210 that most clocks I requested rates
for came out at either 1/2 or 2x what I wanted depending on the path.

I think when Thierry merged my series, he added some code to address
this issue, as he saw it too I think. Depending on what his change was
(to consistently store either pdiv or hw_val) then we may need to adjust
ALL the predefined rates in the clk-tegra210 code.

Thierry, do you remember off-hand what you changed for that?

-rhyland

-- 
nvpublic

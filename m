From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2] clk: tegra210: Fix default rates for HDA clocks
Date: Thu, 13 Jun 2019 16:53:22 +0100
Message-ID: <d69e549b-1509-b249-0a4e-16417b2ce3e8@nvidia.com>
References: <1559743299-11576-1-git-send-email-jonathanh@nvidia.com>
 <20190607002314.4AEF321019@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190607002314.4AEF321019@mail.kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 07/06/2019 01:23, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
> 
> The bot has tested the following trees: v5.1.7, v5.0.21, v4.19.48, v4.14.123, v4.9.180, v4.4.180.
> 
> v5.1.7: Build OK!
> v5.0.21: Build OK!
> v4.19.48: Failed to apply! Possible dependencies:
>     845d782d9144 ("clk: tegra: Fix maximum audio sync clock for Tegra124/210")
> 
> v4.14.123: Failed to apply! Possible dependencies:
>     26f8590c4a1f ("clk: tegra: Make vic03 a child of pll_c3")
>     845d782d9144 ("clk: tegra: Fix maximum audio sync clock for Tegra124/210")
>     c485ad63abb4 ("clk: tegra: Specify VDE clock rate")
> 
> v4.9.180: Failed to apply! Possible dependencies:
>     24c3ebef1ab6 ("clk: tegra: Add aclk")
>     26f8590c4a1f ("clk: tegra: Make vic03 a child of pll_c3")
>     319af7975c9f ("clk: tegra: Define Tegra210 DMIC sync clocks")
>     34ac2c278b30 ("clk: tegra: Fix ISP clock modelling")
>     3843832fc8ca ("clk: tegra: Handle UTMIPLL IDDQ")
>     845d782d9144 ("clk: tegra: Fix maximum audio sync clock for Tegra124/210")
>     8dce89a1c2cf ("clk: tegra: Don't warn for PLL defaults unnecessarily")
>     9326947f2215 ("clk: tegra: Fix pll_a1 iddq register, add pll_a1")
>     bfa34832df1f ("clk: tegra: Add CEC clock")
>     c485ad63abb4 ("clk: tegra: Specify VDE clock rate")
>     e745f992cf4b ("clk: tegra: Rework pll_u")
> 
> v4.4.180: Failed to apply! Possible dependencies:
>     26f8590c4a1f ("clk: tegra: Make vic03 a child of pll_c3")
>     385f9adf625f ("clk: tegra: Constify pdiv-to-hw mappings")
>     407254da291c ("clk: tegra: pll: Add logic for out-of-table rates for T210")
>     6583a6309e83 ("clk: tegra: pll: Add tegra_pll_wait_for_lock to clk header")
>     845d782d9144 ("clk: tegra: Fix maximum audio sync clock for Tegra124/210")
>     86c679a52294 ("clk: tegra: pll: Fix _pll_ramp_calc_pll logic and _calc_dynamic_ramp_rate")
>     8d99704fde54 ("clk: tegra: Format tables consistently")
>     c485ad63abb4 ("clk: tegra: Specify VDE clock rate")
>     c4947e364b50 ("clk: tegra: Fix 26 MHz oscillator frequency")
>     d907f4b4a178 ("clk: tegra: pll: Add logic for handling SDM data")
>     dd322f047d22 ("clk: tegra: pll: Add specialized logic for Tegra210")
>     e52d7c04bb39 ("clk: tegra: Miscellaneous coding style cleanups")
>     e745f992cf4b ("clk: tegra: Rework pll_u")
> 
> 
> How should we proceed with this patch?

I think that applying to 5.0 and 5.1 is fine for now.

Thanks
Jon

-- 
nvpublic

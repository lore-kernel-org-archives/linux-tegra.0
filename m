From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V15 6/6] i2c: tegra: add i2c interface timing support
Date: Fri, 8 Feb 2019 15:53:37 +0300
Message-ID: <3824e7bd-e129-511a-358b-42391ccee0f9@gmail.com>
References: <1549576040-15907-1-git-send-email-skomatineni@nvidia.com>
 <1549576040-15907-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549576040-15907-6-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.02.2019 0:47, Sowjanya Komatineni пишет:
> This patch adds I2C interface timing registers support for
> proper bus rate configuration along with meeting the I2C spec
> setup and hold times based on the tuning performed on Tegra210,
> Tegra186 and Tegra194 platforms.
> 
> I2C_INTERFACE_TIMING_0 register contains TLOW and THIGH field
> and Tegra I2C controller design uses them as a part of internal
> clock divisor.
> 
> I2C_INTERFACE_TIMING_1 register contains the setup and hold times
> for start and stop conditions.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---

[snip]

>  
> +	if (i2c_dev->bus_clk_rate > I2C_STANDARD_MODE &&
> +	    i2c_dev->bus_clk_rate <= I2C_FAST_PLUS_MODE) {
> +		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
> +		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
> +	} else {
> +		tlow = i2c_dev->hw->tlow_std_mode;
> +		thigh = i2c_dev->hw->thigh_std_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
> +	}
> +
> +	if (i2c_dev->hw->has_interface_timing_reg && val) {

Shouldn't it be "&& tlow"?

> +		val = (thigh << I2C_THIGH_SHIFT) | tlow;
> +		i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
> +	}
> +
> +	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
> +		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);

Do we really need those "&& tlow" and "&& tsu_thd" at all? It looks to me that checking for "has_interface_timing_reg" should be enough.

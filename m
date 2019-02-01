From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 2/5] i2c: tegra: add bus clear master support
Date: Fri, 1 Feb 2019 22:06:39 +0300
Message-ID: <f74879c3-4cbe-d59e-ee57-3ebe5bb0a269@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549040867-18149-2-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.02.2019 20:07, Sowjanya Komatineni пишет:
> Bus clear feature of Tegra I2C controller helps to recover from
> bus hang when I2C master loses the bus arbitration due to the
> slave device holding SDA LOW continuously for some unknown reasons.
> 
> Per I2C specification, the device that held the bus LOW should
> release it within 9 clock pulses.
> 
> During bus clear operation, Tegra I2C controller sends 9 clock
> pulses and terminates the transaction with STOP condition.
> Upon successful bus clear operation, bus goes to idle state and
> driver retries the transaction.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  [V9] : Rebased to 5.0-rc4
>  [V5/V6/V7/V8]: Same as V4
>  [V4]: Added I2C Bus Clear support patch to this version of series.
> 
>  drivers/i2c/busses/i2c-tegra.c | 73 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

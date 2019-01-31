From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V8 2/5] i2c: tegra: Add Bus Clear Master Support
Date: Thu, 31 Jan 2019 18:16:36 +0300
Message-ID: <5aacf5c7-13bb-c8ae-d8f2-259b0c3f3c81@gmail.com>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548915387-28826-2-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.01.2019 9:16, Sowjanya Komatineni пишет:
> Bus clear feature of tegra i2c controller helps to recover from
> bus hang when i2c master loses the bus arbitration due to the
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
> ---
>  [V5/V6/V7/V8]: Same as V4
>  [V4]: Added I2C Bus Clear support patch to this version of series.
> 
 
I haven't checked all of the bits in this patch, but at least -EAGAIN should work as expected on older Tegra's:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com> 

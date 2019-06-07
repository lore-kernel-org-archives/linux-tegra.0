From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V1 4/6] i2c: tegra: add spinlock definition comment
Date: Fri, 7 Jun 2019 15:04:34 +0300
Message-ID: <18cd06dd-d28a-12c3-74fd-4877a81e91ef@gmail.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-4-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559908507-31192-4-git-send-email-bbiswas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Fix checkpatch.pl CHECK as follows:
> CHECK: spinlock_t definition without comment
> +       spinlock_t xfer_lock;
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 2d381de..bececa6 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -269,6 +269,7 @@ struct tegra_i2c_dev {
>  	u32 bus_clk_rate;
>  	u16 clk_divisor_non_hs_mode;
>  	bool is_multimaster_mode;
> +	/* xfer_lock: lock to serialize transfer submission and processing */
>  	spinlock_t xfer_lock;
>  	struct dma_chan *tx_dma_chan;
>  	struct dma_chan *rx_dma_chan;
> 

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

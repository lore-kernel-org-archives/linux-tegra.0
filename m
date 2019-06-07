From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V1 2/6] i2c: tegra: remove unnecessary variable init
Date: Fri, 7 Jun 2019 15:03:31 +0300
Message-ID: <9acd02f4-9b37-c31d-b6ae-af8c99bc8d9a@gmail.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-2-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559908507-31192-2-git-send-email-bbiswas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Remove variable initializations in functions that
> are followed by assignments before use
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 00692d8..f7116b7 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -689,7 +689,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  	u32 val;
>  	int err;
>  	u32 clk_divisor, clk_multiplier;
> -	u32 tsu_thd = 0;
> +	u32 tsu_thd;
>  	u8 tlow, thigh;
>  
>  	err = pm_runtime_get_sync(i2c_dev->dev);
> @@ -1218,7 +1218,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  {
>  	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>  	int i;
> -	int ret = 0;
> +	int ret;
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
>  	if (ret < 0) {
> @@ -1489,7 +1489,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	void __iomem *base;
>  	phys_addr_t base_phys;
>  	int irq;
> -	int ret = 0;
> +	int ret;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	base_phys = res->start;
> 

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

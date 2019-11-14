From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4/4] i2c: tegra: Use dma_request_chan() directly for
 channel request
Date: Thu, 14 Nov 2019 07:05:47 +0000
Message-ID: <f30dcd10-69ea-3bf7-99b2-8d12fc5e4cc0@nvidia.com>
References: <20191113092235.30440-1-peter.ujfalusi@ti.com>
 <20191113092235.30440-5-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191113092235.30440-5-peter.ujfalusi@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, ludovic.desroches@microchip.com, agross@kernel.org, wsa+renesas@sang-engineering.com, ldewangan@nvidia.com
Cc: vkoul@kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, digetx@gmail.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, bjorn.andersson@linaro.org
List-Id: linux-tegra@vger.kernel.org


On 13/11/2019 09:22, Peter Ujfalusi wrote:
> dma_request_slave_channel_reason() is:
> #define dma_request_slave_channel_reason(dev, name) \
> 	dma_request_chan(dev, name)
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c1683f9338b4..a98bf31d0e5c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -413,7 +413,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  		return 0;
>  	}
>  
> -	chan = dma_request_slave_channel_reason(i2c_dev->dev, "rx");
> +	chan = dma_request_chan(i2c_dev->dev, "rx");
>  	if (IS_ERR(chan)) {
>  		err = PTR_ERR(chan);
>  		goto err_out;
> @@ -421,7 +421,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  
>  	i2c_dev->rx_dma_chan = chan;
>  
> -	chan = dma_request_slave_channel_reason(i2c_dev->dev, "tx");
> +	chan = dma_request_chan(i2c_dev->dev, "tx");
>  	if (IS_ERR(chan)) {
>  		err = PTR_ERR(chan);
>  		goto err_out;
> 
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon


-- 
nvpublic

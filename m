From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 21:24:11 +0300
Message-ID: <5483b9d5-816f-3969-2d1e-9712d93dd0a6@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.02.2019 22:16, Sowjanya Komatineni пишет:

> +		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE) {
> +			dma_sync_single_for_cpu(i2c_dev->dev,
> +						i2c_dev->dma_phys,
> +						xfer_size,
> +						DMA_FROM_DEVICE);
> +			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
> +			       msg->len);
> +		}
> +
> +		if (i2c_dev->msg_err != I2C_ERR_NONE) {
> +			dmaengine_synchronize(i2c_dev->msg_read ?
> +					      i2c_dev->rx_dma_chan :
> +					      i2c_dev->tx_dma_chan);
> +		}

Minor nit: parentheses are not really around the dmaengine_synchronize()

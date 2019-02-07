From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 23:46:17 +0300
Message-ID: <59f39ee7-c7da-52ea-cc67-52c5af879c35@gmail.com>
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
> +	if (!i2c_dev->msg_read) {
> +		if (dma) {
> +			memcpy(buffer, msg->buf, msg->len);
> +			dma_sync_single_for_device(i2c_dev->dev,
> +						   i2c_dev->dma_phys,
> +						   xfer_size,
> +						   DMA_TO_DEVICE);
> +			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
> +			if (err < 0) {
> +				dev_err(i2c_dev->dev,
> +					"starting TX DMA failed, err %d\n",
> +					err);
> +				goto unlock;
> +			}
> +

This newline is not really needed here.

> +		} else {
> +			tegra_i2c_fill_tx_fifo(i2c_dev);
> +		}
> +	}

That's my last comment for v14. Looking forward for v15!

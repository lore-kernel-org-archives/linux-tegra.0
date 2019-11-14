From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/3] tty: serial: tegra: Use dma_request_chan() directly
 for channel request
Date: Thu, 14 Nov 2019 07:05:12 +0000
Message-ID: <17285b24-b94b-7e86-d386-c5cf3c15c259@nvidia.com>
References: <20191113094618.1725-1-peter.ujfalusi@ti.com>
 <20191113094618.1725-4-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191113094618.1725-4-peter.ujfalusi@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, gregkh@linuxfoundation.org, linux@armlinux.org.uk, agross@kernel.org, bjorn.andersson@linaro.org, ldewangan@nvidia.com, thierry.reding@gmail.com
Cc: vkoul@kernel.org, jslaby@suse.com, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/11/2019 09:46, Peter Ujfalusi wrote:
> dma_request_slave_channel_reason() is:
> #define dma_request_slave_channel_reason(dev, name) \
> 	dma_request_chan(dev, name)
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/tty/serial/serial-tegra.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
> index 2f599515c133..b6ace6290e23 100644
> --- a/drivers/tty/serial/serial-tegra.c
> +++ b/drivers/tty/serial/serial-tegra.c
> @@ -1122,8 +1122,7 @@ static int tegra_uart_dma_channel_allocate(struct tegra_uart_port *tup,
>  	int ret;
>  	struct dma_slave_config dma_sconfig;
>  
> -	dma_chan = dma_request_slave_channel_reason(tup->uport.dev,
> -						dma_to_memory ? "rx" : "tx");
> +	dma_chan = dma_request_chan(tup->uport.dev, dma_to_memory ? "rx" : "tx");
>  	if (IS_ERR(dma_chan)) {
>  		ret = PTR_ERR(dma_chan);
>  		dev_err(tup->uport.dev,
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic

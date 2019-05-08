From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/8] soc: tegra: fuse: Change to the correct
 __dma_request_channel() prototype
Date: Wed, 8 May 2019 18:15:17 +0300
Message-ID: <8746a913-0014-7036-7fab-4e0dfab04e1b@gmail.com>
References: <cover.1557206859.git.baolin.wang@linaro.org>
 <1ddb1abe8722154dd546d265d5c4536480a24a87.1557206859.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1ddb1abe8722154dd546d265d5c4536480a24a87.1557206859.git.baolin.wang@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>, dan.j.williams@intel.com, vkoul@kernel.org
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, Zubair.Kakakhel@imgtec.com, wsa+renesas@sang-engineering.com, jroedel@suse.de, vincent.guittot@linaro.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

07.05.2019 9:09, Baolin Wang пишет:
> Since we've introduced one device node parameter for __dma_request_channel(),
> thus change to the correct function prototype.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra20.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
> index 49ff017..e2571b6 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra20.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
> @@ -110,7 +110,7 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
>  	dma_cap_zero(mask);
>  	dma_cap_set(DMA_SLAVE, mask);
>  
> -	fuse->apbdma.chan = __dma_request_channel(&mask, dma_filter, NULL);
> +	fuse->apbdma.chan = __dma_request_channel(&mask, dma_filter, NULL, NULL);
>  	if (!fuse->apbdma.chan)
>  		return -EPROBE_DEFER;
>  
> 

1) Kernel should be kept bisect'able by not having intermediate patches
that break compilation. Hence you should squash the changes into a
single patch.

2) Better to replace __dma_request_channel() with dma_request_channel()
since they are equal.

-- 
Dmitry

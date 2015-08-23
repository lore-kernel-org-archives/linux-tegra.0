From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [RFC PATCH 1/7] DMA: tegra-apb: Correct runtime-pm usage
Date: Sun, 23 Aug 2015 19:47:07 +0530
Message-ID: <20150823141707.GB13546@localhost>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
 <1439905755-25150-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439905755-25150-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 18, 2015 at 02:49:09PM +0100, Jon Hunter wrote:

> @@ -1543,7 +1531,7 @@ static int tegra_dma_pm_suspend(struct device *dev)
>  	int ret;
>  
>  	/* Enable clock before accessing register */
> -	ret = tegra_dma_runtime_resume(dev);
> +	ret = pm_runtime_get_sync(dev);

why is this required ?

-- 
~Vinod

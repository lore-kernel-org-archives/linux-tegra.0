From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Fix unused function warnings
Date: Thu, 25 Jul 2019 18:32:55 +0530
Message-ID: <20190725130255.GV12733@vkoul-mobl.Dlink>
References: <20190709083258.57112-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190709083258.57112-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: ldewangan@nvidia.com, jonathanh@nvidia.com, dan.j.williams@intel.com, thierry.reding@gmail.com, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09-07-19, 16:32, YueHaibing wrote:
> If CONFIG_PM is not set, build warnings:
> 
> drivers/dma/tegra210-adma.c:747:12: warning: tegra_adma_runtime_resume defined but not used [-Wunused-function]
>  static int tegra_adma_runtime_resume(struct device *dev)
> drivers/dma/tegra210-adma.c:715:12: warning: tegra_adma_runtime_suspend defined but not used [-Wunused-function]
>  static int tegra_adma_runtime_suspend(struct device *dev)
> 
> Mark the two function as __maybe_unused.

Applied, thanks

-- 
~Vinod

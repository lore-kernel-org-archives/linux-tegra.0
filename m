From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH -next] dmaengine: tegra-apb: mark PM functions as
 __maybe_unused
Date: Fri, 20 Mar 2020 17:25:04 +0300
Message-ID: <8d60faa5-2749-0581-7ee5-252f15b0e9cf@gmail.com>
References: <20200320071337.59756-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200320071337.59756-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, ldewangan@nvidia.com, jonathanh@nvidia.com, dan.j.williams@intel.com, vkoul@kernel.org, thierry.reding@gmail.com, swarren@wwwdotorg.org
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

20.03.2020 10:13, YueHaibing пишет:
> When CONFIG_PM is disabled, gcc warning this:
> 
> drivers/dma/tegra20-apb-dma.c:1587:12: warning: 'tegra_dma_runtime_resume' defined but not used [-Wunused-function]
> drivers/dma/tegra20-apb-dma.c:1578:12: warning: 'tegra_dma_runtime_suspend' defined but not used [-Wunused-function]
> 
> Make it as __maybe_unused to fix the warnings,
> also remove unneeded function declarations.
> 
> Fixes: ec8a1586780c ("dma: tegra: add dmaengine based dma driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
...

Looks good, thank you:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

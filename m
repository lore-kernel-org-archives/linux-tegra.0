From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v1] dmaengine: tegra: Use relaxed versions of readl/writel
Date: Fri, 26 Apr 2019 17:31:48 +0530
Message-ID: <20190426120148.GB28103@vkoul-mobl>
References: <20190424231708.21219-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424231708.21219-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 25-04-19, 02:17, Dmitry Osipenko wrote:
> The readl/writel functions are inserting memory barrier in order to
> ensure that memory stores are completed. On Tegra20 and Tegra30 this
> results in L2 cache syncing which isn't a cheapest operation. The
> tegra20-apb-dma driver doesn't need to synchronize generic memory
> accesses, hence use the relaxed versions of the functions.

Subsystem name is **dmaengine** not dma! Please fix that
-- 
~Vinod

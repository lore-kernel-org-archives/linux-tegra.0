From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] [v5] dmaengine: tegra210-adma: Fix runtime PM imbalance
 on error
Date: Wed, 24 Jun 2020 15:12:34 +0530
Message-ID: <20200624094234.GW2324254@vkoul-mobl>
References: <20200624064626.19855-1-dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200624064626.19855-1-dinghao.liu@zju.edu.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: kjlu@umn.edu, Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 24-06-20, 14:46, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.

Applied, thanks

-- 
~Vinod

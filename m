From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: remove PM_CLK dependency
Date: Fri, 5 Jul 2019 11:59:45 +0530
Message-ID: <20190705062945.GW2911@vkoul-mobl>
References: <1561046059-15821-1-git-send-email-spujar@nvidia.com>
 <1f21a03d-4cb9-c0e3-588e-8183d6f31cae@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1f21a03d-4cb9-c0e3-588e-8183d6f31cae@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Sameer Pujar <spujar@nvidia.com>, dan.j.williams@intel.com, thierry.reding@gmail.com, ldewangan@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20-06-19, 17:02, Jon Hunter wrote:
> 
> On 20/06/2019 16:54, Sameer Pujar wrote:
> > Tegra ADMA does not use pm-clk interface now and hence the dependency
> > is removed from Kconfig.

Applied, thanks

-- 
~Vinod

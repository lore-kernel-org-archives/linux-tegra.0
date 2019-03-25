From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 1/2] dmaengine: tegra210-adma: use devm_clk_*() helpers
Date: Mon, 25 Mar 2019 10:24:29 +0530
Message-ID: <20190325045429.GF5348@vkoul-mobl>
References: <1552476757-22360-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552476757-22360-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: dan.j.williams@intel.com, treding@nvidia.com, jonathanh@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 13-03-19, 17:02, Sameer Pujar wrote:
> adma driver is using pm_clk_*() interface for managing clock resources.
> With this it is observed that clocks remain ON always. This happens on
> Tegra devices which use BPMP co-processor to manage clock resources,
> where clocks are enabled during prepare phase. This is necessary because
> clocks to BPMP are always blocking. When pm_clk_*() interface is used on
> such Tegra devices, clock prepare count is not balanced till remove call
> happens for the driver and hence clocks are seen ON always. Thus this
> patch replaces pm_clk_*() with devm_clk_*() framework.

Both applied, thanks

-- 
~Vinod

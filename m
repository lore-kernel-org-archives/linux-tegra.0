From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v1 0/3] Tegra DMA residue improvements
Date: Wed, 21 May 2014 11:22:13 +0530
Message-ID: <20140521055213.GK21128@intel.com>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Freeman <cfreeman@nvidia.com>
Cc: ldewangan@nvidia.com, swarren@nvidia.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, May 06, 2014 at 02:22:20PM -0700, Christopher Freeman wrote:
> A collection of patches to improve Tegra's DMA residual reporting
> 
> Christopher Freeman (3):
>   dma: tegra: finer granularity residual for tx_status
>   dma: tegra: change interrupt-related log levels
>   dma: tegra: avoid int overflow for transferred count
Can you pls use the *right* subsystem name...

-- 
~Vinod

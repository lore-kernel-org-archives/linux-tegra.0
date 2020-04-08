From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] dmaengine: tegra: fix broken 'select' statement
Date: Wed, 8 Apr 2020 15:37:34 -0600
Message-ID: <7c637edc-200b-ed8e-26c8-52c2c7d8025a@wwwdotorg.org>
References: <20200408200504.4067970-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200408200504.4067970-1-arnd@arndb.de>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 4/8/20 2:04 PM, Arnd Bergmann wrote:
> A SoC driver selects the dmaengine driver for the platform it
> is made for, leading to Kconfig warnings in some configurations:
> 
> WARNING: unmet direct dependencies detected for TEGRA20_APB_DMA
>   Depends on [n]: DMADEVICES [=n] && (ARCH_TEGRA [=y] || COMPILE_TEST [=y])
>   Selected by [y]:
>   - SOC_TEGRA_FUSE [=y] && ARCH_TEGRA [=y] && ARCH_TEGRA_2x_SOC [=y]
> 
> WARNING: unmet direct dependencies detected for TEGRA20_APB_DMA
>   Depends on [n]: DMADEVICES [=n] && (ARCH_TEGRA [=y] || COMPILE_TEST [=y])
>   Selected by [y]:
>   - SOC_TEGRA_FUSE [=y] && ARCH_TEGRA [=y] && ARCH_TEGRA_2x_SOC [=y]
> 
> Generally, no driver should 'select' a driver from a different subsystem,
> especially when there is no build-time dependency between the two.

IIRC there's a run-time dependency between the two though; without the
DMA driver available to implement a HW WAR, the fuse driver has to
access fuse registers directly which IIRC can cause a lock-up, or
something like that. So I think allowing APD_DMA to be deselected by the
user is wrong for T20 at least; it simply must be enabled. Perhaps
ARCH_TEGRA_2x_SOC should select it instead?

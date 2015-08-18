From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/4] DMA: tegra-apb: Clean-up
Date: Tue, 18 Aug 2015 11:09:02 +0100
Message-ID: <55D3043E.2030907@nvidia.com>
References: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438867953-11378-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Any feedback on this series?

Cheers Jon

On 06/08/15 14:32, Jon Hunter wrote:
> Some clean-up changes for the tegra-apb DMA driver.
> 
> These have been compile and boot tested for ARM and ARM64. Summary of the
> ARM results are below. ARM64 has been tested locally.
> 
> Test summary
> ------------
> 
> Build: zImage:
>     Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig
> 
> Boot to userspace: multi_v7_defconfig:
>     Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
>                    tegra20-trimslice, tegra30-beaver
> 
> Boot to userspace: tegra_defconfig:
>     Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
>                    tegra20-trimslice, tegra30-beaver
> 
> Jon Hunter (4):
>   DMA: tegra-apb: Remove unused variables
>   DMA: tegra-apb: Avoid unnecessary channel base address calculation
>   DMA: tegra-apb: Remove unnecessary return statements and variables
>   DMA: tegra-apb: Simplify locking for device using global pause
> 
>  drivers/dma/tegra20-apb-dma.c | 63 ++++++++++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 25 deletions(-)
> 

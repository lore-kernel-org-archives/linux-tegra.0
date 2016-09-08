From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dmaengine: tegra210-adma: Add memcpy support
Date: Thu, 8 Sep 2016 10:31:42 -0700
Message-ID: <20160908173141.GA28381@Asurada-Nvidia>
References: <cover.1473186743.git.nicoleotsuka@gmail.com>
 <c730136b708404e1257eb28bb1dc2cbf13bf6023.1473186743.git.nicoleotsuka@gmail.com>
 <bafb9b89-2b45-c419-62d4-b25a50f8d6be@nvidia.com>
 <37d4645c-6318-78bd-79bb-844fb6764a1b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <37d4645c-6318-78bd-79bb-844fb6764a1b-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 08, 2016 at 03:19:57PM +0100, Jon Hunter wrote:

> I tried this again on my audio testing branch for tegra210 and it worked ...
> 
> [   36.427210] dmatest: Started 1 threads using dma1chan0
> [   37.036948] dmatest: dma1chan0-copy0: summary 1024 tests, 0 failures 2410 iops 19419 KB/s (0)
> 
> Do you have other patches in your branch? If so it would be good to
> understand the dependency. May be we are missing a clock somewhere?

Sorry. I forgot to mention that the TEGRA210_CLK_APE_SLCG_OVR
clock is required for the tests. So I cherry-picked 2 patches
from your audio branch to the linux-next:
	clk: tegra210: Add SLCG override gate clocks
	ARM64: tegra: DT: Add SLCG clock for AUD

Besides these two, there'e merely some straightforward changes
to enable the ADMA in the defconfig and DT.

And it seems that you've submitted that patch once but it got
hold because it wasn't so useful at that time?

Thanks
Nic

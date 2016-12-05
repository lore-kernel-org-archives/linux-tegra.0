From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 0/8] Host1x IOMMU support + VIC support
Date: Mon, 5 Dec 2016 15:25:05 +0200
Message-ID: <b4186213-7ce1-901c-0bb5-3b1a02abfbda@kapsi.fi>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110182345.31777-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Bump

On 10.11.2016 20:23, Mikko Perttunen wrote:
> This series adds IOMMU support to Host1x and TegraDRM
> and adds support for the VIC host1x client so that
> host1x can be tested on modern Tegra platforms.
> It depends on the previous fix series. The whole thing
> (modulo patch order) is available as a git repository at
> git://github.com/cyndis/linux.git; branch vic-v1.
>
> IO memory management is organized such that there are
> two domains: the host1x domain and the tegradrm domain.
> The host1x domain is used by the host1x engine and
> contains the host1x CDMA and pushbuffers for submitted
> jobs.
>
> The tegradrm domain is shared by all host1x units and
> contains GEM objects and memory allocated by the
> separate tegra_drm_alloc function. This function is
> currently used to allocate space for firmware blobs
> in the tegradrm domain.
>
> A userspace test case for VIC can be found at
> https://github.com/cyndis/drm/tree/work/tegra.
> The testcase is in tests/tegra and is called submit_vic.
> The in-kernel firewall is not implemented for VIC;
> therefore, IOMMU must be enabled for the test to pass.
>
> Tested with Jetson TX1 (T210). Probably works also
> with Jetson TK1 (T124). Note that due to hardware changes
> the testcase also needs to be changed to run properly
> on T124.
>
> Thanks,
>   Mikko.
>
> Arto Merilainen (2):
>   drm/tegra: Add falcon helper library
>   drm/tegra: Add VIC support
>
> Mikko Perttunen (6):
>   drm/tegra: Add Tegra DRM allocation API
>   drm/tegra: Allocate BOs from lower 4G when without IOMMU
>   gpu: host1x: Add IOMMU support
>   dt-bindings: Add bindings for the Tegra VIC
>   arm64: tegra: Enable VIC on T210
>   arm64: tegra: Enable IOMMU for Host1x on Tegra210
>
>  .../display/tegra/nvidia,tegra20-host1x.txt        |  13 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  19 +-
>  drivers/gpu/drm/tegra/Makefile                     |   4 +-
>  drivers/gpu/drm/tegra/drm.c                        | 101 +++++-
>  drivers/gpu/drm/tegra/drm.h                        |   8 +
>  drivers/gpu/drm/tegra/falcon.c                     | 256 +++++++++++++
>  drivers/gpu/drm/tegra/falcon.h                     | 130 +++++++
>  drivers/gpu/drm/tegra/gem.c                        |   2 +-
>  drivers/gpu/drm/tegra/vic.c                        | 400 +++++++++++++++++++++
>  drivers/gpu/drm/tegra/vic.h                        |  31 ++
>  drivers/gpu/host1x/cdma.c                          |  65 +++-
>  drivers/gpu/host1x/cdma.h                          |   4 +-
>  drivers/gpu/host1x/dev.c                           |  39 +-
>  drivers/gpu/host1x/dev.h                           |   5 +
>  drivers/gpu/host1x/hw/cdma_hw.c                    |  10 +-
>  drivers/gpu/host1x/job.c                           |  76 +++-
>  drivers/gpu/host1x/job.h                           |   1 +
>  include/linux/host1x.h                             |   1 +
>  18 files changed, 1128 insertions(+), 37 deletions(-)
>  create mode 100644 drivers/gpu/drm/tegra/falcon.c
>  create mode 100644 drivers/gpu/drm/tegra/falcon.h
>  create mode 100644 drivers/gpu/drm/tegra/vic.c
>  create mode 100644 drivers/gpu/drm/tegra/vic.h
>

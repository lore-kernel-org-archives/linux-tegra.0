From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] Dynamic Host1x channel allocation
Date: Tue, 7 Nov 2017 18:34:16 +0300
Message-ID: <7b0dc171-0e40-2119-e67a-a3cf5910e16c@gmail.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171105110118.15142-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.11.2017 14:01, Mikko Perttunen wrote:
> Hi all,
> 
> this adds support for a new model of hardware channel allocation for
> Host1x/TegraDRM. In the current model, one hardware channel is
> allocated for each client device at probe time. This is simple but
> does not allow for optimal use of hardware resources.
> 
> In the new model, we allocate channels dynamically when a
> "userspace channel", opened using the channel open IOCTL, has pending
> jobs. However, each userspace channel can only have one assigned
> channel at a time, ensuring current serialization behavior is kept.
> As such there is no change in programming model for the userspace.
> 
> The patch adapts VIC to use the new model - GR2D and GR3D are not
> modified, as the older Tegra chips they are found on do not have
> a large number of hardware channels and therefore it is not clear
> if the new model is beneficial (and I don't have access to those
> chips to test it out).
> 

I think it should be useful regardless of channels number and the main benefit
is probably that jobs arbitration is done on HW, that should prevent one process
to block other other for a long time.

> Tested using the host1x_test test suite, and also by running
> the performance test of host1x_test in parallel.
> 
> Thanks,
> Mikko
> 
> Mikko Perttunen (10):
>   gpu: host1x: Parameterize channel aperture size
>   gpu: host1x: Print MLOCK state in debug dumps on T186
>   gpu: host1x: Add lock around channel allocation
>   gpu: host1x: Lock classes during job submission
>   gpu: host1x: Add job done callback
>   drm/tegra: Deliver job completion callback to client
>   drm/tegra: Make syncpoints be per-context
>   drm/tegra: Implement dynamic channel allocation model
>   drm/tegra: Boot VIC in runtime resume
>   gpu: host1x: Optionally block when acquiring channel
> 
>  drivers/gpu/drm/tegra/drm.c                    |  82 +++++++++++++++--
>  drivers/gpu/drm/tegra/drm.h                    |  12 ++-
>  drivers/gpu/drm/tegra/gr2d.c                   |   8 +-
>  drivers/gpu/drm/tegra/gr3d.c                   |   8 +-
>  drivers/gpu/drm/tegra/vic.c                    | 120 ++++++++++++------------
>  drivers/gpu/host1x/cdma.c                      |  45 ++++++---
>  drivers/gpu/host1x/cdma.h                      |   1 +
>  drivers/gpu/host1x/channel.c                   |  47 ++++++++--
>  drivers/gpu/host1x/channel.h                   |   3 +
>  drivers/gpu/host1x/hw/cdma_hw.c                | 122 +++++++++++++++++++++++++
>  drivers/gpu/host1x/hw/channel_hw.c             |  74 +++++++++++----
>  drivers/gpu/host1x/hw/debug_hw_1x06.c          |  18 +++-
>  drivers/gpu/host1x/hw/host1x01_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/host1x02_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/host1x04_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/host1x05_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/host1x06_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/hw_host1x01_channel.h    |   2 +
>  drivers/gpu/host1x/hw/hw_host1x01_sync.h       |   6 ++
>  drivers/gpu/host1x/hw/hw_host1x02_channel.h    |   2 +
>  drivers/gpu/host1x/hw/hw_host1x02_sync.h       |   6 ++
>  drivers/gpu/host1x/hw/hw_host1x04_channel.h    |   2 +
>  drivers/gpu/host1x/hw/hw_host1x04_sync.h       |   6 ++
>  drivers/gpu/host1x/hw/hw_host1x05_channel.h    |   2 +
>  drivers/gpu/host1x/hw/hw_host1x05_sync.h       |   6 ++
>  drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h |   5 +
>  drivers/gpu/host1x/hw/hw_host1x06_vm.h         |   2 +
>  include/linux/host1x.h                         |   6 +-
>  28 files changed, 517 insertions(+), 118 deletions(-)
> 

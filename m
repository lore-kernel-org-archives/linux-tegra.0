From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/tegra: A couple of fixes for v5.6-rc1
Date: Wed, 5 Feb 2020 20:11:26 +0300
Message-ID: <e6520041-f760-a74b-0250-1108e61b899c@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200204135926.1156340-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

04.02.2020 16:59, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Hi,
> 
> this contains a couple of fixes for a DMA API performance regression
> that was introduced in v5.5 for older Tegra devices. Patches 1 and 2
> will likely have to be backported to v5.5.
> 
> Thierry
> 
> Thierry Reding (3):
>   drm/tegra: Relax IOMMU usage criteria on old Tegra
>   drm/tegra: Reuse IOVA mapping where possible
>   gpu: host1x: Set DMA direction only for DMA-mapped buffer objects
> 
>  drivers/gpu/drm/tegra/drm.c   | 49 +++++++++++++++++++++++------------
>  drivers/gpu/drm/tegra/gem.c   | 10 ++++++-
>  drivers/gpu/drm/tegra/plane.c | 44 +++++++++++++++++--------------
>  drivers/gpu/host1x/job.c      | 34 +++++++++++++++++++++---
>  4 files changed, 96 insertions(+), 41 deletions(-)

Works on Tegra20 and Tegra30, thank you very much :)

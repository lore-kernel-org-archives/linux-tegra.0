From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/tegra: Relax IOMMU usage criteria on old Tegra
Date: Wed, 5 Feb 2020 20:19:44 +0300
Message-ID: <9cb5fc84-f03a-53d9-578d-a4c1589c1009@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200204135926.1156340-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

04.02.2020 16:59, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Older Tegra devices only allow addressing 32 bits of memory, so whether
> or not the host1x is attached to an IOMMU doesn't matter. host1x IOMMU
> attachment is only needed on devices that can address memory beyond the
> 32-bit boundary and where the host1x doesn't support the wide GATHER
> opcode that allows it to access buffers at higher addresses.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This needs a stable tag:

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.5

> ---
>  drivers/gpu/drm/tegra/drm.c | 49 ++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 17 deletions(-)

Otherwise,

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

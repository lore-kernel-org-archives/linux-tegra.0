From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/tegra: Fix SMMU support on Tegra124 and Tegra210
Date: Wed, 25 Mar 2020 20:48:05 +0000
Message-ID: <bf883fab-6c41-9e9e-f70d-d3493862529b@nvidia.com>
References: <20200325201604.833898-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200325201604.833898-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/03/2020 20:16, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> When testing whether or not to enable the use of the SMMU, consult the
> supported DMA mask rather than the actually configured DMA mask, since
> the latter might already have been restricted.
> 
> Fixes: 2d9384ff9177 ("drm/tegra: Relax IOMMU usage criteria on old Tegra")
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c |  3 ++-
>  drivers/gpu/host1x/dev.c    | 13 +++++++++++++
>  include/linux/host1x.h      |  3 +++
>  3 files changed, 18 insertions(+), 1 deletion(-)


Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic

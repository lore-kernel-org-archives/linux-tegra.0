Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A172BEC20;
	Fri,  4 Jul 2025 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619561; cv=none; b=ndI7dpi6WzSRCvJCEF1uFwygEXfL5SG9pLgc4xpUtBnNgzzkA8CjN6jDVfOSF2lZTkcJJdwpJRWvr+GRxANpWKxui5SntdoKfkQtTiZ5G1uNLWArtYvO1jd0GpAxrVAHZjRP6B2zEf0/ICx7fdPcziH3Ckq2wBB6uqW39CVV+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619561; c=relaxed/simple;
	bh=4aDa8NBXppN/LdbIV9IgaMcu2JbMN6S8x0zZJF6okAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKUU4HLPXC9TqEj5vNhaxh48/4JODx/SNssFnDqnuq/CtVnGD/3tIRNZe4HULwhUlE4+NSVW4FHcMdgDYw6wSTtaFXVc109X6oVbsRZ4hTjNURwISD/pBZosi44/tp7ZvHtDGfUSeHFpxLf3OCbmafOKvM8Yo91xFsppA1Ihnv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ho4Lje9f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ho4Lje9f"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E0700667;
	Fri,  4 Jul 2025 10:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751619532;
	bh=4aDa8NBXppN/LdbIV9IgaMcu2JbMN6S8x0zZJF6okAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ho4Lje9figf6lqHEqUrP+Wzcqz/AtqP6p/LJwaPqqTeoN2ePPulVy3OmzK0beeIhg
	 4uUFiHc5jnyK3yoA8xO0aCfUQfFxF5kYDM/KER0PDql4drd2aL20hfugV0iKaUkcX2
	 kPXmM8N2lL7cYvD+/KAZ6a8xflgKV5++IspyhulA=
Date: Fri, 4 Jul 2025 11:58:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Douglas Anderson <dianders@chromium.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Qiang Yu <yuq825@gmail.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Ayushi Makhija <quic_amakhija@quicinc.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	imx@lists.linux.dev, lima@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250704085848.GD14736@pendragon.ideasonboard.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250704075413.3218307-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Jul 04, 2025 at 10:54:13AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 --
>  drivers/gpu/drm/bridge/analogix/anx7625.c          | 2 --
>  drivers/gpu/drm/bridge/parade-ps8640.c             | 2 --
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 1 -
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c              | 4 ----
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c           | 2 --
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c            | 2 --
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 2 --
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c        | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c         | 1 -
>  drivers/gpu/drm/i915/intel_runtime_pm.c            | 2 --
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c               | 1 -
>  drivers/gpu/drm/lima/lima_sched.c                  | 1 -
>  drivers/gpu/drm/panel/panel-edp.c                  | 3 ---
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   | 2 --
>  drivers/gpu/drm/panel/panel-simple.c               | 2 --
>  drivers/gpu/drm/panthor/panthor_sched.c            | 2 --
>  drivers/gpu/drm/tegra/submit.c                     | 1 -
>  drivers/gpu/drm/tidss/tidss_drv.c                  | 2 --
>  drivers/gpu/drm/vc4/vc4_v3d.c                      | 1 -
>  20 files changed, 36 deletions(-)

[snip]

> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index cf0d9049bcf1..bc5a94dba2d4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -916,13 +916,11 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  	etnaviv_gpu_hw_init(gpu);
>  	mutex_unlock(&gpu->lock);
>  
> -	pm_runtime_mark_last_busy(gpu->dev);
>  	pm_runtime_put_autosuspend(gpu->dev);
>  
>  	return 0;
>  
>  fail:

You can drop the fail error later and replace it with pm_put.

> -	pm_runtime_mark_last_busy(gpu->dev);
>  pm_put:
>  	pm_runtime_put_autosuspend(gpu->dev);
>  
> @@ -1109,7 +1107,6 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
>  
>  	ret = 0;
>  
> -	pm_runtime_mark_last_busy(gpu->dev);
>  pm_put:
>  	pm_runtime_put_autosuspend(gpu->dev);
>  
> @@ -1509,7 +1506,6 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
>  	etnaviv_gpu_hw_init(gpu);
>  
>  	mutex_unlock(&gpu->lock);
> -	pm_runtime_mark_last_busy(gpu->dev);
>  pm_put:
>  	pm_runtime_put_autosuspend(gpu->dev);
>  }

[snip]

> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> index bb09df5000bd..11ec7e913974 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -153,7 +153,6 @@ vc4_v3d_pm_put(struct vc4_dev *vc4)
>  
>  	mutex_lock(&vc4->power_lock);
>  	if (--vc4->power_refcount == 0) {
> -		pm_runtime_mark_last_busy(&vc4->v3d->pdev->dev);
>  		pm_runtime_put_autosuspend(&vc4->v3d->pdev->dev);
>  	}

And here you can drop the curly braces. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	mutex_unlock(&vc4->power_lock);

-- 
Regards,

Laurent Pinchart

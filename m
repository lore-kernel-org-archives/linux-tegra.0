From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCHv4 8/8] gpu: host1x: Register DRM dummy device
Date: Fri, 21 Dec 2012 14:53:51 +0100
Message-ID: <1356098031.1490.111.camel@tellur>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>
	 <1356089964-5265-9-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356089964-5265-9-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Freitag, den 21.12.2012, 13:39 +0200 schrieb Terje Bergstrom:
> Register a dummy device for tegradrm, and provide a getter to
> access the device.
> 
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
[...]
> diff --git a/drivers/gpu/host1x/drm.c b/drivers/gpu/host1x/drm.c
> new file mode 100644
> index 0000000..eaaaeed
> --- /dev/null
> +++ b/drivers/gpu/host1x/drm.c
> @@ -0,0 +1,51 @@
> +/*
> + * Tegra host1x driver DRM dummy device
> + *
> + * Copyright (c) 2012, NVIDIA Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include "drm.h"
> +#include "dev.h"
> +
> +int host1x_register_drm_device(struct host1x *host1x)
> +{
> +	struct platform_device *drm_device;
> +
> +	drm_device = platform_device_register_simple("tegradrm", -1, NULL, 0);
> +	if (!drm_device)
> +		return -ENOMEM;
> +	dma_set_coherent_mask(&drm_device->dev, DMA_BIT_MASK(32));
> +
This might not be necessary once we move the allocator to host1x.

> +	host1x->drm_device = drm_device;
> +	return 0;
> +}
> +EXPORT_SYMBOL(host1x_register_drm_device);
> +
> +void host1x_unregister_drm_device(struct host1x *host1x)
> +{
> +	if (host1x->drm_device)
> +		platform_device_unregister(host1x->drm_device);
> +}
> +EXPORT_SYMBOL(host1x_unregister_drm_device);
> +
> +struct platform_device *host1x_drm_device(struct platform_device *pdev)
> +{
> +	struct host1x *host = platform_get_drvdata(pdev);
> +	return host->drm_device;
> +}
> +EXPORT_SYMBOL(host1x_drm_device);
This should be called host1x_get_drm_device

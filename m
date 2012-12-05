From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC libdrm] Add NVIDIA Tegra support
Date: Wed, 5 Dec 2012 09:39:11 +0200
Message-ID: <50BEFA1F.5090907@nvidia.com>
References: <1354634032-9986-1-git-send-email-thierry.reding@avionic-design.de> <1354634032-9986-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354634032-9986-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/04/2012 05:13 PM, Thierry Reding wrote:
> +int drm_tegra_open(const char *path, struct drm_tegra **devicep)
> +{
> +       struct drm_tegra *device;
> +       int err;
> +
> +       if (!path || !devicep)
> +               return -EINVAL;
> +
> +       device = calloc(1, sizeof(*device));
> +       if (!device)
> +               return -ENOMEM;
> +
> +       DRMINITLISTHEAD(&device->bo_list);
> +
> +       device->fd = open(path, O_RDWR);
> +       if (device->fd < 0) {
> +               err = -errno;
> +               free(device);
> +               return err;
> +       }
> +
> +       *devicep = device;
> +
> +       return 0;
> +}

I think you shouldn't ask the path from the application (=DDX) here, but 
use drmOpen() that automatically finds the correct device for you.

I'd also prefer letting the application open and close the device and 
modify drm_tegra_open() to take the fd as a parameter. That way the DDX 
could easily access also all generic libdrm functions.

- Arto

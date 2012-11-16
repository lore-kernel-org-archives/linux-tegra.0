From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/2] NVIDIA Tegra DRM driver
Date: Fri, 16 Nov 2012 11:57:02 +0800
Message-ID: <50A5B98E.8070002@nvidia.com>
References: <1353014903-17429-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353014903-17429-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Clark <rob-l0cyMroinI0@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

Thank you for your hard work.

The series,

Acked-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On Ventana, LVDS and HDMI worked.
PS: Alex's power sequence patch is needed to enable panel and backlight.
    Also we need to define dc and hdmi nodes in tegra20-ventana.dts.
    We may publish the patches for different boards next.

Mark
On 11/16/2012 05:28 AM, Thierry Reding wrote:
> This third version of the patch series cleans up some minor issues that
> were found in the previous versions, such as deferred probe not working
> properly and the display remaining enabled after the driver is removed.
> 
> I've also put the two patches in this series into the tegra/drm/for-3.8
> branch of my repository on gitorious[0].
> 
> Thierry
> 
> [0]: git://gitorious.org/thierryreding/linux.git
> 
> Thierry Reding (2):
>   drm: Add NVIDIA Tegra20 support
>   drm: tegra: Add HDMI support
> 
>  .../bindings/gpu/nvidia,tegra20-host1x.txt         |  191 +++
>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/tegra/Kconfig                      |   23 +
>  drivers/gpu/drm/tegra/Makefile                     |    7 +
>  drivers/gpu/drm/tegra/dc.c                         |  833 ++++++++++++
>  drivers/gpu/drm/tegra/dc.h                         |  388 ++++++
>  drivers/gpu/drm/tegra/drm.c                        |  115 ++
>  drivers/gpu/drm/tegra/drm.h                        |  234 ++++
>  drivers/gpu/drm/tegra/fb.c                         |   56 +
>  drivers/gpu/drm/tegra/hdmi.c                       | 1334 ++++++++++++++++++++
>  drivers/gpu/drm/tegra/hdmi.h                       |  575 +++++++++
>  drivers/gpu/drm/tegra/host1x.c                     |  322 +++++
>  drivers/gpu/drm/tegra/output.c                     |  272 ++++
>  drivers/gpu/drm/tegra/rgb.c                        |  228 ++++
>  15 files changed, 4581 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
>  create mode 100644 drivers/gpu/drm/tegra/Kconfig
>  create mode 100644 drivers/gpu/drm/tegra/Makefile
>  create mode 100644 drivers/gpu/drm/tegra/dc.c
>  create mode 100644 drivers/gpu/drm/tegra/dc.h
>  create mode 100644 drivers/gpu/drm/tegra/drm.c
>  create mode 100644 drivers/gpu/drm/tegra/drm.h
>  create mode 100644 drivers/gpu/drm/tegra/fb.c
>  create mode 100644 drivers/gpu/drm/tegra/hdmi.c
>  create mode 100644 drivers/gpu/drm/tegra/hdmi.h
>  create mode 100644 drivers/gpu/drm/tegra/host1x.c
>  create mode 100644 drivers/gpu/drm/tegra/output.c
>  create mode 100644 drivers/gpu/drm/tegra/rgb.c
> 

From: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Fri, 23 Nov 2012 14:39:54 +0200
Message-ID: <20121123123954.GB10090@sivaramn-lnx>
References: <1353586614-7308-1-git-send-email-tbergstrom@nvidia.com>
 <1353586614-7308-2-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353586614-7308-2-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 22, 2012 at 01:16:49PM +0100, Terje Bergstrom wrote:
> Add nvhost, the driver for host1x and 2D, which is a client device
> for host1x.
> 
> Change-Id: Id93a28491dc2d54049e0adce4ad287c5985b2bca
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/video/Kconfig                              |    2 +
>  drivers/video/Makefile                             |    2 +
>  drivers/video/tegra/host/Kconfig                   |   20 +
>  drivers/video/tegra/host/Makefile                  |   21 +
>  drivers/video/tegra/host/bus_client.c              |  101 ++++
>  drivers/video/tegra/host/bus_client.h              |   32 ++
>  drivers/video/tegra/host/chip_support.c            |   68 +++
>  drivers/video/tegra/host/chip_support.h            |  179 +++++++
>  drivers/video/tegra/host/debug.c                   |  255 ++++++++++
>  drivers/video/tegra/host/debug.h                   |   50 ++
>  drivers/video/tegra/host/dev.c                     |  104 ++++
>  drivers/video/tegra/host/dev.h                     |   33 ++
>  drivers/video/tegra/host/dmabuf.c                  |  151 ++++++
>  drivers/video/tegra/host/dmabuf.h                  |   51 ++
>  drivers/video/tegra/host/host1x/Makefile           |    6 +
>  drivers/video/tegra/host/host1x/host1x.c           |  320 ++++++++++++
>  drivers/video/tegra/host/host1x/host1x.h           |   97 ++++
>  .../video/tegra/host/host1x/host1x01_hardware.h    |  157 ++++++
>  drivers/video/tegra/host/host1x/host1x_cdma.c      |  488 ++++++++++++++++++
>  drivers/video/tegra/host/host1x/host1x_cdma.h      |   39 ++
>  drivers/video/tegra/host/host1x/host1x_channel.c   |  157 ++++++
>  drivers/video/tegra/host/host1x/host1x_debug.c     |  405 +++++++++++++++
>  drivers/video/tegra/host/host1x/host1x_intr.c      |  263 ++++++++++
>  drivers/video/tegra/host/host1x/host1x_syncpt.c    |  170 +++++++
>  .../video/tegra/host/host1x/hw_host1x01_channel.h  |  182 +++++++
>  drivers/video/tegra/host/host1x/hw_host1x01_sync.h |  398 +++++++++++++++
>  .../video/tegra/host/host1x/hw_host1x01_uclass.h   |  474 +++++++++++++++++
>  drivers/video/tegra/host/nvhost_acm.c              |  532 ++++++++++++++++++++
>  drivers/video/tegra/host/nvhost_acm.h              |   49 ++
>  drivers/video/tegra/host/nvhost_cdma.c             |  473 +++++++++++++++++
>  drivers/video/tegra/host/nvhost_cdma.h             |  116 +++++
>  drivers/video/tegra/host/nvhost_channel.c          |  129 +++++
>  drivers/video/tegra/host/nvhost_channel.h          |   65 +++
>  drivers/video/tegra/host/nvhost_intr.c             |  391 ++++++++++++++
>  drivers/video/tegra/host/nvhost_intr.h             |  110 ++++
>  drivers/video/tegra/host/nvhost_job.c              |  398 +++++++++++++++
>  drivers/video/tegra/host/nvhost_memmgr.c           |  252 ++++++++++
>  drivers/video/tegra/host/nvhost_memmgr.h           |   66 +++
>  drivers/video/tegra/host/nvhost_syncpt.c           |  453 +++++++++++++++++
>  drivers/video/tegra/host/nvhost_syncpt.h           |  148 ++++++
>  drivers/video/tegra/host/t20/Makefile              |    6 +
>  drivers/video/tegra/host/t20/t20.c                 |   78 +++
>  drivers/video/tegra/host/t20/t20.h                 |   29 ++
>  drivers/video/tegra/host/t30/Makefile              |    6 +
>  drivers/video/tegra/host/t30/t30.c                 |   80 +++
>  drivers/video/tegra/host/t30/t30.h                 |   29 ++
>  include/linux/nvhost.h                             |  302 +++++++++++
>  include/trace/events/nvhost.h                      |  249 +++++++++
>  48 files changed, 8186 insertions(+)
>  create mode 100644 drivers/video/tegra/host/Kconfig
>  create mode 100644 drivers/video/tegra/host/Makefile
>  create mode 100644 drivers/video/tegra/host/bus_client.c
>  create mode 100644 drivers/video/tegra/host/bus_client.h
>  create mode 100644 drivers/video/tegra/host/chip_support.c
>  create mode 100644 drivers/video/tegra/host/chip_support.h
>  create mode 100644 drivers/video/tegra/host/debug.c
>  create mode 100644 drivers/video/tegra/host/debug.h
>  create mode 100644 drivers/video/tegra/host/dev.c
>  create mode 100644 drivers/video/tegra/host/dev.h
>  create mode 100644 drivers/video/tegra/host/dmabuf.c
>  create mode 100644 drivers/video/tegra/host/dmabuf.h
>  create mode 100644 drivers/video/tegra/host/host1x/Makefile
>  create mode 100644 drivers/video/tegra/host/host1x/host1x.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x.h
>  create mode 100644 drivers/video/tegra/host/host1x/host1x01_hardware.h
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_cdma.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_cdma.h
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_channel.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_debug.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_intr.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_syncpt.c
>  create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_channel.h
>  create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_sync.h
>  create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_uclass.h
>  create mode 100644 drivers/video/tegra/host/nvhost_acm.c
>  create mode 100644 drivers/video/tegra/host/nvhost_acm.h
>  create mode 100644 drivers/video/tegra/host/nvhost_cdma.c
>  create mode 100644 drivers/video/tegra/host/nvhost_cdma.h
>  create mode 100644 drivers/video/tegra/host/nvhost_channel.c
>  create mode 100644 drivers/video/tegra/host/nvhost_channel.h
>  create mode 100644 drivers/video/tegra/host/nvhost_intr.c
>  create mode 100644 drivers/video/tegra/host/nvhost_intr.h
>  create mode 100644 drivers/video/tegra/host/nvhost_job.c
>  create mode 100644 drivers/video/tegra/host/nvhost_memmgr.c
>  create mode 100644 drivers/video/tegra/host/nvhost_memmgr.h
>  create mode 100644 drivers/video/tegra/host/nvhost_syncpt.c
>  create mode 100644 drivers/video/tegra/host/nvhost_syncpt.h
>  create mode 100644 drivers/video/tegra/host/t20/Makefile
>  create mode 100644 drivers/video/tegra/host/t20/t20.c
>  create mode 100644 drivers/video/tegra/host/t20/t20.h
>  create mode 100644 drivers/video/tegra/host/t30/Makefile
>  create mode 100644 drivers/video/tegra/host/t30/t30.c
>  create mode 100644 drivers/video/tegra/host/t30/t30.h
>  create mode 100644 include/linux/nvhost.h
>  create mode 100644 include/trace/events/nvhost.h
> 
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index fb9a14e..94c861b 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -2463,4 +2463,6 @@ config FB_SH_MOBILE_MERAM
>           Up to 4 memory channels can be configured, allowing 4 RGB or
>           2 YCbCr framebuffers to be configured.
> 
> +source "drivers/video/tegra/host/Kconfig"
> +
>  endmenu
> diff --git a/drivers/video/Makefile b/drivers/video/Makefile
> index b936b00..aae33a1 100644
> --- a/drivers/video/Makefile
> +++ b/drivers/video/Makefile
> @@ -17,6 +17,8 @@ obj-y                           += backlight/
> 
>  obj-$(CONFIG_EXYNOS_VIDEO)     += exynos/
> 
> +obj-$(CONFIG_TEGRA_GRHOST)     += tegra/host/
> +
>  obj-$(CONFIG_FB_CFB_FILLRECT)  += cfbfillrect.o
>  obj-$(CONFIG_FB_CFB_COPYAREA)  += cfbcopyarea.o
>  obj-$(CONFIG_FB_CFB_IMAGEBLIT) += cfbimgblt.o
> diff --git a/drivers/video/tegra/host/Kconfig b/drivers/video/tegra/host/Kconfig
> new file mode 100644
> index 0000000..2954bea
> --- /dev/null
> +++ b/drivers/video/tegra/host/Kconfig
> @@ -0,0 +1,20 @@
> +config TEGRA_GRHOST
> +       tristate "Tegra graphics host driver"
> +       help
> +         Driver for the Tegra graphics host hardware.
> +
> +config TEGRA_GRHOST_USE_DMABUF
> +       depends on TEGRA_GRHOST
> +       bool "Support dmabuf buffers"
> +       default y
> +       select DMA_SHARED_BUFFER
> +       help
> +         Support dmabuf buffers.
> +
> +config TEGRA_GRHOST_DEFAULT_TIMEOUT
> +       depends on TEGRA_GRHOST
> +       int "Default timeout for submits"
> +       default 10000
> +       help
> +         Default timeout for jobs in milliseconds. Set to zero for no timeout.
> +
> diff --git a/drivers/video/tegra/host/Makefile b/drivers/video/tegra/host/Makefile
> new file mode 100644
> index 0000000..bd12f98
> --- /dev/null
> +++ b/drivers/video/tegra/host/Makefile
> @@ -0,0 +1,21 @@
> +ccflags-y = -Idrivers/video/tegra/host -Iarch/arm/mach-tegra
> +
> +nvhost-objs = \
> +       nvhost_acm.o \
> +       nvhost_syncpt.o \
> +       nvhost_cdma.o \
> +       nvhost_intr.o \
> +       nvhost_channel.o \
> +       nvhost_job.o \
> +       dev.o \
> +       debug.o \
> +       bus_client.o \
> +       chip_support.o \
> +       nvhost_memmgr.o
> +
> +obj-$(CONFIG_TEGRA_GRHOST) += host1x/
> +obj-$(CONFIG_TEGRA_GRHOST) += t20/
> +obj-$(CONFIG_TEGRA_GRHOST) += t30/
> +obj-$(CONFIG_TEGRA_GRHOST) += nvhost.o
> +
> +obj-$(CONFIG_TEGRA_GRHOST_USE_DMABUF) += dmabuf.o
> diff --git a/drivers/video/tegra/host/bus_client.c b/drivers/video/tegra/host/bus_client.c
> new file mode 100644
> index 0000000..886d3fe
> --- /dev/null
> +++ b/drivers/video/tegra/host/bus_client.c
> @@ -0,0 +1,101 @@
> +/*
> + * drivers/video/tegra/host/bus_client.c
> + *
> + * Tegra Graphics Host Client Module
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/spinlock.h>
> +#include <linux/fs.h>
> +#include <linux/cdev.h>
> +#include <linux/uaccess.h>
> +#include <linux/file.h>
> +#include <linux/clk.h>
> +#include <linux/hrtimer.h>
> +#include <linux/export.h>
> +
> +#include <trace/events/nvhost.h>
> +
> +#include <linux/io.h>
> +#include <linux/string.h>
> +
> +#include <linux/nvhost.h>
> +
> +#include "debug.h"
> +#include "bus_client.h"
> +#include "dev.h"
> +#include "nvhost_memmgr.h"
> +#include "chip_support.h"
> +#include "nvhost_acm.h"
> +
> +#include "nvhost_channel.h"
> +
> +int nvhost_client_device_init(struct platform_device *dev)
> +{
> +       int err;
> +       struct nvhost_master *nvhost_master = nvhost_get_host(dev);
> +       struct nvhost_channel *ch;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       ch = nvhost_alloc_channel(dev);
> +       if (ch == NULL)
> +               return -ENODEV;
> +
> +       /* store the pointer to this device for channel */
> +       ch->dev = dev;
> +
> +       err = nvhost_channel_init(ch, nvhost_master, pdata->index);
> +       if (err)
> +               goto fail;
> +
> +       err = nvhost_module_init(dev);
> +       if (err)
> +               goto fail;
> +
> +       err = nvhost_device_list_add(dev);
> +       if (err)
> +               goto fail;
> +
> +       nvhost_device_debug_init(dev);
> +
> +       dev_info(&dev->dev, "initialized\n");
> +
> +       return 0;
> +
> +fail:
> +       /* Add clean-up */
> +       nvhost_free_channel(ch);
> +       return err;
> +}
> +EXPORT_SYMBOL(nvhost_client_device_init);
> +
> +int nvhost_client_device_suspend(struct platform_device *dev)
> +{
> +       int ret = 0;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       ret = nvhost_channel_suspend(pdata->channel);
> +       if (ret)
> +               return ret;
> +
> +       dev_info(&dev->dev, "suspend status: %d\n", ret);

Shouldn't this be placed before the if statement?

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(nvhost_client_device_suspend);
> diff --git a/drivers/video/tegra/host/bus_client.h b/drivers/video/tegra/host/bus_client.h
> new file mode 100644
> index 0000000..2b56213
> --- /dev/null
> +++ b/drivers/video/tegra/host/bus_client.h
> @@ -0,0 +1,32 @@
> +/*
> + * drivers/video/tegra/host/bus_client.h
> + *
> + * Tegra Graphics Host client
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#ifndef __NVHOST_BUS_CLIENT_H
> +#define __NVHOST_BUS_CLIENT_H
> +
> +#include <linux/types.h>
> +
> +struct platform_device;
> +
> +int nvhost_client_device_init(struct platform_device *dev);
> +
> +int nvhost_client_device_suspend(struct platform_device *dev);
> +
> +#endif
> diff --git a/drivers/video/tegra/host/chip_support.c b/drivers/video/tegra/host/chip_support.c
> new file mode 100644
> index 0000000..fca15a6
> --- /dev/null
> +++ b/drivers/video/tegra/host/chip_support.c
> @@ -0,0 +1,68 @@
> +/*
> + * drivers/video/tegra/host/chip_support.c
> + *
> + * Tegra Graphics Host Chip support module
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
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +#include <linux/bug.h>
> +#include <linux/slab.h>
> +
> +#include "chip_support.h"
> +#include "t20/t20.h"
> +#include "t30/t30.h"
> +
> +#include "fuse.h"
> +
> +struct nvhost_chip_support *nvhost_chip_ops;

Should this be static (considering that the below function exist)?

> +
> +struct nvhost_chip_support *nvhost_get_chip_ops(void)
> +{
> +       return nvhost_chip_ops;
> +}
> +
> +int nvhost_init_chip_support(struct nvhost_master *host)
> +{
> +       int err = 0;
> +
> +       if (nvhost_chip_ops == NULL) {
> +               nvhost_chip_ops = kzalloc(sizeof(*nvhost_chip_ops), GFP_KERNEL);
> +               if (nvhost_chip_ops == NULL) {
> +                       pr_err("%s: Cannot allocate nvhost_chip_support\n",
> +                               __func__);
> +                       return 0;
> +               }
> +       }
> +
> +       switch (tegra_chip_id) {
> +       case TEGRA20:
> +               nvhost_chip_ops->soc_name = "tegra2x";
> +               err = nvhost_init_t20_support(host, nvhost_chip_ops);
> +               break;
> +
> +       case TEGRA30:
> +               nvhost_chip_ops->soc_name = "tegra3x";
> +               err = nvhost_init_t30_support(host, nvhost_chip_ops);
> +               break;
> +
> +       default:
> +               err = -ENODEV;
> +       }
> +
> +       return err;
> +}
> diff --git a/drivers/video/tegra/host/chip_support.h b/drivers/video/tegra/host/chip_support.h
> new file mode 100644
> index 0000000..ce2ac22
> --- /dev/null
> +++ b/drivers/video/tegra/host/chip_support.h
> @@ -0,0 +1,179 @@
> +/*
> + * drivers/video/tegra/host/chip_support.h
> + *
> + * Tegra Graphics Host Chip Support
> + *
> + * Copyright (c) 2011-2012, NVIDIA Corporation.
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
> +#ifndef _NVHOST_CHIP_SUPPORT_H_
> +#define _NVHOST_CHIP_SUPPORT_H_
> +
> +#include <linux/types.h>
> +
> +struct output;
> +
> +struct nvhost_master;
> +struct nvhost_intr;
> +struct nvhost_syncpt;
> +struct nvhost_userctx_timeout;
> +struct nvhost_channel;
> +struct nvhost_cdma;
> +struct nvhost_job;
> +struct push_buffer;
> +struct nvhost_syncpt;
> +struct dentry;
> +struct nvhost_job;
> +struct nvhost_job_unpin_data;
> +struct nvhost_intr_syncpt;
> +struct mem_handle;
> +struct mem_mgr;
> +struct platform_device;
> +
> +struct nvhost_channel_ops {
> +       const char *soc_name;
> +       int (*init)(struct nvhost_channel *,
> +                   struct nvhost_master *,
> +                   int chid);
> +       int (*submit)(struct nvhost_job *job);
> +};
> +
> +struct nvhost_cdma_ops {
> +       void (*start)(struct nvhost_cdma *);
> +       void (*stop)(struct nvhost_cdma *);
> +       void (*kick)(struct  nvhost_cdma *);
> +       int (*timeout_init)(struct nvhost_cdma *,
> +                           u32 syncpt_id);
> +       void (*timeout_destroy)(struct nvhost_cdma *);
> +       void (*timeout_teardown_begin)(struct nvhost_cdma *);
> +       void (*timeout_teardown_end)(struct nvhost_cdma *,
> +                                    u32 getptr);
> +       void (*timeout_cpu_incr)(struct nvhost_cdma *,
> +                                u32 getptr,
> +                                u32 syncpt_incrs,
> +                                u32 syncval,
> +                                u32 nr_slots);
> +};
> +
> +struct nvhost_pushbuffer_ops {
> +       void (*reset)(struct push_buffer *);
> +       int (*init)(struct push_buffer *);
> +       void (*destroy)(struct push_buffer *);
> +       void (*push_to)(struct push_buffer *,
> +                       struct mem_mgr *, struct mem_handle *,
> +                       u32 op1, u32 op2);
> +       void (*pop_from)(struct push_buffer *,
> +                        unsigned int slots);
> +       u32 (*space)(struct push_buffer *);
> +       u32 (*putptr)(struct push_buffer *);
> +};
> +
> +struct nvhost_debug_ops {
> +       void (*debug_init)(struct dentry *de);
> +       void (*show_channel_cdma)(struct nvhost_master *,
> +                                 struct nvhost_channel *,
> +                                 struct output *,
> +                                 int chid);
> +       void (*show_channel_fifo)(struct nvhost_master *,
> +                                 struct nvhost_channel *,
> +                                 struct output *,
> +                                 int chid);
> +       void (*show_mlocks)(struct nvhost_master *m,
> +                           struct output *o);
> +
> +};
> +
> +struct nvhost_syncpt_ops {
> +       void (*reset)(struct nvhost_syncpt *, u32 id);
> +       void (*reset_wait_base)(struct nvhost_syncpt *, u32 id);
> +       void (*read_wait_base)(struct nvhost_syncpt *, u32 id);
> +       u32 (*update_min)(struct nvhost_syncpt *, u32 id);
> +       void (*cpu_incr)(struct nvhost_syncpt *, u32 id);
> +       int (*patch_wait)(struct nvhost_syncpt *sp,
> +                       void *patch_addr);
> +       void (*debug)(struct nvhost_syncpt *);
> +       const char * (*name)(struct nvhost_syncpt *, u32 id);
> +};
> +
> +struct nvhost_intr_ops {
> +       void (*init_host_sync)(struct nvhost_intr *);
> +       void (*set_host_clocks_per_usec)(
> +               struct nvhost_intr *, u32 clocks);
> +       void (*set_syncpt_threshold)(
> +               struct nvhost_intr *, u32 id, u32 thresh);
> +       void (*enable_syncpt_intr)(struct nvhost_intr *, u32 id);
> +       void (*disable_syncpt_intr)(struct nvhost_intr *, u32 id);
> +       void (*disable_all_syncpt_intrs)(struct nvhost_intr *);
> +       int  (*request_host_general_irq)(struct nvhost_intr *);
> +       void (*free_host_general_irq)(struct nvhost_intr *);
> +       int (*free_syncpt_irq)(struct nvhost_intr *);
> +};
> +
> +struct nvhost_dev_ops {
> +       struct nvhost_channel *(*alloc_nvhost_channel)(
> +                       struct platform_device *dev);
> +       void (*free_nvhost_channel)(struct nvhost_channel *ch);
> +};
> +
> +struct nvhost_mem_ops {
> +       struct mem_mgr *(*alloc_mgr)(void);
> +       void (*put_mgr)(struct mem_mgr *);
> +       struct mem_mgr *(*get_mgr)(struct mem_mgr *);
> +       struct mem_mgr *(*get_mgr_file)(int fd);
> +       struct mem_handle *(*alloc)(struct mem_mgr *,
> +                       size_t size, size_t align,
> +                       int flags);
> +       struct mem_handle *(*get)(struct mem_mgr *,
> +                       u32 id, struct platform_device *);
> +       void (*put)(struct mem_mgr *, struct mem_handle *);
> +       struct sg_table *(*pin)(struct mem_mgr *, struct mem_handle *);
> +       void (*unpin)(struct mem_mgr *, struct mem_handle *, struct sg_table *);
> +       void *(*mmap)(struct mem_handle *);
> +       void (*munmap)(struct mem_handle *, void *);
> +       void *(*kmap)(struct mem_handle *, unsigned int);
> +       void (*kunmap)(struct mem_handle *, unsigned int, void *);
> +       int (*pin_array_ids)(struct mem_mgr *,
> +                       struct platform_device *,
> +                       long unsigned *,
> +                       dma_addr_t *,
> +                       u32,
> +                       struct nvhost_job_unpin_data *);
> +};
> +
> +struct nvhost_chip_support {
> +       const char *soc_name;
> +       struct nvhost_channel_ops channel;
> +       struct nvhost_cdma_ops cdma;
> +       struct nvhost_pushbuffer_ops push_buffer;
> +       struct nvhost_debug_ops debug;
> +       struct nvhost_syncpt_ops syncpt;
> +       struct nvhost_intr_ops intr;
> +       struct nvhost_dev_ops nvhost_dev;
> +       struct nvhost_mem_ops mem;
> +};
> +
> +struct nvhost_chip_support *nvhost_get_chip_ops(void);
> +
> +#define host_device_op()       (nvhost_get_chip_ops()->nvhost_dev)
> +#define channel_cdma_op()      (nvhost_get_chip_ops()->cdma)
> +#define channel_op()           (nvhost_get_chip_ops()->channel)
> +#define syncpt_op()            (nvhost_get_chip_ops()->syncpt)
> +#define intr_op()              (nvhost_get_chip_ops()->intr)
> +#define cdma_op()              (nvhost_get_chip_ops()->cdma)
> +#define cdma_pb_op()           (nvhost_get_chip_ops()->push_buffer)
> +#define mem_op()               (nvhost_get_chip_ops()->mem)
> +
> +int nvhost_init_chip_support(struct nvhost_master *host);
> +
> +#endif /* _NVHOST_CHIP_SUPPORT_H_ */
> diff --git a/drivers/video/tegra/host/debug.c b/drivers/video/tegra/host/debug.c
> new file mode 100644
> index 0000000..4f912f2
> --- /dev/null
> +++ b/drivers/video/tegra/host/debug.c
> @@ -0,0 +1,255 @@
> +/*
> + * drivers/video/tegra/host/debug.c
> + *
> + * Copyright (C) 2010 Google, Inc.
> + * Author: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> + *
> + * Copyright (C) 2011-2012 NVIDIA Corporation
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +
> +#include <linux/io.h>
> +
> +#include "dev.h"
> +#include "debug.h"
> +#include "nvhost_acm.h"
> +#include "nvhost_channel.h"
> +#include "chip_support.h"
> +
> +pid_t nvhost_debug_null_kickoff_pid;
> +unsigned int nvhost_debug_trace_cmdbuf;
> +
> +pid_t nvhost_debug_force_timeout_pid;
> +u32 nvhost_debug_force_timeout_val;
> +u32 nvhost_debug_force_timeout_channel;
> +
> +void nvhost_debug_output(struct output *o, const char *fmt, ...)
> +{
> +       va_list args;
> +       int len;
> +
> +       va_start(args, fmt);
> +       len = vsnprintf(o->buf, sizeof(o->buf), fmt, args);
> +       va_end(args);
> +       o->fn(o->ctx, o->buf, len);
> +}
> +
> +static int show_channels(struct platform_device *pdev, void *data)
> +{
> +       struct nvhost_channel *ch;
> +       struct output *o = data;
> +       struct nvhost_master *m;
> +       struct nvhost_device_data *pdata;
> +
> +       if (pdev == NULL)
> +               return 0;
> +
> +       pdata = platform_get_drvdata(pdev);
> +       m = nvhost_get_host(pdev);
> +       ch = pdata->channel;
> +       if (ch) {
> +               mutex_lock(&ch->reflock);
> +               if (ch->refcount) {
> +                       mutex_lock(&ch->cdma.lock);
> +                       nvhost_get_chip_ops()->debug.show_channel_fifo(
> +                               m, ch, o, pdata->index);
> +                       nvhost_get_chip_ops()->debug.show_channel_cdma(
> +                               m, ch, o, pdata->index);
> +                       mutex_unlock(&ch->cdma.lock);
> +               }
> +               mutex_unlock(&ch->reflock);
> +       }
> +
> +       return 0;
> +}
> +
> +static void show_syncpts(struct nvhost_master *m, struct output *o)
> +{
> +       int i;
> +       nvhost_debug_output(o, "---- syncpts ----\n");
> +       for (i = 0; i < nvhost_syncpt_nb_pts(&m->syncpt); i++) {
> +               u32 max = nvhost_syncpt_read_max(&m->syncpt, i);
> +               u32 min = nvhost_syncpt_update_min(&m->syncpt, i);
> +               if (!min && !max)
> +                       continue;
> +               nvhost_debug_output(o, "id %d (%s) min %d max %d\n",
> +                       i, nvhost_get_chip_ops()->syncpt.name(&m->syncpt, i),
> +                       min, max);
> +       }
> +
> +       for (i = 0; i < nvhost_syncpt_nb_bases(&m->syncpt); i++) {
> +               u32 base_val;
> +               base_val = nvhost_syncpt_read_wait_base(&m->syncpt, i);
> +               if (base_val)
> +                       nvhost_debug_output(o, "waitbase id %d val %d\n",
> +                                       i, base_val);
> +       }
> +
> +       nvhost_debug_output(o, "\n");
> +}
> +
> +static void show_all(struct nvhost_master *m, struct output *o)
> +{
> +       nvhost_module_busy(m->dev);
> +
> +       nvhost_get_chip_ops()->debug.show_mlocks(m, o);
> +       show_syncpts(m, o);
> +       nvhost_debug_output(o, "---- channels ----\n");
> +       nvhost_device_list_for_all(o, show_channels);
> +
> +       nvhost_module_idle(m->dev);
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int show_channels_no_fifo(struct platform_device *pdev, void *data)
> +{
> +       struct nvhost_channel *ch;
> +       struct output *o = data;
> +       struct nvhost_master *m;
> +       struct nvhost_device_data *pdata;
> +
> +       if (pdev == NULL)
> +               return 0;
> +
> +       pdata = platform_get_drvdata(pdev);
> +       m = nvhost_get_host(pdev);
> +       ch = pdata->channel;
> +       if (ch) {
> +               mutex_lock(&ch->reflock);
> +               if (ch->refcount) {
> +                       mutex_lock(&ch->cdma.lock);
> +                       nvhost_get_chip_ops()->debug.show_channel_cdma(m,
> +                                       ch, o, pdata->index);
> +                       mutex_unlock(&ch->cdma.lock);
> +               }
> +               mutex_unlock(&ch->reflock);
> +       }
> +
> +       return 0;
> +}
> +
> +static void show_all_no_fifo(struct nvhost_master *m, struct output *o)
> +{
> +       nvhost_module_busy(m->dev);
> +
> +       nvhost_get_chip_ops()->debug.show_mlocks(m, o);
> +       show_syncpts(m, o);
> +       nvhost_debug_output(o, "---- channels ----\n");
> +       nvhost_device_list_for_all(o, show_channels_no_fifo);
> +
> +       nvhost_module_idle(m->dev);
> +}
> +
> +static int nvhost_debug_show_all(struct seq_file *s, void *unused)
> +{
> +       struct output o = {
> +               .fn = write_to_seqfile,
> +               .ctx = s
> +       };
> +       show_all(s->private, &o);
> +       return 0;
> +}
> +
> +static int nvhost_debug_show(struct seq_file *s, void *unused)
> +{
> +       struct output o = {
> +               .fn = write_to_seqfile,
> +               .ctx = s
> +       };
> +       show_all_no_fifo(s->private, &o);
> +       return 0;
> +}
> +
> +static int nvhost_debug_open_all(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, nvhost_debug_show_all, inode->i_private);
> +}
> +
> +static const struct file_operations nvhost_debug_all_fops = {
> +       .open           = nvhost_debug_open_all,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
> +static int nvhost_debug_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, nvhost_debug_show, inode->i_private);
> +}
> +
> +static const struct file_operations nvhost_debug_fops = {
> +       .open           = nvhost_debug_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
> +void nvhost_device_debug_init(struct platform_device *dev)
> +{
> +       struct dentry *de = NULL;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       de = debugfs_create_dir(dev->name, de);
> +
> +       pdata->debugfs = de;
> +}
> +
> +void nvhost_debug_init(struct nvhost_master *master)
> +{
> +       struct nvhost_device_data *pdata;
> +       struct dentry *de = debugfs_create_dir("tegra_host", NULL);
> +
> +       if (!de)
> +               return;
> +
> +       pdata = platform_get_drvdata(master->dev);
> +
> +       /* Store the created entry */
> +       pdata->debugfs = de;
> +
> +       debugfs_create_file("status", S_IRUGO, de,
> +                       master, &nvhost_debug_fops);
> +       debugfs_create_file("status_all", S_IRUGO, de,
> +                       master, &nvhost_debug_all_fops);
> +
> +       debugfs_create_u32("null_kickoff_pid", S_IRUGO|S_IWUSR, de,
> +                       &nvhost_debug_null_kickoff_pid);
> +       debugfs_create_u32("trace_cmdbuf", S_IRUGO|S_IWUSR, de,
> +                       &nvhost_debug_trace_cmdbuf);
> +
> +       if (nvhost_get_chip_ops()->debug.debug_init)
> +               nvhost_get_chip_ops()->debug.debug_init(de);
> +
> +       debugfs_create_u32("force_timeout_pid", S_IRUGO|S_IWUSR, de,
> +                       &nvhost_debug_force_timeout_pid);
> +       debugfs_create_u32("force_timeout_val", S_IRUGO|S_IWUSR, de,
> +                       &nvhost_debug_force_timeout_val);
> +       debugfs_create_u32("force_timeout_channel", S_IRUGO|S_IWUSR, de,
> +                       &nvhost_debug_force_timeout_channel);
> +}
> +#else
> +void nvhost_debug_init(struct nvhost_master *master)
> +{
> +}
> +#endif
> +
> +void nvhost_debug_dump(struct nvhost_master *master)
> +{
> +       struct output o = {
> +               .fn = write_to_printk
> +       };
> +       show_all(master, &o);
> +}
> diff --git a/drivers/video/tegra/host/debug.h b/drivers/video/tegra/host/debug.h
> new file mode 100644
> index 0000000..0d1110a
> --- /dev/null
> +++ b/drivers/video/tegra/host/debug.h
> @@ -0,0 +1,50 @@
> +/*
> + * drivers/video/tegra/host/debug.h
> + *
> + * Tegra Graphics Host Debug
> + *
> + * Copyright (c) 2011-2012 NVIDIA Corporation.
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
> +#ifndef __NVHOST_DEBUG_H
> +#define __NVHOST_DEBUG_H
> +
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +
> +struct output {
> +       void (*fn)(void *ctx, const char *str, size_t len);
> +       void *ctx;
> +       char buf[256];
> +};
> +
> +static inline void write_to_seqfile(void *ctx, const char *str, size_t len)
> +{
> +       seq_write((struct seq_file *)ctx, str, len);
> +}
> +
> +static inline void write_to_printk(void *ctx, const char *str, size_t len)
> +{
> +       pr_info("%s", str);
> +}
> +
> +void nvhost_debug_output(struct output *o, const char *fmt, ...);
> +
> +extern pid_t nvhost_debug_null_kickoff_pid;
> +extern pid_t nvhost_debug_force_timeout_pid;
> +extern u32 nvhost_debug_force_timeout_val;
> +extern u32 nvhost_debug_force_timeout_channel;
> +extern unsigned int nvhost_debug_trace_cmdbuf;
> +
> +#endif /*__NVHOST_DEBUG_H */
> diff --git a/drivers/video/tegra/host/dev.c b/drivers/video/tegra/host/dev.c
> new file mode 100644
> index 0000000..4743039
> --- /dev/null
> +++ b/drivers/video/tegra/host/dev.c
> @@ -0,0 +1,104 @@
> +/*
> + * drivers/video/tegra/host/dev.c
> + *
> + * Tegra Graphics Host Driver Entrypoint
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/nvhost.h>
> +
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/nvhost.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +
> +/* host1x device list is used in 2 places:
> + * 1. In ioctl(NVHOST_IOCTL_CTRL_MODULE_REGRDWR) of host1x device
> + * 2. debug-fs dump of host1x and client device
> + *    as well as channel state */
> +struct nvhost_device_list {
> +       struct list_head list;
> +       struct platform_device *pdev;
> +};
> +
> +/* HEAD for the host1x device list */
> +static struct nvhost_device_list ndev_head;
> +
> +/* Constructor for the host1x device list */
> +void nvhost_device_list_init(void)
> +{
> +       INIT_LIST_HEAD(&ndev_head.list);
> +}
> +
> +/* Adds a device to tail of host1x device list */
> +int nvhost_device_list_add(struct platform_device *pdev)
> +{
> +       struct nvhost_device_list *list;
> +
> +       list = kzalloc(sizeof(struct nvhost_device_list), GFP_KERNEL);
> +       if (!list)
> +               return -ENOMEM;
> +
> +       list->pdev = pdev;
> +       list_add_tail(&list->list, &ndev_head.list);
> +
> +       return 0;
> +}
> +
> +/* Iterator function for host1x device list
> + * It takes a fptr as an argument and calls that function for each
> + * device in the list */
> +void nvhost_device_list_for_all(void *data,
> +       int (*fptr)(struct platform_device *pdev, void *fdata))
> +{
> +       struct list_head *pos;
> +       struct nvhost_device_list *nlist;
> +       int ret;
> +
> +       list_for_each(pos, &ndev_head.list) {
> +               nlist = list_entry(pos, struct nvhost_device_list, list);
> +               if (nlist && nlist->pdev && fptr) {
> +                       ret = fptr(nlist->pdev, data);
> +                       if (ret) {
> +                               pr_info("%s: iterator error\n", __func__);
> +                               break;
> +                       }
> +               }
> +       }
> +}
> +
> +/* Removes a device from the host1x device list */
> +void nvhost_device_list_remove(struct platform_device *pdev)
> +{
> +       struct list_head *pos;
> +       struct nvhost_device_list *nlist;
> +
> +       list_for_each(pos, &ndev_head.list) {
> +               nlist = list_entry(pos, struct nvhost_device_list, list);
> +               if (nlist && nlist->pdev == pdev) {
> +                       list_del(&nlist->list);
> +                       kfree(nlist);

Can there be multiple matches? If yes, shouldn't you be using
list_for_each_safe, instead of list_for_each? If no, then the function
should return immediately? Also, I think you can use nlist instead of
pos and remove calling list_entry()?

> +               }
> +       }
> +}
> +
> +MODULE_AUTHOR("Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
> +MODULE_DESCRIPTION("Graphics host driver for Tegra products");
> +MODULE_VERSION("1.0");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform-nvhost");
> diff --git a/drivers/video/tegra/host/dev.h b/drivers/video/tegra/host/dev.h
> new file mode 100644
> index 0000000..12dfda5
> --- /dev/null
> +++ b/drivers/video/tegra/host/dev.h
> @@ -0,0 +1,33 @@
> +/*
> + * drivers/video/tegra/host/dev.h
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
> +#ifndef NVHOST_DEV_H
> +#define NVHOST_DEV_H
> +
> +#include "host1x/host1x.h"
> +
> +struct platform_device;
> +
> +void nvhost_device_list_init(void);
> +int nvhost_device_list_add(struct platform_device *pdev);
> +void nvhost_device_list_for_all(void *data,
> +       int (*fptr)(struct platform_device *pdev, void *fdata));
> +struct platform_device *nvhost_device_list_match_by_id(u32 id);
> +void nvhost_device_list_remove(struct platform_device *pdev);
> +
> +#endif
> diff --git a/drivers/video/tegra/host/dmabuf.c b/drivers/video/tegra/host/dmabuf.c
> new file mode 100644
> index 0000000..0ae9d78
> --- /dev/null
> +++ b/drivers/video/tegra/host/dmabuf.c
> @@ -0,0 +1,151 @@
> +/*
> + * drivers/video/tegra/host/dmabuf.c
> + *
> + * Tegra Graphics Host DMA-BUF support
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
> +#include <linux/dma-buf.h>
> +#include <linux/nvhost.h>
> +#include "chip_support.h"
> +#include "nvhost_memmgr.h"
> +
> +static inline struct dma_buf_attachment *to_dmabuf_att(struct mem_handle *h)
> +{
> +       return (struct dma_buf_attachment *)(((u32)h) & ~0x3);
> +}
> +
> +static inline struct dma_buf *to_dmabuf(struct mem_handle *h)
> +{
> +       return to_dmabuf_att(h)->dmabuf;
> +}
> +
> +static inline int to_dmabuf_fd(u32 id)
> +{
> +       return nvhost_memmgr_id(id) >> 2;
> +}
> +struct mem_handle *nvhost_dmabuf_alloc(size_t size, size_t align, int flags)
> +{
> +       /* TODO: Add allocation via DMA Mapping API */
> +       return NULL;
> +}
> +
> +void nvhost_dmabuf_put(struct mem_handle *handle)
> +{
> +       struct dma_buf_attachment *attach = to_dmabuf_att(handle);
> +       struct dma_buf *dmabuf = attach->dmabuf;
> +       dma_buf_detach(dmabuf, attach);
> +       dma_buf_put(dmabuf);
> +}
> +
> +struct sg_table *nvhost_dmabuf_pin(struct mem_handle *handle)
> +{
> +       return dma_buf_map_attachment(to_dmabuf_att(handle),
> +                               DMA_BIDIRECTIONAL);
> +}
> +
> +void nvhost_dmabuf_unpin(struct mem_handle *handle, struct sg_table *sgt)
> +{
> +       dma_buf_unmap_attachment(to_dmabuf_att(handle), sgt, DMA_BIDIRECTIONAL);
> +}
> +
> +
> +void *nvhost_dmabuf_mmap(struct mem_handle *handle)
> +{
> +       return dma_buf_vmap(to_dmabuf(handle));
> +}
> +
> +void nvhost_dmabuf_munmap(struct mem_handle *handle, void *addr)
> +{
> +       dma_buf_vunmap(to_dmabuf(handle), addr);
> +}
> +
> +void *nvhost_dmabuf_kmap(struct mem_handle *handle, unsigned int pagenum)
> +{
> +       return dma_buf_kmap(to_dmabuf(handle), pagenum);
> +}
> +
> +void nvhost_dmabuf_kunmap(struct mem_handle *handle, unsigned int pagenum,
> +               void *addr)
> +{
> +       dma_buf_kunmap(to_dmabuf(handle), pagenum, addr);
> +}
> +
> +struct mem_handle *nvhost_dmabuf_get(u32 id, struct platform_device *dev)
> +{
> +       struct mem_handle *h;
> +       struct dma_buf *buf;
> +
> +       buf = dma_buf_get(to_dmabuf_fd(id));
> +       if (IS_ERR_OR_NULL(buf))
> +               return (struct mem_handle *)buf;
> +       else {

Redundant 'else'

> +               h = (struct mem_handle *)dma_buf_attach(buf, &dev->dev);
> +               if (IS_ERR_OR_NULL(h))
> +                       dma_buf_put(buf);
> +       }
> +
> +       return (struct mem_handle *) ((u32)h | mem_mgr_type_dmabuf);
> +}
> +
> +int nvhost_dmabuf_pin_array_ids(struct platform_device *dev,
> +               long unsigned *ids,
> +               long unsigned id_type_mask,
> +               long unsigned id_type,
> +               u32 count,
> +               struct nvhost_job_unpin_data *unpin_data,
> +               dma_addr_t *phys_addr) {

Nit: wrong bracket placement

> +       int i;
> +       int pin_count = 0;
> +       int err;
> +
> +       for (i = 0; i < count; i++) {
> +               struct mem_handle *handle;
> +               struct sg_table *sgt;
> +
> +               if ((ids[i] & id_type_mask) != id_type)
> +                       continue;
> +
> +               handle = nvhost_dmabuf_get(ids[i], dev);
> +
> +               if (IS_ERR(handle)) {
> +                       err = PTR_ERR(handle);
> +                       goto fail;
> +               }
> +
> +               sgt = nvhost_dmabuf_pin(handle);
> +               if (IS_ERR_OR_NULL(sgt)) {
> +                       nvhost_dmabuf_put(handle);
> +                       err = PTR_ERR(sgt);
> +                       goto fail;
> +               }
> +
> +               phys_addr[i] = sg_dma_address(sgt->sgl);
> +
> +               unpin_data[pin_count].h = handle;
> +               unpin_data[pin_count].mem = sgt;
> +               pin_count++;
> +       }
> +       return pin_count;
> +fail:
> +       while (pin_count) {
> +               pin_count--;
> +               nvhost_dmabuf_unpin(unpin_data[pin_count].h,
> +                               unpin_data[pin_count].mem);
> +               nvhost_dmabuf_put(unpin_data[pin_count].h);
> +       }
> +       return err;
> +}
> diff --git a/drivers/video/tegra/host/dmabuf.h b/drivers/video/tegra/host/dmabuf.h
> new file mode 100644
> index 0000000..fc26477
> --- /dev/null
> +++ b/drivers/video/tegra/host/dmabuf.h
> @@ -0,0 +1,51 @@
> +/*
> + * drivers/video/tegra/host/dmabuf.h
> + *
> +  * Tegra Graphics Host dmabuf memory manager
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
> +#ifndef __NVHOST_DMABUF_H
> +#define __NVHOST_DMABUF_H
> +
> +#include "nvhost_memmgr.h"
> +
> +struct nvhost_chip_support;
> +struct platform_device;
> +
> +struct mem_mgr *nvhost_dmabuf_alloc_mgr(void);
> +void nvhost_dmabuf_put_mgr(struct mem_mgr *mgr);
> +struct mem_mgr *nvhost_dmabuf_get_mgr(struct mem_mgr *mgr);
> +struct mem_mgr *nvhost_dmabuf_get_mgr_file(int fd);
> +struct mem_handle *nvhost_dmabuf_alloc(struct mem_mgr *mgr,
> +               size_t size, size_t align, int flags);
> +void nvhost_dmabuf_put(struct mem_handle *handle);
> +struct sg_table *nvhost_dmabuf_pin(struct mem_handle *handle);
> +void nvhost_dmabuf_unpin(struct mem_handle *handle, struct sg_table *sgt);
> +void *nvhost_dmabuf_mmap(struct mem_handle *handle);
> +void nvhost_dmabuf_munmap(struct mem_handle *handle, void *addr);
> +void *nvhost_dmabuf_kmap(struct mem_handle *handle, unsigned int pagenum);
> +void nvhost_dmabuf_kunmap(struct mem_handle *handle, unsigned int pagenum,
> +               void *addr);
> +int nvhost_dmabuf_get(u32 id, struct platform_device *dev);
> +int nvhost_dmabuf_pin_array_ids(struct platform_device *dev,
> +               long unsigned *ids,
> +               long unsigned id_type_mask,
> +               long unsigned id_type,
> +               u32 count,
> +               struct nvhost_job_unpin_data *unpin_data,
> +               dma_addr_t *phys_addr);
> +#endif
> diff --git a/drivers/video/tegra/host/host1x/Makefile b/drivers/video/tegra/host/host1x/Makefile
> new file mode 100644
> index 0000000..516e16f
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/Makefile
> @@ -0,0 +1,6 @@
> +ccflags-y = -Idrivers/video/tegra/host
> +
> +nvhost-host1x-objs  = \
> +       host1x.o
> +
> +obj-$(CONFIG_TEGRA_GRHOST) += nvhost-host1x.o
> diff --git a/drivers/video/tegra/host/host1x/host1x.c b/drivers/video/tegra/host/host1x/host1x.c
> new file mode 100644
> index 0000000..db4389d
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x.c
> @@ -0,0 +1,320 @@
> +/*
> + * drivers/video/tegra/host/dev.c
> + *
> + * Tegra Graphics Host Driver Entrypoint
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include <linux/slab.h>
> +#include <linux/fs.h>
> +#include <linux/cdev.h>
> +#include <linux/uaccess.h>
> +#include <linux/file.h>
> +#include <linux/clk.h>
> +#include <linux/hrtimer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include "dev.h"
> +#include <trace/events/nvhost.h>
> +
> +#include <linux/nvhost.h>
> +
> +#include "debug.h"
> +#include "bus_client.h"
> +#include "nvhost_acm.h"
> +#include "nvhost_channel.h"
> +#include "chip_support.h"
> +
> +#define DRIVER_NAME            "tegra-host1x"
> +
> +struct nvhost_master *nvhost;
> +
> +/* public sync point API */
> +u32 host1x_syncpt_incr_max(u32 id, u32 incrs)
> +{
> +       struct nvhost_syncpt *sp = &nvhost->syncpt;
> +       return nvhost_syncpt_incr_max(sp, id, incrs);
> +}
> +EXPORT_SYMBOL(host1x_syncpt_incr_max);
> +
> +void host1x_syncpt_incr(u32 id)
> +{
> +       struct nvhost_syncpt *sp = &nvhost->syncpt;
> +       nvhost_syncpt_incr(sp, id);
> +}
> +EXPORT_SYMBOL(host1x_syncpt_incr);
> +
> +u32 host1x_syncpt_read(u32 id)
> +{
> +       struct nvhost_syncpt *sp = &nvhost->syncpt;
> +       return nvhost_syncpt_read(sp, id);
> +}
> +EXPORT_SYMBOL(host1x_syncpt_read);
> +
> +int host1x_syncpt_wait(u32 id, u32 thresh,
> +       u32 timeout, u32 *value)
> +{
> +       struct nvhost_syncpt *sp = &nvhost->syncpt;
> +       return nvhost_syncpt_wait_timeout(sp, id, thresh, timeout, value);
> +}
> +EXPORT_SYMBOL(host1x_syncpt_wait);
> +
> +struct nvhost_ctrl_userctx {
> +       struct nvhost_master *dev;
> +       u32 *mod_locks;
> +};
> +
> +static void power_on_host(struct platform_device *dev)
> +{
> +       struct nvhost_master *host = nvhost_get_private_data(dev);
> +
> +       nvhost_syncpt_reset(&host->syncpt);
> +}
> +
> +static int power_off_host(struct platform_device *dev)
> +{
> +       struct nvhost_master *host = nvhost_get_private_data(dev);
> +
> +       nvhost_syncpt_save(&host->syncpt);
> +       return 0;
> +}
> +
> +static void clock_on_host(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +       struct nvhost_master *host = nvhost_get_private_data(dev);
> +       nvhost_intr_start(&host->intr, clk_get_rate(pdata->clk[0]));
> +}
> +
> +static int clock_off_host(struct platform_device *dev)
> +{
> +       struct nvhost_master *host = nvhost_get_private_data(dev);
> +       nvhost_intr_stop(&host->intr);
> +       return 0;
> +}
> +
> +static int __devinit nvhost_user_init(struct nvhost_master *host)
> +{
> +       int err = 0;
> +
> +       host->nvhost_class = class_create(THIS_MODULE, IFACE_NAME);
> +       if (IS_ERR(host->nvhost_class)) {
> +               err = PTR_ERR(host->nvhost_class);
> +               dev_err(&host->dev->dev, "failed to create class\n");
> +       }
> +
> +       return err;
> +}
> +
> +struct nvhost_channel *nvhost_alloc_channel(struct platform_device *dev)
> +{
> +       return host_device_op().alloc_nvhost_channel(dev);
> +}
> +
> +void nvhost_free_channel(struct nvhost_channel *ch)
> +{
> +       host_device_op().free_nvhost_channel(ch);
> +}
> +
> +static void nvhost_free_resources(struct nvhost_master *host)
> +{
> +       kfree(host->intr.syncpt);
> +       host->intr.syncpt = 0;
> +}
> +
> +static int __devinit nvhost_alloc_resources(struct nvhost_master *host)
> +{
> +       int err;
> +
> +       err = nvhost_init_chip_support(host);
> +       if (err)
> +               return err;
> +
> +       host->intr.syncpt = devm_kzalloc(&host->dev->dev,
> +                       sizeof(struct nvhost_intr_syncpt) *
> +                       nvhost_syncpt_nb_pts(&host->syncpt),
> +                       GFP_KERNEL);
> +
> +       if (!host->intr.syncpt) {
> +               /* frees happen in the support removal phase */
> +               return -ENOMEM;
> +       }
> +
> +       return 0;
> +}
> +
> +static int __devinit nvhost_probe(struct platform_device *dev)
> +{
> +       struct nvhost_master *host;
> +       struct resource *regs, *intr0, *intr1;
> +       int i, err;
> +       struct nvhost_device_data *pdata =
> +               (struct nvhost_device_data *)dev->dev.platform_data;
> +
> +       regs = platform_get_resource(dev, IORESOURCE_MEM, 0);
> +       intr0 = platform_get_resource(dev, IORESOURCE_IRQ, 0);
> +       intr1 = platform_get_resource(dev, IORESOURCE_IRQ, 1);
> +
> +       if (!regs || !intr0 || !intr1) {
> +               dev_err(&dev->dev, "missing required platform resources\n");
> +               return -ENXIO;
> +       }
> +
> +       host = devm_kzalloc(&dev->dev, sizeof(*host), GFP_KERNEL);
> +       if (!host)
> +               return -ENOMEM;
> +
> +       nvhost = host;
> +
> +       host->dev = dev;
> +
> +       /* Copy host1x parameters. The private_data gets replaced
> +        * by nvhost_master later */
> +       memcpy(&host->info, pdata->private_data,
> +                       sizeof(struct host1x_device_info));
> +
> +       pdata->finalize_poweron = power_on_host;
> +       pdata->prepare_poweroff = power_off_host;
> +       pdata->prepare_clockoff = clock_off_host;
> +       pdata->finalize_clockon = clock_on_host;
> +
> +       pdata->pdev = dev;
> +
> +       /* set common host1x device data */
> +       platform_set_drvdata(dev, pdata);
> +
> +       /* set private host1x device data */
> +       nvhost_set_private_data(dev, host);
> +
> +       host->aperture = devm_request_and_ioremap(&dev->dev, regs);
> +       if (!host->aperture) {
> +               dev_err(&dev->dev, "failed to remap host registers\n");
> +               err = -ENXIO;
> +               goto fail;
> +       }
> +
> +       err = nvhost_alloc_resources(host);
> +       if (err) {
> +               dev_err(&dev->dev, "failed to init chip support\n");
> +               goto fail;
> +       }
> +
> +       host->memmgr = mem_op().alloc_mgr();
> +       if (!host->memmgr) {
> +               dev_err(&dev->dev, "unable to create memory client\n");
> +               err = -EIO;
> +               goto fail;
> +       }
> +
> +       err = nvhost_syncpt_init(dev, &host->syncpt);
> +       if (err)
> +               goto fail;
> +
> +       err = nvhost_intr_init(&host->intr, intr1->start, intr0->start);
> +       if (err)
> +               goto fail;
> +
> +       err = nvhost_user_init(host);
> +       if (err)
> +               goto fail;
> +
> +       err = nvhost_module_init(dev);
> +       if (err)
> +               goto fail;
> +
> +       for (i = 0; i < pdata->num_clks; i++)
> +               clk_prepare_enable(pdata->clk[i]);
> +       nvhost_syncpt_reset(&host->syncpt);
> +       for (i = 0; i < pdata->num_clks; i++)
> +               clk_disable_unprepare(pdata->clk[i]);
> +
> +       nvhost_device_list_init();
> +       err = nvhost_device_list_add(dev);
> +       if (err)
> +               goto fail;
> +
> +       nvhost_debug_init(host);
> +
> +       dev_info(&dev->dev, "initialized\n");
> +
> +       return 0;
> +
> +fail:
> +       nvhost_free_resources(host);
> +       if (host->memmgr)
> +               mem_op().put_mgr(host->memmgr);
> +       kfree(host);
> +       return err;
> +}
> +
> +static int __exit nvhost_remove(struct platform_device *dev)
> +{
> +       struct nvhost_master *host = nvhost_get_private_data(dev);
> +       nvhost_intr_deinit(&host->intr);
> +       nvhost_syncpt_deinit(&host->syncpt);
> +       nvhost_free_resources(host);
> +       return 0;
> +}
> +
> +static int nvhost_suspend(struct platform_device *dev, pm_message_t state)
> +{
> +       struct nvhost_master *host = nvhost_get_private_data(dev);
> +       int ret = 0;
> +
> +       ret = nvhost_module_suspend(host->dev);
> +       dev_info(&dev->dev, "suspend status: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int nvhost_resume(struct platform_device *dev)
> +{
> +       dev_info(&dev->dev, "resuming\n");
> +       return 0;
> +}
> +
> +static struct of_device_id host1x_match[] __devinitdata = {
> +       { .compatible = "nvidia,tegra20-host1x", },
> +       { .compatible = "nvidia,tegra30-host1x", },
> +       { },
> +};
> +
> +static struct platform_driver platform_driver = {
> +       .probe = nvhost_probe,
> +       .remove = __exit_p(nvhost_remove),
> +       .suspend = nvhost_suspend,
> +       .resume = nvhost_resume,
> +       .driver = {
> +               .owner = THIS_MODULE,
> +               .name = DRIVER_NAME,
> +               .of_match_table = of_match_ptr(host1x_match),
> +       },
> +};
> +
> +static int __init nvhost_mod_init(void)
> +{
> +       return platform_driver_register(&platform_driver);
> +}
> +
> +static void __exit nvhost_mod_exit(void)
> +{
> +       platform_driver_unregister(&platform_driver);
> +}
> +
> +module_init(nvhost_mod_init);
> +module_exit(nvhost_mod_exit);
> +
> diff --git a/drivers/video/tegra/host/host1x/host1x.h b/drivers/video/tegra/host/host1x/host1x.h
> new file mode 100644
> index 0000000..46ecdf4
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x.h
> @@ -0,0 +1,97 @@
> +/*
> + * drivers/video/tegra/host/host1x/host1x.h
> + *
> + * Tegra Graphics Host Driver Entrypoint
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#ifndef __NVHOST_HOST1X_H
> +#define __NVHOST_HOST1X_H
> +
> +#include <linux/cdev.h>
> +#include <linux/nvhost.h>
> +
> +#include "nvhost_syncpt.h"
> +#include "nvhost_intr.h"
> +
> +#define TRACE_MAX_LENGTH       128U
> +#define IFACE_NAME             "nvhost"
> +
> +struct nvhost_channel;
> +struct mem_mgr;
> +
> +struct nvhost_master {
> +       void __iomem *aperture;
> +       void __iomem *sync_aperture;
> +       struct class *nvhost_class;
> +       struct cdev cdev;
> +       struct device *ctrl;
> +       struct nvhost_syncpt syncpt;
> +       struct mem_mgr *memmgr;
> +       struct nvhost_intr intr;
> +       struct platform_device *dev;
> +       atomic_t clientid;
> +       struct host1x_device_info info;
> +};
> +
> +extern struct nvhost_master *nvhost;
> +
> +void nvhost_debug_init(struct nvhost_master *master);
> +void nvhost_device_debug_init(struct platform_device *dev);
> +void nvhost_debug_dump(struct nvhost_master *master);
> +
> +struct nvhost_channel *nvhost_alloc_channel(struct platform_device *dev);
> +void nvhost_free_channel(struct nvhost_channel *ch);
> +
> +extern pid_t nvhost_debug_null_kickoff_pid;
> +
> +static inline void *nvhost_get_private_data(struct platform_device *_dev)
> +{
> +       struct nvhost_device_data *pdata =
> +               (struct nvhost_device_data *)platform_get_drvdata(_dev);
> +       WARN_ON(!pdata);
> +       return (pdata && pdata->private_data) ? pdata->private_data : NULL;
> +}
> +
> +static inline void nvhost_set_private_data(struct platform_device *_dev,
> +       void *priv_data)
> +{
> +       struct nvhost_device_data *pdata =
> +               (struct nvhost_device_data *)platform_get_drvdata(_dev);
> +       WARN_ON(!pdata);
> +       if (pdata)
> +               pdata->private_data = priv_data;
> +}
> +
> +static inline
> +struct nvhost_master *nvhost_get_host(struct platform_device *_dev)
> +{
> +       struct platform_device *pdev;
> +
> +       if (_dev->dev.parent) {
> +               pdev = to_platform_device(_dev->dev.parent);
> +               return nvhost_get_private_data(pdev);
> +       } else
> +               return nvhost_get_private_data(_dev);
> +}
> +
> +static inline
> +struct platform_device *nvhost_get_parent(struct platform_device *_dev)
> +{
> +       return _dev->dev.parent ? to_platform_device(_dev->dev.parent) : NULL;
> +}
> +
> +#endif
> diff --git a/drivers/video/tegra/host/host1x/host1x01_hardware.h b/drivers/video/tegra/host/host1x/host1x01_hardware.h
> new file mode 100644
> index 0000000..75468de
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x01_hardware.h
> @@ -0,0 +1,157 @@
> +/*
> + * drivers/video/tegra/host/host1x/host1x01_hardware.h
> + *
> + * Tegra Graphics Host Register Offsets for T20/T30
> + *
> + * Copyright (c) 2010-2012 NVIDIA Corporation.
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
> +#ifndef __NVHOST_HOST1X01_HARDWARE_H
> +#define __NVHOST_HOST1X01_HARDWARE_H
> +
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include "hw_host1x01_channel.h"
> +#include "hw_host1x01_sync.h"
> +#include "hw_host1x01_uclass.h"
> +
> +/* channel registers */
> +#define NV_HOST1X_CHANNEL_MAP_SIZE_BYTES 16384
> +#define NV_HOST1X_SYNC_MLOCK_NUM 16
> +
> +/* sync registers */
> +#define HOST1X_CHANNEL_SYNC_REG_BASE   0x3000
> +#define NV_HOST1X_NB_MLOCKS 16
> +
> +static inline u32 nvhost_class_host_wait_syncpt(
> +       unsigned indx, unsigned threshold)
> +{
> +       return host1x_uclass_wait_syncpt_indx_f(indx)
> +               | host1x_uclass_wait_syncpt_thresh_f(threshold);
> +}
> +
> +static inline u32 nvhost_class_host_load_syncpt_base(
> +       unsigned indx, unsigned threshold)
> +{
> +       return host1x_uclass_load_syncpt_base_base_indx_f(indx)
> +               | host1x_uclass_load_syncpt_base_value_f(threshold);
> +}
> +
> +static inline u32 nvhost_class_host_wait_syncpt_base(
> +       unsigned indx, unsigned base_indx, unsigned offset)
> +{
> +       return host1x_uclass_wait_syncpt_base_indx_f(indx)
> +               | host1x_uclass_wait_syncpt_base_base_indx_f(base_indx)
> +               | host1x_uclass_wait_syncpt_base_offset_f(offset);
> +}
> +
> +static inline u32 nvhost_class_host_incr_syncpt_base(
> +       unsigned base_indx, unsigned offset)
> +{
> +       return host1x_uclass_incr_syncpt_base_base_indx_f(base_indx)
> +               | host1x_uclass_incr_syncpt_base_offset_f(offset);
> +}
> +
> +static inline u32 nvhost_class_host_incr_syncpt(
> +       unsigned cond, unsigned indx)
> +{
> +       return host1x_uclass_incr_syncpt_cond_f(cond)
> +               | host1x_uclass_incr_syncpt_indx_f(indx);
> +}
> +
> +static inline u32 nvhost_class_host_indoff_reg_write(
> +       unsigned mod_id, unsigned offset, bool auto_inc)
> +{
> +       u32 v = host1x_uclass_indoff_indbe_f(0xf)
> +               | host1x_uclass_indoff_indmodid_f(mod_id)
> +               | host1x_uclass_indoff_indroffset_f(offset);
> +       if (auto_inc)
> +               v |= host1x_uclass_indoff_autoinc_f(1);
> +       return v;
> +}
> +
> +static inline u32 nvhost_class_host_indoff_reg_read(
> +       unsigned mod_id, unsigned offset, bool auto_inc)
> +{
> +       u32 v = host1x_uclass_indoff_indmodid_f(mod_id)
> +               | host1x_uclass_indoff_indroffset_f(offset)
> +               | host1x_uclass_indoff_rwn_read_v();
> +       if (auto_inc)
> +               v |= host1x_uclass_indoff_autoinc_f(1);
> +       return v;
> +}
> +
> +
> +/* cdma opcodes */
> +static inline u32 nvhost_opcode_setclass(
> +       unsigned class_id, unsigned offset, unsigned mask)
> +{
> +       return (0 << 28) | (offset << 16) | (class_id << 6) | mask;
> +}
> +
> +static inline u32 nvhost_opcode_incr(unsigned offset, unsigned count)
> +{
> +       return (1 << 28) | (offset << 16) | count;
> +}
> +
> +static inline u32 nvhost_opcode_nonincr(unsigned offset, unsigned count)
> +{
> +       return (2 << 28) | (offset << 16) | count;
> +}
> +
> +static inline u32 nvhost_opcode_mask(unsigned offset, unsigned mask)
> +{
> +       return (3 << 28) | (offset << 16) | mask;
> +}
> +
> +static inline u32 nvhost_opcode_imm(unsigned offset, unsigned value)
> +{
> +       return (4 << 28) | (offset << 16) | value;
> +}
> +
> +static inline u32 nvhost_opcode_imm_incr_syncpt(unsigned cond, unsigned indx)
> +{
> +       return nvhost_opcode_imm(host1x_uclass_incr_syncpt_r(),
> +               nvhost_class_host_incr_syncpt(cond, indx));
> +}
> +
> +static inline u32 nvhost_opcode_restart(unsigned address)
> +{
> +       return (5 << 28) | (address >> 4);
> +}
> +
> +static inline u32 nvhost_opcode_gather(unsigned count)
> +{
> +       return (6 << 28) | count;
> +}
> +
> +static inline u32 nvhost_opcode_gather_nonincr(unsigned offset,        unsigned count)
> +{
> +       return (6 << 28) | (offset << 16) | BIT(15) | count;
> +}
> +
> +static inline u32 nvhost_opcode_gather_incr(unsigned offset, unsigned count)
> +{
> +       return (6 << 28) | (offset << 16) | BIT(15) | BIT(14) | count;
> +}
> +
> +#define NVHOST_OPCODE_NOOP nvhost_opcode_nonincr(0, 0)
> +
> +static inline u32 nvhost_mask2(unsigned x, unsigned y)
> +{
> +       return 1 | (1 << (y - x));
> +}
> +
> +#endif
> diff --git a/drivers/video/tegra/host/host1x/host1x_cdma.c b/drivers/video/tegra/host/host1x/host1x_cdma.c
> new file mode 100644
> index 0000000..224b721
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x_cdma.c
> @@ -0,0 +1,488 @@
> +/*
> + * drivers/video/tegra/host/host1x/host1x_cdma.c
> + *
> + * Tegra Graphics Host Command DMA
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include <linux/slab.h>
> +#include <linux/scatterlist.h>
> +#include <linux/dma-mapping.h>
> +#include "nvhost_acm.h"
> +#include "nvhost_cdma.h"
> +#include "nvhost_channel.h"
> +#include "dev.h"
> +#include "chip_support.h"
> +#include "nvhost_memmgr.h"
> +
> +#include "host1x_cdma.h"
> +
> +static inline u32 host1x_channel_dmactrl(int stop, int get_rst, int init_get)
> +{
> +       return host1x_channel_dmactrl_dmastop_f(stop)
> +               | host1x_channel_dmactrl_dmagetrst_f(get_rst)
> +               | host1x_channel_dmactrl_dmainitget_f(init_get);
> +}
> +
> +static void cdma_timeout_handler(struct work_struct *work);
> +
> +/*
> + * push_buffer
> + *
> + * The push buffer is a circular array of words to be fetched by command DMA.
> + * Note that it works slightly differently to the sync queue; fence == cur
> + * means that the push buffer is full, not empty.
> + */
> +
> +
> +/**
> + * Reset to empty push buffer
> + */
> +static void push_buffer_reset(struct push_buffer *pb)
> +{
> +       pb->fence = PUSH_BUFFER_SIZE - 8;
> +       pb->cur = 0;
> +}
> +
> +/**
> + * Init push buffer resources
> + */
> +static void push_buffer_destroy(struct push_buffer *pb);
> +static int push_buffer_init(struct push_buffer *pb)
> +{
> +       struct nvhost_cdma *cdma = pb_to_cdma(pb);
> +       struct nvhost_master *master = cdma_to_dev(cdma);
> +       pb->mapped = NULL;
> +       pb->phys = 0;
> +       pb->client_handle = NULL;
> +
> +       cdma_pb_op().reset(pb);
> +
> +       /* allocate and map pushbuffer memory */
> +       pb->mapped = dma_alloc_writecombine(&master->dev->dev,
> +                       PUSH_BUFFER_SIZE + 4, &pb->phys, GFP_KERNEL);
> +       if (IS_ERR_OR_NULL(pb->mapped)) {
> +               pb->mapped = NULL;
> +               goto fail;
> +       }
> +
> +       /* memory for storing mem client and handles for each opcode pair */
> +       pb->client_handle = kzalloc(NVHOST_GATHER_QUEUE_SIZE *
> +                               sizeof(struct mem_mgr_handle),
> +                       GFP_KERNEL);
> +       if (!pb->client_handle)
> +               goto fail;
> +
> +       /* put the restart at the end of pushbuffer memory */
> +       *(pb->mapped + (PUSH_BUFFER_SIZE >> 2)) =
> +               nvhost_opcode_restart(pb->phys);
> +
> +       return 0;
> +
> +fail:
> +       push_buffer_destroy(pb);
> +       return -ENOMEM;
> +}
> +
> +/**
> + * Clean up push buffer resources
> + */
> +static void push_buffer_destroy(struct push_buffer *pb)
> +{
> +       struct nvhost_cdma *cdma = pb_to_cdma(pb);
> +       struct nvhost_master *master = cdma_to_dev(cdma);
> +
> +       if (pb->phys != 0)
> +               dma_free_writecombine(&master->dev->dev,
> +                               PUSH_BUFFER_SIZE + 4,
> +                               pb->mapped, pb->phys);
> +
> +       kfree(pb->client_handle);
> +
> +       pb->mapped = NULL;
> +       pb->phys = 0;
> +       pb->client_handle = 0;
> +}
> +
> +/**
> + * Push two words to the push buffer
> + * Caller must ensure push buffer is not full
> + */
> +static void push_buffer_push_to(struct push_buffer *pb,
> +               struct mem_mgr *client, struct mem_handle *handle,
> +               u32 op1, u32 op2)
> +{
> +       u32 cur = pb->cur;
> +       u32 *p = (u32 *)((u32)pb->mapped + cur);
> +       u32 cur_mem = (cur/8) & (NVHOST_GATHER_QUEUE_SIZE - 1);
> +       WARN_ON(cur == pb->fence);
> +       *(p++) = op1;
> +       *(p++) = op2;
> +       pb->client_handle[cur_mem].client = client;
> +       pb->client_handle[cur_mem].handle = handle;
> +       pb->cur = (cur + 8) & (PUSH_BUFFER_SIZE - 1);
> +}
> +
> +/**
> + * Pop a number of two word slots from the push buffer
> + * Caller must ensure push buffer is not empty
> + */
> +static void push_buffer_pop_from(struct push_buffer *pb,
> +               unsigned int slots)
> +{
> +       /* Clear the mem references for old items from pb */
> +       unsigned int i;
> +       u32 fence_mem = pb->fence/8;
> +       for (i = 0; i < slots; i++) {
> +               int cur_fence_mem = (fence_mem+i)
> +                               & (NVHOST_GATHER_QUEUE_SIZE - 1);
> +               struct mem_mgr_handle *h = &pb->client_handle[cur_fence_mem];
> +               h->client = NULL;
> +               h->handle = NULL;
> +       }
> +       /* Advance the next write position */
> +       pb->fence = (pb->fence + slots * 8) & (PUSH_BUFFER_SIZE - 1);
> +}
> +
> +/**
> + * Return the number of two word slots free in the push buffer
> + */
> +static u32 push_buffer_space(struct push_buffer *pb)
> +{
> +       return ((pb->fence - pb->cur) & (PUSH_BUFFER_SIZE - 1)) / 8;
> +}
> +
> +static u32 push_buffer_putptr(struct push_buffer *pb)
> +{
> +       return pb->phys + pb->cur;
> +}
> +
> +/*
> + * The syncpt incr buffer is filled with methods to increment syncpts, which
> + * is later GATHER-ed into the mainline PB. It's used when a timed out context
> + * is interleaved with other work, so needs to inline the syncpt increments
> + * to maintain the count (but otherwise does no work).
> + */
> +
> +/**
> + * Init timeout resources
> + */
> +static int cdma_timeout_init(struct nvhost_cdma *cdma,
> +                                u32 syncpt_id)
> +{
> +       if (syncpt_id == NVSYNCPT_INVALID)
> +               return -EINVAL;
> +
> +       INIT_DELAYED_WORK(&cdma->timeout.wq, cdma_timeout_handler);
> +       cdma->timeout.initialized = true;
> +
> +       return 0;
> +}
> +
> +/**
> + * Clean up timeout resources
> + */
> +static void cdma_timeout_destroy(struct nvhost_cdma *cdma)
> +{
> +       if (cdma->timeout.initialized)
> +               cancel_delayed_work(&cdma->timeout.wq);
> +       cdma->timeout.initialized = false;
> +}
> +
> +/**
> + * Increment timedout buffer's syncpt via CPU.
> + */
> +static void cdma_timeout_cpu_incr(struct nvhost_cdma *cdma, u32 getptr,
> +                               u32 syncpt_incrs, u32 syncval, u32 nr_slots)
> +{
> +       struct nvhost_master *dev = cdma_to_dev(cdma);
> +       struct push_buffer *pb = &cdma->push_buffer;
> +       u32 i, getidx;
> +
> +       for (i = 0; i < syncpt_incrs; i++)
> +               nvhost_syncpt_cpu_incr(&dev->syncpt, cdma->timeout.syncpt_id);
> +
> +       /* after CPU incr, ensure shadow is up to date */
> +       nvhost_syncpt_update_min(&dev->syncpt, cdma->timeout.syncpt_id);
> +
> +       /* NOP all the PB slots */
> +       getidx = getptr - pb->phys;
> +       while (nr_slots--) {
> +               u32 *p = (u32 *)((u32)pb->mapped + getidx);
> +               *(p++) = NVHOST_OPCODE_NOOP;
> +               *(p++) = NVHOST_OPCODE_NOOP;
> +               dev_dbg(&dev->dev->dev, "%s: NOP at 0x%x\n",
> +                       __func__, pb->phys + getidx);
> +               getidx = (getidx + 8) & (PUSH_BUFFER_SIZE - 1);
> +       }
> +       wmb();
> +}
> +
> +/**
> + * Start channel DMA
> + */
> +static void cdma_start(struct nvhost_cdma *cdma)
> +{
> +       void __iomem *chan_regs = cdma_to_channel(cdma)->aperture;
> +
> +       if (cdma->running)
> +               return;
> +
> +       cdma->last_put = cdma_pb_op().putptr(&cdma->push_buffer);
> +
> +       writel(host1x_channel_dmactrl(true, false, false),
> +               chan_regs + host1x_channel_dmactrl_r());
> +
> +       /* set base, put, end pointer (all of memory) */
> +       writel(0, chan_regs + host1x_channel_dmastart_r());
> +       writel(cdma->last_put, chan_regs + host1x_channel_dmaput_r());
> +       writel(0xFFFFFFFF, chan_regs + host1x_channel_dmaend_r());
> +
> +       /* reset GET */
> +       writel(host1x_channel_dmactrl(true, true, true),
> +               chan_regs + host1x_channel_dmactrl_r());
> +
> +       /* start the command DMA */
> +       writel(host1x_channel_dmactrl(false, false, false),
> +               chan_regs + host1x_channel_dmactrl_r());
> +
> +       cdma->running = true;
> +}
> +
> +/**
> + * Similar to cdma_start(), but rather than starting from an idle
> + * state (where DMA GET is set to DMA PUT), on a timeout we restore
> + * DMA GET from an explicit value (so DMA may again be pending).
> + */
> +static void cdma_timeout_restart(struct nvhost_cdma *cdma, u32 getptr)
> +{
> +       struct nvhost_master *dev = cdma_to_dev(cdma);
> +       void __iomem *chan_regs = cdma_to_channel(cdma)->aperture;
> +
> +       if (cdma->running)
> +               return;
> +
> +       cdma->last_put = cdma_pb_op().putptr(&cdma->push_buffer);
> +
> +       writel(host1x_channel_dmactrl(true, false, false),
> +               chan_regs + host1x_channel_dmactrl_r());
> +
> +       /* set base, end pointer (all of memory) */
> +       writel(0, chan_regs + host1x_channel_dmastart_r());
> +       writel(0xFFFFFFFF, chan_regs + host1x_channel_dmaend_r());
> +
> +       /* set GET, by loading the value in PUT (then reset GET) */
> +       writel(getptr, chan_regs + host1x_channel_dmaput_r());
> +       writel(host1x_channel_dmactrl(true, true, true),
> +               chan_regs + host1x_channel_dmactrl_r());
> +
> +       dev_dbg(&dev->dev->dev,
> +               "%s: DMA GET 0x%x, PUT HW 0x%x / shadow 0x%x\n",
> +               __func__,
> +               readl(chan_regs + host1x_channel_dmaget_r()),
> +               readl(chan_regs + host1x_channel_dmaput_r()),
> +               cdma->last_put);
> +
> +       /* deassert GET reset and set PUT */
> +       writel(host1x_channel_dmactrl(true, false, false),
> +               chan_regs + host1x_channel_dmactrl_r());
> +       writel(cdma->last_put, chan_regs + host1x_channel_dmaput_r());
> +
> +       /* start the command DMA */
> +       writel(host1x_channel_dmactrl(false, false, false),
> +               chan_regs + host1x_channel_dmactrl_r());
> +
> +       cdma->running = true;
> +}
> +
> +/**
> + * Kick channel DMA into action by writing its PUT offset (if it has changed)
> + */
> +static void cdma_kick(struct nvhost_cdma *cdma)
> +{
> +       u32 put;
> +
> +       put = cdma_pb_op().putptr(&cdma->push_buffer);
> +
> +       if (put != cdma->last_put) {
> +               void __iomem *chan_regs = cdma_to_channel(cdma)->aperture;
> +               writel(put, chan_regs + host1x_channel_dmaput_r());
> +               cdma->last_put = put;
> +       }
> +}
> +
> +static void cdma_stop(struct nvhost_cdma *cdma)
> +{
> +       void __iomem *chan_regs = cdma_to_channel(cdma)->aperture;
> +
> +       mutex_lock(&cdma->lock);
> +       if (cdma->running) {
> +               nvhost_cdma_wait_locked(cdma, CDMA_EVENT_SYNC_QUEUE_EMPTY);
> +               writel(host1x_channel_dmactrl(true, false, false),
> +                       chan_regs + host1x_channel_dmactrl_r());
> +               cdma->running = false;
> +       }
> +       mutex_unlock(&cdma->lock);
> +}
> +
> +/**
> + * Stops both channel's command processor and CDMA immediately.
> + * Also, tears down the channel and resets corresponding module.
> + */
> +static void cdma_timeout_teardown_begin(struct nvhost_cdma *cdma)
> +{
> +       struct nvhost_master *dev = cdma_to_dev(cdma);
> +       struct nvhost_channel *ch = cdma_to_channel(cdma);
> +       u32 cmdproc_stop;
> +
> +       if (cdma->torndown && !cdma->running) {
> +               dev_warn(&dev->dev->dev, "Already torn down\n");
> +               return;
> +       }
> +
> +       dev_dbg(&dev->dev->dev,
> +               "begin channel teardown (channel id %d)\n", ch->chid);
> +
> +       cmdproc_stop = readl(dev->sync_aperture + host1x_sync_cmdproc_stop_r());
> +       cmdproc_stop |= BIT(ch->chid);
> +       writel(cmdproc_stop, dev->sync_aperture + host1x_sync_cmdproc_stop_r());
> +
> +       dev_dbg(&dev->dev->dev,
> +               "%s: DMA GET 0x%x, PUT HW 0x%x / shadow 0x%x\n",
> +               __func__,
> +               readl(ch->aperture + host1x_channel_dmaget_r()),
> +               readl(ch->aperture + host1x_channel_dmaput_r()),
> +               cdma->last_put);
> +
> +       writel(host1x_channel_dmactrl(true, false, false),
> +               ch->aperture + host1x_channel_dmactrl_r());
> +
> +       writel(BIT(ch->chid), dev->sync_aperture + host1x_sync_ch_teardown_r());
> +
> +       cdma->running = false;
> +       cdma->torndown = true;
> +}
> +
> +static void cdma_timeout_teardown_end(struct nvhost_cdma *cdma, u32 getptr)
> +{
> +       struct nvhost_master *dev = cdma_to_dev(cdma);
> +       struct nvhost_channel *ch = cdma_to_channel(cdma);
> +       u32 cmdproc_stop;
> +
> +       dev_dbg(&dev->dev->dev,
> +               "end channel teardown (id %d, DMAGET restart = 0x%x)\n",
> +               ch->chid, getptr);
> +
> +       cmdproc_stop = readl(dev->sync_aperture + host1x_sync_cmdproc_stop_r());
> +       cmdproc_stop &= ~(BIT(ch->chid));
> +       writel(cmdproc_stop, dev->sync_aperture + host1x_sync_cmdproc_stop_r());
> +
> +       cdma->torndown = false;
> +       cdma_timeout_restart(cdma, getptr);
> +}
> +
> +/**
> + * If this timeout fires, it indicates the current sync_queue entry has
> + * exceeded its TTL and the userctx should be timed out and remaining
> + * submits already issued cleaned up (future submits return an error).
> + */
> +static void cdma_timeout_handler(struct work_struct *work)
> +{
> +       struct nvhost_cdma *cdma;
> +       struct nvhost_master *dev;
> +       struct nvhost_syncpt *sp;
> +       struct nvhost_channel *ch;
> +
> +       u32 syncpt_val;
> +
> +       u32 prev_cmdproc, cmdproc_stop;
> +
> +       cdma = container_of(to_delayed_work(work), struct nvhost_cdma,
> +                           timeout.wq);
> +       dev = cdma_to_dev(cdma);
> +       sp = &dev->syncpt;
> +       ch = cdma_to_channel(cdma);
> +
> +       nvhost_debug_dump(cdma_to_dev(cdma));
> +
> +       mutex_lock(&cdma->lock);
> +
> +       if (!cdma->timeout.clientid) {
> +               dev_dbg(&dev->dev->dev,
> +                        "cdma_timeout: expired, but has no clientid\n");
> +               mutex_unlock(&cdma->lock);
> +               return;
> +       }
> +
> +       /* stop processing to get a clean snapshot */
> +       prev_cmdproc = readl(dev->sync_aperture + host1x_sync_cmdproc_stop_r());
> +       cmdproc_stop = prev_cmdproc | BIT(ch->chid);
> +       writel(cmdproc_stop, dev->sync_aperture + host1x_sync_cmdproc_stop_r());
> +
> +       dev_dbg(&dev->dev->dev, "cdma_timeout: cmdproc was 0x%x is 0x%x\n",
> +               prev_cmdproc, cmdproc_stop);
> +
> +       syncpt_val = nvhost_syncpt_update_min(&dev->syncpt,
> +                       cdma->timeout.syncpt_id);
> +
> +       /* has buffer actually completed? */
> +       if ((s32)(syncpt_val - cdma->timeout.syncpt_val) >= 0) {
> +               dev_dbg(&dev->dev->dev,
> +                        "cdma_timeout: expired, but buffer had completed\n");
> +               /* restore */
> +               cmdproc_stop = prev_cmdproc & ~(BIT(ch->chid));
> +               writel(cmdproc_stop,
> +                       dev->sync_aperture + host1x_sync_cmdproc_stop_r());
> +               mutex_unlock(&cdma->lock);
> +               return;
> +       }
> +
> +       dev_warn(&dev->dev->dev,
> +               "%s: timeout: %d (%s), HW thresh %d, done %d\n",
> +               __func__,
> +               cdma->timeout.syncpt_id,
> +               syncpt_op().name(sp, cdma->timeout.syncpt_id),
> +               syncpt_val, cdma->timeout.syncpt_val);
> +
> +       /* stop HW, resetting channel/module */
> +       cdma_op().timeout_teardown_begin(cdma);
> +
> +       nvhost_cdma_update_sync_queue(cdma, sp, ch->dev);
> +       mutex_unlock(&cdma->lock);
> +}
> +
> +static const struct nvhost_cdma_ops host1x_cdma_ops = {
> +       .start = cdma_start,
> +       .stop = cdma_stop,
> +       .kick = cdma_kick,
> +
> +       .timeout_init = cdma_timeout_init,
> +       .timeout_destroy = cdma_timeout_destroy,
> +       .timeout_teardown_begin = cdma_timeout_teardown_begin,
> +       .timeout_teardown_end = cdma_timeout_teardown_end,
> +       .timeout_cpu_incr = cdma_timeout_cpu_incr,
> +};
> +
> +static const struct nvhost_pushbuffer_ops host1x_pushbuffer_ops = {
> +       .reset = push_buffer_reset,
> +       .init = push_buffer_init,
> +       .destroy = push_buffer_destroy,
> +       .push_to = push_buffer_push_to,
> +       .pop_from = push_buffer_pop_from,
> +       .space = push_buffer_space,
> +       .putptr = push_buffer_putptr,
> +};
> +
> diff --git a/drivers/video/tegra/host/host1x/host1x_cdma.h b/drivers/video/tegra/host/host1x/host1x_cdma.h
> new file mode 100644
> index 0000000..94bfc09
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x_cdma.h
> @@ -0,0 +1,39 @@
> +/*
> + * drivers/video/tegra/host/host1x/host1x_cdma.h
> + *
> + * Tegra Graphics Host Command DMA
> + *
> + * Copyright (c) 2011-2012, NVIDIA Corporation.
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
> +#ifndef __NVHOST_HOST1X_HOST1X_CDMA_H
> +#define __NVHOST_HOST1X_HOST1X_CDMA_H
> +
> +/* Size of the sync queue. If it is too small, we won't be able to queue up
> + * many command buffers. If it is too large, we waste memory. */
> +#define NVHOST_SYNC_QUEUE_SIZE 512
> +
> +/* Number of gathers we allow to be queued up per channel. Must be a
> + * power of two. Currently sized such that pushbuffer is 4KB (512*8B). */
> +#define NVHOST_GATHER_QUEUE_SIZE 512
> +
> +/* 8 bytes per slot. (This number does not include the final RESTART.) */
> +#define PUSH_BUFFER_SIZE (NVHOST_GATHER_QUEUE_SIZE * 8)
> +
> +/* 4K page containing GATHERed methods to increment channel syncpts
> + * and replaces the original timed out contexts GATHER slots */
> +#define SYNCPT_INCR_BUFFER_SIZE_WORDS   (4096 / sizeof(u32))
> +
> +#endif
> diff --git a/drivers/video/tegra/host/host1x/host1x_channel.c b/drivers/video/tegra/host/host1x/host1x_channel.c
> new file mode 100644
> index 0000000..d39fe60
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x_channel.c
> @@ -0,0 +1,157 @@
> +/*
> + * drivers/video/tegra/host/host1x/channel_host1x.c
> + *
> + * Tegra Graphics Host Channel
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include <linux/nvhost.h>
> +#include "nvhost_channel.h"
> +#include "dev.h"
> +#include "nvhost_acm.h"
> +#include <trace/events/nvhost.h>
> +#include <linux/slab.h>
> +#include "nvhost_intr.h"
> +
> +#define NV_FIFO_READ_TIMEOUT 200000
> +
> +static void submit_gathers(struct nvhost_job *job)
> +{
> +       /* push user gathers */
> +       int i;
> +       for (i = 0 ; i < job->num_gathers; i++) {
> +               struct nvhost_job_gather *g = &job->gathers[i];
> +               u32 op1 = nvhost_opcode_gather(g->words);
> +               u32 op2 = g->mem_base + g->offset;
> +               nvhost_cdma_push_gather(&job->ch->cdma,
> +                               job->memmgr,
> +                               job->gathers[i].ref,
> +                               job->gathers[i].offset,
> +                               op1, op2);
> +       }
> +}
> +
> +static int host1x_channel_submit(struct nvhost_job *job)
> +{
> +       struct nvhost_channel *ch = job->ch;
> +       struct nvhost_syncpt *sp = &nvhost_get_host(job->ch->dev)->syncpt;
> +       u32 user_syncpt_incrs = job->syncpt_incrs;
> +       u32 prev_max = 0;
> +       u32 syncval;
> +       int err;
> +       void *completed_waiter = NULL;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(ch->dev);
> +
> +       /* Turn on the client module and host1x */
> +       nvhost_module_busy(ch->dev);
> +
> +       /* before error checks, return current max */
> +       prev_max = job->syncpt_end =
> +               nvhost_syncpt_read_max(sp, job->syncpt_id);
> +
> +       /* get submit lock */
> +       err = mutex_lock_interruptible(&ch->submitlock);
> +       if (err) {
> +               nvhost_module_idle(ch->dev);
> +               goto error;
> +       }
> +
> +       completed_waiter = nvhost_intr_alloc_waiter();
> +       if (!completed_waiter) {
> +               nvhost_module_idle(ch->dev);
> +               mutex_unlock(&ch->submitlock);
> +               err = -ENOMEM;
> +               goto error;
> +       }
> +
> +       /* begin a CDMA submit */
> +       err = nvhost_cdma_begin(&ch->cdma, job);
> +       if (err) {
> +               mutex_unlock(&ch->submitlock);
> +               nvhost_module_idle(ch->dev);
> +               goto error;
> +       }
> +
> +       if (pdata->serialize) {
> +               /* Force serialization by inserting a host wait for the
> +                * previous job to finish before this one can commence. */
> +               nvhost_cdma_push(&ch->cdma,
> +                               nvhost_opcode_setclass(NV_HOST1X_CLASS_ID,
> +                                       host1x_uclass_wait_syncpt_r(),
> +                                       1),
> +                               nvhost_class_host_wait_syncpt(job->syncpt_id,
> +                                       nvhost_syncpt_read_max(sp,
> +                                               job->syncpt_id)));
> +       }
> +
> +       syncval = nvhost_syncpt_incr_max(sp,
> +                       job->syncpt_id, user_syncpt_incrs);
> +
> +       job->syncpt_end = syncval;
> +
> +       /* add a setclass for modules that require it */
> +       if (pdata->class)
> +               nvhost_cdma_push(&ch->cdma,
> +                       nvhost_opcode_setclass(pdata->class, 0, 0),
> +                       NVHOST_OPCODE_NOOP);
> +
> +       submit_gathers(job);
> +
> +       /* end CDMA submit & stash pinned hMems into sync queue */
> +       nvhost_cdma_end(&ch->cdma, job);
> +
> +       trace_nvhost_channel_submitted(ch->dev->name,
> +                       prev_max, syncval);
> +
> +       /* schedule a submit complete interrupt */
> +       err = nvhost_intr_add_action(&nvhost_get_host(ch->dev)->intr,
> +                       job->syncpt_id, syncval,
> +                       NVHOST_INTR_ACTION_SUBMIT_COMPLETE, ch,
> +                       completed_waiter,
> +                       NULL);
> +       completed_waiter = NULL;
> +       WARN(err, "Failed to set submit complete interrupt");
> +
> +       mutex_unlock(&ch->submitlock);
> +
> +       return 0;
> +
> +error:
> +       kfree(completed_waiter);
> +       return err;
> +}
> +
> +static inline void __iomem *host1x_channel_aperture(void __iomem *p, int ndx)
> +{
> +       p += ndx * NV_HOST1X_CHANNEL_MAP_SIZE_BYTES;
> +       return p;
> +}
> +
> +static int host1x_channel_init(struct nvhost_channel *ch,
> +       struct nvhost_master *dev, int index)
> +{
> +       ch->chid = index;
> +       mutex_init(&ch->reflock);
> +       mutex_init(&ch->submitlock);
> +
> +       ch->aperture = host1x_channel_aperture(dev->aperture, index);
> +       return 0;
> +}
> +
> +static const struct nvhost_channel_ops host1x_channel_ops = {
> +       .init = host1x_channel_init,
> +       .submit = host1x_channel_submit,
> +};
> diff --git a/drivers/video/tegra/host/host1x/host1x_debug.c b/drivers/video/tegra/host/host1x/host1x_debug.c
> new file mode 100644
> index 0000000..ce6074e
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x_debug.c
> @@ -0,0 +1,405 @@
> +/*
> + * drivers/video/tegra/host/host1x/host1x_debug.c
> + *
> + * Copyright (C) 2010 Google, Inc.
> + * Author: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> + *
> + * Copyright (C) 2011 NVIDIA Corporation
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/mm.h>
> +#include <linux/scatterlist.h>
> +
> +#include <linux/io.h>
> +
> +#include "dev.h"
> +#include "debug.h"
> +#include "nvhost_cdma.h"
> +#include "nvhost_channel.h"
> +#include "chip_support.h"
> +#include "nvhost_memmgr.h"
> +
> +#define NVHOST_DEBUG_MAX_PAGE_OFFSET 102400
> +
> +enum {
> +       NVHOST_DBG_STATE_CMD = 0,
> +       NVHOST_DBG_STATE_DATA = 1,
> +       NVHOST_DBG_STATE_GATHER = 2
> +};
> +
> +static int show_channel_command(struct output *o, u32 addr, u32 val, int *count)
> +{
> +       unsigned mask;
> +       unsigned subop;
> +
> +       switch (val >> 28) {
> +       case 0x0:
> +               mask = val & 0x3f;
> +               if (mask) {
> +                       nvhost_debug_output(o,
> +                               "SETCL(class=%03x, offset=%03x, mask=%02x, [",
> +                               val >> 6 & 0x3ff, val >> 16 & 0xfff, mask);
> +                       *count = hweight8(mask);
> +                       return NVHOST_DBG_STATE_DATA;
> +               } else {
> +                       nvhost_debug_output(o, "SETCL(class=%03x)\n",
> +                               val >> 6 & 0x3ff);
> +                       return NVHOST_DBG_STATE_CMD;
> +               }
> +
> +       case 0x1:
> +               nvhost_debug_output(o, "INCR(offset=%03x, [",
> +                       val >> 16 & 0xfff);
> +               *count = val & 0xffff;
> +               return NVHOST_DBG_STATE_DATA;
> +
> +       case 0x2:
> +               nvhost_debug_output(o, "NONINCR(offset=%03x, [",
> +                       val >> 16 & 0xfff);
> +               *count = val & 0xffff;
> +               return NVHOST_DBG_STATE_DATA;
> +
> +       case 0x3:
> +               mask = val & 0xffff;
> +               nvhost_debug_output(o, "MASK(offset=%03x, mask=%03x, [",
> +                          val >> 16 & 0xfff, mask);
> +               *count = hweight16(mask);
> +               return NVHOST_DBG_STATE_DATA;
> +
> +       case 0x4:
> +               nvhost_debug_output(o, "IMM(offset=%03x, data=%03x)\n",
> +                          val >> 16 & 0xfff, val & 0xffff);
> +               return NVHOST_DBG_STATE_CMD;
> +
> +       case 0x5:
> +               nvhost_debug_output(o, "RESTART(offset=%08x)\n", val << 4);
> +               return NVHOST_DBG_STATE_CMD;
> +
> +       case 0x6:
> +               nvhost_debug_output(o,
> +                       "GATHER(offset=%03x, insert=%d, type=%d, count=%04x, addr=[",
> +                       val >> 16 & 0xfff, val >> 15 & 0x1, val >> 14 & 0x1,
> +                       val & 0x3fff);
> +               *count = val & 0x3fff; /* TODO: insert */
> +               return NVHOST_DBG_STATE_GATHER;
> +
> +       case 0xe:
> +               subop = val >> 24 & 0xf;
> +               if (subop == 0)
> +                       nvhost_debug_output(o, "ACQUIRE_MLOCK(index=%d)\n",
> +                               val & 0xff);
> +               else if (subop == 1)
> +                       nvhost_debug_output(o, "RELEASE_MLOCK(index=%d)\n",
> +                               val & 0xff);
> +               else
> +                       nvhost_debug_output(o, "EXTEND_UNKNOWN(%08x)\n", val);
> +               return NVHOST_DBG_STATE_CMD;
> +
> +       default:
> +               return NVHOST_DBG_STATE_CMD;
> +       }
> +}
> +
> +static void show_channel_gather(struct output *o, u32 addr,
> +               phys_addr_t phys_addr, u32 words, struct nvhost_cdma *cdma);
> +
> +static void show_channel_word(struct output *o, int *state, int *count,
> +               u32 addr, u32 val, struct nvhost_cdma *cdma)
> +{
> +       static int start_count, dont_print;
> +
> +       switch (*state) {
> +       case NVHOST_DBG_STATE_CMD:
> +               if (addr)
> +                       nvhost_debug_output(o, "%08x: %08x:", addr, val);
> +               else
> +                       nvhost_debug_output(o, "%08x:", val);
> +
> +               *state = show_channel_command(o, addr, val, count);
> +               dont_print = 0;
> +               start_count = *count;
> +               if (*state == NVHOST_DBG_STATE_DATA && *count == 0) {
> +                       *state = NVHOST_DBG_STATE_CMD;
> +                       nvhost_debug_output(o, "])\n");
> +               }
> +               break;
> +
> +       case NVHOST_DBG_STATE_DATA:
> +               (*count)--;
> +               if (start_count - *count < 64)
> +                       nvhost_debug_output(o, "%08x%s",
> +                               val, *count > 0 ? ", " : "])\n");
> +               else if (!dont_print && (*count > 0)) {
> +                       nvhost_debug_output(o, "[truncated; %d more words]\n",
> +                               *count);
> +                       dont_print = 1;
> +               }
> +               if (*count == 0)
> +                       *state = NVHOST_DBG_STATE_CMD;
> +               break;
> +
> +       case NVHOST_DBG_STATE_GATHER:
> +               *state = NVHOST_DBG_STATE_CMD;
> +               nvhost_debug_output(o, "%08x]):\n", val);
> +               if (cdma) {
> +                       show_channel_gather(o, addr, val,
> +                                       *count, cdma);
> +               }
> +               break;
> +       }
> +}
> +
> +static void do_show_channel_gather(struct output *o,
> +               phys_addr_t phys_addr,
> +               u32 words, struct nvhost_cdma *cdma,
> +               phys_addr_t pin_addr, u32 *map_addr)
> +{
> +       /* Map dmaget cursor to corresponding mem handle */
> +       u32 offset;
> +       int state, count, i;
> +
> +       offset = phys_addr - pin_addr;
> +       /*
> +        * Sometimes we're given different hardware address to the same
> +        * page - in these cases the offset will get an invalid number and
> +        * we just have to bail out.
> +        */
> +       if (offset > NVHOST_DEBUG_MAX_PAGE_OFFSET) {
> +               nvhost_debug_output(o, "[address mismatch]\n");
> +       } else {
> +               /* GATHER buffer starts always with commands */
> +               state = NVHOST_DBG_STATE_CMD;
> +               for (i = 0; i < words; i++)
> +                       show_channel_word(o, &state, &count,
> +                                       phys_addr + i * 4,
> +                                       *(map_addr + offset/4 + i),
> +                                       cdma);
> +       }
> +}
> +
> +static void show_channel_gather(struct output *o, u32 addr,
> +               phys_addr_t phys_addr,
> +               u32 words, struct nvhost_cdma *cdma)
> +{
> +       /* Map dmaget cursor to corresponding mem handle */
> +       struct push_buffer *pb = &cdma->push_buffer;
> +       u32 cur = addr - pb->phys;
> +       struct mem_mgr_handle *mem = &pb->client_handle[cur/8];
> +       u32 *map_addr, offset;
> +       struct sg_table *sgt;
> +
> +       if (!mem || !mem->handle || !mem->client) {
> +               nvhost_debug_output(o, "[already deallocated]\n");
> +               return;
> +       }
> +
> +       map_addr = mem_op().mmap(mem->handle);
> +       if (!map_addr) {
> +               nvhost_debug_output(o, "[could not mmap]\n");
> +               return;
> +       }
> +
> +       /* Get base address from mem */
> +       sgt = mem_op().pin(mem->client, mem->handle);
> +       if (IS_ERR(sgt)) {
> +               nvhost_debug_output(o, "[couldn't pin]\n");
> +               mem_op().munmap(mem->handle, map_addr);
> +               return;
> +       }
> +
> +       offset = phys_addr - sg_dma_address(sgt->sgl);
> +       do_show_channel_gather(o, phys_addr, words, cdma,
> +                       sg_dma_address(sgt->sgl), map_addr);
> +       mem_op().unpin(mem->client, mem->handle, sgt);
> +       mem_op().munmap(mem->handle, map_addr);
> +}
> +
> +static void show_channel_gathers(struct output *o, struct nvhost_cdma *cdma)
> +{
> +       struct nvhost_job *job;
> +
> +       list_for_each_entry(job, &cdma->sync_queue, list) {
> +               int i;
> +               nvhost_debug_output(o, "\n%p: JOB, syncpt_id=%d, syncpt_val=%d,"
> +                               " first_get=%08x, timeout=%d"
> +                               " num_slots=%d, num_handles=%d\n",
> +                               job,
> +                               job->syncpt_id,
> +                               job->syncpt_end,
> +                               job->first_get,
> +                               job->timeout,
> +                               job->num_slots,
> +                               job->num_unpins);
> +
> +               for (i = 0; i < job->num_gathers; i++) {
> +                       struct nvhost_job_gather *g = &job->gathers[i];
> +                       u32 *mapped = mem_op().mmap(g->ref);
> +                       if (!mapped) {
> +                               nvhost_debug_output(o, "[could not mmap]\n");
> +                               continue;
> +                       }
> +
> +                       nvhost_debug_output(o,
> +                               "    GATHER at %08x+%04x, %d words\n",
> +                               g->mem_base, g->offset, g->words);
> +
> +                       do_show_channel_gather(o, g->mem_base + g->offset,
> +                                       g->words, cdma, g->mem_base, mapped);
> +                       mem_op().munmap(g->ref, mapped);
> +               }
> +       }
> +}
> +
> +static void host1x_debug_show_channel_cdma(struct nvhost_master *m,
> +       struct nvhost_channel *ch, struct output *o, int chid)
> +{
> +       struct nvhost_channel *channel = ch;
> +       struct nvhost_cdma *cdma = &channel->cdma;
> +       u32 dmaput, dmaget, dmactrl;
> +       u32 cbstat, cbread;
> +       u32 val, base, baseval;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(channel->dev);
> +
> +       dmaput = readl(channel->aperture + host1x_channel_dmaput_r());
> +       dmaget = readl(channel->aperture + host1x_channel_dmaget_r());
> +       dmactrl = readl(channel->aperture + host1x_channel_dmactrl_r());
> +       cbread = readl(m->sync_aperture + host1x_sync_cbread0_r() + 4 * chid);
> +       cbstat = readl(m->sync_aperture + host1x_sync_cbstat_0_r() + 4 * chid);
> +
> +       nvhost_debug_output(o, "%d-%s (%d): ", chid,
> +                           channel->dev->name,
> +                           pdata->refcount);
> +
> +       if (host1x_channel_dmactrl_dmastop_v(dmactrl)
> +               || !channel->cdma.push_buffer.mapped) {
> +               nvhost_debug_output(o, "inactive\n\n");
> +               return;
> +       }
> +
> +       switch (cbstat) {
> +       case 0x00010008:
> +               nvhost_debug_output(o, "waiting on syncpt %d val %d\n",
> +                       cbread >> 24, cbread & 0xffffff);
> +               break;
> +
> +       case 0x00010009:
> +               base = (cbread >> 16) & 0xff;
> +               baseval = readl(m->sync_aperture +
> +                               host1x_sync_syncpt_base_0_r() + 4 * base);
> +               val = cbread & 0xffff;
> +               nvhost_debug_output(o, "waiting on syncpt %d val %d "
> +                         "(base %d = %d; offset = %d)\n",
> +                       cbread >> 24, baseval + val,
> +                       base, baseval, val);
> +               break;
> +
> +       default:
> +               nvhost_debug_output(o,
> +                               "active class %02x, offset %04x, val %08x\n",
> +                               host1x_sync_cbstat_0_cbclass0_v(cbstat),
> +                               host1x_sync_cbstat_0_cboffset0_v(cbstat),
> +                               cbread);
> +               break;
> +       }
> +
> +       nvhost_debug_output(o, "DMAPUT %08x, DMAGET %08x, DMACTL %08x\n",
> +               dmaput, dmaget, dmactrl);
> +       nvhost_debug_output(o, "CBREAD %08x, CBSTAT %08x\n", cbread, cbstat);
> +
> +       show_channel_gathers(o, cdma);
> +       nvhost_debug_output(o, "\n");
> +}
> +
> +static void host1x_debug_show_channel_fifo(struct nvhost_master *m,
> +       struct nvhost_channel *ch, struct output *o, int chid)
> +{
> +       u32 val, rd_ptr, wr_ptr, start, end;
> +       struct nvhost_channel *channel = ch;
> +       int state, count;
> +
> +       nvhost_debug_output(o, "%d: fifo:\n", chid);
> +
> +       val = readl(channel->aperture + host1x_channel_fifostat_r());
> +       nvhost_debug_output(o, "FIFOSTAT %08x\n", val);
> +       if (host1x_channel_fifostat_cfempty_v(val)) {
> +               nvhost_debug_output(o, "[empty]\n");
> +               return;
> +       }
> +
> +       writel(0x0, m->sync_aperture + host1x_sync_cfpeek_ctrl_r());
> +       writel(host1x_sync_cfpeek_ctrl_cfpeek_ena_f(1)
> +                       | host1x_sync_cfpeek_ctrl_cfpeek_channr_f(chid),
> +               m->sync_aperture + host1x_sync_cfpeek_ctrl_r());
> +
> +       val = readl(m->sync_aperture + host1x_sync_cfpeek_ptrs_r());
> +       rd_ptr = host1x_sync_cfpeek_ptrs_cf_rd_ptr_v(val);
> +       wr_ptr = host1x_sync_cfpeek_ptrs_cf_wr_ptr_v(val);
> +
> +       val = readl(m->sync_aperture + host1x_sync_cf0_setup_r() + 4 * chid);
> +       start = host1x_sync_cf0_setup_cf0_base_v(val);
> +       end = host1x_sync_cf0_setup_cf0_limit_v(val);
> +
> +       state = NVHOST_DBG_STATE_CMD;
> +
> +       do {
> +               writel(0x0, m->sync_aperture + host1x_sync_cfpeek_ctrl_r());
> +               writel(host1x_sync_cfpeek_ctrl_cfpeek_ena_f(1)
> +                               | host1x_sync_cfpeek_ctrl_cfpeek_channr_f(chid)
> +                               | host1x_sync_cfpeek_ctrl_cfpeek_addr_f(rd_ptr),
> +                       m->sync_aperture + host1x_sync_cfpeek_ctrl_r());
> +               val = readl(m->sync_aperture + host1x_sync_cfpeek_read_r());
> +
> +               show_channel_word(o, &state, &count, 0, val, NULL);
> +
> +               if (rd_ptr == end)
> +                       rd_ptr = start;
> +               else
> +                       rd_ptr++;
> +       } while (rd_ptr != wr_ptr);
> +
> +       if (state == NVHOST_DBG_STATE_DATA)
> +               nvhost_debug_output(o, ", ...])\n");
> +       nvhost_debug_output(o, "\n");
> +
> +       writel(0x0, m->sync_aperture + host1x_sync_cfpeek_ctrl_r());
> +}
> +
> +static void host1x_debug_show_mlocks(struct nvhost_master *m, struct output *o)
> +{
> +       u32 __iomem *mlo_regs = m->sync_aperture +
> +               host1x_sync_mlock_owner_0_r();
> +       int i;
> +
> +       nvhost_debug_output(o, "---- mlocks ----\n");
> +       for (i = 0; i < NV_HOST1X_NB_MLOCKS; i++) {
> +               u32 owner = readl(mlo_regs + i);
> +               if (host1x_sync_mlock_owner_0_mlock_ch_owns_0_v(owner))
> +                       nvhost_debug_output(o, "%d: locked by channel %d\n",
> +                               i,
> +                               host1x_sync_mlock_owner_0_mlock_owner_chid_0_f(
> +                                       owner));
> +               else if (host1x_sync_mlock_owner_0_mlock_cpu_owns_0_v(owner))
> +                       nvhost_debug_output(o, "%d: locked by cpu\n", i);
> +               else
> +                       nvhost_debug_output(o, "%d: unlocked\n", i);
> +       }
> +       nvhost_debug_output(o, "\n");
> +}
> +
> +static const struct nvhost_debug_ops host1x_debug_ops = {
> +       .show_channel_cdma = host1x_debug_show_channel_cdma,
> +       .show_channel_fifo = host1x_debug_show_channel_fifo,
> +       .show_mlocks = host1x_debug_show_mlocks,
> +};
> diff --git a/drivers/video/tegra/host/host1x/host1x_intr.c b/drivers/video/tegra/host/host1x/host1x_intr.c
> new file mode 100644
> index 0000000..bf816bb
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x_intr.c
> @@ -0,0 +1,263 @@
> +/*
> + * drivers/video/tegra/host/host1x/host1x_intr.c
> + *
> + * Tegra Graphics Host Interrupt Management
> + *
> + * Copyright (C) 2010 Google, Inc.
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/io.h>
> +#include <asm/mach/irq.h>
> +
> +#include "nvhost_intr.h"
> +#include "dev.h"
> +
> +/* Spacing between sync registers */
> +#define REGISTER_STRIDE 4
> +
> +static void host1x_intr_syncpt_thresh_isr(struct nvhost_intr_syncpt *syncpt);
> +
> +static void syncpt_thresh_cascade_fn(struct work_struct *work)
> +{
> +       struct nvhost_intr_syncpt *sp =
> +               container_of(work, struct nvhost_intr_syncpt, work);
> +       nvhost_syncpt_thresh_fn(sp->irq, sp);
> +}
> +
> +static irqreturn_t syncpt_thresh_cascade_isr(int irq, void *dev_id)
> +{
> +       struct nvhost_master *dev = dev_id;
> +       void __iomem *sync_regs = dev->sync_aperture;
> +       struct nvhost_intr *intr = &dev->intr;
> +       unsigned long reg;
> +       int i, id;
> +
> +       for (i = 0; i < dev->info.nb_pts / BITS_PER_LONG; i++) {
> +               reg = readl(sync_regs +
> +                               host1x_sync_syncpt_thresh_cpu0_int_status_r() +
> +                               i * REGISTER_STRIDE);
> +               for_each_set_bit(id, &reg, BITS_PER_LONG) {
> +                       struct nvhost_intr_syncpt *sp =
> +                               intr->syncpt + (i * BITS_PER_LONG + id);
> +                       host1x_intr_syncpt_thresh_isr(sp);
> +                       queue_work(intr->wq, &sp->work);
> +               }
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void host1x_intr_init_host_sync(struct nvhost_intr *intr)
> +{
> +       struct nvhost_master *dev = intr_to_dev(intr);
> +       void __iomem *sync_regs = dev->sync_aperture;
> +       int i, err, irq;
> +
> +       writel(0xffffffffUL,
> +               sync_regs + host1x_sync_syncpt_thresh_int_disable_r());
> +       writel(0xffffffffUL,
> +               sync_regs + host1x_sync_syncpt_thresh_cpu0_int_status_r());
> +
> +       for (i = 0; i < dev->info.nb_pts; i++)
> +               INIT_WORK(&intr->syncpt[i].work, syncpt_thresh_cascade_fn);
> +
> +       irq = platform_get_irq(dev->dev, 0);
> +       WARN_ON(IS_ERR_VALUE(irq));
> +       err = devm_request_irq(&dev->dev->dev, irq,
> +                               syncpt_thresh_cascade_isr,
> +                               IRQF_SHARED, "host_syncpt", dev);
> +       WARN_ON(IS_ERR_VALUE(err));
> +
> +       /* disable the ip_busy_timeout. this prevents write drops, etc.
> +        * there's no real way to recover from a hung client anyway.
> +        */
> +       writel(0, sync_regs + host1x_sync_ip_busy_timeout_r());
> +
> +       /* increase the auto-ack timout to the maximum value. 2d will hang
> +        * otherwise on Tegra2.
> +        */
> +       writel(0xff, sync_regs + host1x_sync_ctxsw_timeout_cfg_r());
> +}
> +
> +static void host1x_intr_set_host_clocks_per_usec(struct nvhost_intr *intr,
> +               u32 cpm)
> +{
> +       struct nvhost_master *dev = intr_to_dev(intr);
> +       void __iomem *sync_regs = dev->sync_aperture;
> +       /* write microsecond clock register */
> +       writel(cpm, sync_regs + host1x_sync_usec_clk_r());
> +}
> +
> +static void host1x_intr_set_syncpt_threshold(struct nvhost_intr *intr,
> +       u32 id, u32 thresh)
> +{
> +       struct nvhost_master *dev = intr_to_dev(intr);
> +       void __iomem *sync_regs = dev->sync_aperture;
> +       writel(thresh, sync_regs +
> +               (host1x_sync_syncpt_int_thresh_0_r() + id * REGISTER_STRIDE));
> +}
> +
> +static void host1x_intr_enable_syncpt_intr(struct nvhost_intr *intr, u32 id)
> +{
> +       struct nvhost_master *dev = intr_to_dev(intr);
> +       void __iomem *sync_regs = dev->sync_aperture;
> +
> +       writel(BIT_MASK(id), sync_regs +
> +                       host1x_sync_syncpt_thresh_int_enable_cpu0_r() +
> +                       BIT_WORD(id) * REGISTER_STRIDE);
> +}
> +
> +static void host1x_intr_disable_syncpt_intr(struct nvhost_intr *intr, u32 id)
> +{
> +       struct nvhost_master *dev = intr_to_dev(intr);
> +       void __iomem *sync_regs = dev->sync_aperture;
> +
> +       writel(BIT_MASK(id), sync_regs +
> +                       host1x_sync_syncpt_thresh_int_disable_r() +
> +                       BIT_WORD(id) * REGISTER_STRIDE);
> +
> +       writel(BIT_MASK(id), sync_regs +
> +               host1x_sync_syncpt_thresh_cpu0_int_status_r() +
> +               BIT_WORD(id) * REGISTER_STRIDE);
> +}
> +
> +static void host1x_intr_disable_all_syncpt_intrs(struct nvhost_intr *intr)
> +{
> +       struct nvhost_master *dev = intr_to_dev(intr);
> +       void __iomem *sync_regs = dev->sync_aperture;
> +       u32 reg;
> +
> +       for (reg = 0; reg <= BIT_WORD(dev->info.nb_pts) * REGISTER_STRIDE;
> +                       reg += REGISTER_STRIDE) {
> +               writel(0xffffffffu, sync_regs +
> +                               host1x_sync_syncpt_thresh_int_disable_r() +
> +                               reg);
> +
> +               writel(0xffffffffu, sync_regs +
> +                       host1x_sync_syncpt_thresh_cpu0_int_status_r() + reg);
> +       }
> +}
> +
> +/**
> + * Sync point threshold interrupt service function
> + * Handles sync point threshold triggers, in interrupt context
> + */
> +static void host1x_intr_syncpt_thresh_isr(struct nvhost_intr_syncpt *syncpt)
> +{
> +       unsigned int id = syncpt->id;
> +       struct nvhost_intr *intr = intr_syncpt_to_intr(syncpt);
> +
> +       void __iomem *sync_regs = intr_to_dev(intr)->sync_aperture;
> +
> +       u32 reg = BIT_WORD(id) * REGISTER_STRIDE;
> +
> +       writel(BIT_MASK(id), sync_regs +
> +               host1x_sync_syncpt_thresh_int_disable_r() + reg);
> +       writel(BIT_MASK(id), sync_regs +
> +               host1x_sync_syncpt_thresh_cpu0_int_status_r() + reg);
> +}
> +
> +/**
> + * Host general interrupt service function
> + * Handles read / write failures
> + */
> +static irqreturn_t host1x_intr_host1x_isr(int irq, void *dev_id)
> +{
> +       struct nvhost_intr *intr = dev_id;
> +       void __iomem *sync_regs = intr_to_dev(intr)->sync_aperture;
> +       u32 stat;
> +       u32 ext_stat;
> +       u32 addr;
> +
> +       stat = readl(sync_regs + host1x_sync_hintstatus_r());
> +       ext_stat = readl(sync_regs + host1x_sync_hintstatus_ext_r());
> +
> +       if (host1x_sync_hintstatus_ext_ip_read_int_v(ext_stat)) {
> +               addr = readl(sync_regs + host1x_sync_ip_read_timeout_addr_r());
> +               pr_err("Host read timeout at address %x\n", addr);
> +       }
> +
> +       if (host1x_sync_hintstatus_ext_ip_write_int_v(ext_stat)) {
> +               addr = readl(sync_regs + host1x_sync_ip_write_timeout_addr_r());
> +               pr_err("Host write timeout at address %x\n", addr);
> +       }
> +
> +       writel(ext_stat, sync_regs + host1x_sync_hintstatus_ext_r());
> +       writel(stat, sync_regs + host1x_sync_hintstatus_r());
> +
> +       return IRQ_HANDLED;
> +}
> +static int host1x_intr_request_host_general_irq(struct nvhost_intr *intr)
> +{
> +       void __iomem *sync_regs = intr_to_dev(intr)->sync_aperture;
> +       int err;
> +
> +       /* master disable for general (not syncpt) host interrupts */
> +       writel(0, sync_regs + host1x_sync_intmask_r());
> +
> +       /* clear status & extstatus */
> +       writel(0xfffffffful, sync_regs + host1x_sync_hintstatus_ext_r());
> +       writel(0xfffffffful, sync_regs + host1x_sync_hintstatus_r());
> +
> +       err = request_irq(intr->host_general_irq, host1x_intr_host1x_isr, 0,
> +                       "host_status", intr);
> +       if (err)
> +               return err;
> +
> +       /* enable extra interrupt sources IP_READ_INT and IP_WRITE_INT */
> +       writel(BIT(30) | BIT(31), sync_regs + host1x_sync_hintmask_ext_r());
> +
> +       /* enable extra interrupt sources */
> +       writel(BIT(12) | BIT(31), sync_regs + host1x_sync_hintmask_r());
> +
> +       /* enable host module interrupt to CPU0 */
> +       writel(BIT(0), sync_regs + host1x_sync_intc0mask_r());
> +
> +       /* master enable for general (not syncpt) host interrupts */
> +       writel(BIT(0), sync_regs + host1x_sync_intmask_r());
> +
> +       return err;
> +}
> +
> +static void host1x_intr_free_host_general_irq(struct nvhost_intr *intr)
> +{
> +       void __iomem *sync_regs = intr_to_dev(intr)->sync_aperture;
> +
> +       /* master disable for general (not syncpt) host interrupts */
> +       writel(0, sync_regs + host1x_sync_intmask_r());
> +
> +       free_irq(intr->host_general_irq, intr);
> +}
> +
> +static int host1x_free_syncpt_irq(struct nvhost_intr *intr)
> +{
> +       flush_workqueue(intr->wq);
> +       return 0;
> +}
> +
> +static const struct nvhost_intr_ops host1x_intr_ops = {
> +       .init_host_sync = host1x_intr_init_host_sync,
> +       .set_host_clocks_per_usec = host1x_intr_set_host_clocks_per_usec,
> +       .set_syncpt_threshold = host1x_intr_set_syncpt_threshold,
> +       .enable_syncpt_intr = host1x_intr_enable_syncpt_intr,
> +       .disable_syncpt_intr = host1x_intr_disable_syncpt_intr,
> +       .disable_all_syncpt_intrs = host1x_intr_disable_all_syncpt_intrs,
> +       .request_host_general_irq = host1x_intr_request_host_general_irq,
> +       .free_host_general_irq = host1x_intr_free_host_general_irq,
> +       .free_syncpt_irq = host1x_free_syncpt_irq,
> +};
> diff --git a/drivers/video/tegra/host/host1x/host1x_syncpt.c b/drivers/video/tegra/host/host1x/host1x_syncpt.c
> new file mode 100644
> index 0000000..ba0080a
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/host1x_syncpt.c
> @@ -0,0 +1,170 @@
> +/*
> + * drivers/video/tegra/host/host1x/host1x_syncpt.c
> + *
> + * Tegra Graphics Host Syncpoints for HOST1X
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include <linux/io.h>
> +#include <trace/events/nvhost.h>
> +#include "nvhost_syncpt.h"
> +#include "nvhost_acm.h"
> +#include "host1x.h"
> +#include "chip_support.h"
> +
> +/**
> + * Write the current syncpoint value back to hw.
> + */
> +static void host1x_syncpt_reset(struct nvhost_syncpt *sp, u32 id)
> +{
> +       struct nvhost_master *dev = syncpt_to_dev(sp);
> +       int min = nvhost_syncpt_read_min(sp, id);
> +       writel(min, dev->sync_aperture + (host1x_sync_syncpt_0_r() + id * 4));
> +}
> +
> +/**
> + * Write the current waitbase value back to hw.
> + */
> +static void host1x_syncpt_reset_wait_base(struct nvhost_syncpt *sp, u32 id)
> +{
> +       struct nvhost_master *dev = syncpt_to_dev(sp);
> +       writel(sp->base_val[id],
> +               dev->sync_aperture + (host1x_sync_syncpt_base_0_r() + id * 4));
> +}
> +
> +/**
> + * Read waitbase value from hw.
> + */
> +static void host1x_syncpt_read_wait_base(struct nvhost_syncpt *sp, u32 id)
> +{
> +       struct nvhost_master *dev = syncpt_to_dev(sp);
> +       sp->base_val[id] = readl(dev->sync_aperture +
> +                               (host1x_sync_syncpt_base_0_r() + id * 4));
> +}
> +
> +/**
> + * Updates the last value read from hardware.
> + * (was nvhost_syncpt_update_min)
> + */
> +static u32 host1x_syncpt_update_min(struct nvhost_syncpt *sp, u32 id)
> +{
> +       struct nvhost_master *dev = syncpt_to_dev(sp);
> +       void __iomem *sync_regs = dev->sync_aperture;
> +       u32 old, live;
> +
> +       do {
> +               old = nvhost_syncpt_read_min(sp, id);
> +               live = readl(sync_regs + (host1x_sync_syncpt_0_r() + id * 4));
> +       } while ((u32)atomic_cmpxchg(&sp->min_val[id], old, live) != old);
> +
> +       if (!nvhost_syncpt_check_max(sp, id, live))
> +               dev_err(&syncpt_to_dev(sp)->dev->dev,
> +                               "%s failed: id=%u, min=%d, max=%d\n",
> +                               __func__,
> +                               id,
> +                               nvhost_syncpt_read_min(sp, id),
> +                               nvhost_syncpt_read_max(sp, id));
> +
> +       return live;
> +}
> +
> +/**
> + * Write a cpu syncpoint increment to the hardware, without touching
> + * the cache. Caller is responsible for host being powered.
> + */
> +static void host1x_syncpt_cpu_incr(struct nvhost_syncpt *sp, u32 id)
> +{
> +       struct nvhost_master *dev = syncpt_to_dev(sp);
> +       u32 reg_offset = id / 32;
> +
> +       if (!nvhost_module_powered(dev->dev)) {
> +               dev_err(&syncpt_to_dev(sp)->dev->dev,
> +                       "Trying to access host1x when it's off");
> +               return;
> +       }
> +
> +       if (!nvhost_syncpt_client_managed(sp, id)
> +                       && nvhost_syncpt_min_eq_max(sp, id)) {
> +               dev_err(&syncpt_to_dev(sp)->dev->dev,
> +                       "Trying to increment syncpoint id %d beyond max\n",
> +                       id);
> +               nvhost_debug_dump(syncpt_to_dev(sp));
> +               return;
> +       }
> +       writel(BIT_MASK(id), dev->sync_aperture +
> +                       host1x_sync_syncpt_cpu_incr_r() + reg_offset * 4);
> +       wmb();
> +}
> +
> +/* remove a wait pointed to by patch_addr */
> +static int host1x_syncpt_patch_wait(struct nvhost_syncpt *sp,
> +               void *patch_addr)
> +{
> +       u32 override = nvhost_class_host_wait_syncpt(
> +                       NVSYNCPT_GRAPHICS_HOST, 0);
> +       __raw_writel(override, patch_addr);
> +       return 0;
> +}
> +
> +
> +static const char *host1x_syncpt_name(struct nvhost_syncpt *sp, u32 id)
> +{
> +       struct host1x_device_info *info = &syncpt_to_dev(sp)->info;
> +       const char *name = NULL;
> +
> +       if (id < info->nb_pts)
> +               name = info->syncpt_names[id];
> +
> +       return name ? name : "";
> +}
> +
> +static void host1x_syncpt_debug(struct nvhost_syncpt *sp)
> +{
> +       u32 i;
> +       for (i = 0; i < nvhost_syncpt_nb_pts(sp); i++) {
> +               u32 max = nvhost_syncpt_read_max(sp, i);
> +               u32 min = nvhost_syncpt_update_min(sp, i);
> +               if (!max && !min)
> +                       continue;
> +               dev_info(&syncpt_to_dev(sp)->dev->dev,
> +                       "id %d (%s) min %d max %d\n",
> +                       i, syncpt_op().name(sp, i),
> +                       min, max);
> +
> +       }
> +
> +       for (i = 0; i < nvhost_syncpt_nb_bases(sp); i++) {
> +               u32 base_val;
> +               host1x_syncpt_read_wait_base(sp, i);
> +               base_val = sp->base_val[i];
> +               if (base_val)
> +                       dev_info(&syncpt_to_dev(sp)->dev->dev,
> +                                       "waitbase id %d val %d\n",
> +                                       i, base_val);
> +
> +       }
> +}
> +
> +static const struct nvhost_syncpt_ops host1x_syncpt_ops = {
> +       .reset = host1x_syncpt_reset,
> +       .reset_wait_base = host1x_syncpt_reset_wait_base,
> +       .read_wait_base = host1x_syncpt_read_wait_base,
> +       .update_min = host1x_syncpt_update_min,
> +       .cpu_incr = host1x_syncpt_cpu_incr,
> +       .patch_wait = host1x_syncpt_patch_wait,
> +       .debug = host1x_syncpt_debug,
> +       .name = host1x_syncpt_name,
> +};
> diff --git a/drivers/video/tegra/host/host1x/hw_host1x01_channel.h b/drivers/video/tegra/host/host1x/hw_host1x01_channel.h
> new file mode 100644
> index 0000000..ca2f9a0
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/hw_host1x01_channel.h
> @@ -0,0 +1,182 @@
> +/*
> + * drivers/video/tegra/host/host1x/hw_host1x_channel_host1x.h
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
> + *
> + */
> +
> + /*
> +  * Function naming determines intended use:
> +  *
> +  *     <x>_r(void) : Returns the offset for register <x>.
> +  *
> +  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
> +  *
> +  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
> +  *
> +  *     <x>_<y>_f(u32 v) : Returns a value based on 'v' which has been shifted
> +  *         and masked to place it at field <y> of register <x>.  This value
> +  *         can be |'d with others to produce a full register value for
> +  *         register <x>.
> +  *
> +  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
> +  *         value can be ~'d and then &'d to clear the value of field <y> for
> +  *         register <x>.
> +  *
> +  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
> +  *         to place it at field <y> of register <x>.  This value can be |'d
> +  *         with others to produce a full register value for <x>.
> +  *
> +  *     <x>_<y>_v(u32 r) : Returns the value of field <y> from a full register
> +  *         <x> value 'r' after being shifted to place its LSB at bit 0.
> +  *         This value is suitable for direct comparison with other unshifted
> +  *         values appropriate for use in field <y> of register <x>.
> +  *
> +  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
> +  *         field <y> of register <x>.  This value is suitable for direct
> +  *         comparison with unshifted values appropriate for use in field <y>
> +  *         of register <x>.
> +  */
> +
> +#ifndef __hw_host1x_channel_host1x_h__
> +#define __hw_host1x_channel_host1x_h__
> +/*This file is autogenerated.  Do not edit. */
> +
> +static inline u32 host1x_channel_fifostat_r(void)
> +{
> +       return 0x0;
> +}
> +static inline u32 host1x_channel_fifostat_cfempty_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_channel_fifostat_cfempty_f(u32 v)
> +{
> +       return (v & 0x1) << 10;
> +}
> +static inline u32 host1x_channel_fifostat_cfempty_m(void)
> +{
> +       return 0x1 << 10;
> +}
> +static inline u32 host1x_channel_fifostat_cfempty_v(u32 r)
> +{
> +       return (r >> 10) & 0x1;
> +}
> +static inline u32 host1x_channel_fifostat_cfempty_notempty_v(void)
> +{
> +       return 0;
> +}
> +static inline u32 host1x_channel_fifostat_cfempty_empty_v(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_channel_fifostat_outfentries_s(void)
> +{
> +       return 5;
> +}
> +static inline u32 host1x_channel_fifostat_outfentries_f(u32 v)
> +{
> +       return (v & 0x1f) << 24;
> +}
> +static inline u32 host1x_channel_fifostat_outfentries_m(void)
> +{
> +       return 0x1f << 24;
> +}
> +static inline u32 host1x_channel_fifostat_outfentries_v(u32 r)
> +{
> +       return (r >> 24) & 0x1f;
> +}
> +static inline u32 host1x_channel_inddata_r(void)
> +{
> +       return 0xc;
> +}
> +static inline u32 host1x_channel_dmastart_r(void)
> +{
> +       return 0x14;
> +}
> +static inline u32 host1x_channel_dmaput_r(void)
> +{
> +       return 0x18;
> +}
> +static inline u32 host1x_channel_dmaget_r(void)
> +{
> +       return 0x1c;
> +}
> +static inline u32 host1x_channel_dmaend_r(void)
> +{
> +       return 0x20;
> +}
> +static inline u32 host1x_channel_dmactrl_r(void)
> +{
> +       return 0x24;
> +}
> +static inline u32 host1x_channel_dmactrl_dmastop_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_channel_dmactrl_dmastop_f(u32 v)
> +{
> +       return (v & 0x1) << 0;
> +}
> +static inline u32 host1x_channel_dmactrl_dmastop_m(void)
> +{
> +       return 0x1 << 0;
> +}
> +static inline u32 host1x_channel_dmactrl_dmastop_v(u32 r)
> +{
> +       return (r >> 0) & 0x1;
> +}
> +static inline u32 host1x_channel_dmactrl_dmastop_run_v(void)
> +{
> +       return 0;
> +}
> +static inline u32 host1x_channel_dmactrl_dmastop_stop_v(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_channel_dmactrl_dmagetrst_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_channel_dmactrl_dmagetrst_f(u32 v)
> +{
> +       return (v & 0x1) << 1;
> +}
> +static inline u32 host1x_channel_dmactrl_dmagetrst_m(void)
> +{
> +       return 0x1 << 1;
> +}
> +static inline u32 host1x_channel_dmactrl_dmagetrst_v(u32 r)
> +{
> +       return (r >> 1) & 0x1;
> +}
> +static inline u32 host1x_channel_dmactrl_dmainitget_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_channel_dmactrl_dmainitget_f(u32 v)
> +{
> +       return (v & 0x1) << 2;
> +}
> +static inline u32 host1x_channel_dmactrl_dmainitget_m(void)
> +{
> +       return 0x1 << 2;
> +}
> +static inline u32 host1x_channel_dmactrl_dmainitget_v(u32 r)
> +{
> +       return (r >> 2) & 0x1;
> +}
> +
> +#endif /* __hw_host1x_channel_host1x_h__ */
> diff --git a/drivers/video/tegra/host/host1x/hw_host1x01_sync.h b/drivers/video/tegra/host/host1x/hw_host1x01_sync.h
> new file mode 100644
> index 0000000..67f0cbf
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/hw_host1x01_sync.h
> @@ -0,0 +1,398 @@
> +/*
> + * drivers/video/tegra/host/host1x/hw_host1x_sync_host1x.h
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
> + *
> + */
> +
> + /*
> +  * Function naming determines intended use:
> +  *
> +  *     <x>_r(void) : Returns the offset for register <x>.
> +  *
> +  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
> +  *
> +  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
> +  *
> +  *     <x>_<y>_f(u32 v) : Returns a value based on 'v' which has been shifted
> +  *         and masked to place it at field <y> of register <x>.  This value
> +  *         can be |'d with others to produce a full register value for
> +  *         register <x>.
> +  *
> +  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
> +  *         value can be ~'d and then &'d to clear the value of field <y> for
> +  *         register <x>.
> +  *
> +  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
> +  *         to place it at field <y> of register <x>.  This value can be |'d
> +  *         with others to produce a full register value for <x>.
> +  *
> +  *     <x>_<y>_v(u32 r) : Returns the value of field <y> from a full register
> +  *         <x> value 'r' after being shifted to place its LSB at bit 0.
> +  *         This value is suitable for direct comparison with other unshifted
> +  *         values appropriate for use in field <y> of register <x>.
> +  *
> +  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
> +  *         field <y> of register <x>.  This value is suitable for direct
> +  *         comparison with unshifted values appropriate for use in field <y>
> +  *         of register <x>.
> +  */
> +
> +#ifndef __hw_host1x_sync_host1x_h__
> +#define __hw_host1x_sync_host1x_h__
> +/*This file is autogenerated.  Do not edit. */
> +
> +static inline u32 host1x_sync_intmask_r(void)
> +{
> +       return 0x4;
> +}
> +static inline u32 host1x_sync_intc0mask_r(void)
> +{
> +       return 0x8;
> +}
> +static inline u32 host1x_sync_hintstatus_r(void)
> +{
> +       return 0x20;
> +}
> +static inline u32 host1x_sync_hintmask_r(void)
> +{
> +       return 0x24;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_r(void)
> +{
> +       return 0x28;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_ip_read_int_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_ip_read_int_f(u32 v)
> +{
> +       return (v & 0x1) << 30;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_ip_read_int_m(void)
> +{
> +       return 0x1 << 30;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_ip_read_int_v(u32 r)
> +{
> +       return (r >> 30) & 0x1;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_ip_write_int_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_ip_write_int_f(u32 v)
> +{
> +       return (v & 0x1) << 31;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_ip_write_int_m(void)
> +{
> +       return 0x1 << 31;
> +}
> +static inline u32 host1x_sync_hintstatus_ext_ip_write_int_v(u32 r)
> +{
> +       return (r >> 31) & 0x1;
> +}
> +static inline u32 host1x_sync_hintmask_ext_r(void)
> +{
> +       return 0x2c;
> +}
> +static inline u32 host1x_sync_syncpt_thresh_cpu0_int_status_r(void)
> +{
> +       return 0x40;
> +}
> +static inline u32 host1x_sync_syncpt_thresh_cpu1_int_status_r(void)
> +{
> +       return 0x48;
> +}
> +static inline u32 host1x_sync_syncpt_thresh_int_disable_r(void)
> +{
> +       return 0x60;
> +}
> +static inline u32 host1x_sync_syncpt_thresh_int_enable_cpu0_r(void)
> +{
> +       return 0x68;
> +}
> +static inline u32 host1x_sync_cf0_setup_r(void)
> +{
> +       return 0x80;
> +}
> +static inline u32 host1x_sync_cf0_setup_cf0_base_s(void)
> +{
> +       return 9;
> +}
> +static inline u32 host1x_sync_cf0_setup_cf0_base_f(u32 v)
> +{
> +       return (v & 0x1ff) << 0;
> +}
> +static inline u32 host1x_sync_cf0_setup_cf0_base_m(void)
> +{
> +       return 0x1ff << 0;
> +}
> +static inline u32 host1x_sync_cf0_setup_cf0_base_v(u32 r)
> +{
> +       return (r >> 0) & 0x1ff;
> +}
> +static inline u32 host1x_sync_cf0_setup_cf0_limit_s(void)
> +{
> +       return 9;
> +}
> +static inline u32 host1x_sync_cf0_setup_cf0_limit_f(u32 v)
> +{
> +       return (v & 0x1ff) << 16;
> +}
> +static inline u32 host1x_sync_cf0_setup_cf0_limit_m(void)
> +{
> +       return 0x1ff << 16;
> +}
> +static inline u32 host1x_sync_cf0_setup_cf0_limit_v(u32 r)
> +{
> +       return (r >> 16) & 0x1ff;
> +}
> +static inline u32 host1x_sync_cmdproc_stop_r(void)
> +{
> +       return 0xac;
> +}
> +static inline u32 host1x_sync_ch_teardown_r(void)
> +{
> +       return 0xb0;
> +}
> +static inline u32 host1x_sync_usec_clk_r(void)
> +{
> +       return 0x1a4;
> +}
> +static inline u32 host1x_sync_ctxsw_timeout_cfg_r(void)
> +{
> +       return 0x1a8;
> +}
> +static inline u32 host1x_sync_ip_busy_timeout_r(void)
> +{
> +       return 0x1bc;
> +}
> +static inline u32 host1x_sync_ip_read_timeout_addr_r(void)
> +{
> +       return 0x1c0;
> +}
> +static inline u32 host1x_sync_ip_write_timeout_addr_r(void)
> +{
> +       return 0x1c4;
> +}
> +static inline u32 host1x_sync_mlock_0_r(void)
> +{
> +       return 0x2c0;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_r(void)
> +{
> +       return 0x340;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_owner_chid_0_s(void)
> +{
> +       return 4;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_owner_chid_0_f(u32 v)
> +{
> +       return (v & 0xf) << 8;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_owner_chid_0_m(void)
> +{
> +       return 0xf << 8;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_owner_chid_0_v(u32 r)
> +{
> +       return (r >> 8) & 0xf;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_cpu_owns_0_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_cpu_owns_0_f(u32 v)
> +{
> +       return (v & 0x1) << 1;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_cpu_owns_0_m(void)
> +{
> +       return 0x1 << 1;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_cpu_owns_0_v(u32 r)
> +{
> +       return (r >> 1) & 0x1;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_ch_owns_0_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_ch_owns_0_f(u32 v)
> +{
> +       return (v & 0x1) << 0;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_ch_owns_0_m(void)
> +{
> +       return 0x1 << 0;
> +}
> +static inline u32 host1x_sync_mlock_owner_0_mlock_ch_owns_0_v(u32 r)
> +{
> +       return (r >> 0) & 0x1;
> +}
> +static inline u32 host1x_sync_syncpt_0_r(void)
> +{
> +       return 0x400;
> +}
> +static inline u32 host1x_sync_syncpt_int_thresh_0_r(void)
> +{
> +       return 0x500;
> +}
> +static inline u32 host1x_sync_syncpt_base_0_r(void)
> +{
> +       return 0x600;
> +}
> +static inline u32 host1x_sync_syncpt_cpu_incr_r(void)
> +{
> +       return 0x700;
> +}
> +static inline u32 host1x_sync_cbread0_r(void)
> +{
> +       return 0x720;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_r(void)
> +{
> +       return 0x74c;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_addr_s(void)
> +{
> +       return 9;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_addr_f(u32 v)
> +{
> +       return (v & 0x1ff) << 0;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_addr_m(void)
> +{
> +       return 0x1ff << 0;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_addr_v(u32 r)
> +{
> +       return (r >> 0) & 0x1ff;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_channr_s(void)
> +{
> +       return 3;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_channr_f(u32 v)
> +{
> +       return (v & 0x7) << 16;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_channr_m(void)
> +{
> +       return 0x7 << 16;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_channr_v(u32 r)
> +{
> +       return (r >> 16) & 0x7;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_ena_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_ena_f(u32 v)
> +{
> +       return (v & 0x1) << 31;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_ena_m(void)
> +{
> +       return 0x1 << 31;
> +}
> +static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_ena_v(u32 r)
> +{
> +       return (r >> 31) & 0x1;
> +}
> +static inline u32 host1x_sync_cfpeek_read_r(void)
> +{
> +       return 0x750;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_r(void)
> +{
> +       return 0x754;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_cf_rd_ptr_s(void)
> +{
> +       return 9;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_cf_rd_ptr_f(u32 v)
> +{
> +       return (v & 0x1ff) << 0;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_cf_rd_ptr_m(void)
> +{
> +       return 0x1ff << 0;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_cf_rd_ptr_v(u32 r)
> +{
> +       return (r >> 0) & 0x1ff;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_cf_wr_ptr_s(void)
> +{
> +       return 9;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_cf_wr_ptr_f(u32 v)
> +{
> +       return (v & 0x1ff) << 16;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_cf_wr_ptr_m(void)
> +{
> +       return 0x1ff << 16;
> +}
> +static inline u32 host1x_sync_cfpeek_ptrs_cf_wr_ptr_v(u32 r)
> +{
> +       return (r >> 16) & 0x1ff;
> +}
> +static inline u32 host1x_sync_cbstat_0_r(void)
> +{
> +       return 0x758;
> +}
> +static inline u32 host1x_sync_cbstat_0_cboffset0_s(void)
> +{
> +       return 16;
> +}
> +static inline u32 host1x_sync_cbstat_0_cboffset0_f(u32 v)
> +{
> +       return (v & 0xffff) << 0;
> +}
> +static inline u32 host1x_sync_cbstat_0_cboffset0_m(void)
> +{
> +       return 0xffff << 0;
> +}
> +static inline u32 host1x_sync_cbstat_0_cboffset0_v(u32 r)
> +{
> +       return (r >> 0) & 0xffff;
> +}
> +static inline u32 host1x_sync_cbstat_0_cbclass0_s(void)
> +{
> +       return 10;
> +}
> +static inline u32 host1x_sync_cbstat_0_cbclass0_f(u32 v)
> +{
> +       return (v & 0x3ff) << 16;
> +}
> +static inline u32 host1x_sync_cbstat_0_cbclass0_m(void)
> +{
> +       return 0x3ff << 16;
> +}
> +static inline u32 host1x_sync_cbstat_0_cbclass0_v(u32 r)
> +{
> +       return (r >> 16) & 0x3ff;
> +}
> +
> +#endif /* __hw_host1x_sync_host1x_h__ */
> diff --git a/drivers/video/tegra/host/host1x/hw_host1x01_uclass.h b/drivers/video/tegra/host/host1x/hw_host1x01_uclass.h
> new file mode 100644
> index 0000000..ed6e4b7
> --- /dev/null
> +++ b/drivers/video/tegra/host/host1x/hw_host1x01_uclass.h
> @@ -0,0 +1,474 @@
> +/*
> + * drivers/video/tegra/host/host1x/hw_host1x_uclass_host1x.h
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
> + *
> + */
> +
> + /*
> +  * Function naming determines intended use:
> +  *
> +  *     <x>_r(void) : Returns the offset for register <x>.
> +  *
> +  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
> +  *
> +  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
> +  *
> +  *     <x>_<y>_f(u32 v) : Returns a value based on 'v' which has been shifted
> +  *         and masked to place it at field <y> of register <x>.  This value
> +  *         can be |'d with others to produce a full register value for
> +  *         register <x>.
> +  *
> +  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
> +  *         value can be ~'d and then &'d to clear the value of field <y> for
> +  *         register <x>.
> +  *
> +  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
> +  *         to place it at field <y> of register <x>.  This value can be |'d
> +  *         with others to produce a full register value for <x>.
> +  *
> +  *     <x>_<y>_v(u32 r) : Returns the value of field <y> from a full register
> +  *         <x> value 'r' after being shifted to place its LSB at bit 0.
> +  *         This value is suitable for direct comparison with other unshifted
> +  *         values appropriate for use in field <y> of register <x>.
> +  *
> +  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
> +  *         field <y> of register <x>.  This value is suitable for direct
> +  *         comparison with unshifted values appropriate for use in field <y>
> +  *         of register <x>.
> +  */
> +
> +#ifndef __hw_host1x_uclass_host1x_h__
> +#define __hw_host1x_uclass_host1x_h__
> +/*This file is autogenerated.  Do not edit. */
> +
> +static inline u32 host1x_uclass_incr_syncpt_r(void)
> +{
> +       return 0x0;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_cond_s(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_cond_f(u32 v)
> +{
> +       return (v & 0xff) << 8;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_cond_m(void)
> +{
> +       return 0xff << 8;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_cond_v(u32 r)
> +{
> +       return (r >> 8) & 0xff;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_cond_immediate_v(void)
> +{
> +       return 0;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_cond_op_done_v(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_cond_rd_done_v(void)
> +{
> +       return 2;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_cond_reg_wr_safe_v(void)
> +{
> +       return 3;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_indx_s(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_indx_f(u32 v)
> +{
> +       return (v & 0xff) << 0;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_indx_m(void)
> +{
> +       return 0xff << 0;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_indx_v(u32 r)
> +{
> +       return (r >> 0) & 0xff;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_r(void)
> +{
> +       return 0x8;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_indx_s(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_indx_f(u32 v)
> +{
> +       return (v & 0xff) << 24;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_indx_m(void)
> +{
> +       return 0xff << 24;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_indx_v(u32 r)
> +{
> +       return (r >> 24) & 0xff;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_thresh_s(void)
> +{
> +       return 24;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_thresh_f(u32 v)
> +{
> +       return (v & 0xffffff) << 0;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_thresh_m(void)
> +{
> +       return 0xffffff << 0;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_thresh_v(u32 r)
> +{
> +       return (r >> 0) & 0xffffff;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_r(void)
> +{
> +       return 0x9;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_indx_s(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_indx_f(u32 v)
> +{
> +       return (v & 0xff) << 24;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_indx_m(void)
> +{
> +       return 0xff << 24;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_indx_v(u32 r)
> +{
> +       return (r >> 24) & 0xff;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_base_indx_s(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_base_indx_f(u32 v)
> +{
> +       return (v & 0xff) << 16;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_base_indx_m(void)
> +{
> +       return 0xff << 16;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_base_indx_v(u32 r)
> +{
> +       return (r >> 16) & 0xff;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_offset_s(void)
> +{
> +       return 16;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_offset_f(u32 v)
> +{
> +       return (v & 0xffff) << 0;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_offset_m(void)
> +{
> +       return 0xffff << 0;
> +}
> +static inline u32 host1x_uclass_wait_syncpt_base_offset_v(u32 r)
> +{
> +       return (r >> 0) & 0xffff;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_r(void)
> +{
> +       return 0xb;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_base_indx_s(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_base_indx_f(u32 v)
> +{
> +       return (v & 0xff) << 24;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_base_indx_m(void)
> +{
> +       return 0xff << 24;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_base_indx_v(u32 r)
> +{
> +       return (r >> 24) & 0xff;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_value_s(void)
> +{
> +       return 24;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_value_f(u32 v)
> +{
> +       return (v & 0xffffff) << 0;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_value_m(void)
> +{
> +       return 0xffffff << 0;
> +}
> +static inline u32 host1x_uclass_load_syncpt_base_value_v(u32 r)
> +{
> +       return (r >> 0) & 0xffffff;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_r(void)
> +{
> +       return 0xc;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_base_indx_s(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_base_indx_f(u32 v)
> +{
> +       return (v & 0xff) << 24;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_base_indx_m(void)
> +{
> +       return 0xff << 24;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_base_indx_v(u32 r)
> +{
> +       return (r >> 24) & 0xff;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_offset_s(void)
> +{
> +       return 24;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_offset_f(u32 v)
> +{
> +       return (v & 0xffffff) << 0;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_offset_m(void)
> +{
> +       return 0xffffff << 0;
> +}
> +static inline u32 host1x_uclass_incr_syncpt_base_offset_v(u32 r)
> +{
> +       return (r >> 0) & 0xffffff;
> +}
> +static inline u32 host1x_uclass_indoff_r(void)
> +{
> +       return 0x2d;
> +}
> +static inline u32 host1x_uclass_indoff_indbe_s(void)
> +{
> +       return 4;
> +}
> +static inline u32 host1x_uclass_indoff_indbe_f(u32 v)
> +{
> +       return (v & 0xf) << 28;
> +}
> +static inline u32 host1x_uclass_indoff_indbe_m(void)
> +{
> +       return 0xf << 28;
> +}
> +static inline u32 host1x_uclass_indoff_indbe_v(u32 r)
> +{
> +       return (r >> 28) & 0xf;
> +}
> +static inline u32 host1x_uclass_indoff_autoinc_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_uclass_indoff_autoinc_f(u32 v)
> +{
> +       return (v & 0x1) << 27;
> +}
> +static inline u32 host1x_uclass_indoff_autoinc_m(void)
> +{
> +       return 0x1 << 27;
> +}
> +static inline u32 host1x_uclass_indoff_autoinc_v(u32 r)
> +{
> +       return (r >> 27) & 0x1;
> +}
> +static inline u32 host1x_uclass_indoff_spool_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_uclass_indoff_spool_f(u32 v)
> +{
> +       return (v & 0x1) << 26;
> +}
> +static inline u32 host1x_uclass_indoff_spool_m(void)
> +{
> +       return 0x1 << 26;
> +}
> +static inline u32 host1x_uclass_indoff_spool_v(u32 r)
> +{
> +       return (r >> 26) & 0x1;
> +}
> +static inline u32 host1x_uclass_indoff_indoffset_s(void)
> +{
> +       return 24;
> +}
> +static inline u32 host1x_uclass_indoff_indoffset_f(u32 v)
> +{
> +       return (v & 0xffffff) << 2;
> +}
> +static inline u32 host1x_uclass_indoff_indoffset_m(void)
> +{
> +       return 0xffffff << 2;
> +}
> +static inline u32 host1x_uclass_indoff_indoffset_v(u32 r)
> +{
> +       return (r >> 2) & 0xffffff;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_s(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_f(u32 v)
> +{
> +       return (v & 0xff) << 18;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_m(void)
> +{
> +       return 0xff << 18;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_v(u32 r)
> +{
> +       return (r >> 18) & 0xff;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_host1x_v(void)
> +{
> +       return 0;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_mpe_v(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_vi_v(void)
> +{
> +       return 2;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_epp_v(void)
> +{
> +       return 3;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_isp_v(void)
> +{
> +       return 4;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_gr2d_v(void)
> +{
> +       return 5;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_gr3d_v(void)
> +{
> +       return 6;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_display_v(void)
> +{
> +       return 8;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_tvo_v(void)
> +{
> +       return 11;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_displayb_v(void)
> +{
> +       return 9;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_dsi_v(void)
> +{
> +       return 12;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_hdmi_v(void)
> +{
> +       return 10;
> +}
> +static inline u32 host1x_uclass_indoff_indmodid_dsib_v(void)
> +{
> +       return 16;
> +}
> +static inline u32 host1x_uclass_indoff_indroffset_s(void)
> +{
> +       return 16;
> +}
> +static inline u32 host1x_uclass_indoff_indroffset_f(u32 v)
> +{
> +       return (v & 0xffff) << 2;
> +}
> +static inline u32 host1x_uclass_indoff_indroffset_m(void)
> +{
> +       return 0xffff << 2;
> +}
> +static inline u32 host1x_uclass_indoff_indroffset_v(u32 r)
> +{
> +       return (r >> 2) & 0xffff;
> +}
> +static inline u32 host1x_uclass_indoff_acctype_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_uclass_indoff_acctype_f(u32 v)
> +{
> +       return (v & 0x1) << 1;
> +}
> +static inline u32 host1x_uclass_indoff_acctype_m(void)
> +{
> +       return 0x1 << 1;
> +}
> +static inline u32 host1x_uclass_indoff_acctype_v(u32 r)
> +{
> +       return (r >> 1) & 0x1;
> +}
> +static inline u32 host1x_uclass_indoff_acctype_reg_v(void)
> +{
> +       return 0;
> +}
> +static inline u32 host1x_uclass_indoff_acctype_fb_v(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_uclass_indoff_rwn_s(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_uclass_indoff_rwn_f(u32 v)
> +{
> +       return (v & 0x1) << 0;
> +}
> +static inline u32 host1x_uclass_indoff_rwn_m(void)
> +{
> +       return 0x1 << 0;
> +}
> +static inline u32 host1x_uclass_indoff_rwn_v(u32 r)
> +{
> +       return (r >> 0) & 0x1;
> +}
> +static inline u32 host1x_uclass_indoff_rwn_write_v(void)
> +{
> +       return 0;
> +}
> +static inline u32 host1x_uclass_indoff_rwn_read_v(void)
> +{
> +       return 1;
> +}
> +static inline u32 host1x_uclass_inddata_r(void)
> +{
> +       return 0x2e;
> +}
> +
> +#endif /* __hw_host1x_uclass_host1x_h__ */
> diff --git a/drivers/video/tegra/host/nvhost_acm.c b/drivers/video/tegra/host/nvhost_acm.c
> new file mode 100644
> index 0000000..6da816a
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_acm.c
> @@ -0,0 +1,532 @@
> +/*
> + * drivers/video/tegra/host/nvhost_acm.c
> + *
> + * Tegra Graphics Host Automatic Clock Management
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation. All rights reserved.
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
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/stat.h>
> +#include <linux/string.h>
> +#include <linux/sched.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <trace/events/nvhost.h>
> +
> +#include <mach/powergate.h>
> +#include <mach/clk.h>
> +
> +#include "nvhost_acm.h"
> +#include "dev.h"
> +
> +#define ACM_SUSPEND_WAIT_FOR_IDLE_TIMEOUT      (2 * HZ)
> +#define POWERGATE_DELAY                                10
> +#define MAX_DEVID_LENGTH                       16
> +
> +static void do_powergate_locked(int id)
> +{
> +       if (id != -1 && tegra_powergate_is_powered(id))
> +               tegra_powergate_power_off(id);
> +}
> +
> +static void do_unpowergate_locked(int id)
> +{
> +       if (id != -1)
> +               tegra_powergate_power_on(id);
> +}
> +
> +static void to_state_clockgated_locked(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       if (pdata->powerstate == NVHOST_POWER_STATE_RUNNING) {
> +               int i, err;
> +               if (pdata->prepare_clockoff) {
> +                       err = pdata->prepare_clockoff(dev);
> +                       if (err) {
> +                               dev_err(&dev->dev, "error clock gating");
> +                               return;
> +                       }
> +               }
> +
> +               for (i = 0; i < pdata->num_clks; i++)
> +                       clk_disable_unprepare(pdata->clk[i]);
> +               if (dev->dev.parent)
> +                       nvhost_module_idle(to_platform_device(dev->dev.parent));
> +       } else if (pdata->powerstate == NVHOST_POWER_STATE_POWERGATED
> +                       && pdata->can_powergate) {
> +               do_unpowergate_locked(pdata->powergate_ids[0]);
> +               do_unpowergate_locked(pdata->powergate_ids[1]);
> +       }
> +       pdata->powerstate = NVHOST_POWER_STATE_CLOCKGATED;
> +}
> +
> +static void to_state_running_locked(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +       int prev_state = pdata->powerstate;
> +
> +       if (pdata->powerstate == NVHOST_POWER_STATE_POWERGATED)
> +               to_state_clockgated_locked(dev);
> +
> +       if (pdata->powerstate == NVHOST_POWER_STATE_CLOCKGATED) {
> +               int i;
> +
> +               if (dev->dev.parent)
> +                       nvhost_module_busy(to_platform_device(dev->dev.parent));
> +
> +               for (i = 0; i < pdata->num_clks; i++) {
> +                       int err = clk_prepare_enable(pdata->clk[i]);
> +                       if (err) {
> +                               dev_err(&dev->dev, "Cannot turn on clock %s",
> +                                       pdata->clocks[i].name);
> +                               return;
> +                       }
> +               }
> +
> +               if (pdata->finalize_clockon)
> +                       pdata->finalize_clockon(dev);
> +
> +               /* Invoke callback after power un-gating. This is used for
> +                * restoring context. */
> +               if (prev_state == NVHOST_POWER_STATE_POWERGATED
> +                               && pdata->finalize_poweron)
> +                       pdata->finalize_poweron(dev);
> +       }
> +       pdata->powerstate = NVHOST_POWER_STATE_RUNNING;
> +}
> +
> +/* This gets called from powergate_handler() and from module suspend.
> + * Module suspend is done for all modules, runtime power gating only
> + * for modules with can_powergate set.
> + */
> +static int to_state_powergated_locked(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +       int err = 0;
> +
> +       if (pdata->prepare_poweroff &&
> +               pdata->powerstate != NVHOST_POWER_STATE_POWERGATED) {
> +               /* Clock needs to be on in prepare_poweroff */
> +               to_state_running_locked(dev);
> +               err = pdata->prepare_poweroff(dev);
> +               if (err)
> +                       return err;
> +       }
> +
> +       if (pdata->powerstate == NVHOST_POWER_STATE_RUNNING)
> +               to_state_clockgated_locked(dev);
> +
> +       if (pdata->can_powergate) {
> +               do_powergate_locked(pdata->powergate_ids[0]);
> +               do_powergate_locked(pdata->powergate_ids[1]);
> +       }
> +
> +       pdata->powerstate = NVHOST_POWER_STATE_POWERGATED;
> +       return 0;
> +}
> +
> +static void schedule_powergating_locked(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +       if (pdata->can_powergate)
> +               schedule_delayed_work(&pdata->powerstate_down,
> +                               msecs_to_jiffies(pdata->powergate_delay));
> +}
> +
> +static void schedule_clockgating_locked(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +       schedule_delayed_work(&pdata->powerstate_down,
> +                       msecs_to_jiffies(pdata->clockgate_delay));
> +}
> +
> +void nvhost_module_busy(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       if (pdata->busy)
> +               pdata->busy(dev);
> +
> +       mutex_lock(&pdata->lock);
> +       cancel_delayed_work(&pdata->powerstate_down);
> +
> +       pdata->refcount++;
> +       if (pdata->refcount > 0 && !nvhost_module_powered(dev))
> +               to_state_running_locked(dev);
> +       mutex_unlock(&pdata->lock);
> +}
> +
> +static void powerstate_down_handler(struct work_struct *work)
> +{
> +       struct platform_device *dev;
> +       struct nvhost_device_data *pdata;
> +
> +       pdata = container_of(to_delayed_work(work),
> +                       struct nvhost_device_data,
> +                       powerstate_down);
> +
> +       dev = pdata->pdev;
> +
> +       mutex_lock(&pdata->lock);
> +       if (pdata->refcount == 0) {
> +               switch (pdata->powerstate) {
> +               case NVHOST_POWER_STATE_RUNNING:
> +                       to_state_clockgated_locked(dev);
> +                       schedule_powergating_locked(dev);
> +                       break;
> +               case NVHOST_POWER_STATE_CLOCKGATED:
> +                       if (to_state_powergated_locked(dev))
> +                               schedule_powergating_locked(dev);
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&pdata->lock);
> +}
> +
> +void nvhost_module_idle_mult(struct platform_device *dev, int refs)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +       bool kick = false;
> +
> +       mutex_lock(&pdata->lock);
> +       pdata->refcount -= refs;
> +       if (pdata->refcount == 0) {
> +               if (nvhost_module_powered(dev))
> +                       schedule_clockgating_locked(dev);
> +               kick = true;
> +       }
> +       mutex_unlock(&pdata->lock);
> +
> +       if (kick) {
> +               wake_up(&pdata->idle_wq);
> +
> +               if (pdata->idle)
> +                       pdata->idle(dev);
> +       }
> +}
> +
> +static ssize_t refcount_show(struct kobject *kobj,
> +       struct kobj_attribute *attr, char *buf)
> +{
> +       int ret;
> +       struct nvhost_device_power_attr *power_attribute =
> +               container_of(attr, struct nvhost_device_power_attr,
> +                       power_attr[NVHOST_POWER_SYSFS_ATTRIB_REFCOUNT]);
> +       struct platform_device *dev = power_attribute->ndev;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       mutex_lock(&pdata->lock);
> +       ret = sprintf(buf, "%d\n", pdata->refcount);
> +       mutex_unlock(&pdata->lock);
> +
> +       return ret;
> +}
> +
> +static ssize_t powergate_delay_store(struct kobject *kobj,
> +       struct kobj_attribute *attr, const char *buf, size_t count)
> +{
> +       int powergate_delay = 0, ret = 0;
> +       struct nvhost_device_power_attr *power_attribute =
> +               container_of(attr, struct nvhost_device_power_attr,
> +                       power_attr[NVHOST_POWER_SYSFS_ATTRIB_POWERGATE_DELAY]);
> +       struct platform_device *dev = power_attribute->ndev;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       if (!pdata->can_powergate) {
> +               dev_info(&dev->dev, "does not support power-gating\n");
> +               return count;
> +       }
> +
> +       mutex_lock(&pdata->lock);
> +       ret = sscanf(buf, "%d", &powergate_delay);
> +       if (ret == 1 && powergate_delay >= 0)
> +               pdata->powergate_delay = powergate_delay;
> +       else
> +               dev_err(&dev->dev, "Invalid powergate delay\n");
> +       mutex_unlock(&pdata->lock);
> +
> +       return count;
> +}
> +
> +static ssize_t powergate_delay_show(struct kobject *kobj,
> +       struct kobj_attribute *attr, char *buf)
> +{
> +       int ret;
> +       struct nvhost_device_power_attr *power_attribute =
> +               container_of(attr, struct nvhost_device_power_attr,
> +                       power_attr[NVHOST_POWER_SYSFS_ATTRIB_POWERGATE_DELAY]);
> +       struct platform_device *dev = power_attribute->ndev;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       mutex_lock(&pdata->lock);
> +       ret = sprintf(buf, "%d\n", pdata->powergate_delay);
> +       mutex_unlock(&pdata->lock);
> +
> +       return ret;
> +}
> +
> +static ssize_t clockgate_delay_store(struct kobject *kobj,
> +       struct kobj_attribute *attr, const char *buf, size_t count)
> +{
> +       int clockgate_delay = 0, ret = 0;
> +       struct nvhost_device_power_attr *power_attribute =
> +               container_of(attr, struct nvhost_device_power_attr,
> +                       power_attr[NVHOST_POWER_SYSFS_ATTRIB_CLOCKGATE_DELAY]);
> +       struct platform_device *dev = power_attribute->ndev;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       mutex_lock(&pdata->lock);
> +       ret = sscanf(buf, "%d", &clockgate_delay);
> +       if (ret == 1 && clockgate_delay >= 0)
> +               pdata->clockgate_delay = clockgate_delay;
> +       else
> +               dev_err(&dev->dev, "Invalid clockgate delay\n");
> +       mutex_unlock(&pdata->lock);
> +
> +       return count;
> +}
> +
> +static ssize_t clockgate_delay_show(struct kobject *kobj,
> +       struct kobj_attribute *attr, char *buf)
> +{
> +       int ret;
> +       struct nvhost_device_power_attr *power_attribute =
> +               container_of(attr, struct nvhost_device_power_attr,
> +                       power_attr[NVHOST_POWER_SYSFS_ATTRIB_CLOCKGATE_DELAY]);
> +       struct platform_device *dev = power_attribute->ndev;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       mutex_lock(&pdata->lock);
> +       ret = sprintf(buf, "%d\n", pdata->clockgate_delay);
> +       mutex_unlock(&pdata->lock);
> +
> +       return ret;
> +}
> +
> +int nvhost_module_init(struct platform_device *dev)
> +{
> +       int i = 0, err = 0;
> +       struct kobj_attribute *attr = NULL;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       /* initialize clocks to known state */
> +       while (pdata->clocks[i].name && i < NVHOST_MODULE_MAX_CLOCKS) {
> +               char devname[MAX_DEVID_LENGTH];
> +               long rate = pdata->clocks[i].default_rate;
> +               struct clk *c;
> +
> +               snprintf(devname, MAX_DEVID_LENGTH,
> +                               "tegra_%s", dev_name(&dev->dev));
> +               c = devm_clk_get(&dev->dev, pdata->clocks[i].name);
> +               if (IS_ERR_OR_NULL(c)) {
> +                       dev_err(&dev->dev, "Cannot get clock %s\n",
> +                                       pdata->clocks[i].name);
> +                       return -ENODEV;
> +               }
> +
> +               rate = clk_round_rate(c, rate);
> +               clk_prepare_enable(c);
> +               clk_set_rate(c, rate);
> +               clk_disable_unprepare(c);
> +               pdata->clk[i] = c;
> +               i++;
> +       }
> +       pdata->num_clks = i;
> +
> +       mutex_init(&pdata->lock);
> +       init_waitqueue_head(&pdata->idle_wq);
> +       INIT_DELAYED_WORK(&pdata->powerstate_down, powerstate_down_handler);
> +
> +       /* power gate units that we can power gate */
> +       if (pdata->can_powergate) {
> +               do_powergate_locked(pdata->powergate_ids[0]);
> +               do_powergate_locked(pdata->powergate_ids[1]);
> +               pdata->powerstate = NVHOST_POWER_STATE_POWERGATED;
> +       } else {
> +               do_unpowergate_locked(pdata->powergate_ids[0]);
> +               do_unpowergate_locked(pdata->powergate_ids[1]);
> +               pdata->powerstate = NVHOST_POWER_STATE_CLOCKGATED;
> +       }
> +
> +       /* Init the power sysfs attributes for this device */
> +       pdata->power_attrib = devm_kzalloc(&dev->dev,
> +                       sizeof(struct nvhost_device_power_attr),
> +               GFP_KERNEL);
> +       if (!pdata->power_attrib) {
> +               dev_err(&dev->dev, "Unable to allocate sysfs attributes\n");
> +               return -ENOMEM;
> +       }
> +       pdata->power_attrib->ndev = dev;
> +
> +       pdata->power_kobj = kobject_create_and_add("acm", &dev->dev.kobj);
> +       if (!pdata->power_kobj) {
> +               dev_err(&dev->dev, "Could not add dir 'power'\n");
> +               err = -EIO;
> +               goto fail_attrib_alloc;
> +       }
> +
> +       attr = &pdata->power_attrib->power_attr[NVHOST_POWER_SYSFS_ATTRIB_CLOCKGATE_DELAY];
> +       attr->attr.name = "clockgate_delay";
> +       attr->attr.mode = S_IWUSR | S_IRUGO;
> +       attr->show = clockgate_delay_show;
> +       attr->store = clockgate_delay_store;
> +       if (sysfs_create_file(pdata->power_kobj, &attr->attr)) {
> +               dev_err(&dev->dev, "Could not create sysfs attribute clockgate_delay\n");
> +               err = -EIO;
> +               goto fail_clockdelay;
> +       }
> +
> +       attr = &pdata->power_attrib->power_attr[NVHOST_POWER_SYSFS_ATTRIB_POWERGATE_DELAY];
> +       attr->attr.name = "powergate_delay";
> +       attr->attr.mode = S_IWUSR | S_IRUGO;
> +       attr->show = powergate_delay_show;
> +       attr->store = powergate_delay_store;
> +       if (sysfs_create_file(pdata->power_kobj, &attr->attr)) {
> +               dev_err(&dev->dev, "Could not create sysfs attribute powergate_delay\n");
> +               err = -EIO;
> +               goto fail_powergatedelay;
> +       }
> +
> +       attr = &pdata->power_attrib->power_attr[NVHOST_POWER_SYSFS_ATTRIB_REFCOUNT];
> +       attr->attr.name = "refcount";
> +       attr->attr.mode = S_IRUGO;
> +       attr->show = refcount_show;
> +       if (sysfs_create_file(pdata->power_kobj, &attr->attr)) {
> +               dev_err(&dev->dev, "Could not create sysfs attribute refcount\n");
> +               err = -EIO;
> +               goto fail_refcount;
> +       }
> +
> +       return 0;
> +
> +fail_refcount:
> +       attr = &pdata->power_attrib->power_attr[NVHOST_POWER_SYSFS_ATTRIB_POWERGATE_DELAY];
> +       sysfs_remove_file(pdata->power_kobj, &attr->attr);
> +
> +fail_powergatedelay:
> +       attr = &pdata->power_attrib->power_attr[NVHOST_POWER_SYSFS_ATTRIB_CLOCKGATE_DELAY];
> +       sysfs_remove_file(pdata->power_kobj, &attr->attr);
> +
> +fail_clockdelay:
> +       kobject_put(pdata->power_kobj);
> +
> +fail_attrib_alloc:
> +       kfree(pdata->power_attrib);
> +
> +       return err;
> +}
> +
> +static int is_module_idle(struct platform_device *dev)
> +{
> +       int count;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       mutex_lock(&pdata->lock);
> +       count = pdata->refcount;
> +       mutex_unlock(&pdata->lock);
> +
> +       return (count == 0);
> +}
> +
> +int nvhost_module_suspend(struct platform_device *dev)
> +{
> +       int ret;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       ret = wait_event_timeout(pdata->idle_wq, is_module_idle(dev),
> +                       ACM_SUSPEND_WAIT_FOR_IDLE_TIMEOUT);
> +       if (ret == 0) {
> +               dev_info(&dev->dev, "%s prevented suspend\n",
> +                               dev_name(&dev->dev));
> +               return -EBUSY;
> +       }
> +
> +       mutex_lock(&pdata->lock);
> +       cancel_delayed_work(&pdata->powerstate_down);
> +       to_state_powergated_locked(dev);
> +       mutex_unlock(&pdata->lock);
> +
> +       if (pdata->suspend_ndev)
> +               pdata->suspend_ndev(dev);
> +
> +       return 0;
> +}
> +
> +void nvhost_module_deinit(struct platform_device *dev)
> +{
> +       int i;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +
> +       if (pdata->deinit)
> +               pdata->deinit(dev);
> +
> +       nvhost_module_suspend(dev);
> +       for (i = 0; i < pdata->num_clks; i++)
> +               clk_put(pdata->clk[i]);
> +       pdata->powerstate = NVHOST_POWER_STATE_DEINIT;
> +}
> +
> +/* public host1x power management APIs */
> +bool nvhost_module_powered_ext(struct platform_device *dev)
> +{
> +       bool ret = 0;
> +
> +       /* get the parent */
> +       if (dev->dev.parent) {
> +               struct platform_device *pdev;
> +               pdev = to_platform_device(dev->dev.parent);
> +
> +               ret = nvhost_module_powered(pdev);
> +       } else {
> +               dev_warn(&dev->dev, "Cannot return power state, no parent\n");
> +       }
> +
> +       return ret;
> +}
> +

Is this intended not to be exported?

> +void nvhost_module_busy_ext(struct platform_device *dev)
> +{
> +       /* get the parent */
> +       if (dev->dev.parent) {
> +               struct platform_device *pdev;
> +               pdev = to_platform_device(dev->dev.parent);
> +
> +               nvhost_module_busy(pdev);
> +       } else {
> +               dev_warn(&dev->dev, "Cannot turn on, no parent\n");
> +       }
> +}
> +EXPORT_SYMBOL(nvhost_module_busy_ext);
> +
> +void nvhost_module_idle_ext(struct platform_device *dev)
> +{
> +       /* get the parent */
> +       if (dev->dev.parent) {
> +               struct platform_device *pdev;
> +               pdev = to_platform_device(dev->dev.parent);
> +
> +               nvhost_module_idle(pdev);
> +       } else {
> +               dev_warn(&dev->dev, "Cannot idle, no parent\n");
> +       }
> +}

Same as above.

> diff --git a/drivers/video/tegra/host/nvhost_acm.h b/drivers/video/tegra/host/nvhost_acm.h
> new file mode 100644
> index 0000000..65ab3f0
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_acm.h
> @@ -0,0 +1,49 @@
> +/*
> + * drivers/video/tegra/host/nvhost_acm.h
> + *
> + * Tegra Graphics Host Automatic Clock Management
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#ifndef __NVHOST_ACM_H
> +#define __NVHOST_ACM_H
> +
> +#include <linux/workqueue.h>
> +#include <linux/wait.h>
> +#include <linux/mutex.h>
> +#include <linux/clk.h>
> +#include <linux/nvhost.h>
> +
> +/* Sets clocks and powergating state for a module */
> +int nvhost_module_init(struct platform_device *ndev);
> +void nvhost_module_deinit(struct platform_device *dev);
> +int nvhost_module_suspend(struct platform_device *dev);
> +
> +void nvhost_module_busy(struct platform_device *dev);
> +void nvhost_module_idle_mult(struct platform_device *dev, int refs);
> +
> +static inline bool nvhost_module_powered(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +       return pdata->powerstate == NVHOST_POWER_STATE_RUNNING;
> +}
> +
> +static inline void nvhost_module_idle(struct platform_device *dev)
> +{
> +       nvhost_module_idle_mult(dev, 1);
> +}
> +
> +#endif
> diff --git a/drivers/video/tegra/host/nvhost_cdma.c b/drivers/video/tegra/host/nvhost_cdma.c
> new file mode 100644
> index 0000000..71f0343
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_cdma.c
> @@ -0,0 +1,473 @@
> +/*
> + * drivers/video/tegra/host/nvhost_cdma.c
> + *
> + * Tegra Graphics Host Command DMA
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include "nvhost_cdma.h"
> +#include "nvhost_channel.h"
> +#include "dev.h"
> +#include "debug.h"
> +#include "nvhost_memmgr.h"
> +#include "chip_support.h"
> +#include <asm/cacheflush.h>
> +
> +#include <linux/slab.h>
> +#include <linux/kfifo.h>
> +#include <trace/events/nvhost.h>
> +#include <linux/interrupt.h>
> +
> +/*
> + * TODO:
> + *   stats
> + *     - for figuring out what to optimize further
> + *   resizable push buffer
> + *     - some channels hardly need any, some channels (3d) could use more
> + */
> +
> +/**
> + * Add an entry to the sync queue.
> + */
> +static void add_to_sync_queue(struct nvhost_cdma *cdma,
> +                             struct nvhost_job *job,
> +                             u32 nr_slots,
> +                             u32 first_get)
> +{
> +       if (job->syncpt_id == NVSYNCPT_INVALID) {
> +               dev_warn(&job->ch->dev->dev, "%s: Invalid syncpt\n",
> +                               __func__);
> +               return;
> +       }
> +
> +       job->first_get = first_get;
> +       job->num_slots = nr_slots;
> +       nvhost_job_get(job);
> +       list_add_tail(&job->list, &cdma->sync_queue);
> +}
> +
> +/**
> + * Return the status of the cdma's sync queue or push buffer for the given event
> + *  - sq empty: returns 1 for empty, 0 for not empty (as in "1 empty queue" :-)
> + *  - pb space: returns the number of free slots in the channel's push buffer
> + * Must be called with the cdma lock held.
> + */
> +static unsigned int cdma_status_locked(struct nvhost_cdma *cdma,
> +               enum cdma_event event)
> +{
> +       switch (event) {
> +       case CDMA_EVENT_SYNC_QUEUE_EMPTY:
> +               return list_empty(&cdma->sync_queue) ? 1 : 0;
> +       case CDMA_EVENT_PUSH_BUFFER_SPACE: {
> +               struct push_buffer *pb = &cdma->push_buffer;
> +               return cdma_pb_op().space(pb);
> +       }
> +       default:
> +               return 0;
> +       }
> +}
> +
> +/**
> + * Sleep (if necessary) until the requested event happens
> + *   - CDMA_EVENT_SYNC_QUEUE_EMPTY : sync queue is completely empty.
> + *     - Returns 1
> + *   - CDMA_EVENT_PUSH_BUFFER_SPACE : there is space in the push buffer
> + *     - Return the amount of space (> 0)
> + * Must be called with the cdma lock held.
> + */
> +unsigned int nvhost_cdma_wait_locked(struct nvhost_cdma *cdma,
> +               enum cdma_event event)
> +{
> +       for (;;) {
> +               unsigned int space = cdma_status_locked(cdma, event);
> +               if (space)
> +                       return space;
> +
> +               trace_nvhost_wait_cdma(cdma_to_channel(cdma)->dev->name,
> +                               event);
> +
> +               /* If somebody has managed to already start waiting, yield */
> +               if (cdma->event != CDMA_EVENT_NONE) {
> +                       mutex_unlock(&cdma->lock);
> +                       schedule();
> +                       mutex_lock(&cdma->lock);
> +                       continue;
> +               }
> +               cdma->event = event;
> +
> +               mutex_unlock(&cdma->lock);
> +               down(&cdma->sem);
> +               mutex_lock(&cdma->lock);
> +       }
> +       return 0;
> +}
> +
> +/**
> + * Start timer for a buffer submition that has completed yet.
> + * Must be called with the cdma lock held.
> + */
> +static void cdma_start_timer_locked(struct nvhost_cdma *cdma,
> +               struct nvhost_job *job)
> +{
> +       if (cdma->timeout.clientid) {
> +               /* timer already started */
> +               return;
> +       }
> +
> +       cdma->timeout.clientid = job->clientid;
> +       cdma->timeout.syncpt_id = job->syncpt_id;
> +       cdma->timeout.syncpt_val = job->syncpt_end;
> +       cdma->timeout.start_ktime = ktime_get();
> +
> +       schedule_delayed_work(&cdma->timeout.wq,
> +                       msecs_to_jiffies(job->timeout));
> +}
> +
> +/**
> + * Stop timer when a buffer submition completes.
> + * Must be called with the cdma lock held.
> + */
> +static void stop_cdma_timer_locked(struct nvhost_cdma *cdma)
> +{
> +       cancel_delayed_work(&cdma->timeout.wq);
> +       cdma->timeout.clientid = 0;
> +}
> +
> +/**
> + * For all sync queue entries that have already finished according to the
> + * current sync point registers:
> + *  - unpin & unref their mems
> + *  - pop their push buffer slots
> + *  - remove them from the sync queue
> + * This is normally called from the host code's worker thread, but can be
> + * called manually if necessary.
> + * Must be called with the cdma lock held.
> + */
> +static void update_cdma_locked(struct nvhost_cdma *cdma)
> +{
> +       bool signal = false;
> +       struct nvhost_master *dev = cdma_to_dev(cdma);
> +       struct nvhost_syncpt *sp = &dev->syncpt;
> +       struct nvhost_job *job, *n;
> +
> +       /* If CDMA is stopped, queue is cleared and we can return */
> +       if (!cdma->running)
> +               return;
> +
> +       /*
> +        * Walk the sync queue, reading the sync point registers as necessary,
> +        * to consume as many sync queue entries as possible without blocking
> +        */
> +       list_for_each_entry_safe(job, n, &cdma->sync_queue, list) {
> +               /* Check whether this syncpt has completed, and bail if not */
> +               if (!nvhost_syncpt_is_expired(sp,
> +                               job->syncpt_id, job->syncpt_end)) {
> +                       /* Start timer on next pending syncpt */
> +                       if (job->timeout)
> +                               cdma_start_timer_locked(cdma, job);
> +                       break;
> +               }
> +
> +               /* Cancel timeout, when a buffer completes */
> +               if (cdma->timeout.clientid)
> +                       stop_cdma_timer_locked(cdma);
> +
> +               /* Unpin the memory */
> +               nvhost_job_unpin(job);
> +
> +               /* Pop push buffer slots */
> +               if (job->num_slots) {
> +                       struct push_buffer *pb = &cdma->push_buffer;
> +                       cdma_pb_op().pop_from(pb, job->num_slots);
> +                       if (cdma->event == CDMA_EVENT_PUSH_BUFFER_SPACE)
> +                               signal = true;
> +               }
> +
> +               list_del(&job->list);
> +               nvhost_job_put(job);
> +       }
> +
> +       if (list_empty(&cdma->sync_queue) &&
> +                               cdma->event == CDMA_EVENT_SYNC_QUEUE_EMPTY)
> +                       signal = true;
> +
> +       /* Wake up CdmaWait() if the requested event happened */
> +       if (signal) {
> +               cdma->event = CDMA_EVENT_NONE;
> +               up(&cdma->sem);
> +       }
> +}
> +
> +void nvhost_cdma_update_sync_queue(struct nvhost_cdma *cdma,
> +               struct nvhost_syncpt *syncpt, struct platform_device *dev)
> +{
> +       u32 get_restart;
> +       u32 syncpt_incrs;
> +       struct nvhost_job *job = NULL;
> +       u32 syncpt_val;
> +
> +       syncpt_val = nvhost_syncpt_update_min(syncpt, cdma->timeout.syncpt_id);
> +
> +       dev_dbg(&dev->dev,
> +               "%s: starting cleanup (thresh %d)\n",
> +               __func__, syncpt_val);
> +
> +       /*
> +        * Move the sync_queue read pointer to the first entry that hasn't
> +        * completed based on the current HW syncpt value. It's likely there
> +        * won't be any (i.e. we're still at the head), but covers the case
> +        * where a syncpt incr happens just prior/during the teardown.
> +        */
> +
> +       dev_dbg(&dev->dev,
> +               "%s: skip completed buffers still in sync_queue\n",
> +               __func__);
> +
> +       list_for_each_entry(job, &cdma->sync_queue, list) {
> +               if (syncpt_val < job->syncpt_end)
> +                       break;
> +
> +               nvhost_job_dump(&dev->dev, job);
> +       }
> +
> +       /*
> +        * Walk the sync_queue, first incrementing with the CPU syncpts that
> +        * are partially executed (the first buffer) or fully skipped while
> +        * still in the current context (slots are also NOP-ed).
> +        *
> +        * At the point contexts are interleaved, syncpt increments must be
> +        * done inline with the pushbuffer from a GATHER buffer to maintain
> +        * the order (slots are modified to be a GATHER of syncpt incrs).
> +        *
> +        * Note: save in get_restart the location where the timed out buffer
> +        * started in the PB, so we can start the refetch from there (with the
> +        * modified NOP-ed PB slots). This lets things appear to have completed
> +        * properly for this buffer and resources are freed.
> +        */
> +
> +       dev_dbg(&dev->dev,
> +               "%s: perform CPU incr on pending same ctx buffers\n",
> +               __func__);
> +
> +       get_restart = cdma->last_put;
> +       if (!list_empty(&cdma->sync_queue))
> +               get_restart = job->first_get;
> +
> +       /* do CPU increments as long as this context continues */
> +       list_for_each_entry_from(job, &cdma->sync_queue, list) {
> +               /* different context, gets us out of this loop */
> +               if (job->clientid != cdma->timeout.clientid)
> +                       break;
> +
> +               /* won't need a timeout when replayed */
> +               job->timeout = 0;
> +
> +               syncpt_incrs = job->syncpt_end - syncpt_val;
> +               dev_dbg(&dev->dev,
> +                       "%s: CPU incr (%d)\n", __func__, syncpt_incrs);
> +
> +               nvhost_job_dump(&dev->dev, job);
> +
> +               /* safe to use CPU to incr syncpts */
> +               cdma_op().timeout_cpu_incr(cdma,
> +                               job->first_get,
> +                               syncpt_incrs,
> +                               job->syncpt_end,
> +                               job->num_slots);
> +
> +               syncpt_val += syncpt_incrs;
> +       }
> +
> +       list_for_each_entry_from(job, &cdma->sync_queue, list)
> +               if (job->clientid == cdma->timeout.clientid)
> +                       job->timeout = 500;
> +
> +       dev_dbg(&dev->dev,
> +               "%s: finished sync_queue modification\n", __func__);
> +
> +       /* roll back DMAGET and start up channel again */
> +       cdma_op().timeout_teardown_end(cdma, get_restart);
> +}
> +
> +/**
> + * Create a cdma
> + */
> +int nvhost_cdma_init(struct nvhost_cdma *cdma)
> +{
> +       int err;
> +       struct push_buffer *pb = &cdma->push_buffer;
> +       mutex_init(&cdma->lock);
> +       sema_init(&cdma->sem, 0);
> +
> +       INIT_LIST_HEAD(&cdma->sync_queue);
> +
> +       cdma->event = CDMA_EVENT_NONE;
> +       cdma->running = false;
> +       cdma->torndown = false;
> +
> +       err = cdma_pb_op().init(pb);
> +       if (err)
> +               return err;
> +       return 0;
> +}
> +
> +/**
> + * Destroy a cdma
> + */
> +void nvhost_cdma_deinit(struct nvhost_cdma *cdma)
> +{
> +       struct push_buffer *pb = &cdma->push_buffer;
> +
> +       if (cdma->running) {
> +               pr_warn("%s: CDMA still running\n",
> +                               __func__);
> +       } else {
> +               cdma_pb_op().destroy(pb);
> +               cdma_op().timeout_destroy(cdma);
> +       }
> +}
> +
> +/**
> + * Begin a cdma submit
> + */
> +int nvhost_cdma_begin(struct nvhost_cdma *cdma, struct nvhost_job *job)
> +{
> +       mutex_lock(&cdma->lock);
> +
> +       if (job->timeout) {
> +               /* init state on first submit with timeout value */
> +               if (!cdma->timeout.initialized) {
> +                       int err;
> +                       err = cdma_op().timeout_init(cdma,
> +                               job->syncpt_id);
> +                       if (err) {
> +                               mutex_unlock(&cdma->lock);
> +                               return err;
> +                       }
> +               }
> +       }
> +       if (!cdma->running)
> +               cdma_op().start(cdma);
> +
> +       cdma->slots_free = 0;
> +       cdma->slots_used = 0;
> +       cdma->first_get = cdma_pb_op().putptr(&cdma->push_buffer);
> +       return 0;
> +}
> +
> +static void trace_write_gather(struct nvhost_cdma *cdma,
> +               struct mem_handle *ref,
> +               u32 offset, u32 words)
> +{
> +       void *mem = NULL;
> +
> +       if (nvhost_debug_trace_cmdbuf) {
> +               mem = mem_op().mmap(ref);
> +               if (IS_ERR_OR_NULL(mem))
> +                       mem = NULL;
> +       };
> +
> +       if (mem) {
> +               u32 i;
> +               /*
> +                * Write in batches of 128 as there seems to be a limit
> +                * of how much you can output to ftrace at once.
> +                */
> +               for (i = 0; i < words; i += TRACE_MAX_LENGTH) {
> +                       trace_nvhost_cdma_push_gather(
> +                               cdma_to_channel(cdma)->dev->name,
> +                               (u32)ref,
> +                               min(words - i, TRACE_MAX_LENGTH),
> +                               offset + i * sizeof(u32),
> +                               mem);
> +               }
> +               mem_op().munmap(ref, mem);
> +       }
> +}
> +
> +/**
> + * Push two words into a push buffer slot
> + * Blocks as necessary if the push buffer is full.
> + */
> +void nvhost_cdma_push(struct nvhost_cdma *cdma, u32 op1, u32 op2)
> +{
> +       if (nvhost_debug_trace_cmdbuf)
> +               trace_nvhost_cdma_push(cdma_to_channel(cdma)->dev->name,
> +                               op1, op2);
> +
> +       nvhost_cdma_push_gather(cdma, NULL, NULL, 0, op1, op2);
> +}
> +
> +/**
> + * Push two words into a push buffer slot
> + * Blocks as necessary if the push buffer is full.
> + */
> +void nvhost_cdma_push_gather(struct nvhost_cdma *cdma,
> +               struct mem_mgr *client, struct mem_handle *handle,
> +               u32 offset, u32 op1, u32 op2)
> +{
> +       u32 slots_free = cdma->slots_free;
> +       struct push_buffer *pb = &cdma->push_buffer;
> +
> +       if (handle)
> +               trace_write_gather(cdma, handle, offset, op1 & 0xffff);
> +
> +       if (slots_free == 0) {
> +               cdma_op().kick(cdma);
> +               slots_free = nvhost_cdma_wait_locked(cdma,
> +                               CDMA_EVENT_PUSH_BUFFER_SPACE);
> +       }
> +       cdma->slots_free = slots_free - 1;
> +       cdma->slots_used++;
> +       cdma_pb_op().push_to(pb, client, handle, op1, op2);
> +}
> +
> +/**
> + * End a cdma submit
> + * Kick off DMA, add job to the sync queue, and a number of slots to be freed
> + * from the pushbuffer. The handles for a submit must all be pinned at the same
> + * time, but they can be unpinned in smaller chunks.
> + */
> +void nvhost_cdma_end(struct nvhost_cdma *cdma,
> +               struct nvhost_job *job)
> +{
> +       bool was_idle = list_empty(&cdma->sync_queue);
> +
> +       cdma_op().kick(cdma);
> +
> +       add_to_sync_queue(cdma,
> +                       job,
> +                       cdma->slots_used,
> +                       cdma->first_get);
> +
> +       /* start timer on idle -> active transitions */
> +       if (job->timeout && was_idle)
> +               cdma_start_timer_locked(cdma, job);
> +
> +       trace_nvhost_cdma_end(job->ch->dev->name);
> +
> +       mutex_unlock(&cdma->lock);
> +}
> +
> +/**
> + * Update cdma state according to current sync point values
> + */
> +void nvhost_cdma_update(struct nvhost_cdma *cdma)
> +{
> +       mutex_lock(&cdma->lock);
> +       update_cdma_locked(cdma);
> +       mutex_unlock(&cdma->lock);
> +}
> diff --git a/drivers/video/tegra/host/nvhost_cdma.h b/drivers/video/tegra/host/nvhost_cdma.h
> new file mode 100644
> index 0000000..2179f29
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_cdma.h
> @@ -0,0 +1,116 @@
> +/*
> + * drivers/video/tegra/host/nvhost_cdma.h
> + *
> + * Tegra Graphics Host Command DMA
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#ifndef __NVHOST_CDMA_H
> +#define __NVHOST_CDMA_H
> +
> +#include <linux/sched.h>
> +#include <linux/semaphore.h>
> +
> +#include <linux/nvhost.h>
> +#include <linux/list.h>
> +
> +struct nvhost_syncpt;
> +struct nvhost_userctx_timeout;
> +struct nvhost_job;
> +struct mem_mgr;
> +struct mem_handle;
> +
> +/*
> + * cdma
> + *
> + * This is in charge of a host command DMA channel.
> + * Sends ops to a push buffer, and takes responsibility for unpinning
> + * (& possibly freeing) of memory after those ops have completed.
> + * Producer:
> + *     begin
> + *             push - send ops to the push buffer
> + *     end - start command DMA and enqueue handles to be unpinned
> + * Consumer:
> + *     update - call to update sync queue and push buffer, unpin memory
> + */
> +
> +struct mem_mgr_handle {
> +       struct mem_mgr *client;
> +       struct mem_handle *handle;
> +};
> +
> +struct push_buffer {
> +       u32 *mapped;                    /* mapped pushbuffer memory */
> +       dma_addr_t phys;                /* physical address of pushbuffer */
> +       u32 fence;                      /* index we've written */
> +       u32 cur;                        /* index to write to */
> +       struct mem_mgr_handle *client_handle; /* handle for each opcode pair */
> +};
> +
> +struct buffer_timeout {
> +       struct delayed_work wq;         /* work queue */
> +       bool initialized;               /* timer one-time setup flag */
> +       u32 syncpt_id;                  /* buffer completion syncpt id */
> +       u32 syncpt_val;                 /* syncpt value when completed */
> +       ktime_t start_ktime;            /* starting time */
> +       /* context timeout information */
> +       int clientid;
> +};
> +
> +enum cdma_event {
> +       CDMA_EVENT_NONE,                /* not waiting for any event */
> +       CDMA_EVENT_SYNC_QUEUE_EMPTY,    /* wait for empty sync queue */
> +       CDMA_EVENT_PUSH_BUFFER_SPACE    /* wait for space in push buffer */
> +};
> +
> +struct nvhost_cdma {
> +       struct mutex lock;              /* controls access to shared state */
> +       struct semaphore sem;           /* signalled when event occurs */
> +       enum cdma_event event;          /* event that sem is waiting for */
> +       unsigned int slots_used;        /* pb slots used in current submit */
> +       unsigned int slots_free;        /* pb slots free in current submit */
> +       unsigned int first_get;         /* DMAGET value, where submit begins */
> +       unsigned int last_put;          /* last value written to DMAPUT */
> +       struct push_buffer push_buffer; /* channel's push buffer */
> +       struct list_head sync_queue;    /* job queue */
> +       struct buffer_timeout timeout;  /* channel's timeout state/wq */
> +       bool running;
> +       bool torndown;
> +};
> +
> +#define cdma_to_channel(cdma) container_of(cdma, struct nvhost_channel, cdma)
> +#define cdma_to_dev(cdma) nvhost_get_host(cdma_to_channel(cdma)->dev)
> +#define cdma_to_memmgr(cdma) ((cdma_to_dev(cdma))->memmgr)
> +#define pb_to_cdma(pb) container_of(pb, struct nvhost_cdma, push_buffer)
> +
> +int    nvhost_cdma_init(struct nvhost_cdma *cdma);
> +void   nvhost_cdma_deinit(struct nvhost_cdma *cdma);
> +void   nvhost_cdma_stop(struct nvhost_cdma *cdma);
> +int    nvhost_cdma_begin(struct nvhost_cdma *cdma, struct nvhost_job *job);
> +void   nvhost_cdma_push(struct nvhost_cdma *cdma, u32 op1, u32 op2);
> +void   nvhost_cdma_push_gather(struct nvhost_cdma *cdma,
> +               struct mem_mgr *client,
> +               struct mem_handle *handle, u32 offset, u32 op1, u32 op2);
> +void   nvhost_cdma_end(struct nvhost_cdma *cdma,
> +               struct nvhost_job *job);
> +void   nvhost_cdma_update(struct nvhost_cdma *cdma);
> +void   nvhost_cdma_peek(struct nvhost_cdma *cdma,
> +               u32 dmaget, int slot, u32 *out);
> +unsigned int nvhost_cdma_wait_locked(struct nvhost_cdma *cdma,
> +               enum cdma_event event);
> +void nvhost_cdma_update_sync_queue(struct nvhost_cdma *cdma,
> +               struct nvhost_syncpt *syncpt, struct platform_device *dev);
> +#endif
> diff --git a/drivers/video/tegra/host/nvhost_channel.c b/drivers/video/tegra/host/nvhost_channel.c
> new file mode 100644
> index 0000000..f95d8f2
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_channel.c
> @@ -0,0 +1,129 @@
> +/*
> + * drivers/video/tegra/host/nvhost_channel.c
> + *
> + * Tegra Graphics Host Channel
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include "nvhost_channel.h"
> +#include "dev.h"
> +#include "nvhost_acm.h"
> +#include "chip_support.h"
> +
> +#include <trace/events/nvhost.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +
> +#define NVHOST_CHANNEL_LOW_PRIO_MAX_WAIT 50
> +
> +int nvhost_channel_init(struct nvhost_channel *ch,
> +               struct nvhost_master *dev, int index)
> +{
> +       int err;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(ch->dev);
> +
> +       /* Link platform_device to nvhost_channel */
> +       err = channel_op().init(ch, dev, index);
> +       if (err < 0) {
> +               dev_err(&dev->dev->dev, "failed to init channel %d\n",
> +                               index);
> +               return err;
> +       }
> +       pdata->channel = ch;
> +
> +       return 0;
> +}
> +
> +int nvhost_channel_submit(struct nvhost_job *job)
> +{
> +       return channel_op().submit(job);
> +}
> +EXPORT_SYMBOL(nvhost_channel_submit);
> +
> +struct nvhost_channel *nvhost_getchannel(struct nvhost_channel *ch)
> +{
> +       int err = 0;
> +       struct nvhost_device_data *pdata = platform_get_drvdata(ch->dev);
> +
> +       mutex_lock(&ch->reflock);
> +       if (ch->refcount == 0) {
> +               if (pdata->init)
> +                       pdata->init(ch->dev);
> +               err = nvhost_cdma_init(&ch->cdma);
> +       }
> +       if (!err)
> +               ch->refcount++;
> +
> +       mutex_unlock(&ch->reflock);
> +
> +       return err ? NULL : ch;
> +}
> +EXPORT_SYMBOL(nvhost_getchannel);
> +
> +void nvhost_putchannel(struct nvhost_channel *ch)
> +{
> +       mutex_lock(&ch->reflock);
> +       if (ch->refcount == 1) {
> +               channel_cdma_op().stop(&ch->cdma);
> +               nvhost_cdma_deinit(&ch->cdma);
> +               nvhost_module_suspend(ch->dev);
> +       }
> +       ch->refcount--;
> +       mutex_unlock(&ch->reflock);
> +}
> +EXPORT_SYMBOL(nvhost_putchannel);
> +
> +int nvhost_channel_suspend(struct nvhost_channel *ch)
> +{
> +       int ret = 0;
> +
> +       mutex_lock(&ch->reflock);
> +
> +       if (ch->refcount) {
> +               ret = nvhost_module_suspend(ch->dev);
> +               if (!ret)
> +                       channel_cdma_op().stop(&ch->cdma);
> +       }
> +       mutex_unlock(&ch->reflock);
> +
> +       return ret;
> +}
> +
> +struct nvhost_channel *nvhost_alloc_channel_internal(int chindex,
> +       int max_channels, int *current_channel_count)
> +{
> +       struct nvhost_channel *ch = NULL;
> +
> +       if (chindex > max_channels ||
> +            (*current_channel_count + 1) > max_channels)
> +               return NULL;
> +       else {

Nit: redundant else.

> +               ch = kzalloc(sizeof(*ch), GFP_KERNEL);
> +               if (ch == NULL)
> +                       return NULL;
> +               else {

Nit: same as above.

> +                       (*current_channel_count)++;
> +                       return ch;
> +               }
> +       }
> +}
> +
> +void nvhost_free_channel_internal(struct nvhost_channel *ch,
> +       int *current_channel_count)
> +{
> +       kfree(ch);
> +       (*current_channel_count)--;
> +}
> diff --git a/drivers/video/tegra/host/nvhost_channel.h b/drivers/video/tegra/host/nvhost_channel.h
> new file mode 100644
> index 0000000..65854b4
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_channel.h
> @@ -0,0 +1,65 @@
> +/*
> + * drivers/video/tegra/host/nvhost_channel.h
> + *
> + * Tegra Graphics Host Channel
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#ifndef __NVHOST_CHANNEL_H
> +#define __NVHOST_CHANNEL_H
> +
> +#include <linux/cdev.h>
> +#include <linux/io.h>
> +#include "nvhost_cdma.h"
> +
> +#define NVHOST_MAX_WAIT_CHECKS         256
> +#define NVHOST_MAX_GATHERS             512
> +#define NVHOST_MAX_HANDLES             1280
> +#define NVHOST_MAX_POWERGATE_IDS       2
> +
> +struct nvhost_master;
> +struct platform_device;
> +struct nvhost_channel;
> +
> +struct nvhost_channel {
> +       int refcount;
> +       int chid;
> +       u32 syncpt_id;
> +       struct mutex reflock;
> +       struct mutex submitlock;
> +       void __iomem *aperture;
> +       struct device *node;
> +       struct platform_device *dev;
> +       struct cdev cdev;
> +       struct nvhost_cdma cdma;
> +};
> +
> +int nvhost_channel_init(struct nvhost_channel *ch,
> +       struct nvhost_master *dev, int index);
> +
> +struct nvhost_channel *nvhost_getchannel(struct nvhost_channel *ch);
> +void nvhost_putchannel(struct nvhost_channel *ch);
> +int nvhost_channel_suspend(struct nvhost_channel *ch);
> +
> +struct nvhost_channel *nvhost_alloc_channel_internal(int chindex,
> +       int max_channels, int *current_channel_count);
> +
> +void nvhost_free_channel_internal(struct nvhost_channel *ch,
> +       int *current_channel_count);
> +
> +int nvhost_channel_save_context(struct nvhost_channel *ch);
> +
> +#endif
> diff --git a/drivers/video/tegra/host/nvhost_intr.c b/drivers/video/tegra/host/nvhost_intr.c
> new file mode 100644
> index 0000000..9a0fa3e
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_intr.c
> @@ -0,0 +1,391 @@
> +/*
> + * drivers/video/tegra/host/nvhost_intr.c
> + *
> + * Tegra Graphics Host Interrupt Management
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include "nvhost_intr.h"
> +#include "dev.h"
> +#include "nvhost_acm.h"
> +#include <linux/interrupt.h>
> +#include <linux/slab.h>
> +#include <linux/irq.h>
> +#include <trace/events/nvhost.h>
> +#include "nvhost_channel.h"
> +#include "chip_support.h"
> +
> +/*** Wait list management ***/
> +
> +struct nvhost_waitlist {
> +       struct list_head list;
> +       struct kref refcount;
> +       u32 thresh;
> +       enum nvhost_intr_action action;
> +       atomic_t state;
> +       void *data;
> +       int count;
> +};
> +
> +enum waitlist_state {
> +       WLS_PENDING,
> +       WLS_REMOVED,
> +       WLS_CANCELLED,
> +       WLS_HANDLED
> +};
> +
> +static void waiter_release(struct kref *kref)
> +{
> +       kfree(container_of(kref, struct nvhost_waitlist, refcount));
> +}
> +
> +/**
> + * add a waiter to a waiter queue, sorted by threshold
> + * returns true if it was added at the head of the queue
> + */
> +static bool add_waiter_to_queue(struct nvhost_waitlist *waiter,
> +                               struct list_head *queue)
> +{
> +       struct nvhost_waitlist *pos;
> +       u32 thresh = waiter->thresh;
> +
> +       list_for_each_entry_reverse(pos, queue, list)
> +               if ((s32)(pos->thresh - thresh) <= 0) {
> +                       list_add(&waiter->list, &pos->list);
> +                       return false;
> +               }
> +
> +       list_add(&waiter->list, queue);
> +       return true;
> +}
> +
> +/**
> + * run through a waiter queue for a single sync point ID
> + * and gather all completed waiters into lists by actions
> + */
> +static void remove_completed_waiters(struct list_head *head, u32 sync,
> +                       struct list_head completed[NVHOST_INTR_ACTION_COUNT])
> +{
> +       struct list_head *dest;
> +       struct nvhost_waitlist *waiter, *next, *prev;
> +
> +       list_for_each_entry_safe(waiter, next, head, list) {
> +               if ((s32)(waiter->thresh - sync) > 0)
> +                       break;
> +
> +               dest = completed + waiter->action;
> +
> +               /* consolidate submit cleanups */
> +               if (waiter->action == NVHOST_INTR_ACTION_SUBMIT_COMPLETE
> +                       && !list_empty(dest)) {
> +                       prev = list_entry(dest->prev,
> +                                       struct nvhost_waitlist, list);
> +                       if (prev->data == waiter->data) {
> +                               prev->count++;
> +                               dest = NULL;
> +                       }
> +               }
> +
> +               /* PENDING->REMOVED or CANCELLED->HANDLED */
> +               if (atomic_inc_return(&waiter->state) == WLS_HANDLED || !dest) {
> +                       list_del(&waiter->list);
> +                       kref_put(&waiter->refcount, waiter_release);
> +               } else {
> +                       list_move_tail(&waiter->list, dest);
> +               }
> +       }
> +}
> +
> +void reset_threshold_interrupt(struct nvhost_intr *intr,
> +                              struct list_head *head,
> +                              unsigned int id)
> +{
> +       u32 thresh = list_first_entry(head,
> +                               struct nvhost_waitlist, list)->thresh;
> +
> +       intr_op().set_syncpt_threshold(intr, id, thresh);
> +       intr_op().enable_syncpt_intr(intr, id);
> +}
> +
> +
> +static void action_submit_complete(struct nvhost_waitlist *waiter)
> +{
> +       struct nvhost_channel *channel = waiter->data;
> +       int nr_completed = waiter->count;
> +
> +       nvhost_cdma_update(&channel->cdma);
> +       nvhost_module_idle_mult(channel->dev, nr_completed);
> +
> +       /*  Add nr_completed to trace */
> +       trace_nvhost_channel_submit_complete(channel->dev->name,
> +                       nr_completed, waiter->thresh);
> +
> +}
> +
> +static void action_wakeup(struct nvhost_waitlist *waiter)
> +{
> +       wait_queue_head_t *wq = waiter->data;
> +
> +       wake_up(wq);
> +}
> +
> +static void action_wakeup_interruptible(struct nvhost_waitlist *waiter)
> +{
> +       wait_queue_head_t *wq = waiter->data;
> +
> +       wake_up_interruptible(wq);
> +}
> +
> +typedef void (*action_handler)(struct nvhost_waitlist *waiter);
> +
> +static action_handler action_handlers[NVHOST_INTR_ACTION_COUNT] = {
> +       action_submit_complete,
> +       action_wakeup,
> +       action_wakeup_interruptible,
> +};
> +
> +static void run_handlers(struct list_head completed[NVHOST_INTR_ACTION_COUNT])
> +{
> +       struct list_head *head = completed;
> +       int i;
> +
> +       for (i = 0; i < NVHOST_INTR_ACTION_COUNT; ++i, ++head) {
> +               action_handler handler = action_handlers[i];
> +               struct nvhost_waitlist *waiter, *next;
> +
> +               list_for_each_entry_safe(waiter, next, head, list) {
> +                       list_del(&waiter->list);
> +                       handler(waiter);
> +                       WARN_ON(atomic_xchg(&waiter->state, WLS_HANDLED)
> +                                       != WLS_REMOVED);
> +                       kref_put(&waiter->refcount, waiter_release);
> +               }
> +       }
> +}
> +
> +/**
> + * Remove & handle all waiters that have completed for the given syncpt
> + */
> +static int process_wait_list(struct nvhost_intr *intr,
> +                            struct nvhost_intr_syncpt *syncpt,
> +                            u32 threshold)
> +{
> +       struct list_head completed[NVHOST_INTR_ACTION_COUNT];
> +       unsigned int i;
> +       int empty;
> +
> +       for (i = 0; i < NVHOST_INTR_ACTION_COUNT; ++i)
> +               INIT_LIST_HEAD(completed + i);
> +
> +       spin_lock(&syncpt->lock);
> +
> +       remove_completed_waiters(&syncpt->wait_head, threshold, completed);
> +
> +       empty = list_empty(&syncpt->wait_head);
> +       if (empty)
> +               intr_op().disable_syncpt_intr(intr, syncpt->id);
> +       else
> +               reset_threshold_interrupt(intr, &syncpt->wait_head,
> +                                         syncpt->id);
> +
> +       spin_unlock(&syncpt->lock);
> +
> +       run_handlers(completed);
> +
> +       return empty;
> +}
> +
> +/*** host syncpt interrupt service functions ***/
> +/**
> + * Sync point threshold interrupt service thread function
> + * Handles sync point threshold triggers, in thread context
> + */
> +irqreturn_t nvhost_syncpt_thresh_fn(int irq, void *dev_id)
> +{
> +       struct nvhost_intr_syncpt *syncpt = dev_id;
> +       unsigned int id = syncpt->id;
> +       struct nvhost_intr *intr = intr_syncpt_to_intr(syncpt);
> +       struct nvhost_master *dev = intr_to_dev(intr);
> +
> +       (void)process_wait_list(intr, syncpt,
> +                               nvhost_syncpt_update_min(&dev->syncpt, id));
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/*** host general interrupt service functions ***/
> +
> +
> +/*** Main API ***/
> +
> +int nvhost_intr_add_action(struct nvhost_intr *intr, u32 id, u32 thresh,
> +                       enum nvhost_intr_action action, void *data,
> +                       void *_waiter,
> +                       void **ref)
> +{
> +       struct nvhost_waitlist *waiter = _waiter;
> +       struct nvhost_intr_syncpt *syncpt;
> +       int queue_was_empty;
> +
> +       if (waiter == NULL) {
> +               pr_warn("%s: NULL waiter\n", __func__);
> +               return -EINVAL;
> +       }
> +
> +       /* initialize a new waiter */
> +       INIT_LIST_HEAD(&waiter->list);
> +       kref_init(&waiter->refcount);
> +       if (ref)
> +               kref_get(&waiter->refcount);
> +       waiter->thresh = thresh;
> +       waiter->action = action;
> +       atomic_set(&waiter->state, WLS_PENDING);
> +       waiter->data = data;
> +       waiter->count = 1;
> +
> +       syncpt = intr->syncpt + id;
> +
> +       spin_lock(&syncpt->lock);
> +
> +       queue_was_empty = list_empty(&syncpt->wait_head);
> +
> +       if (add_waiter_to_queue(waiter, &syncpt->wait_head)) {
> +               /* added at head of list - new threshold value */
> +               intr_op().set_syncpt_threshold(intr, id, thresh);
> +
> +               /* added as first waiter - enable interrupt */
> +               if (queue_was_empty)
> +                       intr_op().enable_syncpt_intr(intr, id);
> +       }
> +
> +       spin_unlock(&syncpt->lock);
> +
> +       if (ref)
> +               *ref = waiter;
> +       return 0;
> +}
> +
> +void *nvhost_intr_alloc_waiter()
> +{
> +       return kzalloc(sizeof(struct nvhost_waitlist),
> +                       GFP_KERNEL|__GFP_REPEAT);
> +}
> +
> +void nvhost_intr_put_ref(struct nvhost_intr *intr, u32 id, void *ref)
> +{
> +       struct nvhost_waitlist *waiter = ref;
> +       struct nvhost_intr_syncpt *syncpt;
> +       struct nvhost_master *host = intr_to_dev(intr);
> +
> +       while (atomic_cmpxchg(&waiter->state,
> +                               WLS_PENDING, WLS_CANCELLED) == WLS_REMOVED)
> +               schedule();
> +
> +       syncpt = intr->syncpt + id;
> +       (void)process_wait_list(intr, syncpt,
> +                               nvhost_syncpt_update_min(&host->syncpt, id));
> +
> +       kref_put(&waiter->refcount, waiter_release);
> +}
> +
> +
> +/*** Init & shutdown ***/
> +
> +int nvhost_intr_init(struct nvhost_intr *intr, u32 irq_gen, u32 irq_sync)
> +{
> +       unsigned int id;
> +       struct nvhost_intr_syncpt *syncpt;
> +       struct nvhost_master *host = intr_to_dev(intr);
> +       u32 nb_pts = nvhost_syncpt_nb_pts(&host->syncpt);
> +
> +       mutex_init(&intr->mutex);
> +       intr->host_syncpt_irq_base = irq_sync;
> +       intr->wq = create_workqueue("host_syncpt");
> +       intr_op().init_host_sync(intr);
> +       intr->host_general_irq = irq_gen;
> +       intr_op().request_host_general_irq(intr);
> +
> +       for (id = 0, syncpt = intr->syncpt;
> +            id < nb_pts;
> +            ++id, ++syncpt) {
> +               syncpt->intr = &host->intr;
> +               syncpt->id = id;
> +               syncpt->irq = irq_sync + id;
> +               spin_lock_init(&syncpt->lock);
> +               INIT_LIST_HEAD(&syncpt->wait_head);
> +               snprintf(syncpt->thresh_irq_name,
> +                       sizeof(syncpt->thresh_irq_name),
> +                       "host_sp_%02d", id);
> +       }
> +
> +       return 0;
> +}
> +
> +void nvhost_intr_deinit(struct nvhost_intr *intr)
> +{
> +       nvhost_intr_stop(intr);
> +       destroy_workqueue(intr->wq);
> +}
> +
> +void nvhost_intr_start(struct nvhost_intr *intr, u32 hz)
> +{
> +       mutex_lock(&intr->mutex);
> +
> +       intr_op().init_host_sync(intr);
> +       intr_op().set_host_clocks_per_usec(intr,
> +                                              (hz + 1000000 - 1)/1000000);
> +
> +       intr_op().request_host_general_irq(intr);
> +
> +       mutex_unlock(&intr->mutex);
> +}
> +
> +void nvhost_intr_stop(struct nvhost_intr *intr)
> +{
> +       unsigned int id;
> +       struct nvhost_intr_syncpt *syncpt;
> +       u32 nb_pts = nvhost_syncpt_nb_pts(&intr_to_dev(intr)->syncpt);
> +
> +       mutex_lock(&intr->mutex);
> +
> +       intr_op().disable_all_syncpt_intrs(intr);
> +
> +       for (id = 0, syncpt = intr->syncpt;
> +            id < nb_pts;
> +            ++id, ++syncpt) {
> +               struct nvhost_waitlist *waiter, *next;
> +               list_for_each_entry_safe(waiter, next,
> +                               &syncpt->wait_head, list) {
> +                       if (atomic_cmpxchg(&waiter->state,
> +                                               WLS_CANCELLED, WLS_HANDLED)
> +                               == WLS_CANCELLED) {
> +                               list_del(&waiter->list);
> +                               kref_put(&waiter->refcount, waiter_release);
> +                       }
> +               }
> +
> +               if (!list_empty(&syncpt->wait_head)) {  /* output diagnostics */
> +                       pr_warn("%s cannot stop syncpt intr id=%d\n",
> +                                       __func__, id);
> +                       return;
> +               }
> +       }
> +
> +       intr_op().free_host_general_irq(intr);
> +       intr_op().free_syncpt_irq(intr);
> +
> +       mutex_unlock(&intr->mutex);
> +}
> diff --git a/drivers/video/tegra/host/nvhost_intr.h b/drivers/video/tegra/host/nvhost_intr.h
> new file mode 100644
> index 0000000..7554864
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_intr.h
> @@ -0,0 +1,110 @@
> +/*
> + * drivers/video/tegra/host/nvhost_intr.h
> + *
> + * Tegra Graphics Host Interrupt Management
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#ifndef __NVHOST_INTR_H
> +#define __NVHOST_INTR_H
> +
> +#include <linux/kthread.h>
> +#include <linux/semaphore.h>
> +#include <linux/interrupt.h>
> +#include <linux/workqueue.h>
> +
> +struct nvhost_channel;
> +
> +enum nvhost_intr_action {
> +       /**
> +        * Perform cleanup after a submit has completed.
> +        * 'data' points to a channel
> +        */
> +       NVHOST_INTR_ACTION_SUBMIT_COMPLETE = 0,
> +
> +       /**
> +        * Wake up a  task.
> +        * 'data' points to a wait_queue_head_t
> +        */
> +       NVHOST_INTR_ACTION_WAKEUP,
> +
> +       /**
> +        * Wake up a interruptible task.
> +        * 'data' points to a wait_queue_head_t
> +        */
> +       NVHOST_INTR_ACTION_WAKEUP_INTERRUPTIBLE,
> +
> +       NVHOST_INTR_ACTION_COUNT
> +};
> +
> +struct nvhost_intr;
> +
> +struct nvhost_intr_syncpt {
> +       struct nvhost_intr *intr;
> +       u8 id;
> +       u16 irq;
> +       spinlock_t lock;
> +       struct list_head wait_head;
> +       char thresh_irq_name[12];
> +       struct work_struct work;
> +};
> +
> +struct nvhost_intr {
> +       struct nvhost_intr_syncpt *syncpt;
> +       struct mutex mutex;
> +       int host_general_irq;
> +       int host_syncpt_irq_base;
> +       struct workqueue_struct *wq;
> +};
> +#define intr_to_dev(x) container_of(x, struct nvhost_master, intr)
> +#define intr_syncpt_to_intr(is) (is->intr)
> +
> +/**
> + * Schedule an action to be taken when a sync point reaches the given threshold.
> + *
> + * @id the sync point
> + * @thresh the threshold
> + * @action the action to take
> + * @data a pointer to extra data depending on action, see above
> + * @waiter waiter allocated with nvhost_intr_alloc_waiter - assumes ownership
> + * @ref must be passed if cancellation is possible, else NULL
> + *
> + * This is a non-blocking api.
> + */
> +int nvhost_intr_add_action(struct nvhost_intr *intr, u32 id, u32 thresh,
> +                       enum nvhost_intr_action action, void *data,
> +                       void *waiter,
> +                       void **ref);
> +
> +/**
> + * Allocate a waiter.
> + */
> +void *nvhost_intr_alloc_waiter(void);
> +
> +/**
> + * Unreference an action submitted to nvhost_intr_add_action().
> + * You must call this if you passed non-NULL as ref.
> + * @ref the ref returned from nvhost_intr_add_action()
> + */
> +void nvhost_intr_put_ref(struct nvhost_intr *intr, u32 id, void *ref);
> +
> +int nvhost_intr_init(struct nvhost_intr *intr, u32 irq_gen, u32 irq_sync);
> +void nvhost_intr_deinit(struct nvhost_intr *intr);
> +void nvhost_intr_start(struct nvhost_intr *intr, u32 hz);
> +void nvhost_intr_stop(struct nvhost_intr *intr);
> +
> +irqreturn_t nvhost_syncpt_thresh_fn(int irq, void *dev_id);
> +#endif
> diff --git a/drivers/video/tegra/host/nvhost_job.c b/drivers/video/tegra/host/nvhost_job.c
> new file mode 100644
> index 0000000..ebb071d
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_job.c
> @@ -0,0 +1,398 @@
> +/*
> + * drivers/video/tegra/host/nvhost_job.c
> + *
> + * Tegra Graphics Host Job
> + *
> + * Copyright (c) 2010-2012, NVIDIA Corporation.
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
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/kref.h>
> +#include <linux/err.h>
> +#include <linux/vmalloc.h>
> +#include <linux/scatterlist.h>
> +#include <linux/nvhost.h>
> +#include <trace/events/nvhost.h>
> +#include "nvhost_channel.h"
> +#include "nvhost_syncpt.h"
> +#include "dev.h"
> +#include "nvhost_memmgr.h"
> +#include "chip_support.h"
> +
> +/* Magic to use to fill freed handle slots */
> +#define BAD_MAGIC 0xdeadbeef
> +
> +static size_t job_size(u32 num_cmdbufs, u32 num_relocs, u32 num_waitchks)
> +{
> +       u32 num_unpins = num_cmdbufs + num_relocs;
> +       s64 total;
> +
> +       if (num_relocs < 0 || num_waitchks < 0 || num_cmdbufs < 0)
> +               return 0;
> +
> +       total = sizeof(struct nvhost_job)
> +                       + num_relocs * sizeof(struct nvhost_reloc)
> +                       + num_unpins * sizeof(struct nvhost_job_unpin_data)
> +                       + num_waitchks * sizeof(struct nvhost_waitchk)
> +                       + num_cmdbufs * sizeof(struct nvhost_job_gather);
> +
> +       if (total > ULONG_MAX)
> +               return 0;
> +       return (size_t)total;
> +}
> +
> +
> +static void init_fields(struct nvhost_job *job,
> +               u32 num_cmdbufs, u32 num_relocs, u32 num_waitchks)
> +{
> +       u32 num_unpins = num_cmdbufs + num_relocs;
> +       void *mem = job;
> +
> +       /* First init state to zero */
> +
> +       /*
> +        * Redistribute memory to the structs.
> +        * Overflows and negative conditions have
> +        * already been checked in job_alloc().
> +        */
> +       mem += sizeof(struct nvhost_job);
> +       job->relocarray = num_relocs ? mem : NULL;
> +       mem += num_relocs * sizeof(struct nvhost_reloc);
> +       job->unpins = num_unpins ? mem : NULL;
> +       mem += num_unpins * sizeof(struct nvhost_job_unpin_data);
> +       job->waitchk = num_waitchks ? mem : NULL;
> +       mem += num_waitchks * sizeof(struct nvhost_waitchk);
> +       job->gathers = num_cmdbufs ? mem : NULL;
> +       mem += num_cmdbufs * sizeof(struct nvhost_job_gather);
> +       job->addr_phys = (num_cmdbufs || num_relocs) ? mem : NULL;
> +
> +       job->reloc_addr_phys = job->addr_phys;
> +       job->gather_addr_phys = &job->addr_phys[num_relocs];
> +}
> +
> +struct nvhost_job *nvhost_job_alloc(struct nvhost_channel *ch,
> +               int num_cmdbufs, int num_relocs, int num_waitchks,
> +               struct mem_mgr *memmgr)
> +{
> +       struct nvhost_job *job = NULL;
> +       size_t size = job_size(num_cmdbufs, num_relocs, num_waitchks);
> +
> +       if (!size)
> +               return NULL;
> +       job = vzalloc(size);
> +       if (!job)
> +               return NULL;
> +
> +       kref_init(&job->ref);
> +       job->ch = ch;
> +       job->memmgr = memmgr ? mem_op().get_mgr(memmgr) : NULL;
> +
> +       init_fields(job, num_cmdbufs, num_relocs, num_waitchks);
> +
> +       return job;
> +}
> +EXPORT_SYMBOL(nvhost_job_alloc);
> +
> +void nvhost_job_get(struct nvhost_job *job)
> +{
> +       kref_get(&job->ref);
> +}

EXPORT missing?

> +
> +static void job_free(struct kref *ref)
> +{
> +       struct nvhost_job *job = container_of(ref, struct nvhost_job, ref);
> +
> +       if (job->memmgr)
> +               mem_op().put_mgr(job->memmgr);
> +       vfree(job);
> +}
> +
> +void nvhost_job_put(struct nvhost_job *job)
> +{
> +       kref_put(&job->ref, job_free);
> +}
> +EXPORT_SYMBOL(nvhost_job_put);
> +
> +void nvhost_job_add_gather(struct nvhost_job *job,
> +               u32 mem_id, u32 words, u32 offset)
> +{
> +       struct nvhost_job_gather *cur_gather =
> +                       &job->gathers[job->num_gathers];
> +
> +       cur_gather->words = words;
> +       cur_gather->mem_id = mem_id;
> +       cur_gather->offset = offset;
> +       job->num_gathers += 1;
> +}
> +EXPORT_SYMBOL(nvhost_job_add_gather);
> +
> +/*
> + * Check driver supplied waitchk structs for syncpt thresholds
> + * that have already been satisfied and NULL the comparison (to
> + * avoid a wrap condition in the HW).
> + */
> +static int do_waitchks(struct nvhost_job *job, struct nvhost_syncpt *sp,
> +               u32 patch_mem, struct mem_handle *h)
> +{
> +       int i;
> +
> +       /* compare syncpt vs wait threshold */
> +       for (i = 0; i < job->num_waitchk; i++) {
> +               struct nvhost_waitchk *wait = &job->waitchk[i];
> +
> +               /* validate syncpt id */
> +               if (wait->syncpt_id > nvhost_syncpt_nb_pts(sp))
> +                       continue;
> +
> +               /* skip all other gathers */
> +               if (patch_mem != wait->mem)
> +                       continue;
> +
> +               trace_nvhost_syncpt_wait_check(wait->mem, wait->offset,
> +                               wait->syncpt_id, wait->thresh,
> +                               nvhost_syncpt_read(sp, wait->syncpt_id));
> +               if (nvhost_syncpt_is_expired(sp,
> +                                       wait->syncpt_id, wait->thresh)) {
> +                       void *patch_addr = NULL;
> +
> +                       /*
> +                        * NULL an already satisfied WAIT_SYNCPT host method,
> +                        * by patching its args in the command stream. The
> +                        * method data is changed to reference a reserved
> +                        * (never given out or incr) NVSYNCPT_GRAPHICS_HOST
> +                        * syncpt with a matching threshold value of 0, so
> +                        * is guaranteed to be popped by the host HW.
> +                        */
> +                       dev_dbg(&syncpt_to_dev(sp)->dev->dev,
> +                           "drop WAIT id %d (%s) thresh 0x%x, min 0x%x\n",
> +                           wait->syncpt_id,
> +                           syncpt_op().name(sp, wait->syncpt_id),
> +                           wait->thresh,
> +                           nvhost_syncpt_read_min(sp, wait->syncpt_id));
> +
> +                       /* patch the wait */
> +                       patch_addr = mem_op().kmap(h,
> +                                       wait->offset >> PAGE_SHIFT);
> +                       if (patch_addr) {
> +                               nvhost_syncpt_patch_wait(sp,
> +                                       (patch_addr +
> +                                        (wait->offset & ~PAGE_MASK)));
> +                               mem_op().kunmap(h,
> +                                               wait->offset >> PAGE_SHIFT,
> +                                               patch_addr);
> +                       } else {
> +                               pr_err("Couldn't map cmdbuf for wait check\n");
> +                       }
> +               }
> +
> +               wait->mem = 0;
> +       }
> +       return 0;
> +}
> +
> +
> +static int pin_job_mem(struct nvhost_job *job)
> +{
> +       int i;
> +       int count = 0;
> +       int result;
> +       long unsigned *ids =
> +                       kmalloc(sizeof(u32 *) *
> +                               (job->num_relocs + job->num_gathers),
> +                               GFP_KERNEL);
> +       if (!ids)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < job->num_relocs; i++) {
> +               struct nvhost_reloc *reloc = &job->relocarray[i];
> +               ids[count] = reloc->target;
> +               count++;
> +       }
> +
> +       for (i = 0; i < job->num_gathers; i++) {
> +               struct nvhost_job_gather *g = &job->gathers[i];
> +               ids[count] = g->mem_id;
> +               count++;
> +       }
> +
> +       /* validate array and pin unique ids, get refs for unpinning */
> +       result = mem_op().pin_array_ids(job->memmgr, job->ch->dev,
> +               ids, job->addr_phys,
> +               count,
> +               job->unpins);
> +       kfree(ids);
> +
> +       if (result > 0)
> +               job->num_unpins = result;
> +
> +       return result;
> +}
> +
> +static int do_relocs(struct nvhost_job *job,
> +               u32 cmdbuf_mem, struct mem_handle *h)
> +{
> +       int i = 0;
> +       int last_page = -1;
> +       void *cmdbuf_page_addr = NULL;
> +
> +       /* pin & patch the relocs for one gather */
> +       while (i < job->num_relocs) {
> +               struct nvhost_reloc *reloc = &job->relocarray[i];
> +
> +               /* skip all other gathers */
> +               if (cmdbuf_mem != reloc->cmdbuf_mem) {
> +                       i++;
> +                       continue;
> +               }
> +
> +               if (last_page != reloc->cmdbuf_offset >> PAGE_SHIFT) {
> +                       if (cmdbuf_page_addr)
> +                               mem_op().kunmap(h, last_page, cmdbuf_page_addr);
> +
> +                       cmdbuf_page_addr = mem_op().kmap(h,
> +                                       reloc->cmdbuf_offset >> PAGE_SHIFT);
> +                       last_page = reloc->cmdbuf_offset >> PAGE_SHIFT;
> +
> +                       if (unlikely(!cmdbuf_page_addr)) {
> +                               pr_err("Couldn't map cmdbuf for relocation\n");
> +                               return -ENOMEM;
> +                       }
> +               }
> +
> +               __raw_writel(
> +                       (job->reloc_addr_phys[i] +
> +                               reloc->target_offset) >> reloc->shift,
> +                       (cmdbuf_page_addr +
> +                               (reloc->cmdbuf_offset & ~PAGE_MASK)));
> +
> +               /* remove completed reloc from the job */
> +               if (i != job->num_relocs - 1) {
> +                       struct nvhost_reloc *reloc_last =
> +                               &job->relocarray[job->num_relocs - 1];
> +                       reloc->cmdbuf_mem       = reloc_last->cmdbuf_mem;
> +                       reloc->cmdbuf_offset    = reloc_last->cmdbuf_offset;
> +                       reloc->target           = reloc_last->target;
> +                       reloc->target_offset    = reloc_last->target_offset;
> +                       reloc->shift            = reloc_last->shift;
> +                       job->reloc_addr_phys[i] =
> +                               job->reloc_addr_phys[job->num_relocs - 1];
> +                       job->num_relocs--;
> +               } else {
> +                       break;
> +               }
> +       }
> +
> +       if (cmdbuf_page_addr)
> +               mem_op().kunmap(h, last_page, cmdbuf_page_addr);
> +
> +       return 0;
> +}
> +
> +
> +int nvhost_job_pin(struct nvhost_job *job, struct platform_device *pdev)
> +{
> +       int err = 0, i = 0, j = 0;
> +       struct nvhost_syncpt *sp = &nvhost_get_host(pdev)->syncpt;
> +       unsigned long waitchk_mask[nvhost_syncpt_nb_pts(sp) / BITS_PER_LONG];
> +
> +       memset(&waitchk_mask[0], 0, sizeof(waitchk_mask));
> +       for (i = 0; i < job->num_waitchk; i++) {
> +               u32 syncpt_id = job->waitchk[i].syncpt_id;
> +               if (syncpt_id < nvhost_syncpt_nb_pts(sp))
> +                       waitchk_mask[BIT_WORD(syncpt_id)] |=
> +                               BIT_MASK(syncpt_id);
> +       }
> +
> +       /* get current syncpt values for waitchk */
> +       for_each_set_bit(i, &waitchk_mask[0], sizeof(waitchk_mask))
> +               nvhost_syncpt_update_min(sp, i);
> +
> +       /* pin memory */
> +       err = pin_job_mem(job);
> +       if (err <= 0)
> +               goto fail;
> +
> +       /* patch gathers */
> +       for (i = 0; i < job->num_gathers; i++) {
> +               struct nvhost_job_gather *g = &job->gathers[i];
> +
> +               /* process each gather mem only once */
> +               if (!g->ref) {
> +                       g->ref = mem_op().get(job->memmgr,
> +                               g->mem_id, job->ch->dev);
> +                       if (IS_ERR(g->ref)) {
> +                               err = PTR_ERR(g->ref);
> +                               g->ref = NULL;
> +                               break;
> +                       }
> +
> +                       g->mem_base = job->gather_addr_phys[i];
> +
> +                       for (j = 0; j < job->num_gathers; j++) {
> +                               struct nvhost_job_gather *tmp =
> +                                       &job->gathers[j];
> +                               if (!tmp->ref && tmp->mem_id == g->mem_id) {
> +                                       tmp->ref = g->ref;
> +                                       tmp->mem_base = g->mem_base;
> +                               }
> +                       }
> +                       err = do_relocs(job, g->mem_id,  g->ref);
> +                       if (!err)
> +                               err = do_waitchks(job, sp,
> +                                               g->mem_id, g->ref);
> +                       mem_op().put(job->memmgr, g->ref);
> +                       if (err)
> +                               break;
> +               }
> +       }
> +fail:
> +       wmb();
> +
> +       return err;
> +}
> +EXPORT_SYMBOL(nvhost_job_pin);
> +
> +void nvhost_job_unpin(struct nvhost_job *job)
> +{
> +       int i;
> +
> +       for (i = 0; i < job->num_unpins; i++) {
> +               struct nvhost_job_unpin_data *unpin = &job->unpins[i];
> +               mem_op().unpin(job->memmgr, unpin->h, unpin->mem);
> +               mem_op().put(job->memmgr, unpin->h);
> +       }
> +       job->num_unpins = 0;
> +}
> +EXPORT_SYMBOL(nvhost_job_unpin);
> +
> +/**
> + * Debug routine used to dump job entries
> + */
> +void nvhost_job_dump(struct device *dev, struct nvhost_job *job)
> +{
> +       dev_dbg(dev, "    SYNCPT_ID   %d\n",
> +               job->syncpt_id);
> +       dev_dbg(dev, "    SYNCPT_VAL  %d\n",
> +               job->syncpt_end);
> +       dev_dbg(dev, "    FIRST_GET   0x%x\n",
> +               job->first_get);
> +       dev_dbg(dev, "    TIMEOUT     %d\n",
> +               job->timeout);
> +       dev_dbg(dev, "    NUM_SLOTS   %d\n",
> +               job->num_slots);
> +       dev_dbg(dev, "    NUM_HANDLES %d\n",
> +               job->num_unpins);
> +}
> diff --git a/drivers/video/tegra/host/nvhost_memmgr.c b/drivers/video/tegra/host/nvhost_memmgr.c
> new file mode 100644
> index 0000000..47e1944
> --- /dev/null
> +++ b/drivers/video/tegra/host/nvhost_memmgr.c
> @@ -0,0 +1,252 @@
> +/*
> + * drivers/video/tegra/host/nvhost_memmgr.c
> + *
> + * Tegra Graphics Host Memory Management Abstraction
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
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +
> +#include "nvhost_memmgr.h"
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +#include "dmabuf.h"
> +#endif
> +#include "chip_support.h"
> +
> +struct mem_mgr *nvhost_memmgr_alloc_mgr(void)
> +{
> +       struct mem_mgr *mgr = NULL;
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       mgr = (struct mem_mgr *)1;

Perhaps a little explanation would help here (as to why 1 is being
returned)

> +#endif
> +
> +       return mgr;
> +}
> +
> +void nvhost_memmgr_put_mgr(struct mem_mgr *mgr)
> +{
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       mgr = (struct mem_mgr *)1;

Statement with no effect.

> +#endif
> +}
> +
> +struct mem_mgr *nvhost_memmgr_get_mgr(struct mem_mgr *_mgr)
> +{
> +       struct mem_mgr *mgr = NULL;
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       mgr = (struct mem_mgr *)1;
> +#endif
> +
> +       return mgr;
> +}
> +
> +struct mem_mgr *nvhost_memmgr_get_mgr_file(int fd)
> +{
> +       struct mem_mgr *mgr = NULL;
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       mgr = (struct mem_mgr *)1;
> +#endif
> +
> +       return mgr;
> +}
> +
> +struct mem_handle *nvhost_memmgr_alloc(struct mem_mgr *mgr,
> +               size_t size, size_t align, int flags)
> +{
> +       struct mem_handle *h = NULL;
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       h = nvhost_dmabuf_alloc(mgr, size, align, flags);
> +#endif
> +
> +       return h;
> +}
> +
> +struct mem_handle *nvhost_memmgr_get(struct mem_mgr *mgr,
> +               u32 id, struct platform_device *dev)
> +{
> +       struct mem_handle *h = NULL;
> +
> +       switch (nvhost_memmgr_type(id)) {
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       case mem_mgr_type_dmabuf:
> +               h = (struct mem_handle *) nvhost_dmabuf_get(id, dev);
> +               break;
> +#endif
> +       default:
> +               break;
> +       }
> +
> +       return h;
> +}
> +
> +void nvhost_memmgr_put(struct mem_mgr *mgr, struct mem_handle *handle)
> +{
> +       switch (nvhost_memmgr_type((u32)handle)) {
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       case mem_mgr_type_dmabuf:
> +               nvhost_dmabuf_put(handle);
> +               break;
> +#endif
> +       default:
> +               break;
> +       }
> +}
> +
> +struct sg_table *nvhost_memmgr_pin(struct mem_mgr *mgr,
> +               struct mem_handle *handle)
> +{
> +       switch (nvhost_memmgr_type((u32)handle)) {
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       case mem_mgr_type_dmabuf:
> +               return nvhost_dmabuf_pin(handle);
> +               break;
> +#endif
> +       default:
> +               return 0;
> +               break;
> +       }
> +}
> +
> +void nvhost_memmgr_unpin(struct mem_mgr *mgr,
> +               struct mem_handle *handle, struct sg_table *sgt)
> +{
> +       switch (nvhost_memmgr_type((u32)handle)) {
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       case mem_mgr_type_dmabuf:
> +               nvhost_dmabuf_unpin(handle, sgt);
> +               break;
> +#endif
> +       default:
> +               break;
> +       }
> +}
> +
> +void *nvhost_memmgr_mmap(struct mem_handle *handle)
> +{
> +       switch (nvhost_memmgr_type((u32)handle)) {
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       case mem_mgr_type_dmabuf:
> +               return nvhost_dmabuf_mmap(handle);
> +               break;
> +#endif
> +       default:
> +               return 0;
> +               break;
> +       }
> +}
> +
> +void nvhost_memmgr_munmap(struct mem_handle *handle, void *addr)
> +{
> +       switch (nvhost_memmgr_type((u32)handle)) {
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       case mem_mgr_type_dmabuf:
> +               nvhost_dmabuf_munmap(handle, addr);
> +               break;
> +#endif
> +       default:
> +               break;
> +       }
> +}
> +
> +void *nvhost_memmgr_kmap(struct mem_handle *handle, unsigned int pagenum)
> +{
> +       switch (nvhost_memmgr_type((u32)handle)) {
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       case mem_mgr_type_dmabuf:
> +               return nvhost_dmabuf_kmap(handle, pagenum);
> +               break;
> +#endif
> +       default:
> +               return 0;
> +               break;
> +       }
> +}
> +
> +void nvhost_memmgr_kunmap(struct mem_handle *handle, unsigned int pagenum,
> +               void *addr)
> +{
> +       switch (nvhost_memmgr_type((u32)handle)) {
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       case mem_mgr_type_dmabuf:
> +               nvhost_dmabuf_kunmap(handle, pagenum, addr);
> +               break;
> +#endif
> +       default:
> +               break;
> +       }
> +}
> +
> +int nvhost_memmgr_pin_array_ids(struct mem_mgr *mgr,
> +               struct platform_device *dev,
> +               long unsigned *ids,
> +               dma_addr_t *phys_addr,
> +               u32 count,
> +               struct nvhost_job_unpin_data *unpin_data)
> +{
> +       int pin_count = 0;
> +
> +#ifdef CONFIG_TEGRA_GRHOST_USE_DMABUF
> +       {

Redundant brace.

-Sivaram

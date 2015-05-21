From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/tegra: Add VIC support
Date: Thu, 21 May 2015 18:10:46 +0300
Message-ID: <555DF576.7070307@nvidia.com>
References: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com> <1432214425-27137-4-git-send-email-amerilainen@nvidia.com> <555DEE5F.2060100@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555DEE5F.2060100-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, srasal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thank you Mikko for your comments!

Please see my answers inline.

- Arto

On 05/21/2015 05:40 PM, Mikko Perttunen wrote:
> Hi, very good patch!
>
> Here are a few small comments. Aside those, you should also add a
> section to
> Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt in a
> separate patch.

Will do.

> On 05/21/2015 04:20 PM, Arto Merilainen wrote:
>> This patch adds support for Video Image Compositor engine which
>> can be used for 2d operations.
>>
>> The engine has a microcontroller (Falcon) that acts as a frontend
>> for the rest of the unit. In order to properly utilize the engine,
>> the frontend must be booted before pushing any commands.
>>
>> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/tegra/Makefile |   3 +-
>>   drivers/gpu/drm/tegra/drm.c    |   9 +-
>>   drivers/gpu/drm/tegra/drm.h    |   1 +
>>   drivers/gpu/drm/tegra/vic.c    | 593 +++++++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/tegra/vic.h    | 116 ++++++++
>>   include/linux/host1x.h         |   1 +
>>   6 files changed, 721 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/tegra/vic.c
>>   create mode 100644 drivers/gpu/drm/tegra/vic.h
>>
>> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
>> index 2c66a8db9da4..3bc3566e00b6 100644
>> --- a/drivers/gpu/drm/tegra/Makefile
>> +++ b/drivers/gpu/drm/tegra/Makefile
>> @@ -13,6 +13,7 @@ tegra-drm-y := \
>>   	sor.o \
>>   	dpaux.o \
>>   	gr2d.o \
>> -	gr3d.o
>> +	gr3d.o \
>> +	vic.o
>>
>>   obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index bfad15a913a0..d947f5f4d801 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -1,6 +1,6 @@
>>   /*
>>    * Copyright (C) 2012 Avionic Design GmbH
>> - * Copyright (C) 2012-2013 NVIDIA CORPORATION.  All rights reserved.
>> + * Copyright (C) 2012-2015 NVIDIA CORPORATION.  All rights reserved.
>>    *
>>    * This program is free software; you can redistribute it and/or modify
>>    * it under the terms of the GNU General Public License version 2 as
>> @@ -1048,6 +1048,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
>>   	{ .compatible = "nvidia,tegra124-dc", },
>>   	{ .compatible = "nvidia,tegra124-sor", },
>>   	{ .compatible = "nvidia,tegra124-hdmi", },
>> +	{ .compatible = "nvidia,tegra124-vic", },
>>   	{ /* sentinel */ }
>>   };
>>
>> @@ -1097,8 +1098,14 @@ static int __init host1x_drm_init(void)
>>   	if (err < 0)
>>   		goto unregister_gr2d;
>>
>> +	err = platform_driver_register(&tegra_vic_driver);
>> +	if (err < 0)
>> +		goto unregister_gr3d;
>> +
>>   	return 0;
>>
>> +unregister_gr3d:
>> +	platform_driver_unregister(&tegra_gr3d_driver);
>>   unregister_gr2d:
>>   	platform_driver_unregister(&tegra_gr2d_driver);
>>   unregister_dpaux:
>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>> index 0e7756e720c5..a9c02a80d6bf 100644
>> --- a/drivers/gpu/drm/tegra/drm.h
>> +++ b/drivers/gpu/drm/tegra/drm.h
>> @@ -275,5 +275,6 @@ extern struct platform_driver tegra_hdmi_driver;
>>   extern struct platform_driver tegra_dpaux_driver;
>>   extern struct platform_driver tegra_gr2d_driver;
>>   extern struct platform_driver tegra_gr3d_driver;
>> +extern struct platform_driver tegra_vic_driver;
>>
>>   #endif /* HOST1X_DRM_H */
>> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
>> new file mode 100644
>> index 000000000000..b7c5a96697ed
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tegra/vic.c
>> @@ -0,0 +1,593 @@
>> +/*
>> + * Copyright (c) 2015, NVIDIA Corporation.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/clk.h>
>> +#include <linux/host1x.h>
>> +#include <linux/module.h>
>> +#include <linux/firmware.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <soc/tegra/pmc.h>
>> +#include <linux/iommu.h>
>> +
>> +#include "drm.h"
>> +#include "gem.h"
>> +#include "vic.h"
>> +
>> +#define VIC_IDLE_TIMEOUT_DEFAULT	10000	/* 10 milliseconds */
>> +#define VIC_IDLE_CHECK_PERIOD		10	/* 10 usec */
>> +
>> +struct vic;
>
> This doesn't seem to be needed here.
>
>> +
>> +struct vic_config {
>> +	/* firmware name */
>> +	char *ucode_name;
>> +
>> +	/* class id */
>> +	u32 class_id;
>> +
>> +	/* powergate id */
>> +	int powergate_id;
>> +};
>> +
>> +struct vic {
>> +	struct {
>> +		u32 bin_data_offset;
>> +		u32 data_offset;
>> +		u32 data_size;
>> +		u32 code_offset;
>> +		u32 size;
>> +	} os, fce;
>> +
>> +	struct tegra_bo *ucode_bo;
>> +	bool ucode_valid;
>> +	void *ucode_vaddr;
>> +
>> +	bool booted;
>> +
>> +	void __iomem *regs;
>> +	struct tegra_drm_client client;
>> +	struct host1x_channel *channel;
>> +	struct iommu_domain *domain;
>> +	struct device *dev;
>> +	struct clk *clk;
>> +	struct reset_control *rst;
>> +
>> +	/* Platform configuration */
>> +	struct vic_config *config;
>> +
>> +	/* for firewall - this determines if method 1 should be regarded
>> +	 * as an address register */
>> +	bool method_data_is_addr_reg;
>> +};
>> +
>> +static inline struct vic *to_vic(struct tegra_drm_client *client)
>> +{
>> +	return container_of(client, struct vic, client);
>> +}
>> +
>> +void vic_writel(struct vic *vic, u32 v, u32 r)
>> +{
>> +	writel(v, vic->regs + r);
>> +}
>> +
>> +u32 vic_readl(struct vic *vic, u32 r)
>> +{
>> +	return readl(vic->regs + r);
>> +}
>> +
>> +static int vic_wait_idle(struct vic *vic)
>> +{
>> +	u32 timeout = VIC_IDLE_TIMEOUT_DEFAULT;
>> +
>> +	do {
>> +		u32 check = min_t(u32, VIC_IDLE_CHECK_PERIOD, timeout);
>> +		u32 w = vic_readl(vic, NV_PVIC_FALCON_IDLESTATE);
>> +
>> +		if (!w)
>> +			return 0;
>> +
>> +		udelay(VIC_IDLE_CHECK_PERIOD);
>> +		timeout -= check;
>> +	} while (timeout);
>> +
>> +	dev_err(vic->dev, "vic idle timeout");
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static int vic_dma_wait_idle(struct vic *vic)
>> +{
>> +	u32 timeout = VIC_IDLE_TIMEOUT_DEFAULT;
>> +
>> +	do {
>> +		u32 check = min_t(u32, VIC_IDLE_CHECK_PERIOD, timeout);
>> +		u32 dmatrfcmd = vic_readl(vic, NV_PVIC_FALCON_DMATRFCMD);
>> +
>> +		if (dmatrfcmd & DMATRFCMD_IDLE)
>> +			return 0;
>> +
>> +		udelay(VIC_IDLE_CHECK_PERIOD);
>> +		timeout -= check;
>> +	} while (timeout);
>> +
>> +	dev_err(vic->dev, "dma idle timeout");
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static int vic_dma_pa_to_internal_256b(struct vic *vic, phys_addr_t pa,
>> +				       u32 internal_offset, bool imem)
>> +{
>> +	u32 cmd = DMATRFCMD_SIZE_256B;
>> +
>> +	if (imem)
>> +		cmd |= DMATRFCMD_IMEM;
>> +
>> +	vic_writel(vic, DMATRFMOFFS_OFFS(internal_offset),
>> +		   NV_PVIC_FALCON_DMATRFMOFFS);
>> +	vic_writel(vic, DMATRFFBOFFS_OFFS(pa),
>> +		   NV_PVIC_FALCON_DMATRFFBOFFS);
>> +	vic_writel(vic, cmd, NV_PVIC_FALCON_DMATRFCMD);
>> +
>> +	return vic_dma_wait_idle(vic);
>> +}
>> +
>> +static int vic_setup_ucode_image(struct vic *vic,
>> +				 const struct firmware *ucode_fw)
>> +{
>> +	/* image data is little endian. */
>> +	u32 *ucode_vaddr = vic->ucode_vaddr;
>> +	struct ucode_v1_vic ucode;
>> +	int w;
>> +
>> +	/* copy the whole thing taking into account endianness */
>> +	for (w = 0; w < ucode_fw->size / sizeof(u32); w++)
>> +		ucode_vaddr[w] = le32_to_cpu(((u32 *)ucode_fw->data)[w]);
>> +
>> +	ucode.bin_header = (struct ucode_bin_header_v1_vic *)ucode_vaddr;
>> +
>> +	/* endian problems would show up right here */
>> +	if (ucode.bin_header->bin_magic != 0x10de) {
>> +		dev_err(vic->dev, "failed to get firmware magic");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ucode.bin_header->bin_ver != 1) {
>> +		dev_err(vic->dev, "unsupported firmware version");
>> +		return -ENOENT;
>> +	}
>> +
>> +	/* shouldn't be bigger than what firmware thinks */
>> +	if (ucode.bin_header->bin_size > ucode_fw->size) {
>> +		dev_err(vic->dev, "ucode image size inconsistency");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ucode.os_header = (struct ucode_os_header_v1_vic *)
>> +		(((void *)ucode_vaddr) +
>> +		ucode.bin_header->os_bin_header_offset);
>> +	vic->os.size = ucode.bin_header->os_bin_size;
>> +	vic->os.bin_data_offset = ucode.bin_header->os_bin_data_offset;
>> +	vic->os.code_offset = ucode.os_header->os_code_offset;
>> +	vic->os.data_offset = ucode.os_header->os_data_offset;
>> +	vic->os.data_size = ucode.os_header->os_data_size;
>> +
>> +	ucode.fce_header = (struct ucode_fce_header_v1_vic *)
>> +		(((void *)ucode_vaddr) +
>> +		ucode.bin_header->fce_bin_header_offset);
>> +	vic->fce.size = ucode.fce_header->fce_ucode_size;
>> +	vic->fce.data_offset = ucode.bin_header->fce_bin_data_offset;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vic_read_ucode(struct vic *vic)
>> +{
>> +	struct host1x_client *client = &vic->client.base;
>> +	struct drm_device *dev = dev_get_drvdata(client->parent);
>> +	const struct firmware *ucode_fw;
>> +	int err;
>> +
>> +	err = request_firmware(&ucode_fw, vic->config->ucode_name, vic->dev);
>> +	if (err) {
>> +		dev_err(vic->dev, "failed to get firmware\n");
>> +		goto err_request_firmware;
>> +	}
>> +
>> +	vic->ucode_bo = tegra_bo_create(dev, ucode_fw->size, 0);
>> +	if (IS_ERR(vic->ucode_bo)) {
>> +		dev_err(vic->dev, "dma memory allocation failed");
>> +		err = PTR_ERR(vic->ucode_bo);
>> +		goto err_alloc_iova;
>> +	}
>> +
>> +	/* get vaddr for the ucode */
>> +	if (!vic->ucode_bo->vaddr)
>> +		vic->ucode_vaddr = vmap(vic->ucode_bo->pages,
>> +					vic->ucode_bo->num_pages, VM_MAP,
>> +					pgprot_writecombine(PAGE_KERNEL));
>> +	else
>> +		vic->ucode_vaddr = vic->ucode_bo->vaddr;
>> +
>> +	err = vic_setup_ucode_image(vic, ucode_fw);
>> +	if (err) {
>> +		dev_err(vic->dev, "failed to parse firmware image\n");
>> +		goto err_setup_ucode_image;
>> +	}
>> +
>> +	vic->ucode_valid = true;
>> +
>> +	release_firmware(ucode_fw);
>> +
>> +	return 0;
>> +
>> +err_setup_ucode_image:
>> +	drm_gem_object_release(&vic->ucode_bo->gem);
>
> Should this not be freed with tegra_bo_free or similar? Right now this
> looks like it would leak at least memory.
>

Uh, this definitely looks broken. Will fix.

>> +err_alloc_iova:
>> +	release_firmware(ucode_fw);
>> +err_request_firmware:
>> +	return err;
>> +}
>> +
>> +static int vic_boot(struct device *dev)
>> +{
>> +	struct vic *vic = dev_get_drvdata(dev);
>> +	u32 offset;
>> +	int err = 0;
>> +
>> +	if (vic->booted)
>> +		return 0;
>> +
>> +	if (!vic->ucode_valid) {
>> +		err = vic_read_ucode(vic);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	/* ensure that the engine is in sane state */
>> +	reset_control_assert(vic->rst);
>> +	udelay(10);
>> +	reset_control_deassert(vic->rst);
>> +
>> +	/* setup clockgating registers */
>> +	vic_writel(vic, CG_IDLE_CG_DLY_CNT(4) |
>> +			CG_IDLE_CG_EN |
>> +			CG_WAKEUP_DLY_CNT(4),
>> +		   NV_PVIC_MISC_PRI_VIC_CG);
>> +
>> +	/* service all dma requests */
>> +	vic_writel(vic, 0, NV_PVIC_FALCON_DMACTL);
>> +
>> +	/* setup dma base address */
>> +	vic_writel(vic, (vic->ucode_bo->paddr + vic->os.bin_data_offset) >> 8,
>> +		   NV_PVIC_FALCON_DMATRFBASE);
>> +
>> +	/* dma ucode data */
>> +	for (offset = 0; offset < vic->os.data_size; offset += 256)
>> +		vic_dma_pa_to_internal_256b(vic,
>> +					     vic->os.data_offset + offset,
>> +					     offset, false);
>> +
>> +	/* dma ucode */
>> +	vic_dma_pa_to_internal_256b(vic, vic->os.code_offset, 0, true);
>> +
>> +	/* setup falcon interrupts and enable interface */
>> +	vic_writel(vic, IRQMSET_EXT(0xff) |
>> +			IRQMSET_SWGEN1_SET |
>> +			IRQMSET_SWGEN0_SET |
>> +			IRQMSET_EXTERR_SET |
>> +			IRQMSET_HALT_SET |
>> +			IRQMSET_WDTMR_SET,
>> +		   NV_PVIC_FALCON_IRQMSET);
>> +	vic_writel(vic, IRQDEST_HOST_EXT(0Xff) |
>> +			IRQDEST_HOST_SWGEN1_HOST |
>> +			IRQDEST_HOST_SWGEN0_HOST |
>> +			IRQDEST_HOST_EXTERR_HOST |
>> +			IRQDEST_HOST_HALT_HOST,
>> +		    NV_PVIC_FALCON_IRQDEST);
>> +
>> +	/* enable method and context switch interfaces */
>> +	vic_writel(vic, ITFEN_MTHDEN_ENABLE |
>> +			ITFEN_CTXEN_ENABLE,
>> +		   NV_PVIC_FALCON_ITFEN);
>> +
>> +	/* boot falcon */
>> +	vic_writel(vic, BOOTVEC_VEC(0), NV_PVIC_FALCON_BOOTVEC);
>> +	vic_writel(vic, CPUCTL_STARTCPU, NV_PVIC_FALCON_CPUCTL);
>> +
>> +	err = vic_wait_idle(vic);
>> +	if (err != 0) {
>> +		dev_err(dev, "boot failed due to timeout");
>> +		return err;
>> +	}
>> +
>> +	/* Set application id and set-up FCE ucode address */
>> +	vic_writel(vic, NVA0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID >> 2,
>> +		    NV_PVIC_FALCON_METHOD_0);
>> +	vic_writel(vic, 1, NV_PVIC_FALCON_METHOD_1);
>> +	vic_writel(vic, NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_SIZE >> 2,
>> +		    NV_PVIC_FALCON_METHOD_0);
>> +	vic_writel(vic, vic->fce.size, NV_PVIC_FALCON_METHOD_1);
>> +	vic_writel(vic, NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_OFFSET >> 2,
>> +		    NV_PVIC_FALCON_METHOD_0);
>> +	vic_writel(vic, (vic->ucode_bo->paddr + vic->fce.data_offset) >> 8,
>> +		    NV_PVIC_FALCON_METHOD_1);
>> +
>> +	err = vic_wait_idle(vic);
>> +	if (err != 0) {
>> +		dev_err(dev, "failed to set application id and fce base");
>> +		return err;
>> +	}
>> +
>> +	vic->booted = true;
>> +
>> +	dev_info(dev, "booted");
>> +
>> +	return 0;
>> +}
>> +
>> +static int vic_init(struct host1x_client *client)
>> +{
>> +	struct tegra_drm_client *drm = host1x_to_drm_client(client);
>> +	struct drm_device *dev = dev_get_drvdata(client->parent);
>> +	struct tegra_drm *tegra = dev->dev_private;
>> +	struct vic *vic = to_vic(drm);
>> +	int err;
>> +
>> +	if (tegra->domain) {
>> +		err = iommu_attach_device(tegra->domain, vic->dev);
>> +		if (err < 0) {
>> +			dev_err(vic->dev, "failed to attach to domain: %d\n",
>> +				err);
>> +			return err;
>> +		}
>> +
>> +		vic->domain = tegra->domain;
>> +	}
>> +
>> +	vic->channel = host1x_channel_request(client->dev);
>> +	if (!vic->channel)
>> +		return -ENOMEM;
>> +
>> +	client->syncpts[0] = host1x_syncpt_request(client->dev, 0);
>> +	if (!client->syncpts[0]) {
>> +		host1x_channel_free(vic->channel);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	return tegra_drm_register_client(tegra, drm);
>> +}
>> +
>> +static int vic_exit(struct host1x_client *client)
>> +{
>> +	struct tegra_drm_client *drm = host1x_to_drm_client(client);
>> +	struct drm_device *dev = dev_get_drvdata(client->parent);
>> +	struct tegra_drm *tegra = dev->dev_private;
>> +	struct vic *vic = to_vic(drm);
>> +	int err;
>> +
>> +	err = tegra_drm_unregister_client(tegra, drm);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	host1x_syncpt_free(client->syncpts[0]);
>> +	host1x_channel_free(vic->channel);
>> +
>> +	/* ucode is no longer available. release it */
>> +	if (vic->ucode_valid) {
>> +		/* first, ensure that vic is not using it */
>> +		reset_control_assert(vic->rst);
>> +		udelay(10);
>> +		reset_control_deassert(vic->rst);
>> +
>> +		/* ..then release the ucode */
>> +		if (!vic->ucode_bo->vaddr)
>> +			vunmap(vic->ucode_vaddr);
>> +		drm_gem_object_release(&vic->ucode_bo->gem);
>
> Same here, is this the correct way to free this?
>

Same as above.

>> +		vic->ucode_valid = false;
>> +	}
>> +
>> +	if (vic->domain) {
>> +		iommu_detach_device(vic->domain, vic->dev);
>> +		vic->domain = NULL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct host1x_client_ops vic_client_ops = {
>> +	.init = vic_init,
>> +	.exit = vic_exit,
>> +};
>> +
>> +static int vic_open_channel(struct tegra_drm_client *client,
>> +			     struct tegra_drm_context *context)
>> +{
>> +	struct vic *vic = to_vic(client);
>> +	int err;
>> +
>> +	err = vic_boot(vic->dev);
>> +	if (err)
>> +		return err;
>> +
>> +	context->channel = host1x_channel_get(vic->channel);
>> +	if (!context->channel)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> +
>> +static void vic_close_channel(struct tegra_drm_context *context)
>> +{
>> +	host1x_channel_put(context->channel);
>> +}
>> +
>> +static int vic_is_addr_reg(struct device *dev, u32 class, u32 offset, u32 val)
>> +{
>> +	struct vic *vic = dev_get_drvdata(dev);
>> +
>> +	/* handle host class */
>> +	if (class == HOST1X_CLASS_HOST1X) {
>> +		if (offset == 0x2b)
>> +			return true;
>> +		return false;
>
> "return (offset == 0x2b);" perhaps?
>

Works for me.

>> +	}
>> +
>> +	/* write targets towards method 1. check stashed value */
>> +	if (offset == NV_PVIC_FALCON_METHOD_1 >> 2)
>> +		return vic->method_data_is_addr_reg;
>> +
>> +	/* write targets to method 0. determine if the method takes an
>> +	 * address as a parameter */
>> +	if (offset == NV_PVIC_FALCON_METHOD_0 >> 2) {
>> +		u32 method = val << 2;
>> +
>> +		if ((method >= 0x400 && method <= 0x5dc) ||
>> +		    (method >= 0x720 && method <= 0x738))
>> +			vic->method_data_is_addr_reg = true;
>> +		else
>> +			vic->method_data_is_addr_reg = false;
>> +	}
>> +
>> +	/* default to false */
>> +	return false;
>> +}
>> +
>> +static const struct tegra_drm_client_ops vic_ops = {
>> +	.open_channel = vic_open_channel,
>> +	.close_channel = vic_close_channel,
>> +	.is_addr_reg = vic_is_addr_reg,
>> +	.submit = tegra_drm_submit,
>> +};
>> +
>> +static const struct vic_config vic_t124_config = {
>> +	.ucode_name = "vic03_ucode.bin",
>> +	.class_id = HOST1X_CLASS_VIC,
>> +	.powergate_id = TEGRA_POWERGATE_VIC,
>> +};
>> +
>> +static const struct of_device_id vic_match[] = {
>> +	{ .compatible = "nvidia,tegra124-vic",
>> +		.data = &vic_t124_config },
>> +	{ },
>> +};
>> +
>> +static int vic_probe(struct platform_device *pdev)
>> +{
>> +	struct vic_config *vic_config = NULL;
>> +	struct device *dev = &pdev->dev;
>> +	struct host1x_syncpt **syncpts;
>> +	struct resource *regs;
>> +	struct vic *vic;
>> +	int err;
>> +
>> +	if (dev->of_node) {
>> +		const struct of_device_id *match;
>> +
>> +		match = of_match_device(vic_match, dev);
>> +		if (match)
>> +			vic_config = (struct vic_config *)match->data;
>> +		else
>> +			return -ENXIO;
>> +	}
>
> This doesn't seem necessary, we can only be probed from device tree and
> each match entry has a data pointer anyway.
>

True, will remove.

>> +
>> +	vic = devm_kzalloc(dev, sizeof(*vic), GFP_KERNEL);
>> +	if (!vic)
>> +		return -ENOMEM;
>> +
>> +	syncpts = devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
>> +	if (!syncpts)
>> +		return -ENOMEM;
>> +
>> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!regs) {
>> +		dev_err(&pdev->dev, "failed to get registers\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +	vic->regs = devm_ioremap_resource(dev, regs);
>> +	if (IS_ERR(vic->regs))
>> +		return PTR_ERR(vic->regs);
>> +
>> +	vic->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(vic->clk)) {
>> +		dev_err(&pdev->dev, "failed to get clock\n");
>> +		return PTR_ERR(vic->clk);
>> +	}
>> +
>> +	vic->rst = devm_reset_control_get(dev, "vic03");
>
> I might prefer just "vic" as the clock/reset name. The name is often
> used as a sort of "role" for the clock/reset for the device, not
> necessarily the raw name of the "correct" clock/reset.
>

I considered that - but I then noticed that 
drivers/clk/tegra/clk-tegra124.c was already using vic03 variant. I can 
write a patch for changing that too.

>> +	if (IS_ERR(vic->rst)) {
>> +		dev_err(&pdev->dev, "cannot get reset\n");
>> +		return PTR_ERR(vic->rst);
>> +	}
>> +
>> +	platform_set_drvdata(pdev, vic);
>> +
>> +	INIT_LIST_HEAD(&vic->client.base.list);
>> +	vic->client.base.ops = &vic_client_ops;
>> +	vic->client.base.dev = dev;
>> +	vic->client.base.class = vic_config->class_id;
>> +	vic->client.base.syncpts = syncpts;
>> +	vic->client.base.num_syncpts = 1;
>> +	vic->dev = dev;
>> +	vic->config = vic_config;
>> +
>> +	INIT_LIST_HEAD(&vic->client.list);
>> +	vic->client.ops = &vic_ops;
>> +
>> +	err = tegra_powergate_sequence_power_up(vic->config->powergate_id,
>> +						vic->clk, vic->rst);
>> +	if (err) {
>> +		dev_err(dev, "cannot turn on the device\n");
>> +		return err;
>> +	}
>> +
>> +	err = host1x_client_register(&vic->client.base);
>> +	if (err < 0) {
>
> You used 'if (err) {' previously, so maybe also here.
>

True, will fix.

>> +		dev_err(dev, "failed to register host1x client: %d\n", err);
>> +		clk_disable_unprepare(vic->clk);
>> +		tegra_powergate_power_off(vic->config->powergate_id);
>> +		platform_set_drvdata(pdev, NULL);
>> +		return err;
>> +	}
>> +
>> +	dev_info(&pdev->dev, "initialized");
>> +
>> +	return 0;
>> +}
>> +
>> +static int vic_remove(struct platform_device *pdev)
>> +{
>> +	struct vic *vic = platform_get_drvdata(pdev);
>> +	int err;
>> +
>> +	err = host1x_client_unregister(&vic->client.base);
>> +	if (err < 0) {
>
> and here.
>

Will fix.

>> +		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
>> +			err);
>> +		return err;
>> +	}
>> +
>> +	clk_disable_unprepare(vic->clk);
>> +	tegra_powergate_power_off(vic->config->powergate_id);
>> +
>> +	return 0;
>> +}
>> +
>> +struct platform_driver tegra_vic_driver = {
>> +	.driver = {
>> +		.name = "tegra-vic",
>> +		.of_match_table = vic_match,
>> +	},
>> +	.probe = vic_probe,
>> +	.remove = vic_remove,
>> +};
>> diff --git a/drivers/gpu/drm/tegra/vic.h b/drivers/gpu/drm/tegra/vic.h
>> new file mode 100644
>> index 000000000000..65ca38a8da88
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tegra/vic.h
>> @@ -0,0 +1,116 @@
>> +/*
>> + * Copyright (c) 2015, NVIDIA Corporation.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#ifndef TEGRA_VIC_H
>> +#define TEGRA_VIC_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/dma-attrs.h>
>> +#include <linux/firmware.h>
>> +#include <linux/platform_device.h>
>> +
>> +struct ucode_bin_header_v1_vic {
>> +	u32 bin_magic;        /* 0x10de */
>> +	u32 bin_ver;          /* cya, versioning of bin format (1) */
>> +	u32 bin_size;         /* entire image size including this header */
>> +	u32 os_bin_header_offset;
>> +	u32 os_bin_data_offset;
>> +	u32 os_bin_size;
>> +	u32 fce_bin_header_offset;
>> +	u32 fce_bin_data_offset;
>> +	u32 fce_bin_size;
>> +};
>> +
>> +struct ucode_os_code_header_v1_vic {
>> +	u32 offset;
>> +	u32 size;
>> +};
>> +
>> +struct ucode_os_header_v1_vic {
>> +	u32 os_code_offset;
>> +	u32 os_code_size;
>> +	u32 os_data_offset;
>> +	u32 os_data_size;
>> +	u32 num_apps;
>> +	struct ucode_os_code_header_v1_vic *app_code;
>> +	struct ucode_os_code_header_v1_vic *app_data;
>> +	u32 *os_ovl_offset;
>> +	u32 *of_ovl_size;
>> +};
>> +
>> +struct ucode_fce_header_v1_vic {
>> +	u32 fce_ucode_offset;
>> +	u32 fce_ucode_buffer_size;
>> +	u32 fce_ucode_size;
>> +};
>> +
>> +struct ucode_v1_vic {
>> +	struct ucode_bin_header_v1_vic *bin_header;
>> +	struct ucode_os_header_v1_vic  *os_header;
>> +	struct ucode_fce_header_v1_vic *fce_header;
>> +};
>> +
>> +/* VIC methods */
>> +#define NVA0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID	0x00000200
>> +#define NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_SIZE	0x0000071C
>> +#define NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_OFFSET	0x0000072C
>> +
>> +/* VIC registers */
>> +
>> +#define NV_PVIC_FALCON_METHOD_0			0x00000040
>> +#define NV_PVIC_FALCON_METHOD_1			0x00000044
>> +
>> +#define NV_PVIC_FALCON_IRQMSET			0x00001010
>> +#define IRQMSET_WDTMR_SET			(1 << 1)
>> +#define IRQMSET_HALT_SET			(1 << 4)
>> +#define IRQMSET_EXTERR_SET			(1 << 5)
>> +#define IRQMSET_SWGEN0_SET			(1 << 6)
>> +#define IRQMSET_SWGEN1_SET			(1 << 7)
>> +#define IRQMSET_EXT(val)			((val & 0xff) << 8)
>> +
>> +#define NV_PVIC_FALCON_IRQDEST			0x0000101c
>> +#define IRQDEST_HOST_HALT_HOST			(1 << 4)
>> +#define IRQDEST_HOST_EXTERR_HOST		(1 << 5)
>> +#define IRQDEST_HOST_SWGEN0_HOST		(1 << 6)
>> +#define IRQDEST_HOST_SWGEN1_HOST		(1 << 7)
>> +#define IRQDEST_HOST_EXT(val)			((val & 0xff) << 8)
>> +
>> +#define NV_PVIC_FALCON_ITFEN			0x00001048
>> +#define ITFEN_CTXEN_ENABLE			(1 << 0)
>> +#define ITFEN_MTHDEN_ENABLE			(1 << 1)
>> +
>> +#define NV_PVIC_FALCON_IDLESTATE		0x0000104c
>> +
>> +#define NV_PVIC_FALCON_CPUCTL			0x00001100
>> +#define CPUCTL_STARTCPU				(1 << 1)
>> +
>> +#define NV_PVIC_FALCON_BOOTVEC			0x00001104
>> +#define BOOTVEC_VEC(val)			((val & 0xffffffff) << 0)
>> +
>> +#define NV_PVIC_FALCON_DMACTL			0x0000110c
>> +
>> +#define NV_PVIC_FALCON_DMATRFBASE		0x00001110
>> +
>> +#define NV_PVIC_FALCON_DMATRFMOFFS		0x00001114
>> +#define DMATRFMOFFS_OFFS(val)			((val & 0xffff) << 0)
>> +
>> +#define NV_PVIC_FALCON_DMATRFCMD		0x00001118
>> +#define DMATRFCMD_IDLE				(1 << 1)
>> +#define DMATRFCMD_IMEM				(1 << 4)
>> +#define DMATRFCMD_SIZE_256B			(6 << 8)
>> +
>> +#define NV_PVIC_FALCON_DMATRFFBOFFS		0x0000111c
>> +#define DMATRFFBOFFS_OFFS(val)			((val & 0xffffffff) << 0)
>> +
>> +#define NV_PVIC_MISC_PRI_VIC_CG			0x000016d0
>> +#define CG_IDLE_CG_DLY_CNT(val)			((val & 0x3f) << 0)
>> +#define CG_IDLE_CG_EN				(1 << 6)
>> +#define CG_WAKEUP_DLY_CNT(val)			((val & 0xf) << 16)
>> +
>> +
>> +#endif /* TEGRA_VIC_H */
>> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
>> index fc86ced77e76..a006dad00009 100644
>> --- a/include/linux/host1x.h
>> +++ b/include/linux/host1x.h
>> @@ -26,6 +26,7 @@ enum host1x_class {
>>   	HOST1X_CLASS_HOST1X = 0x1,
>>   	HOST1X_CLASS_GR2D = 0x51,
>>   	HOST1X_CLASS_GR2D_SB = 0x52,
>> +	HOST1X_CLASS_VIC = 0x5D,
>>   	HOST1X_CLASS_GR3D = 0x60,
>>   };
>>
>>

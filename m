Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC28ECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 13:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiJ1NCE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 09:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbiJ1NCA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 09:02:00 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B202C5FDD2
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 06:01:55 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MzMy20Dfdz15MLb;
        Fri, 28 Oct 2022 20:56:58 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 21:01:53 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 21:01:53 +0800
Subject: Re: [PATCH -next] gpu: host1x: fix memory leak of device names
To:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <mperttunen@nvidia.com>,
        <yangyingliang@huawei.com>
References: <20221028125238.1128979-1-yangyingliang@huawei.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <ba36063c-3556-6437-fa47-992ea7a80e04@huawei.com>
Date:   Fri, 28 Oct 2022 21:01:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20221028125238.1128979-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Sorry for the noisy, it should for linux master, not next, I will resend 
it with right title,
please ignore this patch.

Thanks,
Yang
On 2022/10/28 20:52, Yang Yingliang wrote:
> The device names allocated by dev_set_name() need be freed
> before module unloading, but they can not be freed because
> the kobject's refcount which was set in device_initialize()
> has not be decreased to 0.
>
> Fix the name leak by calling put_device() to give up the refcount,
> so the name can be freed in kobejct_cleanup().
>
> Add a release() function to device, it's empty, because the
> context devices are freed together in host1x_memory_context_list_free().
>
> Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/gpu/host1x/context.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
> index b08cf11f9a66..f49a7bf6afa5 100644
> --- a/drivers/gpu/host1x/context.c
> +++ b/drivers/gpu/host1x/context.c
> @@ -13,6 +13,11 @@
>   #include "context.h"
>   #include "dev.h"
>   
> +static void host1x_memory_context_release(struct device *dev)
> +{
> +	/* context device is freed in host1x_memory_context_list_free() */
> +}
> +
>   int host1x_memory_context_list_init(struct host1x *host1x)
>   {
>   	struct host1x_memory_context_list *cdl = &host1x->context_list;
> @@ -53,28 +58,27 @@ int host1x_memory_context_list_init(struct host1x *host1x)
>   		dev_set_name(&ctx->dev, "host1x-ctx.%d", i);
>   		ctx->dev.bus = &host1x_context_device_bus_type;
>   		ctx->dev.parent = host1x->dev;
> +		ctx->dev.release = host1x_memory_context_release;
>   
>   		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
>   
>   		err = device_add(&ctx->dev);
>   		if (err) {
>   			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
> -			goto del_devices;
> +			goto put_dev;
>   		}
>   
>   		err = of_dma_configure_id(&ctx->dev, node, true, &i);
>   		if (err) {
>   			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
>   				i, err);
> -			device_del(&ctx->dev);
> -			goto del_devices;
> +			goto unreg_devices;
>   		}
>   
>   		fwspec = dev_iommu_fwspec_get(&ctx->dev);
>   		if (!fwspec || !device_iommu_mapped(&ctx->dev)) {
>   			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
> -			device_del(&ctx->dev);
> -			goto del_devices;
> +			goto unreg_devices;
>   		}
>   
>   		ctx->stream_id = fwspec->ids[0] & 0xffff;
> @@ -82,9 +86,12 @@ int host1x_memory_context_list_init(struct host1x *host1x)
>   
>   	return 0;
>   
> -del_devices:
> -	while (i--)
> -		device_del(&cdl->devs[i].dev);
> +put_dev:
> +	put_device(&cdl->devs[i--].dev);
> +
> +unreg_devices:
> +	while (i >= 0)
> +		device_unregister(&cdl->devs[i--].dev);
>   
>   	kfree(cdl->devs);
>   	cdl->len = 0;
> @@ -97,7 +104,7 @@ void host1x_memory_context_list_free(struct host1x_memory_context_list *cdl)
>   	unsigned int i;
>   
>   	for (i = 0; i < cdl->len; i++)
> -		device_del(&cdl->devs[i].dev);
> +		device_unregister(&cdl->devs[i].dev);
>   
>   	kfree(cdl->devs);
>   	cdl->len = 0;

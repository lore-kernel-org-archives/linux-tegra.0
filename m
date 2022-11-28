Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363EDC433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Nov 2022 09:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiK1JxZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Nov 2022 04:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiK1JxX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Nov 2022 04:53:23 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD02272
        for <linux-tegra@vger.kernel.org>; Mon, 28 Nov 2022 01:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rAkUAYIiy25AhriTqbTtb10nmHBigaaPDVvZI4DDOhI=; b=Dn6P3HoKFtLuGebafEHocFlvBo
        fSG5S/9K10/hGZJgRC3hR9OaTKIA5SDMC2N9d30xrVRtW423gC3JsQL3ZXFiXyFgagfDe6Dh/udD8
        aeaWS7bp1WLkqr6CZCa/qgQlTvn7LRhCsvMmEef9KIWEYHrIqzSezCNCPn3FMO/NFWCBtXdhRulif
        x7XlybvoEiCXH4nBKAt7VNILkKq/2u8qPGoM2fEr8CWsrBZRQwB+RYvbc66AUQn0zd4nWwSJm0KU/
        3rdMVidj9vmoDVPvy5yOHekHZIbSEANMYTEtp1LTR6z2/ZOgDLWgIfw/jR410wbAujg1wPMDOIT/R
        TzyJ+qkg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1ozapC-007AE2-2j; Mon, 28 Nov 2022 11:53:18 +0200
Message-ID: <97b3d50e-fa13-ae55-f7d1-a5082c2ed274@kapsi.fi>
Date:   Mon, 28 Nov 2022 11:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 resend 2/2] gpu: host1x: fix memory leak of device
 names
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        airlied@gmail.com, daniel@ffwll.ch, mperttunen@nvidia.com
References: <20221126073315.365567-1-yangyingliang@huawei.com>
 <20221126073315.365567-3-yangyingliang@huawei.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20221126073315.365567-3-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/26/22 09:33, Yang Yingliang wrote:
> The device names allocated by dev_set_name() need be freed
> before module unloading, but they can not be freed because
> the kobject's refcount which was set in device_initialize()
> has not be decreased to 0.
> 
> As comment of device_add() says, if it fails, use only
> put_device() drop the refcount, then the name will be
> freed in kobejct_cleanup().
> 
> device_del() and put_device() can be replaced with
> device_unregister(), so call it to unregister the added
> successfully devices, and just call put_device() to the
> not added device.
> 
> Add a release() function to device to avoid null release()
> function WARNING in device_release(), it's empty, because
> the context devices are freed together in
> host1x_memory_context_list_free().
> 
> Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/gpu/host1x/context.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
> index 291f34562e2e..047696432eb2 100644
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
> @@ -53,28 +58,30 @@ int host1x_memory_context_list_init(struct host1x *host1x)
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
> +			put_device(&ctx->dev);
> +			goto unreg_devices;
>   		}
>   
>   		err = of_dma_configure_id(&ctx->dev, node, true, &i);
>   		if (err) {
>   			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
>   				i, err);
> -			device_del(&ctx->dev);
> -			goto del_devices;
> +			device_unregister(&ctx->dev);
> +			goto unreg_devices;
>   		}
>   
>   		fwspec = dev_iommu_fwspec_get(&ctx->dev);
>   		if (!fwspec || !device_iommu_mapped(&ctx->dev)) {
>   			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
> -			device_del(&ctx->dev);
> -			goto del_devices;
> +			device_unregister(&ctx->dev);
> +			goto unreg_devices;
>   		}
>   
>   		ctx->stream_id = fwspec->ids[0] & 0xffff;
> @@ -82,9 +89,9 @@ int host1x_memory_context_list_init(struct host1x *host1x)
>   
>   	return 0;
>   
> -del_devices:
> +unreg_devices:
>   	while (i--)
> -		device_del(&cdl->devs[i].dev);
> +		device_unregister(&cdl->devs[i].dev);
>   
>   	kfree(cdl->devs);
>   	cdl->devs = NULL;
> @@ -98,7 +105,7 @@ void host1x_memory_context_list_free(struct host1x_memory_context_list *cdl)
>   	unsigned int i;
>   
>   	for (i = 0; i < cdl->len; i++)
> -		device_del(&cdl->devs[i].dev);
> +		device_unregister(&cdl->devs[i].dev);
>   
>   	kfree(cdl->devs);
>   	cdl->len = 0;

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>


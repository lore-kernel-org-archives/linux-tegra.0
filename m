Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58E7C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Nov 2022 16:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiKYQuA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Nov 2022 11:50:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbiKYQtl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Nov 2022 11:49:41 -0500
X-Greylist: delayed 2847 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Nov 2022 08:48:24 PST
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE58652896
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 08:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6ujMIEQUK4CMzIzLXEGGHPSHlvvtI/+kAIdSvhh/ZPc=; b=CtjqWtRZ9OsJOFd/OIG0gM3INS
        sqvssk/ZA2YxopOI4S66gVjIPhHiYey8GZnZXfsyUSaCtu+vJgjfncKSQcc48/z5IjUYBpJFXBjLY
        7me8Ayt3lyT8hYxGGKjfWrkGKWDPc0bmB+2gFfArTO5MNzUPixJQTC+kmRQ6l+0C9VrA6bL16AGk3
        JnWnmWyBy0Ko/uYZoHeu7TerXUOq01r1vkIHoNijXQ0h5saswXCq/6xc0ahpkvSyQ2XrFzaErrUTA
        9g5a4xgxnLwJldsCgoUcZKmw3l4+fZOWqGne69OGcp5v/Ml5DToePCB1uMzJzxBYUyHvlX50R/uTK
        WCTbAkyQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1oyb8F-00CXM7-LO; Fri, 25 Nov 2022 18:00:51 +0200
Message-ID: <6cf63d07-9a83-0397-9148-5775d5a4417e@kapsi.fi>
Date:   Fri, 25 Nov 2022 18:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH resend] gpu: host1x: fix error return code in
 host1x_memory_context_list_init()
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        airlied@gmail.com, daniel@ffwll.ch, mperttunen@nvidia.com
References: <20221124080559.3592650-1-yangyingliang@huawei.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20221124080559.3592650-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/24/22 10:05, Yang Yingliang wrote:
> If context device has no IOMMU, the 'cdl->devs' is freed in error path,
> but host1x_memory_context_list_init() doesn't return an error code, so
> the module can be loaded successfully, when it's unloading, the
> host1x_memory_context_list_free() is called in host1x_remove(), it will
> cause double free. Return an error code to fix this.
> 
> Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> The previous patch link:
> https://lore.kernel.org/lkml/20220714031123.2154506-1-yangyingliang@huawei.com/
> ---
>   drivers/gpu/host1x/context.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
> index b08cf11f9a66..5cf9b98bedd0 100644
> --- a/drivers/gpu/host1x/context.c
> +++ b/drivers/gpu/host1x/context.c
> @@ -74,6 +74,7 @@ int host1x_memory_context_list_init(struct host1x *host1x)
>   		if (!fwspec || !device_iommu_mapped(&ctx->dev)) {
>   			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
>   			device_del(&ctx->dev);
> +			err = -EOPNOTSUPP;
>   			goto del_devices;
>   		}
>   

One side effect of this patch would be that if IOMMU is disabled on a 
system with context devices defined, Host1x won't work at all (currently 
probe continues and it works though without context isolation).

I'm not sure if that's something anyone is likely to run into, but it 
might be better to get rid of one of the frees instead.

If you can update with that that'd be great, or I can put it onto the 
TODO list.

Thanks,
Mikko

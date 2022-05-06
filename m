Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629DFC433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 21:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444342AbiEFVNh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 17:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444346AbiEFVNg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 17:13:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C32B6F493
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651871391;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UC8PN3IHksXw4YLUl2DR5j2jd0ER+gWoSOxwPmBpqKg=;
        b=FWoRerSRmffaC1A6NDwhnwcJH3uWoiz+ydt/AUD6a2rTBsK0D5T4eE/V7auFlqyLXLa9ES
        2rFe/aB7r/G6UE96JYFNwFlLQiDZEnZayGS2JnTlE0OdBYo1tEtqDXcTPDIhjMIItAt3Iz
        1lfH2gdY4UwpocWTE2xXDT0WfAFsTJE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-6oryBGEFMM-PcMDAgufDSQ-1; Fri, 06 May 2022 17:09:50 -0400
X-MC-Unique: 6oryBGEFMM-PcMDAgufDSQ-1
Received: by mail-qt1-f198.google.com with SMTP id bz27-20020a05622a1e9b00b002f3c8790fe1so2087258qtb.14
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 14:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=UC8PN3IHksXw4YLUl2DR5j2jd0ER+gWoSOxwPmBpqKg=;
        b=1P5u2iPzbPkIFjBQ9JX/VTY9JC/7kATVCARsug5Z63eK1/p3ch0bWo3sTNAe1MVIE0
         u8zTyhP2Wa2efQPKbtx1mbUhFN4OpT6rDo6yJHsO5bzRlxE94JDX6OZe8hvpcGZLHTrL
         EsQXHuOoqxReme2ff/vs6zYKH3RTRh2nr+Vq2Zo3zJ5nYmPiJxcYf0HV5sqfPUlul7qw
         uGPEEADfmgi0nbJHFcmv/a376fdDC2ZwL2cEt2ybeoO7UnzbDwLl+fCiwe8LtCMkmi2Z
         tbQO9YclGoXseMDnI09ly88RjSQfNb9BDy0CitfqY37893Yjd5a0yGDwklpvu2XkFYeP
         xpgQ==
X-Gm-Message-State: AOAM532uLazr6zFe3twpqKFvyfeKOOixs1RiD27dupE7/HfO7xbDnDEz
        WYgKVfIwyosbTzKJjTdJe0NZSNGM2O3yPFIGh4hziHaL6wD6PyKDzJxvSBJXrs3Sga/6KkRHmPB
        W9I2Tg6kyA+IbvXBSx65/+TI=
X-Received: by 2002:ac8:57d2:0:b0:2f3:b3b0:ecbe with SMTP id w18-20020ac857d2000000b002f3b3b0ecbemr4766062qta.29.1651871389819;
        Fri, 06 May 2022 14:09:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXZnGn2kgpYuxbTXggVBq/gakbuX/nYQzG8wHJicm20zlfTeeC+kYw7imlv4ImNqRIYEC4Og==
X-Received: by 2002:ac8:57d2:0:b0:2f3:b3b0:ecbe with SMTP id w18-20020ac857d2000000b002f3b3b0ecbemr4766041qta.29.1651871389605;
        Fri, 06 May 2022 14:09:49 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id de27-20020a05620a371b00b0069fe1fc72e7sm3030497qkb.90.2022.05.06.14.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 14:09:49 -0700 (PDT)
Message-ID: <8ec2715e36dbd1fab8a31b4b12660ae83e29303d.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/tegra: Stop using iommu_present()
From:   Lyude Paul <lyude@redhat.com>
To:     Robin Murphy <robin.murphy@arm.com>, bskeggs@redhat.com,
        kherbst@redhat.com
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org
Date:   Fri, 06 May 2022 17:09:47 -0400
In-Reply-To: <70d40ea441da3663c2824d54102b471e9a621f8a.1649168494.git.robin.murphy@arm.com>
References: <70d40ea441da3663c2824d54102b471e9a621f8a.1649168494.git.robin.murphy@arm.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Whoops! Was going through my unread emails and noticed I somehow missed this
patch last month.

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push this to drm-misc-fixes in a little bit (assuming I don't find it
there already)

On Tue, 2022-04-05 at 15:21 +0100, Robin Murphy wrote:
> Even if some IOMMU has registered itself on the platform "bus", that
> doesn't necessarily mean it provides translation for the device we
> care about. Replace iommu_present() with a more appropriate check.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 992cc285f2fe..2ed528c065fa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -123,7 +123,7 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra
> *tdev)
>  
>         mutex_init(&tdev->iommu.mutex);
>  
> -       if (iommu_present(&platform_bus_type)) {
> +       if (device_iommu_mapped(dev)) {
>                 tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
>                 if (!tdev->iommu.domain)
>                         goto error;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


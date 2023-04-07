Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8537AC76196
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Apr 2023 09:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbjDGJWm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Apr 2023 05:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjDGJWl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Apr 2023 05:22:41 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C878525D
        for <linux-tegra@vger.kernel.org>; Fri,  7 Apr 2023 02:22:40 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i9so41843882wrp.3
        for <linux-tegra@vger.kernel.org>; Fri, 07 Apr 2023 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680859359; x=1683451359;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KDu2mvG4NPEIHKcCGyLGIOvCPFX5WKZZNT7DhCvZgQ=;
        b=hhvAjox7GYxVd7DtMWnFc67EqGqlJaO9tCII8tNw0qHeDTE5Kbm2JX7L4oNzrYOiZO
         oKwvlXAN47vZ28yEwYbdhAA1xr0BMAjYAwEWdn9P3k8pX7pHV+95apvNTLZWjVfvMLW9
         e7QuIxSDzEBPkmqPRSc66p2JDwBGEvRfMNha+Rf9PzySZGxmn24QPrfvHOUfd6JYFxJQ
         0fSQbgmvDvPzDZYedjfjCL/pkZ6K3fRIm056iv6irKSbkK62YPk6LbSYbq2sqoqk0cEG
         1hX/MvjfNQENDMN+H+yeZnbbUXCw3bkdPdAnmOYSNzeRLNIgB1naEYA4wSdUm6FkwbFR
         FlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680859359; x=1683451359;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KDu2mvG4NPEIHKcCGyLGIOvCPFX5WKZZNT7DhCvZgQ=;
        b=nL8a5keBVaV+NZixoq/6mzBSOvid1EEi02PRTxgqQVVLO4y9+6FHTohdZVM2brXYK1
         njIL0fRNkJli4EjZWlatyrefEGktGbslBaOxnOBSmIFYHIp1A/Xg6KJGo2c7YXB1/9WR
         Rggfa1P1LP9BqMtUt1PC7o1MXtBvv7Ld/JrqKrpCQPWa+JjDQCmoCObem7C+6t3meQiA
         KwXsF4h4sEbmu6d3UwbphGG4+923CEycth3i4ueDolwk0oHq/T66b2AY3UlW4A36NMWB
         iI334e6pwmQmYhw2ybTAUrffijj68vYqamKDXBlR48l/mB7lALgrId6POduZ+aLwD5Ev
         SuDg==
X-Gm-Message-State: AAQBX9fBb7I29DHUMPZ3X7kZRHZoC37O3IiKu6+woJMxrqTLk6OxKoR7
        4zprrFBikDbGInZelSTKRVI=
X-Google-Smtp-Source: AKy350Ztp8PyK5p5ytTHRbHon/CzBIM9QsJcWBDNYa5a2YdHejyHEWPeHh36OX1uyTSx0JHdtBQGfg==
X-Received: by 2002:adf:ef46:0:b0:2cf:ee6b:36aa with SMTP id c6-20020adfef46000000b002cfee6b36aamr1266947wrp.64.1680859358855;
        Fri, 07 Apr 2023 02:22:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d4bc2000000b002c70e60abd4sm4099471wrt.2.2023.04.07.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:22:38 -0700 (PDT)
Date:   Fri, 7 Apr 2023 12:22:34 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     yangyingliang@huawei.com
Cc:     linux-tegra@vger.kernel.org
Subject: [bug report] gpu: host1x: Fix memory leak of device names
Message-ID: <33894dbb-ad93-4e14-a779-9b3c33370ff6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

[ What's going on with tegra and old warnings??? ]

Hello Yang Yingliang,

The patch 55879dad0f3a: "gpu: host1x: Fix memory leak of device
names" from Nov 26, 2022, leads to the following Smatch static
checker warning:

	drivers/gpu/host1x/context.c:82 host1x_memory_context_list_init()
	warn: missing error code 'err'

drivers/gpu/host1x/context.c
    21 int host1x_memory_context_list_init(struct host1x *host1x)
    22 {
    23         struct host1x_memory_context_list *cdl = &host1x->context_list;
    24         struct device_node *node = host1x->dev->of_node;
    25         struct host1x_memory_context *ctx;
    26         unsigned int i;
    27         int err;
    28 
    29         cdl->devs = NULL;
    30         cdl->len = 0;
    31         mutex_init(&cdl->lock);
    32 
    33         err = of_property_count_u32_elems(node, "iommu-map");
    34         if (err < 0)
    35                 return 0;
    36 
    37         cdl->devs = kcalloc(err, sizeof(*cdl->devs), GFP_KERNEL);
    38         if (!cdl->devs)
    39                 return -ENOMEM;
    40         cdl->len = err / 4;
    41 
    42         for (i = 0; i < cdl->len; i++) {
    43                 ctx = &cdl->devs[i];
    44 
    45                 ctx->host = host1x;
    46 
    47                 device_initialize(&ctx->dev);
    48 
    49                 /*
    50                  * Due to an issue with T194 NVENC, only 38 bits can be used.
    51                  * Anyway, 256GiB of IOVA ought to be enough for anyone.
    52                  */
    53                 ctx->dma_mask = DMA_BIT_MASK(38);
    54                 ctx->dev.dma_mask = &ctx->dma_mask;
    55                 ctx->dev.coherent_dma_mask = ctx->dma_mask;
    56                 dev_set_name(&ctx->dev, "host1x-ctx.%d", i);
    57                 ctx->dev.bus = &host1x_context_device_bus_type;
    58                 ctx->dev.parent = host1x->dev;
    59                 ctx->dev.release = host1x_memory_context_release;
    60 
    61                 dma_set_max_seg_size(&ctx->dev, UINT_MAX);
    62 
    63                 err = device_add(&ctx->dev);
    64                 if (err) {
    65                         dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
    66                         put_device(&ctx->dev);
    67                         goto unreg_devices;
    68                 }
    69 
    70                 err = of_dma_configure_id(&ctx->dev, node, true, &i);
    71                 if (err) {
    72                         dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
    73                                 i, err);
    74                         device_unregister(&ctx->dev);
    75                         goto unreg_devices;
    76                 }
    77 
    78                 if (!tegra_dev_iommu_get_stream_id(&ctx->dev, &ctx->stream_id) ||
    79                     !device_iommu_mapped(&ctx->dev)) {
    80                         dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
    81                         device_unregister(&ctx->dev);
--> 82                         goto unreg_devices;

Error code?

    83                 }
    84         }
    85 
    86         return 0;
    87 
    88 unreg_devices:
    89         while (i--)
    90                 device_unregister(&cdl->devs[i].dev);
    91 
    92         kfree(cdl->devs);
    93         cdl->devs = NULL;
    94         cdl->len = 0;
    95 
    96         return err;
    97 }

regards,
dan carpenter

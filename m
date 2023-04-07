Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5E8C6FD1D
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Apr 2023 09:22:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240395AbjDGJWt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Apr 2023 05:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239255AbjDGJWs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Apr 2023 05:22:48 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA657EFE
        for <linux-tegra@vger.kernel.org>; Fri,  7 Apr 2023 02:22:47 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso4098809wmo.0
        for <linux-tegra@vger.kernel.org>; Fri, 07 Apr 2023 02:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680859366; x=1683451366;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAHN/CXGKB3MoWWLWw4IwQR8WT0NcGmGtE32ua85Fio=;
        b=fnAVnR//fLTEhksF6zhXwre/Lz8EGHSTWVPDu47TErpK2EkQldJ7D8tV6M6A4jE94r
         Auf9T86+AbWaYOY9AoOocUu7N6fpZL2I9VqkdH//u9w0Agg+QoodIPNeiXHysrObZYgQ
         DSR3HtXLLLS907XBhkKbbHeHTuc7FOrp1fuedLnoyAv1fCWdRpJBEhJfXVjQTBmhflF2
         rg60dk6KBY7uurF9/AmFMpRD0B0DpdsZsb60Idh9M83bfna82ouQZAnmZM+0WFUPuOWQ
         GJylSPyq9iqmFLrwnMSadPyRbUcpYzYBfjv+oJe1aEdMQhfF9oa3Hcc78lVoJg+Bqjgo
         Qx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680859366; x=1683451366;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mAHN/CXGKB3MoWWLWw4IwQR8WT0NcGmGtE32ua85Fio=;
        b=eQ9PHdV32UtJ2a9petTWBv6cX/oCffu4LKDliZCAWfjJ1rdzU1jk0oGPEKEVmoqjiH
         KigmkaO8UnvrO2jHbONRwkyCykmkCuzm+JjUl5shmoyvOFfjtwC6wnAR7av9Ociism+f
         OOWWX9zobGNQspFlAKXK2fg3zzOyj8sppwP0Fn8RV63YCeorBax52F2Pk12HslMDNPnZ
         eLtNQhB1+v5we1gFYKIYFGGvVEBgs2WvzbT1vSXyyNUthqVz+9PyN4da+E8gt89JE5lb
         Nd2FtAT4xBRjNvceHL1sbORYuLINVh9hvRI8QzDAw94uiHbr9NBpAONtTOf4v4rYGj9D
         Wsxg==
X-Gm-Message-State: AAQBX9fdbGEFZZloa9oLCwueMT/XuoQ88eshfAS5wOlZmHxU4/CgNZQQ
        ScWXL0eTMQhELIk/hTaMhGkPQCiKCZU0GQ==
X-Google-Smtp-Source: AKy350aZVRXZqA0LSuGCu5ghnoUFmSjHwuifpbjTE2BfrdbgLgWlLt+Fzu0kAPnCVeVfa/lTm2PkfA==
X-Received: by 2002:a1c:7212:0:b0:3ef:71d5:41d8 with SMTP id n18-20020a1c7212000000b003ef71d541d8mr810583wmc.32.1680859366089;
        Fri, 07 Apr 2023 02:22:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm7766510wms.1.2023.04.07.02.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:22:45 -0700 (PDT)
Date:   Fri, 7 Apr 2023 12:19:09 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     mperttunen@nvidia.com
Cc:     linux-tegra@vger.kernel.org
Subject: [bug report] drm/tegra: Add NVDEC driver
Message-ID: <29294990-de08-4806-b71d-66b769126c5e@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Mikko Perttunen,

The patch 46f226c93d35: "drm/tegra: Add NVDEC driver" from Sep 16,
2021, leads to the following Smatch static checker warning:

	drivers/gpu/drm/tegra/nvdec.c:282 nvdec_load_falcon_firmware()
	error: uninitialized symbol 'iova'.

drivers/gpu/drm/tegra/nvdec.c
    253 static int nvdec_load_falcon_firmware(struct nvdec *nvdec)
    254 {
    255         struct host1x_client *client = &nvdec->client.base;
    256         struct tegra_drm *tegra = nvdec->client.drm;
    257         dma_addr_t iova;
    258         size_t size;
    259         void *virt;
    260         int err;
    261 
    262         if (nvdec->falcon.firmware.virt)
    263                 return 0;
    264 
    265         err = falcon_read_firmware(&nvdec->falcon, nvdec->config->firmware);
    266         if (err < 0)
    267                 return err;
    268 
    269         size = nvdec->falcon.firmware.size;
    270 
    271         if (!client->group) {
    272                 virt = dma_alloc_coherent(nvdec->dev, size, &iova, GFP_KERNEL);
    273 
    274                 err = dma_mapping_error(nvdec->dev, iova);
    275                 if (err < 0)
    276                         return err;
    277         } else {
    278                 virt = tegra_drm_alloc(tegra, size, &iova);
                                                             ^^^^
Needs an if (IS_ERR(virt)) {

No idea why this warning is only just showing up now after two years...

    279         }
    280 
    281         nvdec->falcon.firmware.virt = virt;
--> 282         nvdec->falcon.firmware.iova = iova;
    283 

regards,
dan carpenter

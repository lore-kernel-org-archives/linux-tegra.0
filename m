Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8CEC77B61
	for <linux-tegra@archiver.kernel.org>; Thu, 13 Apr 2023 07:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjDMHzT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 Apr 2023 03:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbjDMHzS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Apr 2023 03:55:18 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AABB1FFE
        for <linux-tegra@vger.kernel.org>; Thu, 13 Apr 2023 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3MrNiM6Co7SAlia0PRof8UP/p7I/0R+gyTV/4SbexN0=; b=yAoq8MrH3a3XzLiOpJtO8T07K+
        Hp3vNIloMVUdiExCi+Sr8ZQ58+k2KQgQtbFICxmRYVsmJmV6kXQzJ5PolZkOkmDRMX1BQjwHfrb6q
        x0SSGZ9+NGXbsYZB+fU+/4XvkYihD6cOD1ycdylkQeewhbgrevGjIzged3g3yQN9DQFjgA3uujkoe
        8BoFXxIW9GfXirv9qVyn3CFJzbpVZmqe78zPQg7LLe4fZ6BibJk3YmEi0ioLNKmyJEGfxvNt4+Mat
        XBI/8JisR/ZFMrStXw9qLfbNWax8pCcOxCN4TNur+BFWKsH3QmpVHoxX2K03vH8MJxIGpXT4POBe4
        /eVBiTGA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1pmrnW-008hr5-DO; Thu, 13 Apr 2023 10:55:14 +0300
Message-ID: <03228379-8d49-9ccd-b0cc-e93ecd0d76cb@kapsi.fi>
Date:   Thu, 13 Apr 2023 10:55:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [bug report] drm/tegra: Add NVDEC driver
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>, mperttunen@nvidia.com
Cc:     linux-tegra@vger.kernel.org
References: <29294990-de08-4806-b71d-66b769126c5e@kili.mountain>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <29294990-de08-4806-b71d-66b769126c5e@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/7/23 12:19, Dan Carpenter wrote:
> Hello Mikko Perttunen,
> 
> The patch 46f226c93d35: "drm/tegra: Add NVDEC driver" from Sep 16,
> 2021, leads to the following Smatch static checker warning:
> 
> 	drivers/gpu/drm/tegra/nvdec.c:282 nvdec_load_falcon_firmware()
> 	error: uninitialized symbol 'iova'.
> 
> drivers/gpu/drm/tegra/nvdec.c
>      253 static int nvdec_load_falcon_firmware(struct nvdec *nvdec)
>      254 {
>      255         struct host1x_client *client = &nvdec->client.base;
>      256         struct tegra_drm *tegra = nvdec->client.drm;
>      257         dma_addr_t iova;
>      258         size_t size;
>      259         void *virt;
>      260         int err;
>      261
>      262         if (nvdec->falcon.firmware.virt)
>      263                 return 0;
>      264
>      265         err = falcon_read_firmware(&nvdec->falcon, nvdec->config->firmware);
>      266         if (err < 0)
>      267                 return err;
>      268
>      269         size = nvdec->falcon.firmware.size;
>      270
>      271         if (!client->group) {
>      272                 virt = dma_alloc_coherent(nvdec->dev, size, &iova, GFP_KERNEL);
>      273
>      274                 err = dma_mapping_error(nvdec->dev, iova);
>      275                 if (err < 0)
>      276                         return err;
>      277         } else {
>      278                 virt = tegra_drm_alloc(tegra, size, &iova);
>                                                               ^^^^
> Needs an if (IS_ERR(virt)) {
> 
> No idea why this warning is only just showing up now after two years...
> 
>      279         }
>      280
>      281         nvdec->falcon.firmware.virt = virt;
> --> 282         nvdec->falcon.firmware.iova = iova;
>      283
> 
> regards,
> dan carpenter

Thanks, I'll take a look at this and the other issue in host1x you reported.

Cheers,
Mikko


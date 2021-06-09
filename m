Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65439C48BCD
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 17:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 517DB613D4
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 17:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhFIRsJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 13:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbhFIRsJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 13:48:09 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368F6C061574
        for <linux-tegra@vger.kernel.org>; Wed,  9 Jun 2021 10:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ylMKWUYw2QnydSbeeqGqbQ4d4p3MWpA7bfKGPeJjZtk=; b=FfZ+LzTTkM2bwH2RdcG1hbLhjA
        VX+zAI/EZaPAw8MkGj3a30ZJPIAj/covmVsOD3O4k4xAWoSl7mSDACW3hVJNHm3yhuLR7nGNN17Ce
        sxVCrS0jSUYukFjZjyMXCgHC59orpp+l4oApSsAFv/Qd18qvPzKpr5VvtsT9npD7eUMwGzoQ4Q21c
        I5d202K5Fe4tvmX8tFOdhifC6FvdtdqvYj9yHmXATdmYNicGUoM3NeANpi1OtCAoyAOqbrzIp1wzD
        QaAVCLWk3K7weYi3dQgZ/xrKg0M9hcoqtvpMbNqEKX3wbtLOCj/pYGih4askvUSHK0qUWbICpfpVR
        lmsyhhdQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lr2HA-0005Qa-Qu; Wed, 09 Jun 2021 20:46:00 +0300
Subject: Re: [PATCH] drm/nouveau: init the base GEM fields for internal BOs
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        imirkin@alum.mit.edu, linux-tegra@vger.kernel.org,
        nouveau@lists.freedesktop.org, ray.huang@amd.com,
        matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210609172902.1937-1-christian.koenig@amd.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <899d773e-9a7d-062c-47fa-080161b22cd6@kapsi.fi>
Date:   Wed, 9 Jun 2021 20:45:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210609172902.1937-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/9/21 8:29 PM, Christian König wrote:
> TTMs buffer objects are based on GEM objects for quite a while
> and rely on initializing those fields before initializing the TTM BO.
> 
> Noveau now doesn't init the GEM object for internally allocated BOs,

Nouveau

> so make sure that we at least initialize some necessary fields.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 520b1ea9d16c..085023624fb0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -149,6 +149,8 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
>   	 */
>   	if (bo->base.dev)
>   		drm_gem_object_release(&bo->base);
> +	else
> +		dma_resv_fini(&bo->base._resv);
>   
>   	kfree(nvbo);
>   }
> @@ -330,6 +332,10 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
>   	if (IS_ERR(nvbo))
>   		return PTR_ERR(nvbo);
>   
> +	nvbo->bo.base.size = size;
> +	dma_resv_init(&nvbo->bo.base._resv);
> +	drm_vma_node_reset(&nvbo->bo.base.vma_node);
> +
>   	ret = nouveau_bo_init(nvbo, size, align, domain, sg, robj);
>   	if (ret)
>   		return ret;
> 

That works, thanks for the fix!

Tested-by: Mikko Perttunen <mperttunen@nvidia.com>

Mikko

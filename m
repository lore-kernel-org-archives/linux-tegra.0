Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254FEC07E95
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Jul 2021 13:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F423B613F3
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Jul 2021 13:01:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238357AbhGPNEg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Jul 2021 09:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbhGPNEf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Jul 2021 09:04:35 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F158BC06175F
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jul 2021 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VZu2GiDvQzydJQR/9E6JpZpGg3cTSLxwSbruWaex61A=; b=dfdVLkS0MKrPtriesm71h5HQFs
        jaqXEgvrZaEQrDcbggm3g6yAK97h67EIeLEi/OLWrJbiG9NMfCwW0p7dbr95/pYkBj2DMvL+6Mqpj
        BIKUeXClP3T7CIFQhONRpSDn+73j3v/b+VgJhwF0E/Ksq5LuiUIBtWeGniTUP+EeiUNULoQGIRZLn
        YUAXbDXZ/S3q8kK9aUrGy3GCuWE4xnfg708AeCLErO9afIQMBCiBT4mzE0wonNdOEHn0y3Qs9uJkF
        VNnQ6ZIhrp+Hp2/8wB0xwnaiolE5ZF6SduQvlqaRLAa4+T3rIOdUVxgsgMjdgg0Y1ZC6fIZ5K10ON
        GBP1bcQg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1m4NTE-0007pf-NO; Fri, 16 Jul 2021 16:01:36 +0300
Subject: Re: [PATCH] drm/tegra: Fix compilation of variadic macro
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Linux Kernel Functional Testing <lkft@linaro.org>
References: <20210716124600.507871-1-jonathanh@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <83f943ec-6685-f467-e7a7-358ac4ad4068@kapsi.fi>
Date:   Fri, 16 Jul 2021 16:01:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210716124600.507871-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/16/21 3:46 PM, Jon Hunter wrote:
> Commit 43636451db8c ("drm/tegra: Implement job submission part of new
> UAPI") added the macro 'SUBMIT_ERR' that in turns makes use of the macro
> '__VA_OPT__'. The '__VA_OPT__' macro is not supported by older versions
> of GCC and so causes build failures when using older versions of GCC.
> Fix this by using the '##__VA_ARGS__' macro instead.
> 
> Fixes: 43636451db8c ("drm/tegra: Implement job submission part of new UAPI")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/gpu/drm/tegra/submit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
> index c53b7207c478..e49630089149 100644
> --- a/drivers/gpu/drm/tegra/submit.c
> +++ b/drivers/gpu/drm/tegra/submit.c
> @@ -24,7 +24,7 @@
>   #define SUBMIT_ERR(context, fmt, ...) \
>   	dev_err_ratelimited(context->client->base.dev, \
>   		"%s: job submission failed: " fmt "\n", \
> -		current->comm __VA_OPT__(,) __VA_ARGS__)
> +		current->comm, ##__VA_ARGS__)
>   
>   static struct tegra_drm_mapping *
>   tegra_drm_mapping_get(struct tegra_drm_context *context, u32 id)
> 

Thanks for taking care of this.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

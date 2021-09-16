Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D72BC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 15:56:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28DDC61212
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 15:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240091AbhIPP5p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 11:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239855AbhIPP5o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 11:57:44 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0746EC061574
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 08:56:24 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b18so18916634lfb.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pXiUgJm3/YT0R1UavljamsegHbZUJZaoEIiTrfWYSoA=;
        b=GHY66jKKKN6d6NjmPVoR2XlGuFlev8iy/c5ihOVU98TR100xqvX1w3Un0BieaiPINE
         9/Am1ujDSZvSZSPtSracjI48I12RDzeOgNhIIx8uyM23Lr9AcZLr7cC4KbVJifaTYZb6
         bT4anUzmcM9tNVXWPJipXbk0SWwQsQAk55u+CKcHvUWg/6Ds+67ZvlBSvStGksQ4ZPS7
         T1T9MS2NK1X8Qi+cSSk5HCDKOnxodDU+iuvuciIhaSJuZ7muspgFlu1J6BqMBiY0E6Lz
         SQCcp3zzyA3V9igLPRbWbovfgbuCcYsgVWfWE7HQZ3JxZH8YQ7zakKSoDgpa8FKVJ07i
         YtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pXiUgJm3/YT0R1UavljamsegHbZUJZaoEIiTrfWYSoA=;
        b=IvLZz26pUDMGgA/g5DEdbkUhW7fUAN0xxt/MoTd6G5e2qgk+2MC5hTUnA4d3ItV+aL
         KmNU8ft6m43Ksfqerze3ycOoaRCJg/0t6RSGS80s3ngECH2/lhmgYzAaozOu1o3PRr0B
         atoT/Hw5Kio3cg8Jcadei0zjjHoa6A7O1dyCJy1FPRtmUksVmxDAzDh3TalmNaTW6lST
         12n2aLamkmJAuPjesUslzhUSAOAPouSVgNgRh/qReaoBCjsf/Hf5qI+/eyiPxkpK4+0v
         EPLTi/6lG/DVbYWbkNZU6fTUlp957zBtFywI25fUdaag2mBGtE171e6KDkwrT5pH1RlF
         uomA==
X-Gm-Message-State: AOAM532C84VEaeDkNQqz0gmPVrLH+P0MzpIop0hOZCwvroT55xLt70iF
        jUNiIhyatYmUJ0IiOy7qLzZbbhEuafI=
X-Google-Smtp-Source: ABdhPJyvXF8R0TDGw96Rj9ymltmjLPtCdAGmk3RkPsV/K0jPLnautylfP8phTSCr/NYN5Yyi+51ZLg==
X-Received: by 2002:a2e:8881:: with SMTP id k1mr5430414lji.443.1631807780987;
        Thu, 16 Sep 2021 08:56:20 -0700 (PDT)
Received: from [192.168.2.145] (94-29-62-67.dynamic.spd-mgts.ru. [94.29.62.67])
        by smtp.googlemail.com with ESMTPSA id r11sm392491ljk.71.2021.09.16.08.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 08:56:20 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: Use correct property for BO size
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210916141307.2010255-1-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <458e09d5-dba0-8c80-a58e-f2ce27973b18@gmail.com>
Date:   Thu, 16 Sep 2021 18:56:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916141307.2010255-1-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.09.2021 17:13, Mikko Perttunen пишет:
> The size property is not always populated, while the gem.size
> property is.
> 
> Fixes: d7c591bc1a3f ("drm/tegra: Implement new UAPI")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/uapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
> index dc16a24f4dbe..690a339c52ec 100644
> --- a/drivers/gpu/drm/tegra/uapi.c
> +++ b/drivers/gpu/drm/tegra/uapi.c
> @@ -222,7 +222,7 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
>  		mapping->iova = sg_dma_address(mapping->sgt->sgl);
>  	}
>  
> -	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
> +	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->gem.size;
>  
>  	err = xa_alloc(&context->mappings, &args->mapping, mapping, XA_LIMIT(1, U32_MAX),
>  		       GFP_KERNEL);
> 

Did something bad happened to [1]? Thierry fetched patches, but didn't
make the fixes-PR yet, AFAICS.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20210817020153.25378-3-digetx@gmail.com/


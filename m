Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB1EC4727D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 15:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5889720708
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 15:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDay96xu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388091AbgJBPCW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 11:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388016AbgJBPCW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 11:02:22 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615F9C0613D0;
        Fri,  2 Oct 2020 08:02:22 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u21so1443452ljl.6;
        Fri, 02 Oct 2020 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ka6/K8mHHg9ZELEKZJRCDuBiuNpr2lVVW/5oVw+42YU=;
        b=eDay96xuK97T4BkOacSyhPCI9JzHTkiEJd6IX+cevA6rjO1X2KA03bRFPyuF765F5x
         o3aftheCQj1UBhsqfgcVgiRSy9aU7rKYUP7im1zsGUVgXtssIcdLQevbUex90jG/sO42
         B19vVAzZ0y9RgAayIYaNwbE3tWT8VkER55kctULFIZrSBaIjLJwBe1mSzzjeq7U9gGDa
         G09jaaccZxjMy2WSxJDNeDwnKDWXdjYQ1lQvYg7SayTy/e63R4EQ5/LXVbyKV7/up1zb
         Q3dPzHlSr1jfv381FKITRhTebp3sC8atHLKdYU59cqjU6B/NuPdIpQm52Gtf/dXOwq4L
         CLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ka6/K8mHHg9ZELEKZJRCDuBiuNpr2lVVW/5oVw+42YU=;
        b=mEURNAqb/7VwYE7MiKZGjYa6mN9Ew5XJAuFozArVQ/+8bMK2nQH1Ez3oisY+Ky1SSJ
         5Ku9tUt/6TWlr02Tkn8ccuXVcERySG79kaQrPBmFc/JxuztdMNyljxe5TsL/h1GGYE3E
         mhepP0/0cVK3Bq8xSS1oE6y66ZRxPk/P3Zqd/J0Ik2Bi3BSIaYPqNuliaxSqbG+nGNI3
         72qp48VcQ7+dmcab/xYxIkbzc7VDr9yIhuyPogovWwo7eyN64hG4DK1chqAZDoR0hJDW
         mtpmbDAFOIijMSKWar5WYHHFX5P2w7WDpY0uWC+YZX6jxLP3toSs9LAkdxvVKzoxlLK0
         kHmg==
X-Gm-Message-State: AOAM533qAUGLJdPunrTPNnPdHHEOFo4+KEUIwJJeGGXscuAKwVoVrWpT
        LUn9Yj95qHZqfpaE+DfFfpVhVkZpX8U=
X-Google-Smtp-Source: ABdhPJwOT67jY7lMUAS0fLLHRBVwgEk4tvyQGOTRnJAWl+2qEQbUHagbwWasPsBuUvDWZwsOqRYGqg==
X-Received: by 2002:a2e:b5d0:: with SMTP id g16mr814724ljn.402.1601650940389;
        Fri, 02 Oct 2020 08:02:20 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id u22sm338978lfl.160.2020.10.02.08.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 08:02:19 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
Date:   Fri, 2 Oct 2020 18:02:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 09:08, Nicolin Chen пишет:
>  static int tegra_smmu_of_xlate(struct device *dev,
>  			       struct of_phandle_args *args)
>  {
> +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
> +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
>  	u32 id = args->args[0];
>  
> +	of_node_put(args->np);

of_find_device_by_node() takes device reference and not the np
reference. This is a bug, please remove of_node_put().

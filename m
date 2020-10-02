Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B143DC4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 20:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7760220719
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 20:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T81o//pZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgJBUCi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 16:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgJBUCi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 16:02:38 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF56EC0613D0;
        Fri,  2 Oct 2020 13:02:36 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g9so988085pgh.8;
        Fri, 02 Oct 2020 13:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BtsPYLpAMufKGWwnGEKTqB9MkTUnZICqfQTREezelnU=;
        b=T81o//pZG8Y+t3X9oXq+D1OnjZHgwAeMGO8ZiaCU2fF19keT2jiqZ586ay+iX6AJtK
         ywyxMTg3vOZtadLO2DCWnuLbDQxN9blNWlZ9Y76e/1qgOHEqoREh99LU7BzSpfz2HiFZ
         0SRlxwLrBFeyBSNXMkYBvCfRFFOaXVlt2OVuqtglSqJ8PIGhquJigt6K9pApZGOCLz2+
         gQ1YJ/zln/dUJ5sP0pW1ViKsLZsw6Fv/XaphMM2lcejTgBvdzNAwl/dQpejPWQ9qkwKz
         PZppGSdsdPa3yySLmrCKvmx1w2IRrS/g0UFcLR2oTomqJvstWhvNg5M3ituCvURuv0zc
         d9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BtsPYLpAMufKGWwnGEKTqB9MkTUnZICqfQTREezelnU=;
        b=Arl6g3insfSU2bil3YhGBm8NpwGV3/rK0R7vP3HxgBKwtguYp0siK7A/g3LJkbI+pM
         GOcdEXrzacTBNCrTinhFogPm55xSCSa6MAiaFOO4CamFUm8fBkpfJld4O6N7Zl1teOQg
         Kh4vEyhwdtDa7mCU/WlK/mv2lmNcX2pzY8S5buE81Qso/wtcH3zJgbutQoNLmlSPsHNT
         NR11QOKzi+C6UicMA+cucVkdiZx4NHHHxplkZoSrmyIYUKK8p3iMvgEatWW9370GmyIX
         whclK60fyqihkvnhwPDe/u0PaafCOEwABmJdsGE75lZnZ8RH4OBw6CgrbviG28g9B3la
         fkhg==
X-Gm-Message-State: AOAM531YaI1hSaCopLQMjY7ReKWPV1GIECVjB2Tl/LqU08pGtiuc1vNj
        bMg85vsa0rMrOV4qW/4CQuwaBeuuhfo=
X-Google-Smtp-Source: ABdhPJw0UYHYiLrK5fM7kDLHdJn1FJhT3JSmNJW2icisa3rxUA/JNqsNNgnApTiKeNc3DaoQFggucg==
X-Received: by 2002:aa7:8216:0:b029:142:2501:3968 with SMTP id k22-20020aa782160000b029014225013968mr4291222pfi.45.1601668956391;
        Fri, 02 Oct 2020 13:02:36 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id s14sm2320791pjr.39.2020.10.02.13.02.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 13:02:36 -0700 (PDT)
Date:   Fri, 2 Oct 2020 12:56:38 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
Message-ID: <20201002195637.GF29706@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
 <75ad716f-aa2f-743a-7d9a-7083eda03672@gmail.com>
 <cb90ebab-9800-c9b4-6fb7-3d53875195a0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb90ebab-9800-c9b4-6fb7-3d53875195a0@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 02, 2020 at 05:52:00PM +0300, Dmitry Osipenko wrote:
> 02.10.2020 17:22, Dmitry Osipenko пишет:
> > 02.10.2020 09:08, Nicolin Chen пишет:
> >>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
> >>  				 struct device *dev)
> >>  {
> >> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >>  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> >>  	struct tegra_smmu_as *as = to_smmu_as(domain);
> >> -	struct device_node *np = dev->of_node;
> >> -	struct of_phandle_args args;
> >>  	unsigned int index = 0;
> >>  	int err = 0;
> > 
> > Looks like there is no need to initialize 'index' and 'err' variables
> > anymore.
> > 
> 
> Same for tegra_smmu_detach_dev().

Can remove them.

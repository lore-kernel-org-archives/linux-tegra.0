Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C51C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 18:57:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E6146113B
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 18:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhINS6o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Sep 2021 14:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhINS6n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Sep 2021 14:58:43 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FD3C061574;
        Tue, 14 Sep 2021 11:57:26 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id f21so6651861plb.4;
        Tue, 14 Sep 2021 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=g2+loS70cSgdFxeOP/sRqiawauBWZZoV++pN8aeuNG4=;
        b=LiNspIrKHZ8lHoj51foc14YEVker+hYXD5WF7LtIW9JrAXaWxwNzMiZ7xZoVWbD56P
         MlFik++pPRVz1wMEMRg0xe0uhGUAVrFDWHIsl5zMK0v3OPiy9BPD8vIvB4rBSZDgwaKq
         46NuEayBAIue4b0SSqeqACnyrYFZsCeiXF4+IUceZp71L8dOXKnnrCrHHDCc9NPJp3AL
         8KhA1a0Gw4MSqKRZvyU9vcKv7FsJdQZ8vZxLCLxHxJm6nOYwgOeqrtO2pK5FkBCmhHVx
         PK1IE/dSrc8ZJG9VL6NT7kXko3iE9mZF7frY1a+63UCcRBror9iuqWugJdnwQBeLi7NZ
         sPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=g2+loS70cSgdFxeOP/sRqiawauBWZZoV++pN8aeuNG4=;
        b=1viJGb0v20uQvxUbbApBRyEd2GoER1X5w7RI7lr9d10rEGTXsDxKLfa1Krwb76Mj2N
         xgYlP5/X+FuZnkzT/0LMdsrGnhMCckGJ3UnRm7XSMU88KiUJ3tDH9Rz10LMZm0C/Fguo
         wDsXnkyiL0E32rNEHW3gImwQAsTBWBvzp9CY8cpPv7OkVqRDvquni/j1fgPfWT2XDdhd
         +ucvdlEg6LQmFQM4vZfBby+TU7fdM5VH29fWqo/cdmL/rdVtD4+INxq5n7ZdKidWlq55
         Jb8YQ3qq1I46NEI77TY9wchp/UsA5xbBd/FQjcNV64T1sUhWQ1R6Kk8NQwRMLAL0Rb6G
         nOBQ==
X-Gm-Message-State: AOAM532zbqROIsV3Rem/5huNIpZujER6FCq/b/eo1+83OgoETwdpVyEG
        Iv3KhuWMkyYLlehLZuRzgsg=
X-Google-Smtp-Source: ABdhPJxCnIRlsaQZc9Q4J3l7LWo55eKXeafd5utGpHYG1mnIrZXruWW/b6d7wLz5hFUBc4vE7exkkA==
X-Received: by 2002:a17:90a:1984:: with SMTP id 4mr3788827pji.87.1631645845834;
        Tue, 14 Sep 2021 11:57:25 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id x15sm12057669pgt.34.2021.09.14.11.57.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 11:57:25 -0700 (PDT)
Date:   Tue, 14 Sep 2021 11:49:34 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to
 debugfs
Message-ID: <20210914184933.GA32705@Asurada-Nvidia>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
 <31501a62-3312-9f04-3bb8-790d0481746c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31501a62-3312-9f04-3bb8-790d0481746c@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 14, 2021 at 04:29:15PM +0300, Dmitry Osipenko wrote:
> 14.09.2021 04:38, Nicolin Chen пишет:
> > +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
> > +{
> > +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
> > +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> > +}
> 
> We know that IOVA is fixed to u32 for this controller. Can we avoid all
> these dma_addr_t castings? It should make code cleaner a tad, IMO.

Tegra210 actually supports 34-bit IOVA...

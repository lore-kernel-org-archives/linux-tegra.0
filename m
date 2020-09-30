Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F62C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C74A20706
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBLomMXf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgI3Fj4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3Fj4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:39:56 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CECC061755;
        Tue, 29 Sep 2020 22:39:56 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bb1so326650plb.2;
        Tue, 29 Sep 2020 22:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Sfmy7ZZk8UYvhy6RI4/Gpi21fRi4lNKb0jBd0kAjjJg=;
        b=nBLomMXfzt25vf2Sp3AqO31imNEOWbZcgTQPPOCYTE8aOFY3RPAHFBcs2UwqO3CJzD
         47WXkMWRUsgzBxptzv0S/eO2EoljUV58BKgQ241e/Ey66Zf4bh9VUBy8TchAtu8UMcfh
         tmUkh6/qvB436J9VJBOolQu89lFV7v1BB3kZ0pjbiV/2NN4MRAl45WaaBygyCdNt7zxD
         xzafK1VUznndfBPTehWmGfPoR6WVZiZVoKz/uw9VwNQYsQybSvnavFU6gLvWbDfImHC8
         D+mWmzNOFwaF9QvHktr+deKI9kFNYy9JlmrR7p2TAf7ft60cXbMEwtK0762FndRKX7zC
         bqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Sfmy7ZZk8UYvhy6RI4/Gpi21fRi4lNKb0jBd0kAjjJg=;
        b=SxsuK2zOQFZT2X7y4Ktqb3sx719jSJEPJJv8sBSrlZNfWbm/GBbso6Aw32XH4d+9ve
         QWImIAvps0P6cndExtNnZ7q30+j8CgUH5WQ6HDsspjcfAFuRFcpoZw5mNCbo5rSA01uP
         1GRBZxi8bv5O6Ak1S6eBIDFQr6S8f94g1ZSlxXdFJfahZ5mi5roh0KhMCrVm3P3wIvVK
         Dyoq4cKdohgL5yZDVRsOJAn6hbkG0gyUMXGjIRYiy2Le1UOD5EpfEhEtv9Zbdy/xYztw
         78Rtqcfl3isEVkSFvey5AmoP0n0Ym1UF9hjiVpQAshMYmPOF9hEdgfz2Y4Hg5nBp0EKU
         MM6g==
X-Gm-Message-State: AOAM530fHyza36qR/HgmxmlXR5fBtJD1cylJuACkZGf4zzBgsMwi5bwt
        AE2IAHw07i2D1WkrCPgVGI4=
X-Google-Smtp-Source: ABdhPJyyhjRdMS6ldpAFpjKqaSpdHHXAmWHoyYuuQf3hOBabEmtv2ZkvYbkAJONPEBqd4PWKJ+HmiQ==
X-Received: by 2002:a17:90a:1f43:: with SMTP id y3mr1055313pjy.28.1601444395688;
        Tue, 29 Sep 2020 22:39:55 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id o11sm687625pgq.36.2020.09.29.22.39.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:39:55 -0700 (PDT)
Date:   Tue, 29 Sep 2020 22:34:25 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20200930053425.GC31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <5a91f07c-bc27-7607-915c-e98a7a0c4b24@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a91f07c-bc27-7607-915c-e98a7a0c4b24@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:10:35AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 03:30, Nicolin Chen пишет:
> >  void tegra_smmu_remove(struct tegra_smmu *smmu)
> >  {
> > +	bus_set_iommu(&platform_bus_type, NULL);
> 
> Why only platform_bus? Is this really needed at all?

I see qcom_iommu.c file set to NULL in remove(), Probably should
have added pci_bus_type too though.

Or are you sure that there's no need at all?

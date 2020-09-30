Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DEEC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A02C620706
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqp4vmkd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgI3Fdh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI3Fdh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:33:37 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEEAC061755;
        Tue, 29 Sep 2020 22:33:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id l18so237881pjz.1;
        Tue, 29 Sep 2020 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OmxpJuvijh0m6kJcF1u1drddAJ2BLcjqzo+pucKDFhY=;
        b=nqp4vmkdnFydbbSm+m0QjFWfBzAsAjfdi8rm2h2f9jz87VU+oto3pBdY71rBrklkGt
         E63lSJUmcKNwPNVphQNlnwwrM++BWwXMYn0IkCrBOAW74ef/WgDFGjLRonwlofMxesji
         xajr0wGt+ED8HcxXD9WpGvmx093Vj7nxAtzFSEtmDrZ0x+tmdwbsUMxCTn/97F3KesOn
         PnPPaNTSXPRs6iqleYiJ6dGgOIVbrKV3uV0rgmO/gWhf7qsaflm8bUZIQqHWZ3naNAxf
         aFJMSpDAEVGBaEDlA5/u1fK2YYdHOOVfZRsEAu6Lxx6l6iyRuBzHHkQksRuCc2Ka7FaG
         BiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OmxpJuvijh0m6kJcF1u1drddAJ2BLcjqzo+pucKDFhY=;
        b=SKrDbfSGR7mcoX3Yqw1DLdok48szXAzgOH6tc5ErYk3Hvq9tVeDu4JTy/YWMDBRJ6O
         jAGIeTngrVK61TwXaFBJ6uTgB053XzidAUUu+oASeZpTDnXb5Z0o51kJg9kifkpWz1n7
         pzm7VZBKPCONQ8DaAufTiieekwONqmR7inL03SrJBxL+2mwvb/XmDJf4Fh0gm+5oS2ff
         nfjMqr4UhsJRFkxVNBNWQp0t4enrmgUNTQ7cow5gq9C8eB/3ifPUo1HpKyvxDCNtaFsE
         py2vBAHRMnO35rBFtl9+0/wwWvLY5FnHrbyjY4ch/96vPY2hS4Dd0Yj6RJ6bebtc+RMJ
         UjjA==
X-Gm-Message-State: AOAM532YmQK7JIA6tGW1ywaOdDUxqjexor5RZKryBTEQjh/Pq/Yi4KOW
        SZ+CCBvBD5w11q2uGaLtrpQ=
X-Google-Smtp-Source: ABdhPJz8999KVOIETNd5trWMtQBQibv12Knp50lGI0K0vTSJfuEJs2akAi00z6JP0DZT/qRZNRdhAA==
X-Received: by 2002:a17:90a:8d05:: with SMTP id c5mr994931pjo.222.1601444012558;
        Tue, 29 Sep 2020 22:33:32 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id c1sm648658pfj.219.2020.09.29.22.33.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:33:32 -0700 (PDT)
Date:   Tue, 29 Sep 2020 22:28:00 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20200930052759.GA31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <27b155ec-97ab-98f6-7b48-3fded875d5cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27b155ec-97ab-98f6-7b48-3fded875d5cc@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:10:00AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 03:30, Nicolin Chen пишет:
> ...
> > +#ifdef CONFIG_PCI
> > +	if (!iommu_present(&pci_bus_type)) {
> 
> Could you please explain why this check is needed?

That's referencing what's in the arm-smmu.c file, since it does
not hurt to have a check.

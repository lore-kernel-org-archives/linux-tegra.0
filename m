Return-Path: <SRS0=Zq/d=DL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2233C4363C
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:10:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C9142078A
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:10:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6k5GDo4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgJDWKV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Oct 2020 18:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgJDWKU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 18:10:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7142C0613CE;
        Sun,  4 Oct 2020 15:10:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t7so4414185pjd.3;
        Sun, 04 Oct 2020 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OQzkxKGyzm6JFhBLiUsozBGoWcCHRGIABPwIBAlSRLE=;
        b=k6k5GDo42aNXzh949rg/z30OVRag8e/ShW4sQJTZrjciBTIEh4ZuraWKz2JvdPd0Sg
         pk48L6TwL9Shrfcpg+8C2Vkxdf8OKfoD+O4WZIZ9glSzbpMiabxC+mSNuhnhthE1qvKL
         5F2ZnACOdOFTdF1LDWP9y5lXCkWP4JvGodLRUyqcyPXZMaDybCd8HdKb67Anqi82K2xu
         kUNOr9dyIqPPw+PssCLcZ2txnTa66hl9YEo6ZwPtiDHT4rf67miZBKCtIV5zBQEqWGK8
         22Tbzkoh2jUDUifQP4V6sjpSSrgDEuQz6/j+wbkR1VjrgAlb2gYtFb1NJ2SdyV+Hd5iO
         tqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OQzkxKGyzm6JFhBLiUsozBGoWcCHRGIABPwIBAlSRLE=;
        b=ovI0Adu3ryHumyEK5j8JCsbnwtKVhskG8DUHpllYnCnuyZtzWsoNDsNp6KVvro8MwP
         sf2h77rcsTTwVIgfrwdGMyh0fQLo483LBnMwxYG0yP2jdJwHJ6S45aWjSnmAmlTLeW9B
         c1wuMDS/ytK8EN5b6ICvdBpS2tIK2Lhskd5B9zFO9a4h1Lg/G76Qv9fW3JbgZfJ4tsOd
         5+y75g8k3+VQKd17n4+NB5UF+bDnQL7bsYFdl8BJw8lIEV7ER4GtA2PO8nE81VS1omas
         fnKqgs+zywqteVIgw7ad/p2Tj9WJO6TurtUbUXQTHO3y8zqKWy+R4PDU29D/HE181YcV
         4Spw==
X-Gm-Message-State: AOAM530CUP19w2stVt4dlZHHLd59ugUvNENexVnsqmsneij0mX/roZbC
        9MV4A2WKWXh7Aq/RCa8Hb5cZNBO/UQA=
X-Google-Smtp-Source: ABdhPJxl/7t+gO+zB4kzamD4T5F4Dlp0mz8AG0ZxG1Bep95oYXElnMKKu29cQuEUDFQxlwVmEaN2HA==
X-Received: by 2002:a17:90a:174e:: with SMTP id 14mr7111874pjm.124.1601849420319;
        Sun, 04 Oct 2020 15:10:20 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id u6sm8153777pjy.37.2020.10.04.15.10.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Oct 2020 15:10:19 -0700 (PDT)
Date:   Sun, 4 Oct 2020 15:04:00 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201004220359.GB21420@Asurada-Nvidia>
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
 <97d69b0b-db32-08ff-0691-73cfa571f974@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97d69b0b-db32-08ff-0691-73cfa571f974@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Oct 03, 2020 at 05:05:52PM +0300, Dmitry Osipenko wrote:
> 03.10.2020 09:59, Nicolin Chen пишет:
> >     ubuntu@jetson:~$ dmesg | grep iommu
> >     iommu: Default domain type: Translated 
> >     tegra-i2c 7000c400.i2c: Adding to iommu group 0
> >     tegra-i2c 7000c500.i2c: Adding to iommu group 0
> >     tegra-i2c 7000d000.i2c: Adding to iommu group 0
> >     tegra-pcie 1003000.pcie: Adding to iommu group 1
> 
> Could you please explain how you got I2C into IOMMU?
> 
> Are you testing vanilla upstream kerne? Upstream DT doesn't assign AHB
> group to I2C controllers, nor to APB DMA controller.

I have local DT changes adding iommus property in i2c/pcie nodes
to test group_device() and pci device, yet neither of them is in
vanilla kernel. The log is merely to show to people the sequence
of iommu core prior to clients.

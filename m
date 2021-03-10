Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB3EC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 22:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68DDF64FC3
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 22:11:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhCJWKl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 17:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbhCJWK1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 17:10:27 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D26C061574;
        Wed, 10 Mar 2021 14:10:27 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id y13so9638042pfr.0;
        Wed, 10 Mar 2021 14:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=842g7c9Tn0Z3vLdWgTHxvqUqf5VmKZ15G35dMX8yNNs=;
        b=VYNAz89I+dztCb63TA5G+CqSH4s4uZSzFUtQS4MqK4KH1ngNNnM5zLTn1e+0S77hF0
         2hNzjqrbXkCDPo4DZyvefpHiqos4YmuAr9hbgT25tFm6aDEzT6w3LH7KPzNpspl3mJaV
         NbDqclIaQ9Kqb5OR5VBjFSOzJqf1oeTf2qDBCfOlYx+NMwpcfPMfpNp5QtCNweUpUs7o
         weu7zwvLuoAwJAAcGrrcVZ3xhms9aLx7M16skUJPAKsUefLYllPLZfMZitCXjMZZFW7x
         HNBn2Crt979arvZhs24LmuvfHRw+S6GlmYm2tqwRfefJIhtab4crscG2ItBGu61yCKL0
         yQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=842g7c9Tn0Z3vLdWgTHxvqUqf5VmKZ15G35dMX8yNNs=;
        b=rRH7yVCW0SfZuJHSJnPXMMm5rm+EK5L0BrwJ3A41NMSxLkBPW6VhV6QF60dP9Uo+Dr
         KExstIPsd0iq+cn3dDirajBzKqirVtp+ys0tCJEWdHSP06aXS1/6DusBV6Qvu8SmAqRm
         ue3fPtJdQs1af2to1txDTNLMmWUSy1TFfP6n4lN7bg326gtvwtSIF/jCB4qJWU5EDNwG
         3E/ZUkxYwTC0YSgGbJ88sf6AimiOZ+1OUG2ZC4mY0WGAQBix0KonFpAg/jtIYULKoD1j
         pMxL2D1U20M1UlammDvgRPy24/v1+k+N4yBDFRUmQIRrZhjvWa63fgHprLcaec3ajNm6
         5KoQ==
X-Gm-Message-State: AOAM530XU5O46TVj8YzQKtfnMXXvuS/DnU6xBBCtsVrrvu3J0iMc4N/f
        DMzO/iWzAqRMOUsZkWZKUWl6Jhy8n9DCzw==
X-Google-Smtp-Source: ABdhPJx4d2837GNgaZU1BEW7RVpyIJA7zsGwnRxN5Nth6O0xbgiD/FkbfW5Msi832YRG01718dg+6A==
X-Received: by 2002:a65:6641:: with SMTP id z1mr4422868pgv.399.1615414227133;
        Wed, 10 Mar 2021 14:10:27 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 21sm428760pgf.69.2021.03.10.14.10.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 14:10:26 -0800 (PST)
Date:   Wed, 10 Mar 2021 14:08:09 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/tegra-smmu: Add pagetable mappings to debugfs
Message-ID: <20210310220808.GA10431@Asurada-Nvidia>
References: <20210310033614.16772-1-nicoleotsuka@gmail.com>
 <cc5dca8f-e9b0-a845-1af4-e762782d5441@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc5dca8f-e9b0-a845-1af4-e762782d5441@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Mar 10, 2021 at 11:38:47PM +0300, Dmitry Osipenko wrote:
> 10.03.2021 06:36, Nicolin Chen пишет:
> > This patch dumps all active mapping entries from pagetable
> > to a debugfs directory named "mappings".
> > 
> > Ataching an example:
> > 
> > SWGROUP: hc
> > ASID: 0
> > reg: 0x250
> > PTB_ASID: 0xe0080004
> > as->pd_dma: 0x80004000
> > {
> >         [1023] 0xf0080013 (1)
> >         {
> >                 PTE RANGE       PHYS           IOVA        SIZE        ATTR
> >                 #1023 - #1023   0x122e5e000    0xfffff000  0x1000      0x5
> >         }
> > }
> > Total PDE count: 1
> > Total PTE count: 1
> 
> Addresses are 32bit on ARM32, please fix the formatting. The phys_addr_t
> and dma_addr_t have special printk specifiers [1].
> 
> [1]
> https://www.kernel.org/doc/html/latest/core-api/printk-formats.html?highlight=printk#physical-address-types-phys-addr-t
> 
> as->pd_dma: 0xc026e81b0000026c
> {
>         [0] 0xf0082848 (1024)
>         {
>                 PTE RANGE       PHYS           IOVA        SIZE
> ATTR
>                 #0    - #15     0xc0f9fc40bfde0000 0x0         0x10000

Thanks for the feedback! I will send v3.

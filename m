Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC7AC433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 22:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22356610A6
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 22:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbhIOW2j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Sep 2021 18:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhIOW2i (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Sep 2021 18:28:38 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E69CC061574;
        Wed, 15 Sep 2021 15:27:19 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w19so3985221pfn.12;
        Wed, 15 Sep 2021 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Xjyd5hMkpqMPk7OhcHiCF4/y/tnGWYGZ0keB+odd2Ng=;
        b=PlXQITEvZmBc1n7tRBdgd+gUsoQd7z+WeqSbwCW0Y6fVI8yT/SQH/gZOWj1rEd5PGH
         swNw22KZC8xoIpuwIOQB0qBuBZBZVQWgdu04NyU6/ozEYdI57WYsUCIzwUwa/fXkskfb
         Alz/fQ0BjBNdtF+77mNK0GKHlJt/0rPr36QxGX+0/Gyr17UmSRlTyBf9gjrH2asTZyW/
         gBPr3uUgJJ/xedmcsnp7l2LPZ4ZTqdm51B1jx6lrUzYPnij2Wz8OZIQrhM6EroN8hPM3
         /F/NaGZD2ImE0QW0yTglhOgYeRTL9MoYcjhqUOgNuIyemHOGS5JDWeTfwft4goXa85x5
         gfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Xjyd5hMkpqMPk7OhcHiCF4/y/tnGWYGZ0keB+odd2Ng=;
        b=Y225gL00UyvafN3CHhLEq2RPdF2NAE11ibzq7FBZbil+84ckG/PcQnH4crlHCGFrZS
         6zBe4J8SyvT0sdVc3s28rxdJ4lgkCHAigC8HhCYw17GIXIBB0hqEgFb10hx8jSpUxnI1
         Qxthfc1Dg1gxdPISd1f1F9nZlSBB+b/FQUaP3dbB797tchieWd5GP4ziBNi9gD1EJPAq
         yEGQ8Sqtfq1vecrL/Y1LJ6k+mbDk1zefdIhQc6J2xwqv71dKHwCVLuptW2IzzIPmZkmh
         y4SSIAOVaHJRWHo86JEal+SbVvJoBqLSiQCdre7B0fZOkc0oiBI8z7T38dixgR12qh1s
         0FxA==
X-Gm-Message-State: AOAM532/V6GMGFaV5pZ2/8dLF9hH1dcBsrXrzCBqJU9AdTkX7LijHE6C
        hhIg1GKbBKEjbU/uKY8FXjc=
X-Google-Smtp-Source: ABdhPJw3biDmUuN9v1ueAp+vI6CP+EYWCLxdUEgAvtkkJ6srbsFEnvpRNyy9gQ4borOgaHrubiOtQg==
X-Received: by 2002:a63:555c:: with SMTP id f28mr1943370pgm.340.1631744838735;
        Wed, 15 Sep 2021 15:27:18 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id m12sm556664pjv.29.2021.09.15.15.27.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 15:27:18 -0700 (PDT)
Date:   Wed, 15 Sep 2021 15:19:27 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to
 debugfs
Message-ID: <20210915221902.GA20845@Asurada-Nvidia>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
 <31501a62-3312-9f04-3bb8-790d0481746c@gmail.com>
 <20210914184933.GA32705@Asurada-Nvidia>
 <25d68aff-323a-df54-45f9-55b22f3089e0@gmail.com>
 <20210915043806.GA19185@Asurada-Nvidia>
 <a5a77169-8711-2983-d2cb-4b94061741b9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5a77169-8711-2983-d2cb-4b94061741b9@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 15, 2021 at 03:09:48PM +0300, Dmitry Osipenko wrote:
> 15.09.2021 07:38, Nicolin Chen пишет:
> > On Tue, Sep 14, 2021 at 10:20:30PM +0300, Dmitry Osipenko wrote:
> >> 14.09.2021 21:49, Nicolin Chen пишет:
> >>> On Tue, Sep 14, 2021 at 04:29:15PM +0300, Dmitry Osipenko wrote:
> >>>> 14.09.2021 04:38, Nicolin Chen пишет:
> >>>>> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
> >>>>> +{
> >>>>> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
> >>>>> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> >>>>> +}
> >>>>
> >>>> We know that IOVA is fixed to u32 for this controller. Can we avoid all
> >>>> these dma_addr_t castings? It should make code cleaner a tad, IMO.
> >>>
> >>> Tegra210 actually supports 34-bit IOVA...
> >>>
> >>
> >> It doesn't. 34-bit is PA, 32-bit is VA.
> >>
> >> Quote from T210 TRM:
> >>
> >> "The SMMU is a centralized virtual-to-physical translation for MSS. It
> >> maps a 32-bit virtual address to a 34-bit physical address. If the
> >> client address is 40 bits then bits 39:32 are ignored."
> > 
> > If you scroll down by a couple of sections, you can see 34-bit
> > virtual addresses in section 18.6.1.2; and if checking one ASID
> > register, you can see it mention the extra two bits va[33:32].
> 
> Thanks for the pointer. It says that only certain memory clients allow
> to combine 4 ASIDs to form 34bit VA space. In this case the PA space is
> split into 4GB areas and there are additional bitfields which configure
> the ASID mapping of each 4GB area. Still each ASID is 32bit.

True.

> This is what TRM says:
> 
> "For the GPU and other clients with 34-bit address interfaces, the ASID
> registers are extended to point to four ASIDs. The SMMU supports 4GB of
> virtual address space per ASID, so mapping addr[33:32] into ASID[1:0]
> extends the virtual address space of a client to 16GB."
> 
> > However, the driver currently sets its geometry.aperture_end to
> > 32-bit, and we can only get 32-bit IOVAs using PDE and PTE only,
> > so I think it should be safe to remove the castings here. I'll
> > wait for a couple of days and see if there'd be other comments
> > for me to address in next version.
> 
> You will need to read the special "ASID Assignment Register" which
> supports 4 sub-ASIDs to translate the PA address into the actual VA. By
> default all clients are limited to a single ASID and upstream kernel
> doesn't support programming of 34bit VAs. So doesn't worth the effort to
> fully translate the VA, IMO.

Yea. It'd be easier to just stay in 32-bit. I will remove those
castings in the next version, waiting for Thierry taking a look
at this v6 first.

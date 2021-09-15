Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE0EC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 04:46:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2331961212
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 04:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhIOErR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Sep 2021 00:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhIOErR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Sep 2021 00:47:17 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF8AC061574;
        Tue, 14 Sep 2021 21:45:58 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 18so1515099pfh.9;
        Tue, 14 Sep 2021 21:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=yYShYH6c0JsEIbmuevIokeH+p63SJCkzU1KxDMZrMRU=;
        b=aVR0vKEEBl2GkFmYWgRMWkkIFywwAeHQ0uBq8YJMAzsGLSKzr8YECn3UeO9udZCnXh
         aPLZiHwVMZM6Or8t1xICwUm8hzLMnfakbvKdtm7bms2+tKnfez98inzHo8axZhR3VXcx
         XcWQYlgeZBpOyO2dWdRSM3GDk0ookjU3pcLyzDmq7+Oh0gGSzeB0hS0wSxumGreJZhin
         dEv/Qj404C0H2XXci+wjczU5GId2LIHpCskxHSX2JJK+pLGNvMlqJ3OkDhtUQDGuric2
         7SfrAMjjz8J/PLU2FVBQfESAmdfPXs+eSS/EQm+WRDo9NILTFLiAsOE69KlWR9WP+fJo
         XmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yYShYH6c0JsEIbmuevIokeH+p63SJCkzU1KxDMZrMRU=;
        b=Z7cJMvELqOXqNWCSpP8ViJBOC8aNj6trRm84LZsTHYU5+HGal35PJ7KQYGxIMZ/Z0S
         2ahd9I/2R3KTooN7TSaL4cR4IDYA8EaiUkTNchdxMjA6SUWuE4HJnSVY6Cyla7lkFmlW
         1SXkNEtUi+ocoStan+sRnDthYd7VF4cdQS5PtG76wYw+9+fz6raBJYICOG+6zvddduZO
         6H8XhFlMpFBQvId3UxtwCtcVnTDj7Q5NPEV4zkU1poCbl/eMsPAcYLzXDPgrpvi+T6Q7
         FRzgSJAsLOzgY0Zow8+Gjf5jb7vYOukKLH/L29kJUVPauJ2R/0u5nAd5LLyi6V0r9Bg5
         AE1w==
X-Gm-Message-State: AOAM5304XYDMYzKs5oc2VpPLOMHKWbzwuhJ29XGbQEkExXHGJ0cfcRhp
        6itq5VzZiDghdRtAGk20LZ0=
X-Google-Smtp-Source: ABdhPJyqFB4fVQvokDCtCWklgerVzTHYVn9Fge2j83Lu7zNRFhIjFFh4VRitlCs91WHLWNkIFeAAUQ==
X-Received: by 2002:a05:6a00:2184:b0:3f4:cac4:cf41 with SMTP id h4-20020a056a00218400b003f4cac4cf41mr8442290pfi.6.1631681158262;
        Tue, 14 Sep 2021 21:45:58 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 132sm11758750pfy.190.2021.09.14.21.45.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 21:45:58 -0700 (PDT)
Date:   Tue, 14 Sep 2021 21:38:06 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to
 debugfs
Message-ID: <20210915043806.GA19185@Asurada-Nvidia>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
 <31501a62-3312-9f04-3bb8-790d0481746c@gmail.com>
 <20210914184933.GA32705@Asurada-Nvidia>
 <25d68aff-323a-df54-45f9-55b22f3089e0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25d68aff-323a-df54-45f9-55b22f3089e0@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 14, 2021 at 10:20:30PM +0300, Dmitry Osipenko wrote:
> 14.09.2021 21:49, Nicolin Chen пишет:
> > On Tue, Sep 14, 2021 at 04:29:15PM +0300, Dmitry Osipenko wrote:
> >> 14.09.2021 04:38, Nicolin Chen пишет:
> >>> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
> >>> +{
> >>> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
> >>> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> >>> +}
> >>
> >> We know that IOVA is fixed to u32 for this controller. Can we avoid all
> >> these dma_addr_t castings? It should make code cleaner a tad, IMO.
> > 
> > Tegra210 actually supports 34-bit IOVA...
> > 
> 
> It doesn't. 34-bit is PA, 32-bit is VA.
> 
> Quote from T210 TRM:
> 
> "The SMMU is a centralized virtual-to-physical translation for MSS. It
> maps a 32-bit virtual address to a 34-bit physical address. If the
> client address is 40 bits then bits 39:32 are ignored."

If you scroll down by a couple of sections, you can see 34-bit
virtual addresses in section 18.6.1.2; and if checking one ASID
register, you can see it mention the extra two bits va[33:32].

However, the driver currently sets its geometry.aperture_end to
32-bit, and we can only get 32-bit IOVAs using PDE and PTE only,
so I think it should be safe to remove the castings here. I'll
wait for a couple of days and see if there'd be other comments
for me to address in next version.

> Even if it supported more than 32bit, then the returned ulong is 32bit,
> which doesn't make sense.

On ARM64 (Tegra210), isn't ulong 64-bit?

Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3EDC433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 20:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 491C064F06
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 20:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhCOUCd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 16:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbhCOUCM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 16:02:12 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4263EC06174A;
        Mon, 15 Mar 2021 13:02:12 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t18so9390869pjs.3;
        Mon, 15 Mar 2021 13:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rL3vKYH4+4i5CC0aVunrWlzK1wduuZG220EJ/vhziQw=;
        b=ELopI56GAtnJ9od1YG8FNmWchTUFYHQzQnDiLKLf6uFJ6rH401bfejAp18uGs91+1i
         GWgTfleCV6Uh5T2r2Pxj6Web9vw7JQJTQu2ly9AYPV7FqhK9lHHqPEwCmSFLrXt7xO75
         b7MBkKnfT2hK7IVL5qsXRpWHDJZz9q7PqyhnurW04j3isnCcgZt4m1zgzxGireYB/1MD
         AhUISweOYG+oDxLUgzuZceLwibRCeMZ50hM9Gq0o67b8ySWu5W+45c89PUleZR0VCE1K
         WiJ1orcF8r8PVYuF3sNOXmBrIltsrTZy9K2zlTsqmEG9jdkuJNhEhU/P44raIFgYXE/F
         BPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rL3vKYH4+4i5CC0aVunrWlzK1wduuZG220EJ/vhziQw=;
        b=p6RTGzxI0dZi5awuezpxYrVMqzEFyQOv+XGSkCPVtmepWiDyYCWfIh7YtgMRscmWtK
         0mnZoHBDo3e3n5rykxLUw5HtQWQ1l6zaHI2v98EMdxTMVzHI+XQ3T9q53IHHRNwpn22p
         FidjBi/Y3EKamo2lbvrM0AaR7ZIPQqrUEUq4Ubz3D57w6S58Y2s3Oif4Tn5vxE8e9q4R
         N+5318ogL3HERLi+aERL+OQkIBxFRC/lx7gZPkt/IiZkySWo9gdMDsH8gN/EsW+7fGuv
         PZAnt/uGaCSqB3+bv/JPGtofq8wNUXieRJgi8fhe9LNq37MY114quinFDW3Zw3gayAx/
         nBtA==
X-Gm-Message-State: AOAM533xxE4smeTxSX+voRE+ClRCqsnNQaVOGm8k3/yTWr+sivnRZjZB
        bErVfyIfvZWVpcY8tA1+Drw=
X-Google-Smtp-Source: ABdhPJybiLZqEI+XjPqVHFhLW3Gu6zqMwtmPntvElOc45gnu6cMWEQmVLZXXRngR/RiMCkr7ZNGVeQ==
X-Received: by 2002:a17:90a:9d82:: with SMTP id k2mr807500pjp.48.1615838531534;
        Mon, 15 Mar 2021 13:02:11 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 11sm4712300pfn.146.2021.03.15.13.02.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 13:02:11 -0700 (PDT)
Date:   Mon, 15 Mar 2021 12:59:57 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iommu/tegra-smmu: Add pagetable mappings to debugfs
Message-ID: <20210315195956.GA16172@Asurada-Nvidia>
References: <20210315033504.23937-1-nicoleotsuka@gmail.com>
 <c57a805a-cf14-1d78-ae2a-dfce4f643db1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c57a805a-cf14-1d78-ae2a-dfce4f643db1@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Mar 15, 2021 at 09:53:09PM +0300, Dmitry Osipenko wrote:
> 15.03.2021 06:35, Nicolin Chen пишет:
> > This patch dumps all active mapping entries from pagetable
> > to a debugfs directory named "mappings".
> > 
> > Ataching an example:
> 
> Attaching
> 
> > 
> > SWGROUP: hc
> > ASID: 0
> > reg: 0x250
> > PTB_ASID: 0xe0080004
> > as->pd_dma: 0x80004000
> > {
> >         [1023] 0xf008000b (1)
> >         {
> >                 PTE RANGE      | ATTR | PHYS               | IOVA               | SIZE
> >                 [#1023, #1023] | 0x5  | 0x0000000111a8d000 | 0x00000000fffff000 | 0x1000
> >         }
> > }
> > Total PDE count: 1
> > Total PTE count: 1
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> 
> Good to me, thanks.
> 
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 
> > +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
> > +		struct page *pt_page;
> > +		u32 *addr;
> > +		unsigned int i;
> 
> Unimportant nit: I'd keep lines arranged by length for consistency with
> the rest of the code.
> 
> ...
> > +	group_debug = devm_kcalloc(dev, soc->num_swgroups, sizeof(*group_debug), GFP_KERNEL);
> 
> Another nit: this is a long line, I'd split it into two lines to keep
> coding style consistent and to improve readability for those who have a
> side-by-side code viewing setup.

Sending v5. Will add your Tested-by and Reviewed-by since there'd
be no functional changes. Thanks!

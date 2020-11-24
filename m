Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C602BC2D0E4
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 21:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6520D20857
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 21:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9gGuWbM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731379AbgKXVWa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Nov 2020 16:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731375AbgKXVW2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Nov 2020 16:22:28 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454AFC0613D6;
        Tue, 24 Nov 2020 13:22:28 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id j19so347218pgg.5;
        Tue, 24 Nov 2020 13:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lXcYXoNVYyBl/v8uATa3c6wAjQJYnbcQgq2r1GB/dQM=;
        b=F9gGuWbMPILK+mWrq2XTN2QS2w9vYFb4ZOquS6WbuWvw+LM/7WzzFQtDuLrnoKchjT
         TCBmtpGMnzzEAMJJSs5hVkQeB1FdGyD89m8JYO99K69vGnyEpgwG0yvCnvJqZzqyr6GU
         Mg54/aJGRzJw3p/XabvBfklZ5+09xsJflN99a0vDYxX1E+zWzlQNT0BwON1Wc8M3U0r2
         R72DFVDrPGeYkN750cKrg8R4DHYNKlGJXBiTJGSARmdqgP++p3sv3rywWBoMnT4SeKow
         EMSrXyNEbB/kK5ctZGsqFTm3zXumb94MGdxUWQpwO0dbJc5RdkKDNjXb7VPOzoxIvsk9
         FS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lXcYXoNVYyBl/v8uATa3c6wAjQJYnbcQgq2r1GB/dQM=;
        b=qE3CYyPJBk+IoBmWYlfsxPlQn7Ag+YOE3SpZ0Iqp02XmvH7SugNbCt9PbCl8HFT+Q1
         R8VGmJF920JMtCTTHbtuF+zgNhj+dlYl51Enq+0ymibh23HRBTXttJArTDeSkMYShhcJ
         Mraz9o8JXtBgtghmBLpyn6rI54WvZvCQrdRmqdrtims/TAf2YGrXgjwo5dBNtsfV8/ng
         zhVpX1Fs4lGViXKe1bLXqBWGLAV4fp/5r+o7kGz+QFSIw6RgtXvxIvQEVah5jDdxgW1L
         DqcJkFUpj89JOjaGVviAX4NN+0hU0Yjl9f90Kiec55Xki8I8hGfH6zCJLlaR9tKtf+K6
         avDg==
X-Gm-Message-State: AOAM531rkmv9GIDoUQ7zYpVnsPgtJhYAwgrs8a5ENGFhMRMvU2TqJpIM
        eDiuHwUuXBqHbGdINGZSG6Y=
X-Google-Smtp-Source: ABdhPJyTW6/NYxqbtf9PHOWGAMel2/Z3XjCTxBGeVzlqahz5Y9lUVWrEOQ//RTskRi1rN9MfmWv9LQ==
X-Received: by 2002:a62:ddcb:0:b029:197:faf2:e8b4 with SMTP id w194-20020a62ddcb0000b0290197faf2e8b4mr250681pff.75.1606252947842;
        Tue, 24 Nov 2020 13:22:27 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id w15sm143484pjy.47.2020.11.24.13.22.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 13:22:27 -0800 (PST)
Date:   Tue, 24 Nov 2020 13:21:01 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     joro@8bytes.org
Cc:     thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com
Subject: Re: [PATCH RESEND 0/5] iommu/tegra-smmu: Some pending reviewed
 changes
Message-ID: <20201124212100.GA32108@Asurada-Nvidia>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111222129.15736-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Joerg,

These five patches were acked by Thierry and acked-n-tested by
Dmitry a while ago. Would it be possible for you to apply them?

Thanks!

On Wed, Nov 11, 2020 at 02:21:24PM -0800, Nicolin Chen wrote:
> This is a merged set of resend for previously two series of patches
> that were reviewed/acked a month ago yet have not got applied.
> 
> Series-1: https://lkml.org/lkml/2020/9/29/73
> "[PATCH v4 0/2] iommu/tegra-smmu: Two followup changes"
> 
> Series-2: https://lkml.org/lkml/2020/10/9/808
> "[PATCH v7 0/3] iommu/tegra-smmu: Add PCI support"
> 
> Nicolin Chen (5):
>   iommu/tegra-smmu: Unwrap tegra_smmu_group_get
>   iommu/tegra-smmu: Expand mutex protection range
>   iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
>   iommu/tegra-smmu: Rework tegra_smmu_probe_device()
>   iommu/tegra-smmu: Add PCI support
> 
>  drivers/iommu/tegra-smmu.c | 240 ++++++++++++++-----------------------
>  1 file changed, 88 insertions(+), 152 deletions(-)
> 
> -- 
> 2.17.1
> 

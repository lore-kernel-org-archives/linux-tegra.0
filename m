Return-Path: <SRS0=c7AF=EN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2AFC388F7
	for <linux-tegra@archiver.kernel.org>; Sat,  7 Nov 2020 08:51:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8584120704
	for <linux-tegra@archiver.kernel.org>; Sat,  7 Nov 2020 08:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDX33btd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgKGIvM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 7 Nov 2020 03:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbgKGIvM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 7 Nov 2020 03:51:12 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8087CC0613CF;
        Sat,  7 Nov 2020 00:51:11 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id g19so300241pji.0;
        Sat, 07 Nov 2020 00:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QPvzVmvWxLmKrMg0Sr8OPDxq+YAWcayXVhURIV2qcs4=;
        b=rDX33btdGtMNq+Bz99R1w1obQXwIQ9IekqpbkTp3q7MRYFS2prTnbcLv1GOwk1ueHL
         PdQIA8SbRQVZK9UyOX4QaX6grk8aHnpitYpYAfchMOjwXdBCv5VY1uDywA/VplQt1EqJ
         nYEO6ZxCO4RIX6Qm2SHoaldztJcL68qR+3RqA9VIWaX6b8ahejKVQQA4QP054qE8+8om
         uKAsR9IZLGfV1H4xiHCroxcM9kUVmjqfhiBhZ5RCDsuL3kSMixp3CtqK3aZ5GSdyIaCm
         cH+1TzubPk1ftVO5o+jCOWFGvrWt4QpbHGLN+h/qeBDIs2X9Ygs1ltsqcJI7SXFd6dDU
         h4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QPvzVmvWxLmKrMg0Sr8OPDxq+YAWcayXVhURIV2qcs4=;
        b=NdMTH8xdf/nRyuXhLbWlHmIurOQVkSsBuEWgoh6mSCyUFAORQ8KFrNM7erTEkSrBML
         JvRg0ym/DtSmHP8S1HrnWkiolGXeDM8NsFm8Kcc3vismTphBrox21CCXXAZSh7KV2qsf
         9Im4S238f3UEw7Srthuf5L4n49J6ypvoY+dHfH+eUdkpnbMbMKxwj2w7iVEpFBwPAh37
         aIZbstssMQd+diRg09NE8QzRP2k/ecJdmPAwP1IyNUC1V00aIbRZQgJQAx8SVOR5GVbn
         qEqF+Bu17Bh6HTYx901gVwhlpa71gjVinONKZaFFWqGxwN8Rx3Z8x4Zh4+4eAeGiXDsv
         nS1A==
X-Gm-Message-State: AOAM531tQbzhGULy0/19GfnXA1kXlkeDolTxWyMzNOmxAdhipAwDGllL
        We0L+XgUUauL1vYdC/mG32gubnJR9iBQ3g==
X-Google-Smtp-Source: ABdhPJxkh8t4Zw81Sd+8sRSeTYa+FjFDXD44nHGvdsv5U7xnmrOEWCsK0OCpq+IgwzBmuv601yp45w==
X-Received: by 2002:a17:90a:ee8b:: with SMTP id i11mr3718689pjz.118.1604739071088;
        Sat, 07 Nov 2020 00:51:11 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 3sm4819037pfv.92.2020.11.07.00.51.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Nov 2020 00:51:10 -0800 (PST)
Date:   Sat, 7 Nov 2020 00:38:55 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20201107083855.GA32464@Asurada-Nvidia>
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009161936.23122-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 09, 2020 at 09:19:33AM -0700, Nicolin Chen wrote:
> This series is to add PCI support in tegra-smmu driver.

This v7 has fixed all the existing comments and been in the
maillist for nearly a month. Can anyone please apply them?

Thanks
Nic

> Changelog (Detail in each patch)
> v6->v7
>  * Added comments for put_device in PATCH-2
>  * Renamed goto labels in PATCH-3
>  * Kept Dmitry's Reviewed-by and Tested-by as no function change
> v5->v6
>  * Dropped a NULL check, per Dmitry's comments
>  * Added Dmitry's Reviewed-by and Tested-by
> v4->v5
>  * PATCH-1 Cleaned two variables inits
>  * PATCH-2 Fixed put() in ->of_xlate() and Updated commit message
>  * PATCH-3 Added Dmitry's Reviewed-by
> v3->v4
>  * Dropped helper function, per Thierry's comments
>  * Found another way to get smmu pointer
> v2->v3
>  * Replaced with devm_tegra_get_memory_controller
>  * Updated changes by following Dmitry's comments
> v1->v2
>  * Added PATCH-1 suggested by Dmitry
>  * Reworked PATCH-2 to unify certain code
> 
> Nicolin Chen (3):
>   iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
>   iommu/tegra-smmu: Rework tegra_smmu_probe_device()
>   iommu/tegra-smmu: Add PCI support
> 
>  drivers/iommu/tegra-smmu.c | 187 +++++++++++++------------------------
>  1 file changed, 63 insertions(+), 124 deletions(-)
> 
> -- 
> 2.17.1
> 

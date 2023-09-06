Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA1BEB8FD3
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Sep 2023 13:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241155AbjIFNg6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Sep 2023 09:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241140AbjIFNg5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Sep 2023 09:36:57 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26CB110C7
        for <linux-tegra@vger.kernel.org>; Wed,  6 Sep 2023 06:36:54 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68bed2c786eso2580578b3a.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 Sep 2023 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1694007413; x=1694612213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Td6a6sw5kxMExUrt1cEVr4QfSz/8/zuHKWsclB1jWMA=;
        b=UdjV119woGEt2qUbWbOMmZCQ6qzxDMHUMuFNE99UWPfnoDd8sjNAu+2TPd4bx6V2jl
         4pLrvVgsCkQ2QmpYXFDDZ2E97vxjLU/mGWGsQHPhUtS1LYBbWKFDj9gsMC7zRW4ppK1j
         J+8UJXYQrwR/sgNoxTWGIXGex4J5ZAqHNP5xEGdTvAS3IN3dKVXweLAsW+QDoqH3lK9F
         mGltVxbqpN4NesFngsgJKr1BGaV9Nselg8bhAaeigxJ+vBFrF+gb1+hFbqWsAA/rndPV
         6EvZK20jeYPz9icFf4sz9gUuEhvWsW7/vECK0n/PtznUJ5yIbqyQQPEqKdP8OnDbZu0J
         TG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694007413; x=1694612213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td6a6sw5kxMExUrt1cEVr4QfSz/8/zuHKWsclB1jWMA=;
        b=hnlviw0kIu/eQ/yhLRqVJIxvPbcsEEe5tHE2fqbfl39Wg820g6H36wQorFYo8DDB2Y
         yuARVJxVC1EpoFo813Jkqem+shYfhH0+BFwJLq1RBfYEm9fE/+EZ9WH7sBHf9/dImAu/
         dfoOgTdpuVOWc1/ATpIZnx6R/xpQ6gwTxPYZghx25W/SXrR6CNcubuE6jJYWUdldq4mn
         dgJXIh6J6JXjym+4mZSNFvp8QmRAzXLp/CMA6RBlrgI9TAC2cuuRoYg+7KCcKTq7CFB6
         MzmO2Pam7lzy3M41Wi/FEJvEoSpQeKXeiMIrE6j8GGd/qlfO+V20TrfhUbgl3V4AnJwC
         WBPg==
X-Gm-Message-State: AOJu0YxyFBF29VO/rRJBWh3zwdBRL0D7XA5yRp3pO0drjL7bw8+L9fO2
        nNv5jH/gcJ/rBJAf7rmT7II6+Q==
X-Google-Smtp-Source: AGHT+IGOwRHPmAKNRaGsD/hGYssr/5Y0BJzqOelNvybA7jZN/WxhNoLttPYaPUwO81J4iLj5RhHYKA==
X-Received: by 2002:a05:6a00:2e84:b0:68a:52ec:3d36 with SMTP id fd4-20020a056a002e8400b0068a52ec3d36mr17143606pfb.31.1694007413553;
        Wed, 06 Sep 2023 06:36:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id g20-20020a62e314000000b00688214cff65sm10826298pfh.44.2023.09.06.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 06:36:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1qdsiB-000yIl-HZ;
        Wed, 06 Sep 2023 10:36:51 -0300
Date:   Wed, 6 Sep 2023 10:36:51 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Baolu Lu <baolu.lu@linux.intel.com>
Cc:     Jinjie Ruan <ruanjinjie@huawei.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] iommu/tegra-smmu: Fix the NULL vs IS_ERR() bug for
 debugfs_create_dir()
Message-ID: <ZPiAc4MuNAJfnTaY@ziepe.ca>
References: <20230831123846.3137304-1-ruanjinjie@huawei.com>
 <8830ecd1-f7a3-a708-66b1-2d9698d0d477@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8830ecd1-f7a3-a708-66b1-2d9698d0d477@linux.intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 01, 2023 at 11:05:48AM +0800, Baolu Lu wrote:
> On 2023/8/31 20:38, Jinjie Ruan wrote:
> > The debugfs_create_dir() function returns error pointers.
> > It never returns NULL. So use IS_ERR() to check it.
> > 
> > Fixes: d1313e7896e9 ("iommu/tegra-smmu: Add debugfs support")
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> > ---
> >   drivers/iommu/tegra-smmu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > index e445f80d0226..cd1d80c4c673 100644
> > --- a/drivers/iommu/tegra-smmu.c
> > +++ b/drivers/iommu/tegra-smmu.c
> > @@ -1056,7 +1056,7 @@ DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
> >   static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
> >   {
> >   	smmu->debugfs = debugfs_create_dir("smmu", NULL);
> > -	if (!smmu->debugfs)
> > +	if (IS_ERR(smmu->debugfs))
> >   		return;
> 
> There is no need to check the return value of debugfs_create_dir(). This
> change cannot fix anything as far as I can see. Just remove the
> check.

Right

Jason

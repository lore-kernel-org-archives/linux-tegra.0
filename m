Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55E8C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 20:37:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C702D61074
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 20:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbhJGUjP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 16:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233223AbhJGUjO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 16:39:14 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44ABC061570;
        Thu,  7 Oct 2021 13:37:20 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id c29so6341463pfp.2;
        Thu, 07 Oct 2021 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/R6h2Xb41+ZaL3s6zRGcSwU7ER8EXS0p7pKvPqDNMfk=;
        b=L6g7yBOFXxdPb9Sw7whNFWQtYTIW8g0VqYh6a43KbeHiW0W3tdpWnLy//caAJsFdas
         gZTblvWzCyBXOcFPMAY2u030GV2zbAWPtwLPC52ofNnui+8Ta9oaGW9G9oZUDgBJYM4r
         /zH3pDcHHiWAtFNfxQKjdueMGJsVVhrW7vh8oqYbmUgVqUmMzjSVG651It3EP4LCP8RI
         3kJDljtbgyH+v+X4TNh7HlA394H9uFMMHOz8l8Z3ammocv/8Nj6LdZpXVh74TdTdargp
         CMgAHS9h1W0TNprmb16TRkVstAYWmuqEv5MIUc4AXzJyOiR3+GBcn5wb5HUtJ9vrzAM+
         C4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/R6h2Xb41+ZaL3s6zRGcSwU7ER8EXS0p7pKvPqDNMfk=;
        b=EqCoQxBilrUymuA24EaHOPUHoxzlqZysvsN1gwHTlRayDITzAolVwGAHH2WzzpJSd2
         O0JnyStMIsJ6aNBGCF9jQQcf1KbYLRCSRSvQvOC/CXT6hDtjaoiWCUK168xWYyjwqbp1
         qcoKzhO9RJVN1gnyngOi8fpU6XA2bDsw4SclPWhKfb1dQDmkWI/7PxAR9MQau1BIUyBL
         RbOanFAYHSxtaExAxAg0Jp4z5R2XKlPWI9ajgCanpE9yvl3xzqOwcXEzOSfcQTBbqTVO
         AH6XteS/SnArwgeWBRr/+mHUQb2g7JtjLT/90QfYPB2/f19A/Zn3yE1zw0S8Rg7WhKNM
         qU/w==
X-Gm-Message-State: AOAM5325SsgoIU/v6DXRkpQsopHfW8tCUXmdQ/M2EDRbFz1s6BEmDbpQ
        fiof+d5loAVPJ+jp0QFDY80=
X-Google-Smtp-Source: ABdhPJyxnnukeMgGct7B/INdlC+uTL5TVWEre3A7xHinHV428Lh7zSEjFjOwZvXHlHGRTg3XVZj8FA==
X-Received: by 2002:a63:4b63:: with SMTP id k35mr1394325pgl.206.1633639038818;
        Thu, 07 Oct 2021 13:37:18 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id p2sm129926pja.51.2021.10.07.13.37.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 13:37:18 -0700 (PDT)
Date:   Thu, 7 Oct 2021 13:29:45 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 3/6] iommu/tegra-smmu: Rename struct
 tegra_smmu_swgroup *group to *swgrp
Message-ID: <20211007202945.GB20821@Asurada-Nvidia>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-4-nicoleotsuka@gmail.com>
 <YV8m+0qP2ibQBvNs@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV8m+0qP2ibQBvNs@orome.fritz.box>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 07, 2021 at 06:57:31PM +0200, Thierry Reding wrote:
> On Mon, Sep 13, 2021 at 06:38:55PM -0700, Nicolin Chen wrote:
> > There are both tegra_smmu_swgroup and tegra_smmu_group structs
> > using "group" for their pointer instances. This gets confusing
> > to read the driver sometimes.
> > 
> > So this patch renames "group" of struct tegra_smmu_swgroup to
> > "swgrp" as a cleanup. Also renames its "find" function.
> > 
> > Note that we already have "swgroup" being used for an unsigned
> > int type variable that is inside struct tegra_smmu_swgroup, so
> > it's not able to use "swgroup" but only something like "swgrp".
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> >  drivers/iommu/tegra-smmu.c | 34 +++++++++++++++++-----------------
> >  1 file changed, 17 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > index a32ed347e25d..0f3883045ffa 100644
> > --- a/drivers/iommu/tegra-smmu.c
> > +++ b/drivers/iommu/tegra-smmu.c
> > @@ -334,35 +334,35 @@ static void tegra_smmu_domain_free(struct iommu_domain *domain)
> >  }
> >  
> >  static const struct tegra_smmu_swgroup *
> > -tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
> > +tegra_smmu_find_swgrp(struct tegra_smmu *smmu, unsigned int swgroup)
> 
> This makes things inconsistent now. The tegra_smmu_find_swgroup() name
> indicates that we're looking for some "swgroup" entity within an "smmu"
> object. The entity that we're looking for is a struct tegra_smmu_swgroup
> so I think it makes sense to use that full name in the function name.

This is more like an indirect change to keep consistency between
function name and pointer name.

> >  {
> > -	const struct tegra_smmu_swgroup *group = NULL;
> > +	const struct tegra_smmu_swgroup *swgrp = NULL;
> 
> I don't think the existing naming is confusing. The variable name
> "group" is consistently used for tegra_smmu_swgroup structures and there
> are no cases where we would confuse them with struct tegra_smmu_group
> instances.

If we don't rename it, then PATCH-4 adds to struct tegra_smmu_group
a "struct tegra_smmu_swgroup *group", which results in a confusing
group->group...

> However, I don't feel strongly about it, so I'm fine with changing the
> variable names to "swgrp" if you think that makes things less confusing.

Yea, I'd like to keep this change. I will respin it in next version
after fixing other comments.

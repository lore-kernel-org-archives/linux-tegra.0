Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA1AC4363D
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 20:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E0D92076A
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 20:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5rPcvt2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgI3U53 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 16:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3U53 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 16:57:29 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4AFC061755;
        Wed, 30 Sep 2020 13:57:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g29so1918488pgl.2;
        Wed, 30 Sep 2020 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c6iynEWbtPNgxX3PlHoKiO0+Xrwds8fLYpzSvmRXVyM=;
        b=L5rPcvt2OqP+yHB8xDFS98LZTl35P80/EINvhHFaOaeoyLVwfsmVSw/AHZg0y41WUE
         SLAG+8TpUnHX+PyjfH9ILfr/VZJeP2mI5OZLstCi8Lw3sccMI5xvU0kTUWwUsd5hmZ4V
         vCuIeXJrxhMeDjxkIMW70Lhop45CKJxnQffBe4IKP1pHMdyF72WulI+760PuzRTzJSu6
         OQU+kHvCK5ibdngNTDhIYAzzJAHn2trtIStRz23mym5o89OaZ90JaBDMmpjLU6+xTk4+
         C9hMoz4WsPEnhVuTm2hgnVxQVSOgKX00CSlTxyyO53MNPZUs1zVgPgQ+H3Dr2Q3cdQJZ
         HY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c6iynEWbtPNgxX3PlHoKiO0+Xrwds8fLYpzSvmRXVyM=;
        b=P/zzzskDdeic2tTszJWSwONifrxJidgkhFmpjyI2m62beFf8PnZ7gNcQepKsDhBPj8
         NgHDrJFJ3f/AXZH+7LId4ccCRHNj/PfwFf/k9TqduOpLMTu6fQ5rSL067BJL5udEcfDc
         4QGSZSuRhZzUY2zyyVv3EzTR9EleXqlOKhFBX8+opK7WqJWJBr4BZXcaBmq9vwOvw1Co
         zmm7K2Jy3KwiIAvymQ8LFQmnAbyMb2WRMofr6x6jyJgGYxtRdlx71jMOIPlJsTcqAdVC
         9wt+7J53i2FocioY4Bs5J9UQODhzYu1pkntSDfsDhUktGb1ssQHn1ZTBojSxlBW+xRty
         FFLQ==
X-Gm-Message-State: AOAM532DKtTu+xDR7lSWqwWaI1SGHRMmibvRpj4bmobzNlJOQC/+p0o3
        FT+9Jr6NMICEckL8iV8U1s8=
X-Google-Smtp-Source: ABdhPJxWXSa4OAju42zuPPsUhvDRG1I3TfFRLgs82lOiyea7Er1AvZ8pxSUdIu2X58JM0E588GiVJA==
X-Received: by 2002:a63:e40b:: with SMTP id a11mr3596331pgi.450.1601499448869;
        Wed, 30 Sep 2020 13:57:28 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id v21sm3224143pjn.4.2020.09.30.13.57.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 13:57:28 -0700 (PDT)
Date:   Wed, 30 Sep 2020 13:51:49 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930205149.GA3052@Asurada-Nvidia>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <30808bd3-a546-e981-00ff-34c07ee1a678@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30808bd3-a546-e981-00ff-34c07ee1a678@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 06:09:43PM +0300, Dmitry Osipenko wrote:
> ...
> >  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
> >  				 struct device *dev)
> >  {
> > +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> >  	struct tegra_smmu_as *as = to_smmu_as(domain);
> > -	struct device_node *np = dev->of_node;
> > -	struct of_phandle_args args;
> >  	unsigned int index = 0;
> >  	int err = 0;
> >  
> > -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> > -					   &args)) {
> > -		unsigned int swgroup = args.args[0];
> > -
> > -		if (args.np != smmu->dev->of_node) {
> > -			of_node_put(args.np);
> > -			continue;
> > -		}
> > -
> > -		of_node_put(args.np);
> > +	if (!fwspec || fwspec->ops != &tegra_smmu_ops)
> > +		return -ENOENT;
> 
> In previous reply you said that these fwspec checks are borrowed from
> the arm-smmu driver, but I'm now looking at what other drivers do and I
> don't see them having this check.
> 
> Hence I'm objecting the need to have this check here. You either should
> give a rational to having the check or it should be removed.
> 
> Please never blindly copy foreign code, you should always double-check it.

I will give a test and remove it upon positive result.

Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F68C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:25:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 403A520789
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uiFR6MaT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgI3GZG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 02:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3GZG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 02:25:06 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9180EC061755;
        Tue, 29 Sep 2020 23:25:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id l126so462485pfd.5;
        Tue, 29 Sep 2020 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kaEkSViWbjYB0RH9ZyEW8r5tVkb02wtxnjkae2cXiGU=;
        b=uiFR6MaTCXKc54vDlDXKTz1jvt4Fhu0qB6H5jQi1oliL6ap+OfSGineMREv4zbbGXn
         XjXLqruGSTMRn6tiTzSFuISucJznAxSpYoa7Pgg9XaY1Fdj3UMF7fmnLpjgIHbg2OXjE
         SUmcl0J2NPKxYmsNnJV+47xzw5SaPj6OG4Onsx6OmzGaIjHbz/yTmztDFUk/KQC0HjXT
         E+LBY4gdhTaiATRhI1ZlGdftj/ZqDRgXmHjN5REdPogg7Ir7UB9+5csXiwD9/wWFnTbS
         GRsh3j6EvriK4oFXnWktQMJ/9RKl0dEUGVzO1XitHw3LwWqjLPFij97lRUpszDlChu6Y
         uNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kaEkSViWbjYB0RH9ZyEW8r5tVkb02wtxnjkae2cXiGU=;
        b=jzQp5yHSQKbJBAkpisnqKiwUtGAuWoyD7MJJMkdfqnKUpHBQOmVRP1DL5DI9a+BsLN
         C/X7eahumptHGsJKrZQvbm/KhnR7Il/qkh2Ra/0CCc1HzFMJ0LmcrgEpqavDtAN34HF9
         9JglLDTA5kxjUu+11EquB1Hta/q6t44KpZru53HUfVfr18Jkx4u4eNZTvJRRypsWTz+Z
         hL7OU50XsrNAXnyuOb0m+xkUlw271zczk0GqI+qFpjZlUCcALPStSKwC6oEKxuspuzJR
         nvDjA/gEh7heQer5f/+c5ghS7XHHp24ZTLd5wk+UZDOLlFQRcxq7oDe8AoCOcHSeoKRl
         U1WQ==
X-Gm-Message-State: AOAM533Bw+r02ujrq9MFZATsFTIAoMJKgGE4h5s745596d5SVjtRZPha
        Nb26uOrbLSet7jF68SsZdT4=
X-Google-Smtp-Source: ABdhPJyFgo9fQifkjD9mCyIrvhywze1TLPeRflkvCdNjJL3rK/yZVlXe9GkrQjEpe26+1L6Faqadow==
X-Received: by 2002:a63:fa45:: with SMTP id g5mr976137pgk.448.1601447106094;
        Tue, 29 Sep 2020 23:25:06 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id t3sm895690pje.43.2020.09.29.23.25.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 23:25:05 -0700 (PDT)
Date:   Tue, 29 Sep 2020 23:19:35 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930061935.GB16460@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <e557a09b-bcc3-11cb-9529-096aafb42051@gmail.com>
 <20200930054119.GE31821@Asurada-Nvidia>
 <68c13611-bc3d-5ba6-70ec-29786d69ff9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68c13611-bc3d-5ba6-70ec-29786d69ff9a@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:59:45AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 08:41, Nicolin Chen пишет:
> > On Wed, Sep 30, 2020 at 08:39:54AM +0300, Dmitry Osipenko wrote:
> >> 30.09.2020 03:30, Nicolin Chen пишет:
> >>>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
> >>>  				 struct device *dev)
> >>>  {
> >>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >>>  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> >>>  	struct tegra_smmu_as *as = to_smmu_as(domain);
> >>> -	struct device_node *np = dev->of_node;
> >>> -	struct of_phandle_args args;
> >>>  	unsigned int index = 0;
> >>>  	int err = 0;
> >>>  
> >>> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> >>> -					   &args)) {
> >>> -		unsigned int swgroup = args.args[0];
> >>> -
> >>> -		if (args.np != smmu->dev->of_node) {
> >>> -			of_node_put(args.np);
> >>> -			continue;
> >>> -		}
> >>> -
> >>> -		of_node_put(args.np);
> >>> +	if (!fwspec || fwspec->ops != &tegra_smmu_ops)
> >>> +		return -ENOENT;
> >>
> >> s/&tegra_smmu_ops/smmu->iommu.ops/
> >>
> >> Secondly, is it even possible that fwspec could be NULL here or that
> >> fwspec->ops != smmu->ops?
> > 
> > I am following what's in the arm-smmu driver, as I think it'd be
> > a common practice to do such a check in such a way.
> > 
> 
> Please check whether it's really needed. It looks like it was needed
> sometime ago, but that's not true anymore.

Given that most iommu drivers have ->ops check, I'd like to
have it also for safety. If someday that's not true anymore,
I'd expect someone to update all existing drivers.

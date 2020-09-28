Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C31C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 19:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 361CF208D5
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 19:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJNKn7JT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgI1Tis (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 15:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgI1Tis (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 15:38:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2B3C061755;
        Mon, 28 Sep 2020 12:38:47 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q4so1269595pjh.5;
        Mon, 28 Sep 2020 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PvTQsN4lpGwG4bNurmMUhGfYEfi6y08HRQbRjBGRPr4=;
        b=AJNKn7JTkfaZWtYcKjnLpI83Sh4ohhpITVcw5SKfptBltLlJ8F1Q7Rxw1/Ch3Nmklr
         4ItvKqn/0VTCFRoP9m8+jQHchDQdnY4n1HvUnaqxq/zKFtHq2CMlziEGwZ3E8yaDfXsu
         vgiQE6l0m6TLpXKl4vqzfTG0UETd0OiQHvbGlbUcaBwFc1AL9gpVvCEa9LH2dMstyrZB
         lPxD294GyKHV0gpy1lx0gulhZMLcN1tn8skrdpIYb7jrhbafFj1qvalvpsZGBfP7omAv
         j3K7yxyM3Bb/4ZupYNrWTUITOjHh10ON5WDvlerBpRtJ57lcEVoURlcNLoSCCXQZ0QKL
         t7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PvTQsN4lpGwG4bNurmMUhGfYEfi6y08HRQbRjBGRPr4=;
        b=Q0l6xGZMts7RwXBcuLRUxmhXv/OaFsD+X2CqT6cDB4pk4wPxsPjNOid7JxzN9y307i
         P2TZaaU0TGsZz2YJn3dGaWXSVDU+XHecE9cbcwChD9Bt6HXaHWOUhwAGwdBBmO/KBbVF
         0PgFR+9QwpUZOAFSahjELndIf/5EVV4fZYju68MEsIlA4hmtsb1ctr7dFlaTUg5k64hZ
         zuiB50E/0WvTeHjzHMqKrLEK++tAG+fzcwAlbNnFAP/jYBURqdjCmiwWfp9D5Zy+DSyo
         yPFSqkh/c+qSHGz8iEXVbsHO1NnbWRsb4xlVe+GZypMIxMkzCgVmDbU9xSrF0OOdYz3C
         IxTQ==
X-Gm-Message-State: AOAM533k21p+JpSVabuJvlxEjENXQCiEyg3AwkpQpzEAVqZ1QjZaHSps
        o3xLL+Uyhb+HfsIWWiF9bTY=
X-Google-Smtp-Source: ABdhPJyF7ovAy2Q8BmAUiZrG9WO75KHcCu3kDg52GYU/f+Na8ljFsJelKts82PPVgVv3EihaUWaHaA==
X-Received: by 2002:a17:90a:1188:: with SMTP id e8mr691936pja.185.1601321926605;
        Mon, 28 Sep 2020 12:38:46 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id gb19sm2111133pjb.38.2020.09.28.12.38.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 12:38:46 -0700 (PDT)
Date:   Mon, 28 Sep 2020 12:33:28 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Message-ID: <20200928193328.GA15720@Asurada-Nvidia>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-2-nicoleotsuka@gmail.com>
 <20200928071356.GD2837573@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928071356.GD2837573@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

Thanks for the review.

On Mon, Sep 28, 2020 at 09:13:56AM +0200, Thierry Reding wrote:
> > -static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
> > -						unsigned int swgroup)
> > +static struct iommu_group *tegra_smmu_device_group(struct device *dev)
> >  {
> > +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> > +	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> >  	const struct tegra_smmu_group_soc *soc;
> >  	struct tegra_smmu_group *group;
> > +	int swgroup = fwspec->ids[0];
> 
> This should be unsigned int to match the type of swgroup elsewhere.
> Also, it might not be worth having an extra local variable for this
> since it's only used once.

Will change to unsigned int. There are actually a few places using
it in this function, previously tegra_smmu_group_get().

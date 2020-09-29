Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D246EC2D0A8
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 01:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 852B3208FE
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 01:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB5AkSvg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgI2BVV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 21:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgI2BVV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 21:21:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8544C061755;
        Mon, 28 Sep 2020 18:21:20 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id y14so2447046pgf.12;
        Mon, 28 Sep 2020 18:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LJ2EaLyywMeQ220DXk/3m8ij2UCaXBFliElieIvVcWo=;
        b=dB5AkSvgSsuC4jqhJi1Du6fOX/N7Xqa7co1RAVRI7k5jGv6Bykuo2tOZ/hkkel3qzY
         CTS8a/Oal7MbkDg+kiT/tRhuH74Nl3g/7dKHJijJyXGtbC8AlTGjsR/d9vYzi2kf/nR1
         4oizg3sYkVtgATl4O58g0KvM7Gi3/4ZWup+Dxtczp0wmPtnV6YAR/bIsw1Er0jVGTujr
         NNzOmFB+JjELoSImcu53H6HFX6UmQpQGSgK396wSboSVx3JwNZhGUL6f5QLWlLhJ7BnP
         +5ITYJYN8klNUwbH3449wW7mMwZp0FIU8cp32Es6bcaZnfwrQWbNiFOcq4eUzNCZ4vzR
         wOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LJ2EaLyywMeQ220DXk/3m8ij2UCaXBFliElieIvVcWo=;
        b=P0ViIyE0a9OKkXP4akBguDBhzAoXS+l+4pwXMv7AvMMF4747k6LyB/9qQiS1REfsO/
         VW234KOQo4TClX05ShRyNMH3xlaA/CW0uvXlhvmtREXA4zC9xft1PjEB4k5REnFnZV3R
         JLeZoxU7y9Fx1cqZOl9QkHTMizuh7ur1mq9K6dQTRdCUuZLUpVVNKUPAjSO5PkJS/k13
         2usqoDXBwvJi5OPfQt/vDr4T3U587XVvlGEI8mmDyumnpeMShBEqpSXOHJIVLBxzQrIj
         EDJ0IW5d/nk1xS1kUhWfROxPutSx31bMGMndtCWwxve5I3cWIgXWLLS+xFJ8LZiG9/+M
         Yxhg==
X-Gm-Message-State: AOAM530IQQ71Pq+LSCSDWyR5ux7UAAdQU2WNAzjXvkqAU3vvFzljZy8F
        eTruV20cK2tklYrxbULYOSg=
X-Google-Smtp-Source: ABdhPJyImG3w8frEfpcUQx/Q4jWtb4RC9mBhFFjza2RqlH0U2v8tnaw3/b8ogIZGHZf/614y9A889w==
X-Received: by 2002:a17:902:b685:b029:d2:1e62:4cbe with SMTP id c5-20020a170902b685b02900d21e624cbemr2075538pls.58.1601342477766;
        Mon, 28 Sep 2020 18:21:17 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d25sm2589760pgl.23.2020.09.28.18.21.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 18:21:17 -0700 (PDT)
Date:   Mon, 28 Sep 2020 18:15:57 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iommu/tegra-smmu: Expend mutex protection range
Message-ID: <20200929011557.GA905@Asurada-Nvidia>
References: <20200928235901.28337-1-nicoleotsuka@gmail.com>
 <20200928235901.28337-3-nicoleotsuka@gmail.com>
 <692b51fa-7a3e-dee7-b628-7cb2d2dc188d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <692b51fa-7a3e-dee7-b628-7cb2d2dc188d@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 29, 2020 at 03:17:58AM +0300, Dmitry Osipenko wrote:
> ...
> >  static bool tegra_smmu_capable(enum iommu_cap cap)
> > @@ -420,17 +413,21 @@ static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
> >  				 struct tegra_smmu_as *as)
> >  {
> >  	u32 value;
> > -	int err;
> > +	int err = 0;
> > +
> > +	mutex_lock(&smmu->lock);
> >  
> >  	if (as->use_count > 0) {
> >  		as->use_count++;
> > -		return 0;
> > +		goto err_unlock;
> 
> This looks a bit odd because it's not a error condition. Perhaps should
> be better to "goto bump_usecount"?
> 
> Or make it similar to tegra_smmu_as_unprepare()?

Hmm...I think it's simple to just make it "goto unlock" then.

Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152C3C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCD5E2074B
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhrFErRM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgI3FpE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI3FpE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:45:04 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52648C061755;
        Tue, 29 Sep 2020 22:45:02 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id q123so426828pfb.0;
        Tue, 29 Sep 2020 22:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tRdqtpZuO9VlHAKM9EV6SLp/Vc7sBfzATqlbagqH/RQ=;
        b=mhrFErRMevyjT/bOEjjKelhWvNvAibIO1NgK0kCrxYY+Mn3CjdF4KMDtEEDICHufYJ
         Isu/HtYsFFcMc4QN1gBhecO1xetvZjTKys1XgJJlJq3zo4KPCCuGaV8cAd1FNamDl+wY
         ahthsSaCvfl6NdlCGZdmASnLmzu7u3Nb9Djg3MHIrSLOE71AzHUDEBRmDBr2va3+Es+V
         wXuE07ZdqzPw74kWYqE5KGH6pB/S88RNm26zGXfF1mW/LW/rrq6dNEoOIPGa0Oy+QkyV
         5jPMjKSJsGaa+B5QtFtho1CFwb17QELUQUNv7/AdcPzOoqbkP81ffLIzS4P3rnUNfnOR
         B3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tRdqtpZuO9VlHAKM9EV6SLp/Vc7sBfzATqlbagqH/RQ=;
        b=e81wl/Kw/p2fmszxmxykZqvuYkIO0G9KnwkBtoDuGDyYFNa7myZdsL935YDOn8QVef
         WowVPiXHcIybkAFkWw7naJy0y7swnbq6kD/ZIfDz6BJGY6K6v+XqwqtpVOQ3QfdrqAXT
         ptFY0Es4QanIC7iUgqiLBJMCWzdyljTJ3gS8hSNd7wNfU8qqAhQU0KVOMIS6IFb1etEe
         hi5XzM8Xs69e+qGYEmlccgLyRXCuxxItRap90I8MXBmgQdv6Qtpg9jV51N6EBa3wXdhI
         Y0x9KY1tOQywk5pDPs8UrnW6EgfzRzxZXQQTyJMPsrwOJgrml80BSJf2eh7RSnWipqyL
         Vc6w==
X-Gm-Message-State: AOAM531lSXTYuRp0FWe26pbCu1ZmBlGeV3lw951vffEZRdVxraKntvnM
        Ik7ScyIK5zFKqEIF9QiyK38=
X-Google-Smtp-Source: ABdhPJxXrv4hwyUUnyZdUCFlV5myhX0PXPJKHvHr4ZoQqkPu2YBnDMM4+FKYJP/Iw+xdaZPedJXj/A==
X-Received: by 2002:a63:3448:: with SMTP id b69mr902755pga.269.1601444701732;
        Tue, 29 Sep 2020 22:45:01 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 123sm650855pgd.83.2020.09.29.22.45.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:45:01 -0700 (PDT)
Date:   Tue, 29 Sep 2020 22:39:31 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930053930.GD31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <03710107-b6ad-5256-4550-09c610d0fded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03710107-b6ad-5256-4550-09c610d0fded@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:24:02AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 03:30, Nicolin Chen пишет:
> > +	/*
> > +	 * IOMMU core allows -ENODEV return to carry on. So bypass any call
> > +	 * from bus_set_iommu() during tegra_smmu_probe(), as a device will
> > +	 * call in again via of_iommu_configure when fwspec is prepared.
> > +	 */
> > +	if (!mc->smmu || !fwspec || fwspec->ops != &tegra_smmu_ops)
> >  		return ERR_PTR(-ENODEV);
> 
> The !mc->smmu can't be true.

Are you sure? I have removed the "mc->smmu = smmu" in probe() with
this change. So the only time "mc->smmu == !NULL" is after probe()
of SMMU driver is returned. As my comments says, tegra_smmu_probe()
calls in this function via bus_set_iommu(), so mc->smmu can be NULL
in this case.

Return-Path: <SRS0=mUr2=ED=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB84C55179
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 01:47:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2206C20720
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 01:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5gMs+eO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgJ1Bii (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Oct 2020 21:38:38 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40441 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1833055AbgJ0Xrh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Oct 2020 19:47:37 -0400
Received: by mail-pl1-f193.google.com with SMTP id j5so1591254plk.7;
        Tue, 27 Oct 2020 16:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/6ryBAjhYQWjKYyZ6Le172OJUQcIiSdBP4BaH3Rlg64=;
        b=Q5gMs+eOrcdJ0AbdplqdNB3rhSB/lSY5Y1go23d0pWx+kotcrMMZ2eH0eHgM7NQmzQ
         2z8lGgrFJP1jZ2hPRNzMF2LYKufDydPcmIMcGtlS5rRUb5lQ8batLXTaqeBbKPBYcyuj
         B9f4eXjn3Yy+MdtRDDgp1EczG9DOIaDVz0+BDjjIF+NG3abqAEM6Y70H+4+TqTMek7RV
         9NxP+zGtRVhC5Yv/R54iQIQ4KTbzoAko39W2fCG8RzodJyEVMeS8Dcjwzqxch6cOqo8Z
         RJDVHeUEIVxP7KmDuDr1EgKH3LwYSWX5lqiuQX4O4iejXYWBFj+pgMzUvkOWS3gzUlvP
         dzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/6ryBAjhYQWjKYyZ6Le172OJUQcIiSdBP4BaH3Rlg64=;
        b=GkOAMQeCTwx7e32ECW/lRnlFinH5ZdimUIskp+jMjYCzkX3wGVx5VCTYB4VYunyGdL
         UhqzYWSaOam5QOEK9WnIjZQFaOlHYmtXmHEb7YkLpiP0Zr2/fWYySBh7CB6U+OtXKrKp
         fgI+gSZaOlfrm8xpK22dne2E8h3YQSqgTZSkVQHVs/jVHW999iEobCL0FjagCShjgLNt
         M7db+zPi3wrYaToDMHyejqPUMaBrSBUr6aCYG5ErVNlEJ6S3ZWZduwEO4ub/gpvpRbqW
         jikIsVBa7lOdP3z7nF0MKOArxuakwycXcqI12Wq1GOt7JUN8T9AqJPtSkuZtobGWsNWt
         xFYQ==
X-Gm-Message-State: AOAM532a4pvRC36MEQUDqBoJNu++WJJVvHBWZpE9t6jX2TE37GeOcCZS
        gjec6pkda2RQMi40zyI5x4g=
X-Google-Smtp-Source: ABdhPJz/lQbram89lQGpaIKmmR0hCnzx0BFgcEU0n7e10YYJ0CbPFhHKKcYO48buaN6RbQgEtmMO5g==
X-Received: by 2002:a17:902:bc43:b029:d6:711c:1a77 with SMTP id t3-20020a170902bc43b02900d6711c1a77mr620272plz.43.1603842456452;
        Tue, 27 Oct 2020 16:47:36 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id b17sm3271543pgb.94.2020.10.27.16.47.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 16:47:36 -0700 (PDT)
Date:   Tue, 27 Oct 2020 16:37:12 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] memory: tegra: Complete tegra210_swgroups
Message-ID: <20201027233711.GB11164@Asurada-Nvidia>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-6-nicoleotsuka@gmail.com>
 <20201027130111.GB1822510@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027130111.GB1822510@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 27, 2020 at 02:01:11PM +0100, Thierry Reding wrote:
> On Wed, Oct 07, 2020 at 05:37:46PM -0700, Nicolin Chen wrote:
> > According to Tegra X1 TRM, there are missing swgroups in the
> > tegra210_swgroups list. So this patch adds them to the list.
> > 
> > Note that the TEGRA_SWGROUP_GPU (in list) should be actually
> > TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
> > is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
> > this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
> > TEGRA_SWGROUP_GPU (in list) as it is.
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> >  drivers/memory/tegra/tegra210.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
> > index b400802c9f14..b3bbc5a05ba1 100644
> > --- a/drivers/memory/tegra/tegra210.c
> > +++ b/drivers/memory/tegra/tegra210.c
> > @@ -1028,6 +1028,8 @@ static const struct tegra_smmu_swgroup tegra210_swgroups[] = {
> >  	{ .name = "hda",       .swgroup = TEGRA_SWGROUP_HDA,       .reg = 0x254 },
> >  	{ .name = "isp2",      .swgroup = TEGRA_SWGROUP_ISP2,      .reg = 0x258 },
> >  	{ .name = "nvenc",     .swgroup = TEGRA_SWGROUP_NVENC,     .reg = 0x264 },
> > +	{ .name = "nv",        .swgroup = TEGRA_SWGROUP_NV,        .reg = 0x268 },
> > +	{ .name = "nv2",       .swgroup = TEGRA_SWGROUP_NV2,       .reg = 0x26c },
> 
> Oddly enough I can see these in the TRM, but they are not in the
> internal reference manuals that are supposed to be the canonical
> reference for the TRM. Perhaps the TRM is out of date?

Hmm..I actually have been using the TRM from official site all
the time. These two aren't being used downstream either; I put
them in the patch merely because they exist in the TRM. So we
may drop them if you feel that's better.

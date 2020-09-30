Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEABC4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 09:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94CEA2075F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 09:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2mQDBcC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgI3JqI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 05:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3JqI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 05:46:08 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0F5C061755;
        Wed, 30 Sep 2020 02:46:07 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y20so705605pll.12;
        Wed, 30 Sep 2020 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w6x76gtOHsFZbRIC64IzxvoZiSxuFZiWjvjCw4IeBQg=;
        b=p2mQDBcCc34wHPCS1PNzUjlkF5oBkaoVSc4y0UTqBTEU0wukBKhr3l7IugLFhsWwPk
         sBCNpg2XDBk2OENMWkcxe87s5sTNnAguKCXJ6TDg0ls1rcGx0XE7jUu5FlJ7zDFPzzEX
         2HzpcJjkCPTBS1Ppm4WKw0azG0UEKk1tjgWweFP0qty95Bj5RJ2laAt37HL+UhYr84ET
         5e6ww1KK+tiIzJtD09T1/N6lgRK8YaMCWpGRjgcyGZ7ci/KArqSTfDL0wvfQ+6yfCzRr
         NpL977c4gkkhKnv3cQBQGpUIUkJiFUDixoD5gzENfM+OELC4byQ2AvKrHFt8FeG0C9OR
         xXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w6x76gtOHsFZbRIC64IzxvoZiSxuFZiWjvjCw4IeBQg=;
        b=kqDAtKc2rT7WbYp/Qk5DNLHOYS+UsMmhaUJMvW9W8rU8fmKMrQDPyCE/7pj03x4jmp
         5xuB/5tTHvoqoqB1uzUmHsGg6j8U94PQHRfJ8PKZgqN2iijMNrIPt8n8aqgKkGE2hd1/
         VJdPWzUD1p08szPVP5+lhWxR1x+i0LhLPuCwrc0V+JdCvDAYUh/x6lTeMyPM8Df97VXs
         9h7k/xVyNQBIhSpfTqEF6LEq9njNGdbRlG6Yfk/K5FwAbYmqqz7w8GVOB8MtwgOQPq/6
         oDd3QbRmgO7bXzT7FiQ3E+jxTBUVbsSN1MBi7/rf7iiRhudDifgiupwZ0Z+2WEAfgQum
         PdKA==
X-Gm-Message-State: AOAM531ywgK9V7KDCkyZ4QNfsPfGYsfh+1pneo5E+7JG3QiJSsup2/75
        BzD98TcFU+ioALPT7SEOuCk=
X-Google-Smtp-Source: ABdhPJzm6vd4n3L4meRW311HnXuqF9jAY2zYIatqFAbTkPoW7zP6m1SSm9AGlDm9UQ7WkSMcF9YWjQ==
X-Received: by 2002:a17:90b:33cb:: with SMTP id lk11mr1797687pjb.98.1601459167352;
        Wed, 30 Sep 2020 02:46:07 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id j26sm1890991pfa.160.2020.09.30.02.46.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 02:46:07 -0700 (PDT)
Date:   Wed, 30 Sep 2020 02:40:32 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930094032.GA6686@Asurada-Nvidia>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <CAJKOXPeF8D0A6PGVbi_7RedO-DFd70sjGcJOjx-gCJ7Cd8k0YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPeF8D0A6PGVbi_7RedO-DFd70sjGcJOjx-gCJ7Cd8k0YQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 11:21:14AM +0200, Krzysztof Kozlowski wrote:
> On Wed, 30 Sep 2020 at 10:48, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > Previously the driver relies on bus_set_iommu() in .probe() to call
> > in .probe_device() function so each client can poll iommus property
> > in DTB to configure fwspec via tegra_smmu_configure(). According to
> > the comments in .probe(), this is a bit of a hack. And this doesn't
> > work for a client that doesn't exist in DTB, PCI device for example.
> >
> > Actually when a device/client gets probed, the of_iommu_configure()
> > will call in .probe_device() function again, with a prepared fwspec
> > from of_iommu_configure() that reads the SWGROUP id in DTB as we do
> > in tegra-smmu driver.
> >
> > Additionally, as a new helper devm_tegra_get_memory_controller() is
> > introduced, there's no need to poll the iommus property in order to
> > get mc->smmu pointers or SWGROUP id.
> >
> > This patch reworks .probe_device() and .attach_dev() by doing:
> > 1) Using fwspec to get swgroup id in .attach_dev/.dettach_dev()
> > 2) Removing DT polling code, tegra_smmu_find/tegra_smmu_configure()
> > 3) Calling devm_tegra_get_memory_controller() in .probe_device()
> > 4) Also dropping the hack in .probe() that's no longer needed.
> >
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> >
> > Changelog
> > v2->v3
> >  * Used devm_tegra_get_memory_controller() to get mc pointer
> >  * Replaced IS_ERR_OR_NULL with IS_ERR in .probe_device()
> > v1->v2
> >  * Replaced in .probe_device() tegra_smmu_find/tegra_smmu_configure()
> >    with tegra_get_memory_controller call.
> >  * Dropped the hack in tegra_smmu_probe().
> >
> >  drivers/iommu/tegra-smmu.c | 144 ++++++++++---------------------------
> >  1 file changed, 36 insertions(+), 108 deletions(-)
> >
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > index 6a3ecc334481..636dc3b89545 100644
> > --- a/drivers/iommu/tegra-smmu.c
> > +++ b/drivers/iommu/tegra-smmu.c
> > @@ -61,6 +61,8 @@ struct tegra_smmu_as {
> >         u32 attr;
> >  };
> >
> > +static const struct iommu_ops tegra_smmu_ops;
> 
> I cannot find in this patch where this is assigned.

Because it's already set in probe():
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/iommu/tegra-smmu.c#n1162

And my PATCH-3 sets it for PCI bus also.

Thanks

Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2AEC4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 10:19:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E23C42074A
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601461155;
	bh=nTbVVi0bBmsikxqqFyCHBhKtRKOBq+D0s0tir46ZHhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HkqyqM/27D/V007ZNBeuUpwAfNHE66qLdDR86KPfyyT1gQzhmq1mfgWqcef/a0/EK
	 BmTsG6L6RdS52C9e4cQCzo2K4ym4oYN/pKstw2n50qYTwqAfw8wDnzpj5l6gsmCB93
	 XDmE3IN3YscgOFthrTQYzybPnPjOQcjWorqAcC8M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI3KTP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 06:19:15 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38969 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727657AbgI3KTP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 06:19:15 -0400
Received: by mail-ed1-f67.google.com with SMTP id e22so1209363edq.6;
        Wed, 30 Sep 2020 03:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OfTJRaa/8TAarxg+Kx9m69UamnCj7/6BcDzFIhg9imE=;
        b=FyUpcyJyQm+4awJGoUSBawM/rT7jILBrD3lX+Dd2qKzf/k5RT2IaDEdyEthGm2H5wk
         nvML8Rw/NsqahYc9oupAVGveRiriky/aVn+mcrR+HSpRWpTnR7upbCXv/XMlNQXcpYwT
         eDOi3g+kHZdgZ9k2qNIea6ItVxOMXQeIeF65o8BD0rqKNJFkR2/ikv0fJ0n9zXME4PhD
         YRjMElPoSjK6ak5g+7fzOxxpVEHXa7B3dsuvGygRA27FLoMW+AH+noRaDUgUHsPfj/yd
         Ixp6M9JorNlYtLRRxET3cq30F3QK5UWwX0Tygb8C3f+8YpGnovpR5KI3Nmr3JTg+T/hR
         LRHA==
X-Gm-Message-State: AOAM533azbibP5kUJSyOFCDQQQ2E+T6lCbejUAPY6e5IOW+Smyts/Ll7
        XnNseVki89ZMy17r9TDreo8=
X-Google-Smtp-Source: ABdhPJxI9G3fz0Hy5adUFLWMdVySYAPVnzVYqZbp+i4LqrLXxP4uBbfGGky5VyDcqZvwZvjDV53EMw==
X-Received: by 2002:a50:cc8d:: with SMTP id q13mr1857004edi.298.1601461153186;
        Wed, 30 Sep 2020 03:19:13 -0700 (PDT)
Received: from pi3 ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id g11sm1032053edj.85.2020.09.30.03.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 03:19:12 -0700 (PDT)
Date:   Wed, 30 Sep 2020 12:19:09 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930101909.GA1147@pi3>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <CAJKOXPeF8D0A6PGVbi_7RedO-DFd70sjGcJOjx-gCJ7Cd8k0YQ@mail.gmail.com>
 <20200930094032.GA6686@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930094032.GA6686@Asurada-Nvidia>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 02:40:32AM -0700, Nicolin Chen wrote:
> On Wed, Sep 30, 2020 at 11:21:14AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, 30 Sep 2020 at 10:48, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > Previously the driver relies on bus_set_iommu() in .probe() to call
> > > in .probe_device() function so each client can poll iommus property
> > > in DTB to configure fwspec via tegra_smmu_configure(). According to
> > > the comments in .probe(), this is a bit of a hack. And this doesn't
> > > work for a client that doesn't exist in DTB, PCI device for example.
> > >
> > > Actually when a device/client gets probed, the of_iommu_configure()
> > > will call in .probe_device() function again, with a prepared fwspec
> > > from of_iommu_configure() that reads the SWGROUP id in DTB as we do
> > > in tegra-smmu driver.
> > >
> > > Additionally, as a new helper devm_tegra_get_memory_controller() is
> > > introduced, there's no need to poll the iommus property in order to
> > > get mc->smmu pointers or SWGROUP id.
> > >
> > > This patch reworks .probe_device() and .attach_dev() by doing:
> > > 1) Using fwspec to get swgroup id in .attach_dev/.dettach_dev()
> > > 2) Removing DT polling code, tegra_smmu_find/tegra_smmu_configure()
> > > 3) Calling devm_tegra_get_memory_controller() in .probe_device()
> > > 4) Also dropping the hack in .probe() that's no longer needed.
> > >
> > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > ---
> > >
> > > Changelog
> > > v2->v3
> > >  * Used devm_tegra_get_memory_controller() to get mc pointer
> > >  * Replaced IS_ERR_OR_NULL with IS_ERR in .probe_device()
> > > v1->v2
> > >  * Replaced in .probe_device() tegra_smmu_find/tegra_smmu_configure()
> > >    with tegra_get_memory_controller call.
> > >  * Dropped the hack in tegra_smmu_probe().
> > >
> > >  drivers/iommu/tegra-smmu.c | 144 ++++++++++---------------------------
> > >  1 file changed, 36 insertions(+), 108 deletions(-)
> > >
> > > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > > index 6a3ecc334481..636dc3b89545 100644
> > > --- a/drivers/iommu/tegra-smmu.c
> > > +++ b/drivers/iommu/tegra-smmu.c
> > > @@ -61,6 +61,8 @@ struct tegra_smmu_as {
> > >         u32 attr;
> > >  };
> > >
> > > +static const struct iommu_ops tegra_smmu_ops;
> > 
> > I cannot find in this patch where this is assigned.
> 
> Because it's already set in probe():
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/iommu/tegra-smmu.c#n1162
> 
> And my PATCH-3 sets it for PCI bus also.

OK, good point. Thanks for explanation.

Best regards,
Krzysztof

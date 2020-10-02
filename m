Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B015C4727E
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 03:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E89C5206DB
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 03:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSpUgx3P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387491AbgJBDAa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 23:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgJBDAa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 23:00:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4637C0613D0;
        Thu,  1 Oct 2020 20:00:28 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id x2so214657pjk.0;
        Thu, 01 Oct 2020 20:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vxCBqrAPI4BpulMRUd2dHi3liznsJJT1GfUE4tz0DaA=;
        b=oSpUgx3PIvcCjJEXKh2OcdwU6+Gu8yhGSFSDnYxRQdH3rtA4+igTwHajMexafQqOYW
         VrLEKUFMZrfl33npsf3i+TUfQQcSQDNj1++MFzWbhvAFkAOUDB4VXzVxnbUs4hX5AtfZ
         BTBamC1L1/k0hKUy9Shg8LNdDVyQCwkYwunDN40usxKx/TRQT14t197JR9Mawg4fH7En
         OSGyHspZxE4tD8K4C/sOwq/YmxjJMByKchRTQB2uII+rjuFBnd1Op2oA4If6XkqNOcZO
         7f6RV90FRasAxaQAxSW90CDKXbn9+hkW+gJc0LoAt2EfvKU7W6KUhR3PkuqNxKmtMhaz
         viOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vxCBqrAPI4BpulMRUd2dHi3liznsJJT1GfUE4tz0DaA=;
        b=sotMAO++hQ9Yuu9nyvPCSwqi1r5ZTi4tecqBfaxRsEm+74dYKg/ibcgeRf/leFHL/d
         yin/ZZIgpRDzhbuUmSH5zLR4pyIzji30KrVtsjxfykqqCxujg5LJgh8kFCvF22ydCTnp
         Y6J0ZQU4FhbC64+1+lUS4sxBJppcX4wuZtkjsz9r2qS02DGzRNtVw1f//peVmLZ5HFlJ
         /BYZpORKPwIKtMepnYXMsVjYL4PmZFkz18z4MZMWddx45xg5IP/kGLH3cgcfH14tVQma
         SdQKA1OfFCBNbqqrtPSkKY9CXUizVU+JZili1jd9FWX4kvdurMv3ioX7z6pPctwf7bTx
         PYdA==
X-Gm-Message-State: AOAM532k9qszLPmjvricBGxKUzsq1PTfIi0pTvtt9ciHW8MBUntb0EXR
        NQ+F61FdLtYsnf2u73QjVpE=
X-Google-Smtp-Source: ABdhPJxxJ/72A/OmbDItHMGCvQ2xjK0xiOUvxS1AbALAf8vSAIoGtERKyAuNNz0J5ee4KjedSLx1Mw==
X-Received: by 2002:a17:90a:ad8b:: with SMTP id s11mr427971pjq.40.1601607628065;
        Thu, 01 Oct 2020 20:00:28 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a1sm13541pjh.2.2020.10.01.20.00.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 20:00:27 -0700 (PDT)
Date:   Thu, 1 Oct 2020 19:54:35 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201002025434.GA9394@Asurada-Nvidia>
References: <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia>
 <20201001102316.GF3919720@ulmo>
 <20201001110425.GB1272@Asurada>
 <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
 <20201002010751.GA26971@Asurada-Nvidia>
 <1b621b9d-cdc3-c7aa-2fa2-d728ae2bbc5d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b621b9d-cdc3-c7aa-2fa2-d728ae2bbc5d@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 02, 2020 at 04:55:34AM +0300, Dmitry Osipenko wrote:
> 02.10.2020 04:07, Nicolin Chen пишет:
> > On Thu, Oct 01, 2020 at 11:33:38PM +0300, Dmitry Osipenko wrote:
> >>>>> If we can't come to an agreement on globalizing mc pointer, would
> >>>>> it be possible to pass tegra_mc_driver through tegra_smmu_probe()
> >>>>> so we can continue to use driver_find_device_by_fwnode() as v1?
> >>>>>
> >>>>> v1: https://lkml.org/lkml/2020/9/26/68
> >>>>
> >>>> tegra_smmu_probe() already takes a struct tegra_mc *. Did you mean
> >>>> tegra_smmu_probe_device()? I don't think we can do that because it isn't
> >>>
> >>> I was saying to have a global parent_driver pointer: similar to
> >>> my v1, yet rather than "extern" the tegra_mc_driver, we pass it
> >>> through egra_smmu_probe() and store it in a static global value
> >>> so as to call tegra_smmu_get_by_fwnode() in ->probe_device().
> >>>
> >>> Though I agree that creating a global device pointer (mc) might
> >>> be controversial, yet having a global parent_driver pointer may
> >>> not be against the rule, considering that it is common in iommu
> >>> drivers to call driver_find_device_by_fwnode in probe_device().
> >>
> >> You don't need the global pointer if you have SMMU OF node.
> >>
> >> You could also get driver pointer from mc->dev->driver.
> >>
> >> But I don't think you need to do this at all. The probe_device() could
> >> be invoked only for the tegra_smmu_ops and then seems you could use
> >> dev_iommu_priv_set() in tegra_smmu_of_xlate(), like sun50i-iommu driver
> >> does.
> > 
> > Getting iommu device pointer using driver_find_device_by_fwnode()
> > is a common practice in ->probe_device() of other iommu drivers.
> 
> Please give me a full list of the IOMMU drivers which use this method.
> 
> > But this requires a device_driver pointer that tegra-smmu doesn't
> > have. So passing tegra_mc_driver through tegra_smmu_probe() will
> > address it.
> > 
> 
> If you're borrowing code and ideas from other drivers, then at least
> please borrow them from a modern good-looking drivers. And I already
> pointed out that following cargo cult is not always a good idea.
> 
> ARM-SMMU isn't a modern driver and it has legacy code. You shouldn't
> copy it blindly. The sun50i-iommu driver was added half year ago, you
> may use it as a reference.

I took a closer look at sun50i-iommu driver. It's a good idea.
I think I can come up with a cleaner one. Will send v4.

Thanks for the advice.

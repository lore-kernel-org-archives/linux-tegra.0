Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43BCC4727E
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 01:13:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF3CD208C7
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 01:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZuDSndO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387430AbgJBBNo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 21:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733275AbgJBBNo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 21:13:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30923C0613D0;
        Thu,  1 Oct 2020 18:13:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b17so42150pji.1;
        Thu, 01 Oct 2020 18:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cyj5bDIyFJEfsZsMox4XldvwN5w3gjkgLZSeBDyADL0=;
        b=VZuDSndO9n7HwRbuSpii2V7aBh35rBSo8cv4IVZ7C8HWKMHbFFR9nTIhXEKL7kWdHD
         iNC+1BgH/LoZ6P/GuM3ZQdQxa+vw3Yw7dz52aY2m9nJqVfONyfee6/+OgM3LxGhJ8C1U
         jdfgwF0SeNDbeNyio7znl0KM8vxNrSETZ2X0gNUmNMZnLgq8xiNvVyYREU59RJBuQQRn
         pNlXu6PG2igAr0ANQdxSu9C3wfppiZZADUyn6+tRLdvJ6QdqaRUNZW4AoqNswg/2q+6n
         zLHJJJhkl+Xaob5gh/hxq+udZ1boCCneH/ZgvN1QsvEulfF7bwsKnk9zDsBG5qPvxhGQ
         teRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cyj5bDIyFJEfsZsMox4XldvwN5w3gjkgLZSeBDyADL0=;
        b=HS5Mup94XGmxdzGixsa9rebOtv57WV061yFgZblvzOE/IHvjIp3QHPLVQ262f1PRLM
         1VH682th43deFVZjfVZ7X5MJyqExqTrA2u1f+bxmP4uXtgOOI3I7r0AYqLJE7iQV+Qkp
         CEqawG7RGGNwFZe15EjehqhG7eta9zTUz3TnqH4T4OZVF3dTjApUBVatLeN9T8sUJQxi
         FhvDINhd7fLW6FLeLOSeM3sLJNAH5yjCQ4TQZvsQ9efOa6BjDM9slpuNPe/7v7CUiEtD
         bEOAsWaSVXRy/JFmzO8Z4Pu+74uHXed3Jtz2Dx4d2czUFFGYBDLVVoI0BuJNnuCsXC6C
         IM7A==
X-Gm-Message-State: AOAM533Ol8x87YiYEZXH1DnUtelbXDNev1d6e4/FoGItgMc0L544zhwY
        CHEF+Omk2DkPOVBWsaeSxHwKz1/vJgw=
X-Google-Smtp-Source: ABdhPJy1SQt9uw+QkCOsb9zaS5rHccdp+czF4vyWwr65WJMYUl078ivr6S9KMegcra/3a90mC1GJfw==
X-Received: by 2002:a17:90a:ea0a:: with SMTP id w10mr69467pjy.165.1601601223488;
        Thu, 01 Oct 2020 18:13:43 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a2sm7755053pfk.201.2020.10.01.18.13.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 18:13:43 -0700 (PDT)
Date:   Thu, 1 Oct 2020 18:07:51 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201002010751.GA26971@Asurada-Nvidia>
References: <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia>
 <20201001102316.GF3919720@ulmo>
 <20201001110425.GB1272@Asurada>
 <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 01, 2020 at 11:33:38PM +0300, Dmitry Osipenko wrote:
> >>> If we can't come to an agreement on globalizing mc pointer, would
> >>> it be possible to pass tegra_mc_driver through tegra_smmu_probe()
> >>> so we can continue to use driver_find_device_by_fwnode() as v1?
> >>>
> >>> v1: https://lkml.org/lkml/2020/9/26/68
> >>
> >> tegra_smmu_probe() already takes a struct tegra_mc *. Did you mean
> >> tegra_smmu_probe_device()? I don't think we can do that because it isn't
> > 
> > I was saying to have a global parent_driver pointer: similar to
> > my v1, yet rather than "extern" the tegra_mc_driver, we pass it
> > through egra_smmu_probe() and store it in a static global value
> > so as to call tegra_smmu_get_by_fwnode() in ->probe_device().
> > 
> > Though I agree that creating a global device pointer (mc) might
> > be controversial, yet having a global parent_driver pointer may
> > not be against the rule, considering that it is common in iommu
> > drivers to call driver_find_device_by_fwnode in probe_device().
> 
> You don't need the global pointer if you have SMMU OF node.
> 
> You could also get driver pointer from mc->dev->driver.
> 
> But I don't think you need to do this at all. The probe_device() could
> be invoked only for the tegra_smmu_ops and then seems you could use
> dev_iommu_priv_set() in tegra_smmu_of_xlate(), like sun50i-iommu driver
> does.

Getting iommu device pointer using driver_find_device_by_fwnode()
is a common practice in ->probe_device() of other iommu drivers.
But this requires a device_driver pointer that tegra-smmu doesn't
have. So passing tegra_mc_driver through tegra_smmu_probe() will
address it.

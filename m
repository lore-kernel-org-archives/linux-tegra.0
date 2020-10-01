Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1B9C47425
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 11:04:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A41C12137B
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 11:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNg1K8NE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbgJALEa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 07:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731548AbgJALEa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 07:04:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE1DC0613D0;
        Thu,  1 Oct 2020 04:04:28 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id u3so1691832pjr.3;
        Thu, 01 Oct 2020 04:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kwUefxEc2VKbwnC6MpLeVeUZR7V/IW6FImc8bCJZL2g=;
        b=aNg1K8NEZunLQmWhVbBO36QAXTlfpFp49OAdMVRRVb5ZH4Zoqt2Be1/6Wf/TzDVNp9
         37AcV94pUrFEaRto2MR9IFK40gmn8xCD+TvadaEemWr7v7Vj76aOWSWlkhQrF5po+UVn
         ztfTWAo0xzGVWkcDYAjYRjPhC7LZhF4/6rsgdUycBe653d+Dl0L6IVmGN5E/Pby3IVEN
         Msv9wcU0LlkqzQLKJ8vbt+kZ178nZpArUaWVHeGQ47AB0PXjPLi3GsLJ6a8Q7GzskKaW
         F3fV1FL+/2ioSnI0s+hwKQ8X1VljKEHYeBbQ5ZiHj2atKjLaWnAtRcvhbogn7yJdx5xz
         xBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kwUefxEc2VKbwnC6MpLeVeUZR7V/IW6FImc8bCJZL2g=;
        b=g53jLMYxrOlSMFGrlD/J+THYmt0dOJcRZSK2zKMO0AjPSm96l3KRePIHAOjsH29Po0
         W9nzkT6ANgZl3UcmsndF7tEN+LidJJIMnYcjYeRHeQ1LWGqFKOdIpynmet9gahNXJFgl
         GXF+l4JPVpffyx4gkLKKORpx6l6nYXUYeilFfLw6b1+EwD/7/V7l3SPdJOxF7cBmrS/a
         mUxhquzNx5KMMGRQfH9JaqKP7VNn5P1uFOGifUjb73sZ5sb2xvRHzZ5tejfJh9DtmZ0G
         xzoQ+xew/x1sJ7Ti//ZV8cW3BZ08oiJtA+NlXMMJl2HE1qFV4XvM80eRsg7GwNZUNNzW
         t16Q==
X-Gm-Message-State: AOAM531tZKRnGsqzrtnRJTl5jgN4v9Wm+KQT2iOmNmLO9VYpkf2qvbPZ
        vwm/6TzXpCvvNE9ni0Cikas=
X-Google-Smtp-Source: ABdhPJzLpth+rE+tUrfWWYVadP7gpURbzlQAvd7inBklRMAZfhnIqldBIWQKgfle0cwSrKp6IwwU0w==
X-Received: by 2002:a17:90a:fe07:: with SMTP id ck7mr6542657pjb.20.1601550268351;
        Thu, 01 Oct 2020 04:04:28 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
        by smtp.gmail.com with ESMTPSA id z6sm4446676pgz.87.2020.10.01.04.04.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2020 04:04:28 -0700 (PDT)
Date:   Thu, 1 Oct 2020 04:04:25 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001110425.GB1272@Asurada>
References: <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia>
 <20201001102316.GF3919720@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001102316.GF3919720@ulmo>
User-Agent: Mutt/1.5.22 (2013-10-16)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 01, 2020 at 12:23:16PM +0200, Thierry Reding wrote:
 > > >>>>>> It looks to me like the only reason why you need this new global API is
> > > >>>>>> because PCI devices may not have a device tree node with a phandle to
> > > >>>>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
> > > >>>>>> root complex has an iommus property, right? In that case, can't we
> > > >>>>>> simply do something like this:
> > > >>>>>>
> > > >>>>>> 	if (dev_is_pci(dev))
> > > >>>>>> 		np = find_host_bridge(dev)->of_node;
> > > >>>>>> 	else
> > > >>>>>> 		np = dev->of_node;

> > I personally am not a fan of adding a path for PCI device either,
> > since PCI/IOMMU cores could have taken care of it while the same
> > path can't be used for other buses.
> 
> There's already plenty of other drivers that do something similar to
> this. Take a look at the arm-smmu driver, for example, which seems to be
> doing exactly the same thing to finding the right device tree node to
> look at (see dev_get_dev_node() in drivers/iommu/arm-smmu/arm-smmu.c).

Hmm..okay..that is quite convincing then...

> > If we can't come to an agreement on globalizing mc pointer, would
> > it be possible to pass tegra_mc_driver through tegra_smmu_probe()
> > so we can continue to use driver_find_device_by_fwnode() as v1?
> > 
> > v1: https://lkml.org/lkml/2020/9/26/68
> 
> tegra_smmu_probe() already takes a struct tegra_mc *. Did you mean
> tegra_smmu_probe_device()? I don't think we can do that because it isn't

I was saying to have a global parent_driver pointer: similar to
my v1, yet rather than "extern" the tegra_mc_driver, we pass it
through egra_smmu_probe() and store it in a static global value
so as to call tegra_smmu_get_by_fwnode() in ->probe_device().

Though I agree that creating a global device pointer (mc) might
be controversial, yet having a global parent_driver pointer may
not be against the rule, considering that it is common in iommu
drivers to call driver_find_device_by_fwnode in probe_device().

> known at that point whether MC really is the SMMU. That's in fact the
> whole reason why we have to go through this whole dance of iterating
> over the iommus entries to find the SMMU.

Hmm..I don't quite get the meaning of:
"it isn't known at that point whether MC really is the SMMU".

Are you saying the stage of bus_set_iommu()? So because at that
point either SMMU probe() or MC probe() hasn't finished yet?

Thanks!

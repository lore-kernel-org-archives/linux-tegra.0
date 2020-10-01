Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128FDC4363D
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 02:54:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B94A42087D
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 02:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icsVsbr4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730349AbgJACyf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 22:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgJACye (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 22:54:34 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D91C061755;
        Wed, 30 Sep 2020 19:54:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 34so2775742pgo.13;
        Wed, 30 Sep 2020 19:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=KJi4ba1o7OEmQx07SGkY7nXm0TQ/hVgl3GIotn3ANWo=;
        b=icsVsbr4uO5Wp5/f5LgBnFO4SPOkAf7fycnO2bW7r8Yq6fOScvXwXoFGQhK6aTWktT
         gUiJt6FFpFygsbyRT73JYR4JZGJHE54C5JT5Vmy1XbgI3Mu8G6T5PTeFYq+uC+IBpDDP
         JHc0QqmQFjUlNKXKuGrGQf6G0XS/t5aNf+zJGPHWjU7LfHXjtwWXFGn/HWtsM1yhfCl5
         Bcu/+b5VlxlwW9TWRYVbfQCHpa/uSiMmHYaVkrZFJLquIpR6X2NSnA6z+O4ybR+FGxYJ
         OsQ251ORTZ4xBKOHPt0PZ3g7oBJi+lFsRDgoGBaptFhB2Zrnw4v515u8Z6yj/YQ07OGy
         2Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=KJi4ba1o7OEmQx07SGkY7nXm0TQ/hVgl3GIotn3ANWo=;
        b=C8RlIo5LZsB+xeiDgUc8PBxY/06RWGe6mW8n8hA5QwBBQhI234b/yR1QS7J6WARTAU
         9s21R5DVQy3J1QupE/Qx4JFlLhXXfn0aC+9JT8ptoOc9kUIWo8WfHjplhsjOsd6yLNTX
         qEeCO1DCvCMiskDhu9CFgsfivdKqiY9GH9OosoHYCKl8xxFtpTpKGnaTmBIHOjal7TWJ
         SjB6bUgjjDbjx86WcRbNa4Ul51gj/X2zL+5lH4C6C1tpKBi9wKMec+QjihJPCeTzJO3O
         mv/85d+oosaX72HfrPyH0BN4o2QalMVJqXkwDoJy12s5YorL4MW/BRaICsBifZ1d2bSk
         PkYA==
X-Gm-Message-State: AOAM530iz9gm6MdxhyG4iIXmPAGUI8zSY+4QmaoFYvR+5nwR8Xvh7qeZ
        5akroAI51gvzDOuEmG3gMhg=
X-Google-Smtp-Source: ABdhPJwnS01CLMBYPUaSVwPd6+pnekEkWjRFV6Kf726LqsVavVn2ZtKWEdaXKRzMbxDeOp7RMzL1KQ==
X-Received: by 2002:a63:6306:: with SMTP id x6mr4644910pgb.161.1601520872517;
        Wed, 30 Sep 2020 19:54:32 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id w203sm4412626pff.0.2020.09.30.19.54.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 19:54:32 -0700 (PDT)
Date:   Wed, 30 Sep 2020 19:48:50 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001024850.GA28456@Asurada-Nvidia>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 01, 2020 at 05:06:19AM +0300, Dmitry Osipenko wrote:
> 01.10.2020 04:26, Nicolin Chen пишет:
> > On Thu, Oct 01, 2020 at 12:56:46AM +0300, Dmitry Osipenko wrote:
> >> 01.10.2020 00:32, Nicolin Chen пишет:
> >>> On Thu, Oct 01, 2020 at 12:24:25AM +0300, Dmitry Osipenko wrote:
> >>>> ...
> >>>>>> It looks to me like the only reason why you need this new global API is
> >>>>>> because PCI devices may not have a device tree node with a phandle to
> >>>>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
> >>>>>> root complex has an iommus property, right? In that case, can't we
> >>>>>> simply do something like this:
> >>>>>>
> >>>>>> 	if (dev_is_pci(dev))
> >>>>>> 		np = find_host_bridge(dev)->of_node;
> >>>>>> 	else
> >>>>>> 		np = dev->of_node;
> >>>>>>
> >>>>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> >>>>>> sure that exists.
> >>>>>>
> >>>>>> Once we have that we can still iterate over the iommus property and do
> >>>>>> not need to rely on this global variable.
> >>>>>
> >>>>> I agree that it'd work. But I was hoping to simplify the code
> >>>>> here if it's possible. Looks like we have an argument on this
> >>>>> so I will choose to go with your suggestion above for now.
> >>>>
> >>>> This patch removed more lines than were added. If this will be opposite
> >>>> for the Thierry's suggestion, then it's probably not a great suggestion.
> >>>
> >>> Sorry, I don't quite understand this comments. Would you please
> >>> elaborate what's this "it" being "not a great suggestion"?
> >>>
> >>
> >> I meant that you should try to implement Thierry's solution, but if the
> >> end result will be worse than the current patch, then you shouldn't make
> >> a v4, but get back to this discussion in order to choose the best option
> >> and make everyone agree on it.
> > 
> > I see. Thanks for the reply. And here is a sample implementation:
> 
> That's what I supposed to happen :) The new variant adds code and
> complexity, while old did the opposite. Hence the old variant is clearly
> more attractive, IMO.

I personally am not a fan of adding a path for PCI device either,
since PCI/IOMMU cores could have taken care of it while the same
path can't be used for other buses.

If we can't come to an agreement on globalizing mc pointer, would
it be possible to pass tegra_mc_driver through tegra_smmu_probe()
so we can continue to use driver_find_device_by_fwnode() as v1?

v1: https://lkml.org/lkml/2020/9/26/68

Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2F2C4363A
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 01:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 532DC207F7
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 01:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR2segjE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgJFBVI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 21:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgJFBVI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 21:21:08 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85867C0613CE;
        Mon,  5 Oct 2020 18:21:08 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so8062456pff.6;
        Mon, 05 Oct 2020 18:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0yWXKrqXMFP3HPBRZ+yjO3u40MSxEa60RyZK91ANWVM=;
        b=IR2segjEJ+qR4NMC1gYN941vKF3ypk6RnWcPXyMrNE4vaUcV6vlM++CMQo+qS6pcWt
         voww5nAAvAGxSqSW1u3KPkqNqT2J4TRkKf6OI9m7VITITXKlgpbDd2sbHSaZG7zSUO7D
         WWUeu6P4x3+FWuC12b4SLzEp1RfY/nHE5l+tf5qD/MlPRSRxbiuNnN7Vdf1LL/AH1IjZ
         OUkuhRSZ/+FpnT6KiqemDn3RY7xoT5qLEtMFxkhPNCSqjUFRZRAHCDjd2BvZOylmyoM3
         RNmH0K4LTk6mjGpWKoA+8ruiBRszLQ/7En+bg/l5oAIKGgDdFDFuNURnRcNS2p7wjikH
         u22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0yWXKrqXMFP3HPBRZ+yjO3u40MSxEa60RyZK91ANWVM=;
        b=FSxAGw+bQLVd6HRLrKIpg5+oyLdSRev8eKpBbKcNv6ixYuKndvBh4WLodMUSvi6Zv4
         mFLx06a8GCCuTRA8nyYxN4Y1AStPk+u/1/3FySlc2YASTofBsnS9x62hFQa6xEovKs71
         iKbhyWG8Xb4FOtgxG5OM+PDDEZj39hBEPuo4hptgfoSy7FR5Qiw/UYNHRj4d35mrdhvv
         9EtZ+xkrojQ5xm7IG693DgwRg20Tw/6dfsH1T10YDH4Mux5k6Ut0sReLbZs2Jl3WNRJ6
         0vShnQ++y3BXlfnbwbZml8Ha1lMNXx7K913LpoQn5MGJoXZfpktXsD9a+oJJGh2kQ1Po
         7QtQ==
X-Gm-Message-State: AOAM53272pRNCgLoDw4R8e2B/hpneH3rnijDfhUkKUSbh/14nN3AQQjB
        4/ELiP45BHNpAeoFjbQAHfLQnkfl0Qw=
X-Google-Smtp-Source: ABdhPJz++fvdW5BO+Yg+ry6Xixb6SSNf9AXvvqMX3oHryM90ksPOZMbv+p4+XqyTLnKWNS9FnSUgEA==
X-Received: by 2002:a63:e212:: with SMTP id q18mr1900863pgh.356.1601947267951;
        Mon, 05 Oct 2020 18:21:07 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id v205sm1283135pfc.110.2020.10.05.18.21.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 18:21:07 -0700 (PDT)
Date:   Mon, 5 Oct 2020 18:14:34 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201006011434.GC28640@Asurada-Nvidia>
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
 <4a5a5b1c-080a-327a-1e2f-dc087948e1a1@gmail.com>
 <20201004215731.GA21420@Asurada-Nvidia>
 <689c3d90-e05c-d36a-bf37-0bec100040f5@gmail.com>
 <20201005105638.GO425362@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005105638.GO425362@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 05, 2020 at 12:56:38PM +0200, Thierry Reding wrote:
> On Mon, Oct 05, 2020 at 11:41:08AM +0300, Dmitry Osipenko wrote:
> > 05.10.2020 00:57, Nicolin Chen пишет:
> > > On Sat, Oct 03, 2020 at 05:06:42PM +0300, Dmitry Osipenko wrote:
> > >> 03.10.2020 09:59, Nicolin Chen пишет:
> > >>>  static int tegra_smmu_of_xlate(struct device *dev,
> > >>>  			       struct of_phandle_args *args)
> > >>>  {
> > >>> +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
> > >>> +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
> > >>>  	u32 id = args->args[0];
> > >>>  
> > >>> +	put_device(&iommu_pdev->dev);
> > >>> +
> > >>> +	if (!mc || !mc->smmu)
> > >>> +		return -EPROBE_DEFER;
> > >>
> > >> I'm not very excited by seeing code in the patches that can't be
> > >> explained by the patch authors and will appreciate if you could provide
> > >> a detailed explanation about why this NULL checking is needed because I
> > >> think it is unneeded, especially given that other IOMMU drivers don't
> > >> have such check.
> > > 
> > > This function could be called from of_iommu_configure(), which is
> > > a part of other driver's probe(). So I think it's safer to have a
> > > check. Yet, given mc driver is added to the "arch_initcall" stage,
> > > you are probably right that there's no really need at this moment
> > > because all clients should be called after mc/smmu are inited. So
> > > I'll resend a v6, if that makes you happy.
> > 
> > I wanted to get the explanation :) I'm very curious why it's actually
> > needed because I'm not 100% sure whether it's not needed at all.
> > 
> > I'd assume that the only possible problem could be if some device is
> > created in parallel with the MC probing and there is no locking that
> > could prevent this in the drivers core. It's not apparent to me whether
> > this situation could happen at all in practice.
> > 
> > The MC is created early and at that time everything is sequential, so
> > it's indeed should be safe to remove the check.
> 
> I think I now remember exactly why the "hack" in tegra_smmu_probe()
> exists. The reason is that the MC driver does this:
> 
> 	mc->smmu = tegra_smmu_probe(...);
> 
> That means that mc->smmu is going to be NULL until tegra_smmu_probe()
> has finished. But tegra_smmu_probe() calls bus_set_iommu() and that in
> turn calls ->probe_device(). So the purpose of the "hack" in the
> tegra_smmu_probe() function was to make sure mc->smmu was available at
> that point, because, well, it is already known, but we haven't gotten
> around to storing it yet.

Yea, that's exactly what I described in the commit message of a
later version of this patch. Yet, we can drop it now as a device
will probe() and call ->probe_device() again.

> ->of_xlate() can theoretically be called as early as right after
> bus_set_iommu() via of_iommu_configure() if that is called in parallel
> with tegra_smmu_probe(). I think that's very unlikely, but I'm not 100%
> sure that it can't happen.

As my previous reply to Dmitry above, I don't think it'd happen,
given that mc/smmu drivers are inited during arch_initcall stage
while all clients should be probed during device_initcall stage,
once this rework patch gets merged.

> In any case, I do agree with Dmitry that we should have a comment here
> explaining why this is necessary. Even if we're completely certain that
> this is necessary, it's not obvious and therefore should get that
> comment. And if we're not certain that it's necessary, it's probably
> also good to mention that in the comment so that eventually it can be
> determined or the check removed if it proves to be unnecessary.

Well, I have answered him, and also removed the mc/smmu check in
v6 already.

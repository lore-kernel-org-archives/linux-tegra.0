Return-Path: <SRS0=Zq/d=DL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1354C4363C
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:03:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 689C2206DD
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGtddg2o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgJDWDz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Oct 2020 18:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgJDWDz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 18:03:55 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C394C0613CE;
        Sun,  4 Oct 2020 15:03:54 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id b17so4142969pji.1;
        Sun, 04 Oct 2020 15:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hiTQzSF4WkdU76QTi9QZDEhHhUN1SUtqOZbzP+32RK4=;
        b=YGtddg2oP1zVqUfCFFhAO4LAsgstkdAA3IL24t43oNsEjqjCnBLxcRDpe3b4GkB7Fi
         qNS7GUN7e0UwYYngF/FYAHRRt9pEpyYgHhBTEXJw7dW4Fszet2kUTtBdOOjst2f1eQqu
         K7XHAlKWXJe28W7vaswHtMLoBI5fuOyTK9/TT/VXfA9MUOcNuGor+S4fK7KTerhChyC0
         EEmoD8rnyMVoDE2sdy+Tk5LTuZN3I4oXlK/TRngSxw+8zU4ACUFj1NXaLTkQRSw0B0C3
         p1ekNvDq/IAtbH7rRTGm7qBOkM1LZJxME3P5839WQfuSvdRBtxGFP7gALM94EdoMM5eR
         DsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hiTQzSF4WkdU76QTi9QZDEhHhUN1SUtqOZbzP+32RK4=;
        b=Hv23CgaYdkC0rmNDmOoo59vKoMJcXdfonc/4fPghD8GL4pD4kg1/e5X7BYeiFt7NAT
         P1r26rBcCC92mzRqkq0a934s/70DYBqGpuVjfHNRkaQQiRDqYkdGGCTHvVB0BAdfceKe
         iMopnDJxjQHEKgEEutROk5asAeFIOVrdWXpC96g9G+CXzOpglmOBlBf/ccGGicIot1NN
         eSq8k3wl6g0XW54/2E4j2Tv/NzxSeVzsJI8ghIrysVbic/hCLt17J+n00rW0XgNJYE3d
         stYX2OoovxgiHOOpaYKyQKPUqDDyElT87YVsJvptSbnEkeAIEgTZIOGDpDJIBcvJ3LvT
         AoTg==
X-Gm-Message-State: AOAM533Dw/Bg+0rJ5s+lOWCTXly3Cnb1kn/Jtub9GCTMQhyMXNN3MT8b
        3cDNUKGfWBwJWvyaPzd1VxKjxjhtwDc=
X-Google-Smtp-Source: ABdhPJymMfT4hxoF5YwtFJKrWgXA9ioeVfiQ8Bw5gURBdv8+OmuXnFjc/3+WMwpThxpJKagDsNeu6A==
X-Received: by 2002:a17:90b:1741:: with SMTP id jf1mr13242190pjb.164.1601849033662;
        Sun, 04 Oct 2020 15:03:53 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d128sm9942284pfc.8.2020.10.04.15.03.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Oct 2020 15:03:53 -0700 (PDT)
Date:   Sun, 4 Oct 2020 14:57:31 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201004215731.GA21420@Asurada-Nvidia>
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
 <4a5a5b1c-080a-327a-1e2f-dc087948e1a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a5a5b1c-080a-327a-1e2f-dc087948e1a1@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Oct 03, 2020 at 05:06:42PM +0300, Dmitry Osipenko wrote:
> 03.10.2020 09:59, Nicolin Chen пишет:
> >  static int tegra_smmu_of_xlate(struct device *dev,
> >  			       struct of_phandle_args *args)
> >  {
> > +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
> > +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
> >  	u32 id = args->args[0];
> >  
> > +	put_device(&iommu_pdev->dev);
> > +
> > +	if (!mc || !mc->smmu)
> > +		return -EPROBE_DEFER;
> 
> I'm not very excited by seeing code in the patches that can't be
> explained by the patch authors and will appreciate if you could provide
> a detailed explanation about why this NULL checking is needed because I
> think it is unneeded, especially given that other IOMMU drivers don't
> have such check.

This function could be called from of_iommu_configure(), which is
a part of other driver's probe(). So I think it's safer to have a
check. Yet, given mc driver is added to the "arch_initcall" stage,
you are probably right that there's no really need at this moment
because all clients should be called after mc/smmu are inited. So
I'll resend a v6, if that makes you happy.

> I'm asking this question second time now, please don't ignore review
> comments next time.

I think I missed your reply or misunderstood it.

Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A96C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Feb 2021 06:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02E8964EBD
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Feb 2021 06:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbhBYG1y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Feb 2021 01:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233291AbhBYG12 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Feb 2021 01:27:28 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D153C06174A;
        Wed, 24 Feb 2021 22:26:47 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id o6so2918715pjf.5;
        Wed, 24 Feb 2021 22:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=w8TXeKml8XM1ZbA6ShbdIyFFO1a3KVv9r8HYd21fZjk=;
        b=p19dGD+CtfMWthkM6oPMevPv6cSTY5w5I15nfN7Il0AFFuk+DDhRywx9dAOKOylpiz
         AddR9A97AT1BV89QDKGX6qVEBU+Jix+DLHuUJIxkrA/MDqJQW4gZEXw72bzrJkEZOp4V
         T8ZORrbSZNq/tw7EtYa/0C74efB9AAXr3G8oHVG8oJ+DB6njNaI3iMXZjB6Lau8EtLGM
         PlH5TlB9qEwy+HQMZpcKTlTspDuCWlllm0Dz29DysvqXwRdDxK9LKrY6WtMfxhAdAvM4
         5x4dtODIV6QL5GClNVzeF2U5i9U0yqyAtLOXFTZzuZ0dZzabuLS9qWhFO7AxH7JiP7hn
         vprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=w8TXeKml8XM1ZbA6ShbdIyFFO1a3KVv9r8HYd21fZjk=;
        b=M4ZLYoFkBJh4GDcwp3gKeiJ18eVssFXWbGUutfJBx8/NHMvKzIf7IadkLmdpb18Ezd
         ifXEgGsqubzpr5oQfbQkMbCh2h0OoGgLhhmIxrPt7i8GDiUr4F/jzDkBXNk2EgMduZX1
         pu26RN9nkn6lHCpPtWjTZ1O3JNcw8x44A/Ur1yM/ZxQWpZmpqwsYZegBvqCadldQZ5+L
         JcGV/z2tAq22RtcQOXxV498juYctYve3Xp315CxSlWUsWXkSseAEzq1i7GN5EjzGNcJi
         YT/JLCGbd4fsHef3H3Ge9F9IuVRDT5wH3NjvOIhZGMfk4MuGeelV3gNLTkKbB5mXym0y
         sHpg==
X-Gm-Message-State: AOAM532S/E23faKetrQCIipN/tY6ZvbOWuVYZ+SEt/DBNru/vsHgObQc
        Vsyg845ax/Cg95Ni9D5xbUE=
X-Google-Smtp-Source: ABdhPJy1Weq2xf/Mb961fv+2Q+OKgsSyBof3VnceaDHKkw7fdW2LEYlYl75J31TS2Bc58lJ8GzVh3g==
X-Received: by 2002:a17:902:b089:b029:e3:28:b8ee with SMTP id p9-20020a170902b089b02900e30028b8eemr1812650plr.84.1614234407056;
        Wed, 24 Feb 2021 22:26:47 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id o3sm4407946pgm.60.2021.02.24.22.26.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 22:26:46 -0800 (PST)
Date:   Wed, 24 Feb 2021 22:27:43 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
Message-ID: <20210225062742.GA13353@Asurada-Nvidia>
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <9d6445c0-9574-1650-e327-32b11716f87e@gmail.com>
 <20210223021343.GA6539@Asurada-Nvidia>
 <79bb1248-497f-8adf-663b-74448bea3849@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79bb1248-497f-8adf-663b-74448bea3849@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Feb 23, 2021 at 08:10:41AM +0300, Dmitry Osipenko wrote:
> 23.02.2021 05:13, Nicolin Chen пишет:
> > Hi Dmitry,
> > 
> > On Sat, Feb 20, 2021 at 08:16:22AM +0300, Dmitry Osipenko wrote:
> >> 19.02.2021 01:07, Nicolin Chen пишет:
> >>> Commit 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> >>> removed certain hack in the tegra_smmu_probe() by relying on IOMMU core to
> >>> of_xlate SMMU's SID per device, so as to get rid of tegra_smmu_find() and
> >>> tegra_smmu_configure() that are typically done in the IOMMU core also.
> >>>
> >>> This approach works for both existing devices that have DT nodes and other
> >>> devices (like PCI device) that don't exist in DT, on Tegra210 and Tegra3
> >>> upon testing. However, Page Fault errors are reported on tegra124-Nyan:
> >>>
> >>>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> >>> 	 EMEM address decode error (SMMU translation error [--S])
> >>>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> >>> 	 Page fault (SMMU translation error [--S])
> >>>
> >>> After debugging, I found that the mentioned commit changed some function
> >>> callback sequence of tegra-smmu's, resulting in enabling SMMU for display
> >>> client before display driver gets initialized. I couldn't reproduce exact
> >>> same issue on Tegra210 as Tegra124 (arm-32) differs at arch-level code.
> >>
> >> Hello Nicolin,
> >>
> >> Could you please explain in a more details what exactly makes the
> >> difference for the callback sequence?
> > 
> > Here is a log with 5.11.0-rc6:
> > https://lava.collabora.co.uk/scheduler/job/3187849
> > [dump_stack was added in some tegra-smmu functions]
> > 
> > And here is a corresponding log with reverting the original commit:
> > https://lava.collabora.co.uk/scheduler/job/3187851
> > 
> > Here is a log with 5.11.0-rc7-next-20210210:
> > https://lava.collabora.co.uk/scheduler/job/3210245
> > 
> > And here is a corresponding log with reverting the original commit:
> > https://lava.collabora.co.uk/scheduler/job/3210596
> > 
> > Both failing logs show that mc errors started right after client DC
> > got enabled by ->attach_dev() callback that in the passing logs was
> > not called until Host1x driver init. And note that two failing logs
> > show that ->attach_dev() could be called from two different sources,
> > of_dma_configure_id() or arch_setup_dma_ops().
> > 
> > The reason why ->attach_dev() gets called is probably related to the
> > following reasons (sorry, can't be 100% sure as I don't have Tegra124
> > or other 32bit Tegra board to test):
> > 1) With the commit reverted, all clients are probed in "arch" stage,
> >    which is even prior to iommu core initialization -- including it
> >    setting default domain type. This probably messed up the type of
> >    allocating domains against the default domain type. Also internal
> >    group is somehow affected. So some condition check in iommu core
> >    failed and then it bypassed ->attach_dev callback in really_probe
> >    stage, until Host1x driver does attach_dev again.
> > 
> > 2) 32bit ARM has arch_setup_dma_ops() does an additional set of iommu
> >    domain allocation + attach_dev(), after of_dma_configure_id() did
> >    once. This isn't reproducible for me on Tegra210.
> > 
> > As debugging online isn't very efficient, and given that Thierry has
> > been working on the linear mapping of framebuffer carveout, I choose
> > to partially revert as a quick fix.
> 
> The partially revert should be okay, but it's not clear to me what makes
> difference for T124 since I don't see that problem on T30, which also
> has active display at a boot time.

Hmm..do you see ->attach_dev() is called from host1x_client_iommu_attach
or from of_dma_configure_id/arch_setup_dma_ops?

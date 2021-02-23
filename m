Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073ECC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Feb 2021 02:13:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC773600CC
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Feb 2021 02:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhBWCNb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Feb 2021 21:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhBWCNa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Feb 2021 21:13:30 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CD8C061574;
        Mon, 22 Feb 2021 18:12:50 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id e9so8916111plh.3;
        Mon, 22 Feb 2021 18:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=c5ZGNOEFsq06O3hDL6Dkcj0DN73dBzxBLUMcvrx4vz8=;
        b=PLpTI6iZ95+2Hpv+V69z/FmaAV3HebWieADBp0LmkCVcJWyWRqHGX4GrMad0MqbLO0
         SbSRecFFlIH73tSepywsfNwDEtmKFC2P4m8jMrBHH9GD8vVdv482iAkTe6qT8RFsofND
         Ps1mslDMQwBAY4jOZFcj2wlmDQ6Eevyn/FV33k4obz/aOBDCYk4Il4UD3tbQIIvYChTK
         dsFOZFBq/IPrSujTdetbUoDxAC6hvy3TMncB2gFgihJendfclDtaTDpbnW8JDV3xATRD
         pr00y6+5EVHtHLH2YBAWCPmSKcBedUuzhYoKCIpYyLrcpm9JiXWyBMSZV8mn7FVUXVQA
         X9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=c5ZGNOEFsq06O3hDL6Dkcj0DN73dBzxBLUMcvrx4vz8=;
        b=plKWoPUSl99hsmWd6SlX+5e3rF1HRFuJ+uXF+L42UIvkqRxNsqL2UOvMDxJL96dYga
         apAGHE6kU/5dKZrx9u9jfQeWUGD6rlfyUrGgLaPKFG3nqFPbA4/h6h2TNZVRmIdnXU3Z
         2KPymX6f8A8bkV1z4MDw5h5+sW7aO5LgOEl3pERtz0ajeSm2WFuZaR6o+iwMuLD83Svj
         wDItpyr42mJgAvJST/rnPFSZWZnc0LdkIKO0GuuKXzKYckKGFD0cKEI1OuxAWRCvUjHm
         PczDvT/3kKBHDmbtKeRM5t5fscXpx+KWAxzp7wFv09t10PY6RG/xi1R/2SYO9F0zpQLO
         hkIw==
X-Gm-Message-State: AOAM533b7kRTZa9nDHYKLdqvekp19d3b+LN2JOoa54NxDZ9ZazPOdGJ4
        h+aL82uWFqY6S/tL141ho20=
X-Google-Smtp-Source: ABdhPJyBcNDbkq2zlENqdPwG/ui/noxDrcs/Rvpcj5HMzJyyrXKsSa+YbMa5RPaTdVSHxWtFWdl+bg==
X-Received: by 2002:a17:90a:e17:: with SMTP id v23mr26904664pje.193.1614046369902;
        Mon, 22 Feb 2021 18:12:49 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id w202sm10092100pff.198.2021.02.22.18.12.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 18:12:49 -0800 (PST)
Date:   Mon, 22 Feb 2021 18:13:44 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
Message-ID: <20210223021343.GA6539@Asurada-Nvidia>
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <9d6445c0-9574-1650-e327-32b11716f87e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d6445c0-9574-1650-e327-32b11716f87e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On Sat, Feb 20, 2021 at 08:16:22AM +0300, Dmitry Osipenko wrote:
> 19.02.2021 01:07, Nicolin Chen пишет:
> > Commit 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> > removed certain hack in the tegra_smmu_probe() by relying on IOMMU core to
> > of_xlate SMMU's SID per device, so as to get rid of tegra_smmu_find() and
> > tegra_smmu_configure() that are typically done in the IOMMU core also.
> > 
> > This approach works for both existing devices that have DT nodes and other
> > devices (like PCI device) that don't exist in DT, on Tegra210 and Tegra3
> > upon testing. However, Page Fault errors are reported on tegra124-Nyan:
> > 
> >   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> > 	 EMEM address decode error (SMMU translation error [--S])
> >   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> > 	 Page fault (SMMU translation error [--S])
> > 
> > After debugging, I found that the mentioned commit changed some function
> > callback sequence of tegra-smmu's, resulting in enabling SMMU for display
> > client before display driver gets initialized. I couldn't reproduce exact
> > same issue on Tegra210 as Tegra124 (arm-32) differs at arch-level code.
> 
> Hello Nicolin,
> 
> Could you please explain in a more details what exactly makes the
> difference for the callback sequence?

Here is a log with 5.11.0-rc6:
https://lava.collabora.co.uk/scheduler/job/3187849
[dump_stack was added in some tegra-smmu functions]

And here is a corresponding log with reverting the original commit:
https://lava.collabora.co.uk/scheduler/job/3187851

Here is a log with 5.11.0-rc7-next-20210210:
https://lava.collabora.co.uk/scheduler/job/3210245

And here is a corresponding log with reverting the original commit:
https://lava.collabora.co.uk/scheduler/job/3210596

Both failing logs show that mc errors started right after client DC
got enabled by ->attach_dev() callback that in the passing logs was
not called until Host1x driver init. And note that two failing logs
show that ->attach_dev() could be called from two different sources,
of_dma_configure_id() or arch_setup_dma_ops().

The reason why ->attach_dev() gets called is probably related to the
following reasons (sorry, can't be 100% sure as I don't have Tegra124
or other 32bit Tegra board to test):
1) With the commit reverted, all clients are probed in "arch" stage,
   which is even prior to iommu core initialization -- including it
   setting default domain type. This probably messed up the type of
   allocating domains against the default domain type. Also internal
   group is somehow affected. So some condition check in iommu core
   failed and then it bypassed ->attach_dev callback in really_probe
   stage, until Host1x driver does attach_dev again.

2) 32bit ARM has arch_setup_dma_ops() does an additional set of iommu
   domain allocation + attach_dev(), after of_dma_configure_id() did
   once. This isn't reproducible for me on Tegra210.

As debugging online isn't very efficient, and given that Thierry has
been working on the linear mapping of framebuffer carveout, I choose
to partially revert as a quick fix.

Thanks

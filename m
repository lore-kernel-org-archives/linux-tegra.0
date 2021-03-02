Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FEAC2BB1F
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E0CD6023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443402AbhCCDby (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2361018AbhCBXME (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 18:12:04 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58237C061756;
        Tue,  2 Mar 2021 15:11:24 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id j12so14813545pfj.12;
        Tue, 02 Mar 2021 15:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=L3H573ByBrOBb02mX24lIDWny2m/571jx6B2ljmNh9I=;
        b=nsm0YN6OwiBC+K4bksH/UKwwlqlHN8/6zHYehmIUvbFMy2m/6ZdXis7+k2M95kBthr
         3vFkaz4iRTr4hgC3hDjLpsq4Cmn48gblX4IBupXb0rLWaVoccuf3m28hhu1tNb4F6jrf
         gSzNoOkLAcV7+u1XMmPFrNgnOUeOTGbF1GDwWjDuNK5TBFsmY+E7GGl9HyBGgyxk1vBR
         rkGvERwp9pKlgNrDRNUq6vuD8JNscgDWtQ0rlBdHQf6YBC8AwfVn4fsn/oaJTVjmnfPi
         EowMgu5d2N1iyjQluoRtsZNqUVQQDlIvye2+UFCy3LA32Vq7eJ1yxGmgjbcHwzD//e0K
         ZMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=L3H573ByBrOBb02mX24lIDWny2m/571jx6B2ljmNh9I=;
        b=mFsAl3tW69fVM7Im2tQPw3rH1n1BiV5L0+Ml/8eC77K7BLhatDXW0aiwxYYSiRr79e
         FCZ4cz2WHpxE5dT8rZSjTEgtiEkQTSj0lFXdW+b5HplWRa5Oa2r5l4FHYGjQow2TMAcC
         HCrnksVfqMIHMRNjHIv8wnLxXOksmBLvnSFjb0IoTP0MK5vqKmj1JBUVuSXqGbhHcefx
         mrpXUbxZ/7xRb3KlDZt3owmOw+j3E0s7ej4Eae3LKKM2wCDXAfXX3cRdX5dH98SCEAyZ
         /RcYLfyqiOQ+hr2+fv9w4D2Ykj+kEcMLRu8ZER/4rhfCiDkv3tnGKizgg+r2ShUbzknX
         oAVQ==
X-Gm-Message-State: AOAM530K4ojoxhV8qfJpXHEU0ulYlg5//lKyUTPo2scoLQGUpEvK7PL8
        iZ9Ktim6XCaevzRHn8MaKZA=
X-Google-Smtp-Source: ABdhPJy0A2GP1mYe3NRIqvfFKpxiK0+TByyD12Ql5KhraG55vVsAP4N42M2J0O49jTzKkY6gGdMqzg==
X-Received: by 2002:a65:46c7:: with SMTP id n7mr20247495pgr.267.1614726683722;
        Tue, 02 Mar 2021 15:11:23 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id y12sm7959008pgs.71.2021.03.02.15.11.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 15:11:23 -0800 (PST)
Date:   Tue, 2 Mar 2021 15:08:59 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
Message-ID: <20210302230856.GA22992@Asurada-Nvidia>
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <9d6445c0-9574-1650-e327-32b11716f87e@gmail.com>
 <20210223021343.GA6539@Asurada-Nvidia>
 <79bb1248-497f-8adf-663b-74448bea3849@gmail.com>
 <20210225062742.GA13353@Asurada-Nvidia>
 <ee0f40f4-dffe-2987-5d4b-c5896f27ec24@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee0f40f4-dffe-2987-5d4b-c5896f27ec24@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Feb 27, 2021 at 12:59:17PM +0300, Dmitry Osipenko wrote:
> 25.02.2021 09:27, Nicolin Chen пишет:
> ...
> >> The partially revert should be okay, but it's not clear to me what makes
> >> difference for T124 since I don't see that problem on T30, which also
> >> has active display at a boot time.
> > 
> > Hmm..do you see ->attach_dev() is called from host1x_client_iommu_attach
> > or from of_dma_configure_id/arch_setup_dma_ops?
> > 
> 
> I applied yours debug-patch, please see dmesg.txt attached to the email.
> Seems probe-defer of the tegra-dc driver prevents the implicit
> tegra_smmu_attach_dev, so it happens to work by accident.

> [    0.327826] tegra-dc 54200000.dc: -------tegra_smmu_of_xlate: id 1
> [    0.328641] [<c052ec75>] (tegra_smmu_of_xlate) from [<c052e591>] (of_iommu_xlate+0x51/0x70)
> [    0.328740] [<c052e591>] (of_iommu_xlate) from [<c052e6d7>] (of_iommu_configure+0x127/0x150)
> [    0.328896] [<c052e6d7>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
> [    0.329060] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
> [    0.331438] tegra-dc 54200000.dc: --------tegra_smmu_probe_device, 822
> [    0.332234] [<c052ebed>] (tegra_smmu_probe_device) from [<c052bd6d>] (__iommu_probe_device+0x35/0x1c4)
> [    0.332391] [<c052bd6d>] (__iommu_probe_device) from [<c052c3cd>] (iommu_probe_device+0x19/0xec)
> [    0.332545] [<c052c3cd>] (iommu_probe_device) from [<c052e6ab>] (of_iommu_configure+0xfb/0x150)
> [    0.332701] [<c052e6ab>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
> [    0.332804] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
> [    0.335202] tegra-dc 54200000.dc: ---------iommu_group_get_for_dev, 1572
> [    0.335292] tegra-dc 54200000.dc: ---------tegra_smmu_device_group, 862
> [    0.335474] tegra-dc 54200000.dc: ---------tegra_smmu_device_group, 909: 1: drm
> [    0.335566] tegra-dc 54200000.dc: ---------iommu_group_get_for_dev, 1574
> [    0.335718] tegra-dc 54200000.dc: ---------iommu_group_add_device, 858
> [    0.335862] tegra-dc 54200000.dc: Adding to iommu group 1
> [    0.335955] tegra-dc 54200000.dc: ---------iommu_alloc_default_domain, 1543: type 3
> [    0.336101] iommu: ------iommu_group_alloc_default_domain: platform, (null), drm
> [    0.336187] ---------tegra_smmu_domain_alloc, 284: type 3
 [    0.336968] [<c0a0ff45>] (tegra_smmu_domain_alloc) from [<c0a0f87b>] (iommu_group_alloc_default_domain+0x4b/0xfa)
> [    0.337127] [<c0a0f87b>] (iommu_group_alloc_default_domain) from [<c052c41d>] (iommu_probe_device+0x69/0xec)
> [    0.337285] [<c052c41d>] (iommu_probe_device) from [<c052e6ab>] (of_iommu_configure+0xfb/0x150)
> [    0.337441] [<c052e6ab>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
> [    0.337599] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
> [    0.339913] tegra-dc 54200000.dc: ---------iommu_probe_device, 272
> [    0.348144] tegra-dc 54200000.dc: failed to probe RGB output: -517

Hmm..not sure where this EPROBE_DEFER comes from. But you are right,
as of_dma_configure_id() returns because of that so it didn't run to
arch_setup_dma_ops() call, which allocates an UNMANAGED iommu domain
and attaches DC to it on Tegra124.

By the way, anyone can accept this change? It doesn't feel right to
leave a regression in the newer release...

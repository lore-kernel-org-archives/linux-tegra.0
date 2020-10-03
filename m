Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEF2C47095
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:19:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2A21206B6
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEc4myML"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgJCOTK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 10:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgJCOTK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 10:19:10 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A451EC0613D0;
        Sat,  3 Oct 2020 07:19:09 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l13so497738ljg.10;
        Sat, 03 Oct 2020 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jN8VgN7S7pjs1PzOSOFLnFJnbrtuHTaGBpTaIB/dfig=;
        b=BEc4myMLhmq3tcDouty00YxzIuK9lSi+P6qlkY/aLnpDlv3/3D+YMgHkXTlfim0OXb
         53/sDvTtdx54B3xoyPajsSTnkGJZqdBHzNFNAHOBGq6IPW2J39XcgPDHgb9SF8N2MOGt
         1Rovttm9dRUi3GQhYc3HOCB5jmtT+W90vIhnfQDDyxv0nO8XanOEwFfyzA+lLPjW/zXY
         wGAR5ni75OnVz8Y3dJUmQ6adIPuZhciuECOS7HLZ+i6qU1n8ikwBc0BmEJKwNOxZDo/w
         LGvSQ5L32fJUAO+GzIlp+o9vUHmKq5lU/N0tkpmXruD/oUbRelW6E/78TP7eD7VqZ8ko
         vqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jN8VgN7S7pjs1PzOSOFLnFJnbrtuHTaGBpTaIB/dfig=;
        b=TcsYEh350YZ3xnHsvmcRxCMBrFGgWARZPJoAq6C9H3VztNf/za4uw5y/4gKM0oDWGg
         fiJW28BMO+0mwSp3UhDcooW4ZHDf+wi8vFG+XLV9BwJrOv4PLdjS12x4YwcWX65mSK7r
         6kxpBSFpFyqHbpkD5Y0eUv4RPUrQh2jWwsDA411RoDamTIB/XMDt45GLczaU4ypgnwIE
         Zfkq5hy7xRI3nDdCozNArf8Tl1CSaFkbc2sxMoimmOd2txNP/TJ7QF6SJJn9VSXB4Euj
         Z5rOp+udgdEYlf2UjOG1ZsquM7OcxjimErjMzcuGV96H/zqc0sCpPQ3IuQFb74drhPdJ
         dQ1Q==
X-Gm-Message-State: AOAM532Xl14qJ3uVYa2Xdwm/sf4HJ6xJCYyjnsinrbZXwMbYj80Zbmpj
        ZHrb9tl3t3vTKEbIwHoKjAtSC/Y9JqA=
X-Google-Smtp-Source: ABdhPJz8HRkiH2e6yJaKfQVsXBwbSCTParLvavlh7kezkqoMDYHYISv/d74+Ey8VVb+z5CjBdiRViQ==
X-Received: by 2002:a2e:b006:: with SMTP id y6mr1782981ljk.462.1601734747881;
        Sat, 03 Oct 2020 07:19:07 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id i139sm1645750lfi.276.2020.10.03.07.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 07:19:07 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <386737ab-83e3-9424-66d9-afff04092599@gmail.com>
Date:   Sat, 3 Oct 2020 17:19:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003065947.18671-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.10.2020 09:59, Nicolin Chen пишет:
> The bus_set_iommu() in tegra_smmu_probe() enumerates all clients
> to call in tegra_smmu_probe_device() where each client searches
> its DT node for smmu pointer and swgroup ID, so as to configure
> an fwspec. But this requires a valid smmu pointer even before mc
> and smmu drivers are probed. So in tegra_smmu_probe() we added a
> line of code to fill mc->smmu, marking "a bit of a hack".
> 
> This works for most of clients in the DTB, however, doesn't work
> for a client that doesn't exist in DTB, a PCI device for example.
> 
> Actually, if we return ERR_PTR(-ENODEV) in ->probe_device() when
> it's called from bus_set_iommu(), iommu core will let everything
> carry on. Then when a client gets probed, of_iommu_configure() in
> iommu core will search DTB for swgroup ID and call ->of_xlate()
> to prepare an fwspec, similar to tegra_smmu_probe_device() and
> tegra_smmu_configure(). Then it'll call tegra_smmu_probe_device()
> again, and this time we shall return smmu->iommu pointer properly.
> 
> So we can get rid of tegra_smmu_find() and tegra_smmu_configure()
> along with DT polling code by letting the iommu core handle every
> thing, except a problem that we search iommus property in DTB not
> only for swgroup ID but also for mc node to get mc->smmu pointer
> to call dev_iommu_priv_set() and return the smmu->iommu pointer.
> So we'll need to find another way to get smmu pointer.
> 
> Referencing the implementation of sun50i-iommu driver, of_xlate()
> has client's dev pointer, mc node and swgroup ID. This means that
> we can call dev_iommu_priv_set() in of_xlate() instead, so we can
> simply get smmu pointer in ->probe_device().
> 
> This patch reworks tegra_smmu_probe_device() by:
> 1) Removing mc->smmu hack in tegra_smmu_probe() so as to return
>    ERR_PTR(-ENODEV) in tegra_smmu_probe_device() during stage of
>    tegra_smmu_probe/tegra_mc_probe().
> 2) Moving dev_iommu_priv_set() to of_xlate() so we can get smmu
>    pointer in tegra_smmu_probe_device() to replace DTB polling.
> 3) Removing tegra_smmu_configure() accordingly since iommu core
>    takes care of it.
> 
> This also fixes a problem that previously we added all clients to
> iommu groups before iommu core initializes its default domain:
>     ubuntu@jetson:~$ dmesg | grep iommu
>     platform smmu_benchmark: Adding to iommu group 0
>     platform 1003000.pcie: Adding to iommu group 1
>     platform 50000000.host1x: Adding to iommu group 2
>     platform 57000000.gpu: Adding to iommu group 3
>     platform 7000c400.i2c: Adding to iommu group 4
>     platform 7000c500.i2c: Adding to iommu group 4
>     platform 7000c700.i2c: Adding to iommu group 4
>     platform 7000d000.i2c: Adding to iommu group 4
>     iommu: Default domain type: Translated
> 
> Though it works fine with IOMMU_DOMAIN_UNMANAGED, but will have
> warnings if switching to IOMMU_DOMAIN_DMA:
>     iommu: Failed to allocate default IOMMU domain of type 0 for
>            group (null) - Falling back to IOMMU_DOMAIN_DMA
>     iommu: Failed to allocate default IOMMU domain of type 0 for
>            group (null) - Falling back to IOMMU_DOMAIN_DMA
> 
> Now, bypassing the first probe_device() call from bus_set_iommu()
> fixes the sequence:
>     ubuntu@jetson:~$ dmesg | grep iommu
>     iommu: Default domain type: Translated 
>     tegra-i2c 7000c400.i2c: Adding to iommu group 0
>     tegra-i2c 7000c500.i2c: Adding to iommu group 0
>     tegra-i2c 7000d000.i2c: Adding to iommu group 0
>     tegra-pcie 1003000.pcie: Adding to iommu group 1
>     ...
> 
> Note that dmesg log above is testing with IOMMU_DOMAIN_UNMANAGED.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---

Everything looks good to me, apart from the very minor pending question
about the NULL-checking. Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>

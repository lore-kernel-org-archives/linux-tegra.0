Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3B5C433E0
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Feb 2021 05:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D517964EB3
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Feb 2021 05:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbhBTFRG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Feb 2021 00:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhBTFRF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Feb 2021 00:17:05 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0C2C061574;
        Fri, 19 Feb 2021 21:16:25 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id k22so35370357ljg.3;
        Fri, 19 Feb 2021 21:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=75WgM4j7TpcglCJIQaidtSvYuszmMtipi4ZJU85Xubs=;
        b=s+91Q/NxEOWWfiT2BbVxo3Htl8db0wjaq1enuCFCFswR75Spv5EtSIqCwZqc68F+iO
         Dy3RLT413GvOqNnrhKPD/Vg8AoZA2PRWZq6DXoJsO1VDHzsmp7UpveYPwRPCMfnNLVRd
         p/4Zt6sLr+G0bKCgBzhF5CUSOML3nCnLzfQDepoBJvdZ2vlgy3uQDWeQt1ajuMd1zE0B
         U5CRBES1msaKbgxJCpElsC9vYP2AV8szpwT6wlsoM6t4PbHIe7FG0UwkRYS9ynZ89v/9
         TDlmuP8IceGw3ja00kM9W1Krj26CbsF99tXj2Sh9P9RE1smQPG80GH5HZxCQkA+GcuAC
         VoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=75WgM4j7TpcglCJIQaidtSvYuszmMtipi4ZJU85Xubs=;
        b=FJ6b3twa3eRSfoUKWkt0sqTp8HSWdGHWxxfzJqy1JIhsrT28PQy4WXfM1opxdlcACT
         5yRFCYGjYNCy1JvSHEaHchXmyc6F4PeOGAxKZFQ4rZotlanhN1yYlXbecSD1j5pX4JbG
         QLgi0rT0KcOFyrTx25ssjXglcxacFKq3lomGiJ9E3OOFxf6PnLZgARh3YHycd8dB+5fM
         GMGycUhxggIURFLIDV04uirw+qANafu4NCvxBliG/UWuTEX6FYahatOu83d2IO/bfX7a
         TDJPehGyJzgL+A4gRit4IdeYEUOQrLGUjKIGpMhETGIOTAmTyRRSACpuDj9Qbu+yfpPU
         LIBA==
X-Gm-Message-State: AOAM530z5qjfP5b7xqjgz9VqtD67kB6q+7/ij6UkCt6aenXiRg1fOjOn
        XMBdLsIfqQbLaqRsveQCizIKzJ0PXZY=
X-Google-Smtp-Source: ABdhPJwjsq3TDQS5wEjqyDwFxuQJ5k1GaYHDBbikWFxv6QHUKfYn86ehN4RvF+ueagBaOHj5rxLwTQ==
X-Received: by 2002:a19:500a:: with SMTP id e10mr7503522lfb.241.1613798183645;
        Fri, 19 Feb 2021 21:16:23 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id o16sm284804lfn.252.2021.02.19.21.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 21:16:23 -0800 (PST)
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9d6445c0-9574-1650-e327-32b11716f87e@gmail.com>
Date:   Sat, 20 Feb 2021 08:16:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210218220702.1962-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.02.2021 01:07, Nicolin Chen пишет:
> Commit 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> removed certain hack in the tegra_smmu_probe() by relying on IOMMU core to
> of_xlate SMMU's SID per device, so as to get rid of tegra_smmu_find() and
> tegra_smmu_configure() that are typically done in the IOMMU core also.
> 
> This approach works for both existing devices that have DT nodes and other
> devices (like PCI device) that don't exist in DT, on Tegra210 and Tegra3
> upon testing. However, Page Fault errors are reported on tegra124-Nyan:
> 
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 EMEM address decode error (SMMU translation error [--S])
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 Page fault (SMMU translation error [--S])
> 
> After debugging, I found that the mentioned commit changed some function
> callback sequence of tegra-smmu's, resulting in enabling SMMU for display
> client before display driver gets initialized. I couldn't reproduce exact
> same issue on Tegra210 as Tegra124 (arm-32) differs at arch-level code.

Hello Nicolin,

Could you please explain in a more details what exactly makes the
difference for the callback sequence?

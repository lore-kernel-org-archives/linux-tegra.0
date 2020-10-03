Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA78C41604
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F91206CD
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJ7/eg7d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgJCOF4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 10:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgJCOF4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 10:05:56 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88F7C0613D0;
        Sat,  3 Oct 2020 07:05:55 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so5435874lfr.4;
        Sat, 03 Oct 2020 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P8VKZJgIOfKJQqqxkg2s++QEd40BwnCYRjtS8zyaB9g=;
        b=tJ7/eg7daE0NdushXX21Wxs1bod4oGp4wlBaQK3220LPx0VyyC45aevFobwKnVXCXk
         C/vy+nvb1Fw5OlcX4cYb303szLb0rBg7O99OHZIQYNLsZrWmtq2AoiErOOeTacdowfd3
         nagpFEK8KjRUHY8xboL8xZDTXai0uGoHgufwV50RprcfgWwnzbWWauVAk4B2T8NGRZ3y
         GAAnAFC8yHQSHziJAdyGqFSuaJAZRFBKrmkz0FwB9Iy3vXyKHUjAkAJvdl96mWOmYUEx
         DZFcN8c/OvZfgdPzf96veIdEm9nQAtDW3WmFG+iWgZqi6w77jGhCpPMiLi8x+V8JDVBD
         ZmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P8VKZJgIOfKJQqqxkg2s++QEd40BwnCYRjtS8zyaB9g=;
        b=fX1iiQydsHNDUChj/VqhpBMts+9Y1bxNF1EwpzEBubwK2AYSPRweNkvuOwwVqOsacQ
         KEazCMHNwnmwCPBes2Ry65WCTbHjQOXMZkZ8817Zb6q4EnWgeQsb/TMZ8QTd27C4Jmph
         g2BQrhpzzKNSmdZHPp/qqUKkkNETMowbA3sE5yflbjcuVI7ODKuG54Ey+bJHxF/k0AtE
         iAVohLkYKZgIFCrrf/+A9aqQT2JHZDktj39AWrZtL6X0VQpvc2+IcE71Mj+zER2PnEDD
         DTskwOMWLjp9aRcOrbmJdXpLZ9h4bZtHWCNK6G+f2BXT81Jo8dmJLZDCSizbny4iTHwx
         cfEQ==
X-Gm-Message-State: AOAM531mu5UwQ6Rc7z2y4Mt+s+JfMpLnSEq+riyqTsHuXGmJHDcEMsud
        rkyKBV4ZnSDZ/NCmtlaJ5HCJRTqHqm4=
X-Google-Smtp-Source: ABdhPJwiIVBKjbuMqPuBu145QDDnNyabxNwZ3EBw4jd/qIpOQAicGFWbr0s4AlF9dhzXMLJO+WoYgA==
X-Received: by 2002:ac2:4827:: with SMTP id 7mr2765932lft.493.1601733954070;
        Sat, 03 Oct 2020 07:05:54 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id z2sm1630625lfc.209.2020.10.03.07.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 07:05:53 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <97d69b0b-db32-08ff-0691-73cfa571f974@gmail.com>
Date:   Sat, 3 Oct 2020 17:05:52 +0300
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
>     ubuntu@jetson:~$ dmesg | grep iommu
>     iommu: Default domain type: Translated 
>     tegra-i2c 7000c400.i2c: Adding to iommu group 0
>     tegra-i2c 7000c500.i2c: Adding to iommu group 0
>     tegra-i2c 7000d000.i2c: Adding to iommu group 0
>     tegra-pcie 1003000.pcie: Adding to iommu group 1

Could you please explain how you got I2C into IOMMU?

Are you testing vanilla upstream kerne? Upstream DT doesn't assign AHB
group to I2C controllers, nor to APB DMA controller.

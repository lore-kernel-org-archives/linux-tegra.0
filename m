Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B08BC4363C
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 16:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D35220758
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 16:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoUkOv1b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733260AbgJBQhS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 12:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBQhS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 12:37:18 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8B4C0613D0;
        Fri,  2 Oct 2020 09:37:16 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y17so2607691lfa.8;
        Fri, 02 Oct 2020 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3s1ndk5JJzpTHJbjvHEODJg7aasvsgC96M1MqYVGaPM=;
        b=MoUkOv1bLFhwxqvQ7eJEzuUDqCvfwIHhzGJ+sSsfpRCg3Uj1Sos89Zsz4k0HwLFKNd
         3tCzaQAjhTOVo8S339v+my5Lg7RGL4x8y7w6eD7Tr7PmQqPGn3S+H0lrZivY7JmXgfdL
         fFWqSt9VnLNGzqbZy4vqu8qxTLIWeyr0+RrrbOUwuPiLEoHeOf90eklJU7vmSvYcVxnb
         s+hrQgzG3nCq0iG4YAGJR4mpA75mHDFprpbaMEiv4018f1w4SUkLO2jtJoTHtOd1nE4S
         ldDiuedoWHw3Os8wYxuYgW+o7SHfB/V/aYQ1IZbQBg8iuT2LKSlBppPnzJbn3xz1WtXa
         +7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3s1ndk5JJzpTHJbjvHEODJg7aasvsgC96M1MqYVGaPM=;
        b=uGvJ5wiz5yOknrqwQHl3W5d8FcvCCa8XI3Y0cZTtzOvCfO4djqOXfRTniQjE/Lmkq7
         oV4Hnn9RpMiOMCcScP/sPzYybfQ9HsX/JnMQQNLD1PLZIJRpoGprkml4S46fsNuNBcsG
         lDBUCNTusEpwv7xfv3TRYP7wRCBvO7sccQqVoGPf2CGmzq3ljbEB3vP/ciQ6Q13OzxJJ
         0n5SGnvakN15MF9voBRWmYZJzVFP2v81oyyr4FF81bzf1UEzP4i5TLxP0e3j3vdkXxYE
         GQFDZDKaFi7R3Ie/8yhjP7O/JeuxOu/GL6EdhYFq39ZTmmLqz+eEvMUqSoQMcjuLxXNY
         SD/Q==
X-Gm-Message-State: AOAM533IjEWeJj8q0FLAZzqFz+zJ0xuYXfJidyzIFvz3nPkGdWQHYUEl
        fugdveNYdQLL3LCxsWWEeILMHulnko0=
X-Google-Smtp-Source: ABdhPJy/fW4T4c5bEdSHlIQMolsrKNHfJpbkIgXELKvWNr4fzP2VwyMb8ATYDhe/UyfiJ1XfjaPfrQ==
X-Received: by 2002:ac2:538c:: with SMTP id g12mr1092249lfh.326.1601656633904;
        Fri, 02 Oct 2020 09:37:13 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id t14sm383650lfp.77.2020.10.02.09.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 09:37:12 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, Maxime Ripard <maxime@cerno.tech>
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <99d322d0-efb5-8a34-ee83-b907b785ced3@gmail.com>
 <3ecfe9ae-fa32-8384-c912-4e17ff5fede7@gmail.com>
Message-ID: <6018e1c5-9ddd-3e37-1d6b-3feb969a7474@gmail.com>
Date:   Fri, 2 Oct 2020 19:37:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3ecfe9ae-fa32-8384-c912-4e17ff5fede7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 19:00, Dmitry Osipenko пишет:
> 02.10.2020 18:23, Dmitry Osipenko пишет:
>> 02.10.2020 09:08, Nicolin Chen пишет:
>>> Then when a client gets probed, of_iommu_configure() in
>>> iommu core will search DTB for swgroup ID and call ->of_xlate()
>>> to prepare an fwspec, similar to tegra_smmu_probe_device() and
>>> tegra_smmu_configure(). Then it'll call tegra_smmu_probe_device()
>>> again, and this time we shall return smmu->iommu pointer properly.
>>
>> I don't quite see where IOMMU core calls of_xlate().
>>
>> Have tried to at least boot-test this patch?
>>
> 
> I don't see how it ever could work because of_xlate() is only invoked from:
> 
> fsl_mc_dma_configure()->of_dma_configure_id()->of_iommu_configure()
> 
> Looks like the tegra_smmu_configure() is still needed.
> 
> I don't know how sun50i driver could work to be honest. Seems IOMMU is
> broken on sun50i, but maybe I'm missing something.
> 
> I added Maxime Ripard to this thread, who is the author of the
> sun50i-iommu driver.
> 

Actually, I now see that the other IOMMU drivers (qcom, exynos, etc) do
the same. So obviously I'm missing something and it should work..

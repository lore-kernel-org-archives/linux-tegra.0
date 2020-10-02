Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E77C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 16:00:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEF13206FA
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 16:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXu+ildL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbgJBQAn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 12:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgJBQAn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 12:00:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D84C0613D0;
        Fri,  2 Oct 2020 09:00:42 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b12so2461098lfp.9;
        Fri, 02 Oct 2020 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dhAnoeBmyK6BcDynuK2zNHQZ6hj5tN6P0kpEIveLp7o=;
        b=nXu+ildLgsM+jM4sHHMNh0wFhYRfaWZHOdLXwZqCOlY2OZHI/Dm+eJ5/CYCwVG1kkO
         cYSVGx++koKfLEFTUKyzRiMc+I8PK8AwieXpXgVRMlQHzCa5lCkhFsoQxv5diGNFmGqv
         YQkcDhpNom+wSzGwwuK82ux7g/5CY91Qr5RqOnplESiTEiNxOMpJKrOL3f1UNoXrBugh
         U09J6ogbQmK6SB66V7OVywERPMovoTvsJtKO+1qpBcWqNktXct1E5MGwp34pb3aRn1HU
         3N1S99scbj3lx0gLgLSrk2SgXvoYVTEGwSWhvRSIdkgKqo6seBUJKg4Ws908X5hHR2y7
         ZEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dhAnoeBmyK6BcDynuK2zNHQZ6hj5tN6P0kpEIveLp7o=;
        b=IjOTbqD5A1j0Lgo1PwZU0j37RZuMRATD9UUKlqeU0KyS+W9B56U+BULZtWHzm+ffOe
         KfNKffbAcnJUl/HPLqNUYJsPwcboAbIjM7OjYZplxK7eru2c2ZQsf/6TJFle2Z7vGztu
         9hYGJANSkQ3GJb62oJeVXHmhTcmWM6xirkyL5FtPMPgG2Jjky2hslBkFr74VX74sRpQ/
         EbuZRZbLrcCb8Zj5cOrdyMiSm3YfTqiLkAFK31ONxdZ2f+DCCF//0Lce0sRmeL3glZ+q
         pYZlCji047VHB6E1GxxwDQFnVfYYNly/rbM9Lh7Si33k+3Mv+a5ccEWlOyw/SfT0u8dz
         7j8Q==
X-Gm-Message-State: AOAM533Tydccl7gChgUY5yMx5yqGMfVMw0UFjirpZaAicmXTvouw1PzZ
        Lgt5AbjkzBEadDG3g7Gyy9dFePLEDc8=
X-Google-Smtp-Source: ABdhPJyKXMN6R1NYll2+WowzuwnckGYlpVU9Os1T9IYfDnZEzGs+9eU0RcBb7JTcu3S3Hz75KsG2+w==
X-Received: by 2002:ac2:5e2b:: with SMTP id o11mr1137547lfg.24.1601654441028;
        Fri, 02 Oct 2020 09:00:41 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id x15sm276743ljd.93.2020.10.02.09.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 09:00:40 -0700 (PDT)
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
Message-ID: <3ecfe9ae-fa32-8384-c912-4e17ff5fede7@gmail.com>
Date:   Fri, 2 Oct 2020 19:00:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <99d322d0-efb5-8a34-ee83-b907b785ced3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 18:23, Dmitry Osipenko пишет:
> 02.10.2020 09:08, Nicolin Chen пишет:
>> Then when a client gets probed, of_iommu_configure() in
>> iommu core will search DTB for swgroup ID and call ->of_xlate()
>> to prepare an fwspec, similar to tegra_smmu_probe_device() and
>> tegra_smmu_configure(). Then it'll call tegra_smmu_probe_device()
>> again, and this time we shall return smmu->iommu pointer properly.
> 
> I don't quite see where IOMMU core calls of_xlate().
> 
> Have tried to at least boot-test this patch?
> 

I don't see how it ever could work because of_xlate() is only invoked from:

fsl_mc_dma_configure()->of_dma_configure_id()->of_iommu_configure()

Looks like the tegra_smmu_configure() is still needed.

I don't know how sun50i driver could work to be honest. Seems IOMMU is
broken on sun50i, but maybe I'm missing something.

I added Maxime Ripard to this thread, who is the author of the
sun50i-iommu driver.

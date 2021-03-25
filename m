Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BDFC433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:13:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34D4061A13
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhCYPNL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 11:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbhCYPMz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 11:12:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659A8C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 08:12:55 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b4so3038838lfi.6
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WnTFrwAfePNw9Aef52Q1wEY1qtEOTDfqn1ojM94Ae6E=;
        b=HV/Oi4NVHDSvuB6pwSTtE5OHNnFx3BahyrSAm/Q3kYMPZ61nMuhvNBJCTFUPc817n+
         DFOfmZ2QK197axzyyG70IYRB8nR2v1hpVUKRuh3KAqRXXRIesLKGPpofgqZUgvj3Nkx2
         hgELWoa7aWpFjntG5Ky2SNPl8vXmz5cqudVormd4LnVgfwawChaNWzE14qHu4Uafho1k
         oTSEhNnajyVlc16FzDMCwdoTAuT1u0uZqOdPhIuuWVRG3+CXNpUJzExTDHFxFbdcr1cr
         fSEpq+0pOJ4PoRrwZEdqc2JF22tGmpCy08eMUH15qLqC4fS8Q7UHOc145Yo/RJKQB/A2
         PDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WnTFrwAfePNw9Aef52Q1wEY1qtEOTDfqn1ojM94Ae6E=;
        b=X8o7HFesBVoryQP45diGDl1GXNuOaNHJC5dciZ0gxFdE88ZKp1bSvtY0BqxlCeIwWL
         6n8eALEAWrRLyHhsTXzxrrPX+UHozUq9pGPzMiM3bJwJyoT7yCklr/jbSFpTi9hYfxrm
         cvlMJVC0VhhGnXOz5uGcPK67T33tpx56Yf2Ti5yu+JmoYXOjNd2yqM+2RyDWu35707AS
         uqe6Q6mAxjUEBjga+hl4Id4TalmfpxVHiw2fdb0iuWeK5GRBjJs1B+qRurgnjy9f+Wgy
         kIYplT+WxR1X/Oj2dz69I/2H3ByZ0GszvYUAECKJZDlErDHHgfPi+duXewUEnse3KBcY
         017g==
X-Gm-Message-State: AOAM532Gwl3dclShk1doMIO2IuOKqA2YRfOP9NXFHJfV9BXe/M0aZYyk
        LKvEHNQx2nRzVI6nHmUd2Pg=
X-Google-Smtp-Source: ABdhPJz02RpX7reky+R0Ku0sSImOsnP5BRrwqX8XYuEODRAbMoFD7wkcixfdZIytwGQAHadGb2lA2g==
X-Received: by 2002:a05:6512:3481:: with SMTP id v1mr5328599lfr.193.1616685173799;
        Thu, 25 Mar 2021 08:12:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id g14sm796314ljj.3.2021.03.25.08.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 08:12:53 -0700 (PDT)
Subject: Re: [PATCH 1/9] memory: tegra: Move internal data structures into
 separate header
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ca70b07a-608a-51b3-3c30-ff04bdf8bcc0@gmail.com>
Date:   Thu, 25 Mar 2021 18:12:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325130332.778208-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.03.2021 16:03, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> From Tegra20 through Tegra210, either the GART or SMMU drivers need
> access to the internals of the memory controller driver because they are
> tightly coupled (in fact, the GART and SMMU are part of the memory
> controller). On later chips, a separate hardware block implements the
> SMMU functionality, so this is no longer needed. However, we still want
> to reuse some of the existing infrastructure on later chips, so split
> the memory controller internals into a separate header file to avoid
> conflicts with the implementation on newer chips.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/iommu/tegra-gart.c      |  2 +-
>  drivers/iommu/tegra-smmu.c      |  2 +-
>  drivers/memory/tegra/mc.h       |  2 +-
>  drivers/memory/tegra/tegra186.c | 12 ++++---
>  include/soc/tegra/mc-internal.h | 62 +++++++++++++++++++++++++++++++++
>  include/soc/tegra/mc.h          | 50 --------------------------
>  6 files changed, 72 insertions(+), 58 deletions(-)
>  create mode 100644 include/soc/tegra/mc-internal.h

What about to make T186 to re-use the existing tegra_mc struct? Seems
there is nothing special in that struct which doesn't fit for the newer
SoCs. Please notice that both SMMU and GART are already optional and all
the SoC differences are specified within the tegra_mc_soc. It looks to
me that this could be a much nicer and cleaner variant.

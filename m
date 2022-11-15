Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E34C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Nov 2022 18:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiKOSdf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Nov 2022 13:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiKOSdV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Nov 2022 13:33:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEA5303C6;
        Tue, 15 Nov 2022 10:33:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D65B1B818D1;
        Tue, 15 Nov 2022 18:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45185C433D7;
        Tue, 15 Nov 2022 18:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668537189;
        bh=iFk2C5rMscwTCjr6mbJ3SLiT1nN1ydkf/s9Is0bqib4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tvSye5iaT5YDKDCyhxf7vx/QIgVomCFkqjLlYSxYPZsFed5kggUOEmMGA1Eru2n+u
         vWXNmEpl18df15MLFC/oHRVu0WgDsaRRHVYTRyuVHiC0YK659SlBW3NiL6w2KGnx/9
         1wxctLBfFEZjYMRw2LKVIk8Pu+jGVSMA2k/sqlUDfiJFYCaBKL9+mPadiMMSTEOc3Z
         LSMYOZPuQaW6IGiLbK30Vi/T6CDmsrhELNxo7UtFQB10nzeirISuCS+Ol0Q8oCwR4M
         SJVdr1i0A1KYvGQdIduhLOba45IuHhokoOghtD9uZYOaZ7G+cuRTbJooCFqRO5qawe
         nKMeeuH4Uqjow==
From:   Will Deacon <will@kernel.org>
To:     Besar Wicaksono <bwicaksono@nvidia.com>, catalin.marinas@arm.com,
        suzuki.poulose@arm.com, mark.rutland@arm.com
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
        mathieu.poirier@linaro.org, thanu.rangarajan@arm.com,
        vsethi@nvidia.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, linux-tegra@vger.kernel.org,
        treding@nvidia.com, mike.leach@linaro.org,
        Michael.Williams@arm.com, sudeep.holla@arm.com, leo.yan@linaro.org
Subject: Re: [PATCH v7 0/3] perf: ARM CoreSight PMU support
Date:   Tue, 15 Nov 2022 18:32:53 +0000
Message-Id: <166852008965.2033505.10501634922702345601.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221111222330.48602-1-bwicaksono@nvidia.com>
References: <20221111222330.48602-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 11 Nov 2022 16:23:27 -0600, Besar Wicaksono wrote:
> Add driver support for ARM CoreSight PMU device and event attributes for NVIDIA
> implementation. The code is based on ARM Coresight PMU architecture and ACPI ARM
> Performance Monitoring Unit table (APMT) specification below:
>  * ARM Coresight PMU:
>         https://developer.arm.com/documentation/ihi0091/latest
>  * APMT: https://developer.arm.com/documentation/den0117/latest
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/3] perf: arm_cspmu: Add support for ARM CoreSight PMU driver
      https://git.kernel.org/will/c/e37dfd65731d
[2/3] perf: arm_cspmu: Add support for NVIDIA SCF and MCF attribute
      https://git.kernel.org/will/c/84481be7167e

Note that I had to add some MODULE_LICENSE() macros to the files so that
modpost doesn't fail with an allmodconfig build. Please shout if that
needs adjusting at all.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

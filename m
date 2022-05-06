Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA479C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 16:07:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443495AbiEFQLh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 12:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443527AbiEFQLY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 12:11:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBDE6E8C9
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 09:07:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2959DB83705
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 16:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C0BC385B1;
        Fri,  6 May 2022 16:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651853240;
        bh=HYc8kR/H5TxbxplFH1FuhV35mhkrf7IJ8g9tiQWF6ig=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DP78+2lyclWRCUDsSlbplfm8Yc6EkWzZUMXPXJ32GgeiYA0Gvln8APd9HU1j+3vC7
         v5FSpm3qmFLrImkMdgerZ6Ty6bfc7GqfJ5e+yg3b2wfkTsS5/ocvfzUIjvGAKAKnTy
         /HMqwKPZv+McZxgufERSgP4DrH+8fWdj+WbudTSORsqYncxZS5WLKs4/IELJdIqclp
         HrmCxzcGAUG5S66/uVEjaEFccbht60Yh26TMIuzU7WrZQJjPkD0TfJtwFWhsOOCcI0
         IUMZcdF9oCG8k0Aj8ZhNXkoozjmd0DstA/RhMUWc9/g58aUU8w9zuP4xPJMOBxpaYI
         G7wa+yoMTB5ig==
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu: Support Tegra234 SMMU
Date:   Fri,  6 May 2022 17:07:04 +0100
Message-Id: <165185099765.2781901.13785452169185170055.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220429082243.496000-1-thierry.reding@gmail.com>
References: <20220429082243.496000-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 29 Apr 2022 10:22:40 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi Joerg,
> 
> this is essentially a resend of v2 with a Acked-by:s from Robin and Will
> added. These have been on the list for quite a while now, but apparently
> there was a misunderstanding, so neither you nor Will picked this up.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/3] dt-bindings: arm-smmu: Document nvidia,memory-controller property
      https://git.kernel.org/will/c/c02bda09f91a
[2/3] dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
      https://git.kernel.org/will/c/95d5aeabda00
[3/3] iommu/arm-smmu: Support Tegra234 SMMU
      https://git.kernel.org/will/c/5ca216155b5e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

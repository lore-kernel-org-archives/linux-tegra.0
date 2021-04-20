Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD65C43460
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86A2361076
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhDTR0Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbhDTR0X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:23 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1219BC06138A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:52 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id w3so59498050ejc.4
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vz/zyZ47TrozGRsIa2tK+ufxsCFVoosfjna/ca4O/c0=;
        b=aVjoNEMiGwN5Lx+kpE0qEfP1uo8Al+w9/1qZbSxv72ywzCQu2k9YlZjwLBxzIGxUN+
         kcZDfsUTdhASLUq94nNRF4nvKMWEQVwJMww6W7mYpQFODk6JAzP5KOokivLnY3o3O/XE
         BbTv9xfW5UtNxcGy2iMtGSd7dJEO7cRa56EA1p2XF0Ik9dyKnWGRnOIZy+oHsQILsZws
         asw61xqlOH4Fj5DCjYezjLZ7A5GZGsM5NqxfUtxjmQrufFp9l0cGHD0WH3ckKC3nAwNB
         w8bsZz59BZAcouWtPRyvn2fFYRRghJWtFpgxY9laczlHFANH305JGjQySqz42mU+dusz
         KJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vz/zyZ47TrozGRsIa2tK+ufxsCFVoosfjna/ca4O/c0=;
        b=QY8PQg8tZ7qFV0GhRBSaAeJOH3cNk2m2vr8Ugn1n9F14xtAFb+kOFp9iDzs1WeLqgq
         u5qM6ccx2eP7d7OX2ef35sOW4uJVLTkQFhbDqyB2r+V34C1gn9gfim5QoVr/yG05wkeW
         Qn/hDv8ERpfC5sCt0SaA6MxHxKCdNLDDA+5FjFLP9Vh5wAJ/Xa20qHc1Ff+mNVNXqLUw
         Bh6LW/I4GvlKJBsPctOuU9i82+l0DkPUgqQtRa7T5UKAec/7RFQVwEFgy3ymVpgppreF
         IaqjcgjnonjBEUKR6nyjJh7bpcySq7+E601RWLyb2CIFRAQi+UB6xdZLVom/G89MqOH/
         GZvg==
X-Gm-Message-State: AOAM530uiMNkTHubf0Q0Ry5wtXzYR6E0oFM/ZJoftYsSnVa9Pvwh6oNk
        9PsgnFIx+JowjaHp/+tFXKQ=
X-Google-Smtp-Source: ABdhPJwZCdHDE7NG0mwEAEDc9JwkflUVViR7hF+HAhuinZYY9qCwxULzmByvXibRb3tsjc/edR/Hew==
X-Received: by 2002:a17:906:134d:: with SMTP id x13mr29062800ejb.61.1618939550792;
        Tue, 20 Apr 2021 10:25:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c13sm10630242edw.88.2021.04.20.10.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/10] arm64: tegra: Use correct compatible string for Tegra186 SMMU
Date:   Tue, 20 Apr 2021 19:26:16 +0200
Message-Id: <20210420172619.3782831-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420172619.3782831-1-thierry.reding@gmail.com>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SMMU found on Tegra186 requires interoperation with the memory
controller in order to program stream ID overrides. The generic ARM SMMU
500 compatible is therefore inaccurate. Replace it with a more correct,
SoC-specific compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 9f75bbf00cf7..a173f40256ae 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1082,7 +1082,7 @@ pci@3,0 {
 	};
 
 	smmu: iommu@12000000 {
-		compatible = "arm,mmu-500";
+		compatible = "nvidia,tegra186-smmu", "nvidia,smmu-500";
 		reg = <0 0x12000000 0 0x800000>;
 		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.30.2


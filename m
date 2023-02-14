Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F08AC05027
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Feb 2023 14:05:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjBNOF4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Feb 2023 09:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbjBNOFz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Feb 2023 09:05:55 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913FA9EC5
        for <linux-tegra@vger.kernel.org>; Tue, 14 Feb 2023 06:05:54 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id gn39so2036220ejc.8
        for <linux-tegra@vger.kernel.org>; Tue, 14 Feb 2023 06:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vp3AulvepOS2fc3bpY733hiALNG2cjKxWZTuQcyLEOQ=;
        b=GU2cGUNNiOzKAeuObf42lev8Vxh0jwMMuuii/RwqrZDW2hcNVA4hIYqgC45oM897XB
         kA1s5xXyZyoL/vR/dJIMcjnENLpPnAl32jqxDiDbs29BqSkJncLi8gHA/NRTNBIIize9
         cLkPk8OeDhlPAEMvokQUdU+gcwTfk1031SOIIvPtunX3X98JB4BIO1G4Tbe/ayGwFQLU
         0xiajI7bfbl0lTxFsxitjjeQ3/4BLD0bYXX1y5A8e/IA+N/JXWLktukoTLfMKu0bG/7k
         W1XgmPn/5cA6g7h+dFnAB64PGwX8PBxdm9lTCf/T/z9pZYmafVk0mPbxRxcasFjX/HXj
         QPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp3AulvepOS2fc3bpY733hiALNG2cjKxWZTuQcyLEOQ=;
        b=XWUc6pGhBkQ8sV1p7nq7xKrX3sLOkgyE/O3Tqo/ZdGimvPGcTlQEoTmfLGfJ00zd12
         xV8Qk45fbaMesThUV3i/ZUEIFchqtELkjpoIQ+cz0VYO9tjMFhZJ6T2JsDVHacAYbBLc
         OGm4ZXvRaCL3nL+EQKajcszD7PlFZ2nkgDarc/UiQ+lqM6yvy8XXIebCGjg8FYd61HJy
         UJfXCq/BTeNijlA8a0NjNdjrQ4Qecu0u16QkxJLUKiLgwYE913AvzisnubLHvbBvZPpE
         h7lFe8T0ihcG88nqXPjsfCzb7C+oN/bkTFVRb0t4NsTLCRi3b1sOYBnueSRCW3fnVfsA
         BDKg==
X-Gm-Message-State: AO0yUKUyKyMaaee7nW6aK1EO0LS7duV0vD4UjC8F7qdh2dy6M9kvyOLT
        EhS5Rr80T6FOORaebWnvMbuCigVbOY0=
X-Google-Smtp-Source: AK7set9LYE/RW4SuCmMRdrbul2Vc/g/xuQeHhXyRde+pIzMMTcuUzgccr4Ma+y3Q4TpCO1ABHOCNRA==
X-Received: by 2002:a17:906:bcee:b0:8af:391e:e4c4 with SMTP id op14-20020a170906bcee00b008af391ee4c4mr2488809ejb.41.1676383553065;
        Tue, 14 Feb 2023 06:05:53 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y21-20020a1709060a9500b008b1315bff9fsm764771ejf.148.2023.02.14.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:05:52 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Bump CBB ranges property on Tegra194 and Tegra234
Date:   Tue, 14 Feb 2023 15:05:49 +0100
Message-Id: <20230214140549.3340395-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Both Xavier (Tegra194) and Orin (Tegra234) support a 40-bit address map,
so bump the CBB ranges property to cover all of the 1 TiB address space.
This fixes an issue where some of the PCIe regions could not be remapped
because of they were outside the memory specified by the CBB's ranges
property.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 133dbe5b429d..7096b999b33f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -22,7 +22,7 @@ bus@0 {
 
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges = <0x0 0x0 0x0 0x0 0x0 0x40000000>;
+		ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
 
 		apbmisc: misc@100000 {
 			compatible = "nvidia,tegra194-misc";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 8fe8eda7654d..f1748cff8a33 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -20,7 +20,7 @@ bus@0 {
 
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges = <0x0 0x0 0x0 0x0 0x0 0x40000000>;
+		ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
 
 		misc@100000 {
 			compatible = "nvidia,tegra234-misc";
-- 
2.39.1


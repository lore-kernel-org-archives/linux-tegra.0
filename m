Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B34C43219
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242834AbhLIR33 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242876AbhLIR31 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:27 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13CEC0617A2
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:52 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id c4so10909578wrd.9
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hP601Qhn37r3S327PJpYVEaLJVJMjD0XlEb0Nd2Ee0w=;
        b=YVCSwtroXXa3lCMUR/HRw684kXBTZhm2Km9lRyf98zsHFHi+j0c5ta/kJpub61SI8t
         Ln2iTRY/PZ85KEvQMhOC+6IhbwqUMqbLzz/SI3A7OQQT6XQLG5tLATNjC/PTGf28CW9z
         Og5VNH4Y9AAndkLenVN4e8HaGEU0MM54KGxh3kvxLcna3Llo7NRszp+XUVV4Brl/2/xj
         9aai4CdQNnmlHlqF4nHQ2SSpl004bJaRW8OdZ+75bOSmgqOcYDRC225opbIMmK3e5IFq
         M8W9Mig+D2/giN8nSAAuw73m/VfJ880XiiYB/4sBj3mSQLi4+YJdDxE5R4ZmZzOG/pmQ
         tP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hP601Qhn37r3S327PJpYVEaLJVJMjD0XlEb0Nd2Ee0w=;
        b=3nLVO7FMMA8VDJwwQAR62J33U2Vj/9p0fjsJ3ObNGVfvUlvvEFsGnXh6cdAxJCHOLg
         QcUEhYgb35on5D0PKoDIOdyxuFc4bZRZVdEmcQ+5mpNpaSSx2YqDrQY3LPnnw/YXLnJs
         NJpccyHeUR8N8OXs5K9IfSCFyaWCCLuuhKoO4FwJugogCQqHDuso0mix6aypDS5sGuLo
         nFCr5Ahxl7zZzpXBhbRkyJf6BKFv04eJe3Q304mfcp3ksIsqhoVurU//zUIm7+wy+VCH
         xxWHic1rMI+VwRsjYWHcm3PUIUqBoW0bvqQX+PvuSjNR03+RqGCfBymblBwA3WqlS8Qe
         FxUA==
X-Gm-Message-State: AOAM532hr57kM8AJoPMZG0SSkoiNfkTuF6qPFzTmPeFr6qBjaN67H/Vx
        Z9p4OiVmwfmct4lSzSWkH8M=
X-Google-Smtp-Source: ABdhPJwBSm4s7i86a0XOZxgCrsSoj366T63caTQMt3EhMehg8rC9lkEeA2CNDRf5ob/NtEodnWM4SQ==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr7988722wru.182.1639070751346;
        Thu, 09 Dec 2021 09:25:51 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d15sm393909wri.50.2021.12.09.09.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:50 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 18/30] arm64: tegra: Fix Tegra194 HSP compatible string
Date:   Thu,  9 Dec 2021 18:24:51 +0100
Message-Id: <20211209172503.617716-19-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The HSP instances on Tegra194 are not fully compatible with the version
found on Tegra186, so drop the fallback compatible string from the list.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 8bdb129c4094..675e9f5db2c3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1180,7 +1180,7 @@ cec@3960000 {
 		};
 
 		hsp_top0: hsp@3c00000 {
-			compatible = "nvidia,tegra194-hsp", "nvidia,tegra186-hsp";
+			compatible = "nvidia,tegra194-hsp";
 			reg = <0x03c00000 0xa0000>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
 			             <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
@@ -1358,7 +1358,7 @@ p2u_hsio_11: phy@3f40000 {
 		};
 
 		hsp_aon: hsp@c150000 {
-			compatible = "nvidia,tegra194-hsp", "nvidia,tegra186-hsp";
+			compatible = "nvidia,tegra194-hsp";
 			reg = <0x0c150000 0x90000>;
 			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
 			             <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1


Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66BFC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 18:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FCA8619CF
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 18:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbhC3SSd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 14:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbhC3SSL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 14:18:11 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E610CC061574
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 11:18:10 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id b7so26241408ejv.1
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 11:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5PIpJrGl8iWrawN7W1yiCqheWQtbbQZULjO5n0brRE=;
        b=LYoCudITn92ac83fHOCASMr7QQNHA7r30skl3JHkqy+35UcLN/zBhW14Wti0cOFNmy
         pZedfolQsSlQyaY8ByM/QPUWtowe8E3TZ1BdrjSleSED0l/o/umIMhe3cu/n4hi2NbZT
         sIGBdAwtXa0j24BFdHk2QEjpU6N7IiCJ8lHQeSS5KdxnsAxAAxdtLHovkkUwqGjV+sl3
         RvVtHwCHWEQn+rLtCNGi1IlnsdJdqdd+JKU5wvDoUPB6MboGys9LIxIQcuHeZ8L+6TJn
         BYvrzcvWdTA4yo6TuqdTS2INTNaRfiVdmiElg/m2ez9qRz0Sjm7afNUU+aldEDlXTOgK
         W6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5PIpJrGl8iWrawN7W1yiCqheWQtbbQZULjO5n0brRE=;
        b=jvRwfJKAJEDvEVWd7lSWFwxydffoo1bAzg0cNkeV1IzWvxERadhBw1BZus3IqNechR
         w3PQUOC6R/wIsIwx5G7cCn98qqu29KX+6QostPe4U/VIFOQfVIq6nmevLiytbSxPRoLD
         HE0j0AwBVvRvf7ADWt8575XtxKNYZSzfb5E/w/XXJYdBcZQ/Q07sKlra1Bzy9dFNVBbU
         E9ZKE8zprzKGNfQ6jSLuS7YPrbNMdBGe9ah3aq0nRRdQUGet4D9o3uhInT2ptx8ky+9e
         EiRKq7Dtehh+yqFaji9FSr1iZhtao5mcEXnT7kFKNdkyIQ90f1/nvp0P8xriFHHk7n6W
         BlvQ==
X-Gm-Message-State: AOAM533bMPgTRa5/itjBksXQOmaXwj5CkMuLysKrPV6em25Mg93ZHSks
        ce0Hvh+UkHC5SNflMmM6ZQE=
X-Google-Smtp-Source: ABdhPJwot5MvGb6ErXAtg0NjbChCHxne+LOoXgOk+S2Jc2ubxELtbIe3creSVyyUZwHvqECY5d85Cg==
X-Received: by 2002:a17:906:f203:: with SMTP id gt3mr33733140ejb.346.1617128289622;
        Tue, 30 Mar 2021 11:18:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c19sm11840027edu.20.2021.03.30.11.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:18:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Consolidate audio card names
Date:   Tue, 30 Mar 2021 20:18:31 +0200
Message-Id: <20210330181831.1869611-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The current scheme for audio card names is suboptimal because it causes
the automatically generated names (for ID and driver) to be truncated,
which in turn can cause conflicts.

Introduce a new scheme which reuses the board model for the names and
appends the "HDA" and "APE" suffixes for the HDA and APE, respectively.
As a side-effect these suffixes end up being used as the ID of the SoC
sound cards which makes it easy for users to select them when using the
ALSA command-line utilities, for example.

As a separate measure, the driver name for the cards is now set by the
corresponding audio driver (either tegra-hda or tegra-ape), making it a
more useful identifier than the currently normalized card name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts  | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi      | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts  | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 683743f81849..74c1a5df3fdb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -817,7 +817,7 @@ mmc@3400000 {
 	};
 
 	hda@3510000 {
-		nvidia,model = "jetson-tx2-hda";
+		nvidia,model = "NVIDIA Jetson TX2 HDA";
 		status = "okay";
 	};
 
@@ -1109,6 +1109,6 @@ sound {
 		       <&i2s5_port>, <&i2s6_port>, <&dmic1_port>, <&dmic2_port>,
 		       <&dmic3_port>, <&dspk1_port>, <&dspk2_port>;
 
-		label = "jetson-tx2-ape";
+		label = "NVIDIA Jetson TX2 APE";
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 2888efc42ba1..4399deda7462 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -554,7 +554,7 @@ mmc@3400000 {
 		};
 
 		hda@3510000 {
-			nvidia,model = "jetson-xavier-hda";
+			nvidia,model = "NVIDIA Jetson AGX Xavier HDA";
 			status = "okay";
 		};
 
@@ -830,7 +830,7 @@ sound {
 		       <&i2s1_port>, <&i2s2_port>, <&i2s4_port>, <&i2s6_port>,
 		       <&dmic3_port>;
 
-		label = "jetson-xavier-ape";
+		label = "NVIDIA Jetson AGX Xavier APE";
 
 		widgets =
 			"Microphone",	"CVB-RT MIC Jack",
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index d1d77220154f..a717d2b66131 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -36,7 +36,7 @@ eeprom@57 {
 		};
 
 		hda@3510000 {
-			nvidia,model = "jetson-xavier-nx-hda";
+			nvidia,model = "NVIDIA Jetson Xavier NX HDA";
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index a9caaf7c0d67..d8409c1b4380 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1345,7 +1345,7 @@ sata@70020000 {
 	};
 
 	hda@70030000 {
-		nvidia,model = "jetson-tx1-hda";
+		nvidia,model = "NVIDIA Jetson TX1 HDA";
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index dd7996411881..09ce555017fb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -532,7 +532,7 @@ pmc@7000e400 {
 	};
 
 	hda@70030000 {
-		nvidia,model = "jetson-nano-hda";
+		nvidia,model = "NVIDIA Jetson Nano HDA";
 
 		status = "okay";
 	};
@@ -1146,7 +1146,7 @@ sound {
 		       <&i2s3_port>, <&i2s4_port>,
 		       <&dmic1_port>, <&dmic2_port>;
 
-		label = "jetson-nano-ape";
+		label = "NVIDIA Jetson Nano APE";
 
 		widgets = "Headphone", "CVB-TI HP Jack";
 
-- 
2.30.2


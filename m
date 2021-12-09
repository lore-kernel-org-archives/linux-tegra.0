Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7485C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242911AbhLIRaB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242909AbhLIRaA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:30:00 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADCDC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:25 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d9so10959494wrw.4
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mMV1K9LSS8eWVfs7EIdhknisLwoEQBuheuCVW31krBk=;
        b=idxzzZkmXnBQc3b8sz2EY5ryPhYN76taYCJiT7dsC9kbHaKe0DiThUSBqdtwpUzeP4
         onwCXeUefKU6HSP7Kea9qS+TEo9xQLI7ftpQ7XM692ruNAXvCdCGb9XEObz4CdLbZKVA
         i7v08EPXQMNTICM2pxx8KiJHFyx2JOe+rzLN+LhoJ4nnkWGo4UxFDFUyu1iU5SunklCj
         s2ZUOYRwCDAnzmWOWaFPJHAu37c0hbPTFevzb626Q8IFfp5JaWMlqCK6PcFDFV9AFhK2
         tgJvR0CSP+g78ji4pTHXF9N9QDYwOUJFvQku+v/BU9ySaDLyWR6zfjMOELIN6MrvbJ+Q
         q2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mMV1K9LSS8eWVfs7EIdhknisLwoEQBuheuCVW31krBk=;
        b=mHojxwKWPWdUpo6yasa/UPT36otYPh7nD+jycjdmdrmzhjasZZsXnKokKYkaYvIGri
         Gn3hnDOuli7t+Rsqh0bpOTPaXwjiBFMSFOTdpmAVz+SnnQabhNesHbS5/Wu6o7yHX0ou
         9AMlwEj2VedZq0/cDu8gpXErXAMrjQCKEGtInMhZWLfXu0cP7VXUfVG+5I3p6sxCpub2
         tgViVn4JWHQXPe7zZXWAyXZ1FdKfJ9VVNP39uqZXKDDjkDpFEHgSLc5kK/yek4B+KZht
         ShxER/I7kl/UzlHd5uYkigiNE8WNEPe4CFsui+uCfg4KyZuvdeqnfP1u/OUjHbRrXtZZ
         sLng==
X-Gm-Message-State: AOAM5321vjJojOHNV/Jk+dHKFQqJfhMnqKlopOI+Ie02w8xHzPjZpL7f
        ZDkPkYMurFVk+5xoBTLPPWA=
X-Google-Smtp-Source: ABdhPJzpRm3rY5r/pqw0G6NsCLB0Gmk2ICEx3jCsUrNaidavxGxAwusEfvOnuscgZbm80hgeqjGklQ==
X-Received: by 2002:a05:6000:1201:: with SMTP id e1mr8345621wrx.298.1639070784504;
        Thu, 09 Dec 2021 09:26:24 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m125sm9164732wmm.39.2021.12.09.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:23 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 30/30] arm64: tegra: Rename Ethernet PHY nodes
Date:   Thu,  9 Dec 2021 18:25:03 +0100
Message-Id: <20211209172503.617716-31-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Name the Ethernet PHY device tree nodes as expected by the DT schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi                | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi                | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 3d8878c0ec03..aff857df25cf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -44,7 +44,7 @@ mdio {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			phy: phy@0 {
+			phy: ethernet-phy@0 {
 				compatible = "ethernet-phy-ieee802.3-c22";
 				reg = <0x0>;
 				interrupt-parent = <&gpio>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 6cc51083adb7..4631504c3c7a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -46,7 +46,7 @@ mdio {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			phy: phy@0 {
+			phy: ethernet-phy@0 {
 				compatible = "ethernet-phy-ieee802.3-c22";
 				reg = <0x0>;
 				interrupt-parent = <&gpio_aon>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index ad217cac2b28..a7d7cfd66379 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -39,7 +39,7 @@ mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				phy: phy@0 {
+				phy: ethernet-phy@0 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <0x0>;
 					interrupt-parent = <&gpio>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
index f16b0aa8a374..0bd66f9c620b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -36,7 +36,7 @@ mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				phy: phy@0 {
+				phy: ethernet-phy@0 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <0x0>;
 					interrupt-parent = <&gpio>;
-- 
2.34.1


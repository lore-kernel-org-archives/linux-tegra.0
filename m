Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9F7C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242811AbhLIR32 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242861AbhLIR3W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:22 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412F2C0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:48 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so4660341wme.4
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ozEl1fUL6lJl/GH6XnsRzclwfsNgyu86lBq+gCCVN+M=;
        b=MZf+2G7ez7CcNHTPIaP8pNXJDznZdN3PRYknF9zdyJdtX6tWh2L87mpW8KaCnRgxBw
         UEW+G9NLPq1g3rZuSQRGlD0k+Y1z8IshFyWiZ2q/+h7z/6rcR1cwIw4uZVVLwdGeBH7b
         8OjUfXBPDmnYKs8YrlEPbMo4rs0koFsa6hy3d+iboxohksnHwcQW7ndOzcn82gbYJMSz
         zta3hfDD++D1EunbFNgyQC6vtf2R8dH0xsT04uuM8sIshLINHDjlFCvD+hplfCB1HL0G
         TSgaLduZUuDWw7NCrX6t4Ji4u+IjlsqWk0LGxQqIaWXYV3q3DMuF3us0INBrj5unjHpn
         SOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ozEl1fUL6lJl/GH6XnsRzclwfsNgyu86lBq+gCCVN+M=;
        b=myaOZj2HDZcMsO+4ZqOWTMsDyS65YO0u9+N2znZcnbkBZ9WQJ+/fMDrOrKW1UewcHC
         0IlPUNI5eUuhMnyF08vuRj3/7GyhhAQuApL5PFt9yI+IWdV2gGxh0W8fUKzFkZ3IPmhc
         FK86utGArz714+/L91FAUd5HTe8dDjvF+6oCkzwU8SdDoZkkgOz2O+6mTTJeJNMJ6fEb
         u68hqRv7dWtCgNqM8Op/oc3LnRgoldfbFF2UWGXN6faK344i8hEcS0NZ8Hd0NlV175IB
         K2W+SJMZ2kxGe82LgA5GlOzouiy+THf6ox9zPezxosGPA9D2WU1wWCBF7B/1x/anIxeh
         3/Mg==
X-Gm-Message-State: AOAM5301UG7U+L2YXE4zXvSS6RuHH8j2BQQlz3PMHMGJsdEyNFwkVNuy
        B/2cqqci/pKxIiZYtZr+CAS+zD0XvuhKqQ==
X-Google-Smtp-Source: ABdhPJw1UYULx0qHk6VGu0hlAN7eNttxdti3cuA5pPuSe+bu79dZaBWUwNXuXj2nmaRL3ERW6qgNzA==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr8984354wmb.174.1639070746813;
        Thu, 09 Dec 2021 09:25:46 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id j17sm534617wmq.41.2021.12.09.09.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:46 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 16/30] arm64: tegra: Use JEDEC vendor prefix for SPI NOR flash chips
Date:   Thu,  9 Dec 2021 18:24:49 +0100
Message-Id: <20211209172503.617716-17-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The standard "jedec," vendor prefix should be used for SPI NOR flash
chips. This allows the right DT schema to be picked for validation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 6d4ed67ffeda..1323fa9b8301 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -1878,7 +1878,7 @@ spi@3270000 {
 			status = "okay";
 
 			flash@0 {
-				compatible = "spi-nor";
+				compatible = "jedec,spi-nor";
 				reg = <0>;
 				spi-max-frequency = <102000000>;
 				spi-tx-bus-width = <4>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 260de1122aa3..9fc4a8f46250 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -1637,7 +1637,7 @@ spi@70410000 {
 		status = "okay";
 
 		flash@0 {
-			compatible = "spi-nor";
+			compatible = "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <104000000>;
 			spi-tx-bus-width = <2>;
-- 
2.34.1


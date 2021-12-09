Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16774C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbhLIRic (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRib (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:31 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193D1C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:58 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id o13so10926943wrs.12
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t593U6jnAX2qOsNeBNBkrwZwoJMGeLahGGdgRk8vEXo=;
        b=HxCE9nVfZx+rfmn5mNYGJ4ZyfR3zi4lZwPg3U/fpO+Wu2vJgJOXxs62+yXfnBCfKaI
         FAzozpexq6TxEAc1515T3YH6smPSIQslD0NSvsD7SAl1K1gvrV59hRgpZJnJSqZXSLmh
         jxvmaBWaaDMyGfUGifki2hXh4A9Awj3s2akNIAzmHogBFCmED2uGYNyi/iFNZlR9xc+y
         E9pG9xbB03og8UaFqVLPIGWWs3afWtoSpmYRFBFQAwgxYosLxqqU2vbB091AMyGVr42p
         +zx/DscNGp4xO9qisJI2ix/6dqVkWvVNMF12rUb9HsVAkjB4SWwRXAgD3HMttwlWQt18
         cf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t593U6jnAX2qOsNeBNBkrwZwoJMGeLahGGdgRk8vEXo=;
        b=m/jJoT3XIohMGl/EgeAgmR/aIhGcpbedu/Cnk/X+OD4KATeKI0Eo+a5nBpLVqNdM8K
         HqMfLKPtjFKFjJJeva+ROalamfZfmPVflf7UCzMCWRt7TeGr7mAqIMa7n1qoMbHB7CL1
         7dzg/HtPp0nmr2aiNFV8DXQkkesM4+/Sp9RcLH2IXygNE9SvnUUwR7cimgd+7O8c5G1G
         n0W3vW0bdNTKWVwXlVMHGOwt7LMDzQciBv+psKyT7iW55fMalPlqRTyvMmiXXh4uWKtd
         3FnAr4XLay0RuwlMjNFCsSUNOQ51Xj6kfvlBHRNoQ3O9eApGmyKZDU+/daO3FgFgadKu
         3nmw==
X-Gm-Message-State: AOAM531xx2PdfGXQCTHLOsyN5UpgAXGiVt57VZzByvJzOYtSp3tS+X2E
        pw0FEh8J0++30RsdRNg3JuuWEfzhqmLVng==
X-Google-Smtp-Source: ABdhPJyJ38FyX/VnNZzqThBvQ+bFyv+l8Dx9RwARq1A/QzMXW7DvYO5AkTBSiWXxXQRADeGm5VVCXw==
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr7839194wrs.263.1639071296668;
        Thu, 09 Dec 2021 09:34:56 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m36sm432897wms.25.2021.12.09.09.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:55 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 21/25] ARM: tegra: Remove unsupported properties on Apalis
Date:   Thu,  9 Dec 2021 18:33:52 +0100
Message-Id: <20211209173356.618460-22-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The +V1.2_VDD_CORE regulator on Apalis and Colibri boards uses the
unsupported ti,vsel{0,1}-state-low properties. It turns out that these
are in fact the default and can be overridden by ti,vsel{0,1}-state-high
properties if needed. Drop them since they are not needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi | 3 ---
 arch/arm/boot/dts/tegra30-apalis.dtsi      | 3 ---
 arch/arm/boot/dts/tegra30-colibri.dtsi     | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index e4e17c0e01fd..010dfa665b3d 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -1044,9 +1044,6 @@ regulator@60 {
 			regulator-max-microvolt = <1400000>;
 			regulator-boot-on;
 			regulator-always-on;
-			ti,vsel0-state-low;
-			/* VSEL1: EN_CORE_DVFS_N low for DVFS */
-			ti,vsel1-state-low;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 28e7d445c076..424d83f99be7 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1027,9 +1027,6 @@ regulator@60 {
 			regulator-max-microvolt = <1400000>;
 			regulator-boot-on;
 			regulator-always-on;
-			ti,vsel0-state-low;
-			/* VSEL1: EN_CORE_DVFS_N low for DVFS */
-			ti,vsel1-state-low;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 4361b93d0934..20c9a583a6e0 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -898,9 +898,6 @@ regulator@60 {
 			regulator-max-microvolt = <1400000>;
 			regulator-boot-on;
 			regulator-always-on;
-			ti,vsel0-state-low;
-			/* VSEL1: EN_CORE_DVFS_N low for DVFS */
-			ti,vsel1-state-low;
 		};
 	};
 
-- 
2.34.1


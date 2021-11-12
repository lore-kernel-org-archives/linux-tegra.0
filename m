Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069DAC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0B466109D
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbhKLNJ2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbhKLNJ1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:09:27 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F5CC06127A;
        Fri, 12 Nov 2021 05:06:37 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v127so7642170wme.5;
        Fri, 12 Nov 2021 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SWIFW/fnSVnpw58DWX0hMcDBNIcMy+D1n+aYUBiXusQ=;
        b=Ty9D3hE3BDwVYDK6pQggCDj9GYqzX69bqVkcqAWpXM0ADa7CF/ykyMMBO1gHkjwp6Z
         tSt6OSA9+J8bmeTlPRpyONXBoCLSl2X44MGJyf+1/NyOSOnxyM7Qq7GtJnQ8WNZbz6u6
         sifembdYVJXTGFu0ayTLoYdX5j/AkTW24tIuHYdO5uXKJbaKHB/eu/T5xx4bIqTHhiqY
         6CWcEj9Xet71vgrvniSryZz9mQOi7VTckhaABmJu+KXY9DdzVRW+3dEs/kluTkdUhcw5
         wX4Nj2Y/IUtqZYgI7XN5KQxWy1bHIGWEg/6wkHwS5R4aNI1qdnR2qi9D38brOoCbi9c2
         b74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SWIFW/fnSVnpw58DWX0hMcDBNIcMy+D1n+aYUBiXusQ=;
        b=ES8d53RRqpNJi8UiOIq0+gMSun6mY0wClEVJAy6JjH4Bm9+jHScsPQv+DIx3oIUWiy
         Ae/l4Ec9cmhvcdVHXXhM+XdOjeIoIWmv6V68Ra4mSWhXc3C4/OObj5kkfUnlAsHEbmFk
         3qox/qsuRq42oku1p1sdy38VQ1RflNbjRPF3hq7E5SVoPFoaAyQU+n3f4DcmOz2DZzpn
         5YkHLdBp4hPeYdxEfzIzV0ofg9D/DSYqUGGgdM7RFPYOT27xKUUFN4P7olWPDyKlWpIB
         Imurciq8I4uSwmFr4JwangtRHZhRW2DpQeQbjzCXSlEN1cYZl5+7a7GhGBdihiArT8Zw
         GKgg==
X-Gm-Message-State: AOAM531QOGItLoIKllKpXc+8N95sfaIRRzbG74KsMX88DeFU3ZdfU0NX
        92R99R0P+aAAcMiSGH5ygTZ2LVpqDGv1AA==
X-Google-Smtp-Source: ABdhPJyuPf1uKPnB1i7ugQTrf3+gAvja7ghh453aNEyKxTTNfnEUjTME6ybOSWNkG0VMNhCeZVlrCg==
X-Received: by 2002:a05:600c:510d:: with SMTP id o13mr34169670wms.104.1636722395778;
        Fri, 12 Nov 2021 05:06:35 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id r8sm7385544wrz.43.2021.11.12.05.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:06:34 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: memory: tegra: Add Tegra234 support
Date:   Fri, 12 Nov 2021 14:06:24 +0100
Message-Id: <20211112130627.3682795-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130627.3682795-1-thierry.reding@gmail.com>
References: <20211112130627.3682795-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the variant of the memory controller and external memory
controllers found on Tegra234 and add some memory client and SMMU
stream ID definitions for use in device tree files.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra186-mc.yaml                   |  2 ++
 include/dt-bindings/clock/tegra234-clock.h    |  9 ++++++
 include/dt-bindings/memory/tegra234-mc.h      | 32 +++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 include/dt-bindings/memory/tegra234-mc.h

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index f6e4af4e86cf..75bad0cb9d7e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -31,6 +31,7 @@ properties:
       - enum:
           - nvidia,tegra186-mc
           - nvidia,tegra194-mc
+          - nvidia,tegra234-mc
 
   reg:
     maxItems: 3
@@ -66,6 +67,7 @@ patternProperties:
           - enum:
               - nvidia,tegra186-emc
               - nvidia,tegra194-emc
+              - nvidia,tegra234-emc
 
       reg:
         maxItems: 2
diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 21ed0c732fb9..8d7e66e1b6ef 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -9,6 +9,15 @@
  * @defgroup bpmp_clock_ids Clock ID's
  * @{
  */
+/**
+ * @brief controls the EMC clock frequency.
+ * @details Doing a clk_set_rate on this clock will select the
+ * appropriate clock source, program the source rate and execute a
+ * specific sequence to switch to the new clock source for both memory
+ * controllers. This can be used to control the balance between memory
+ * throughput and memory controller power.
+ */
+#define TEGRA234_CLK_EMC			31U
 /** @brief output of gate CLK_ENB_FUSE */
 #define TEGRA234_CLK_FUSE			40U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC4 */
diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
new file mode 100644
index 000000000000..2662f70c15c6
--- /dev/null
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+
+#ifndef DT_BINDINGS_MEMORY_TEGRA234_MC_H
+#define DT_BINDINGS_MEMORY_TEGRA234_MC_H
+
+/* special clients */
+#define TEGRA234_SID_INVALID		0x00
+#define TEGRA234_SID_PASSTHROUGH	0x7f
+
+
+/* NISO1 stream IDs */
+#define TEGRA234_SID_SDMMC4	0x02
+#define TEGRA234_SID_BPMP	0x10
+
+/*
+ * memory client IDs
+ */
+
+/* sdmmcd memory read client */
+#define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
+/* sdmmcd memory write client */
+#define TEGRA234_MEMORY_CLIENT_SDMMCWAB 0x67
+/* BPMP read client */
+#define TEGRA234_MEMORY_CLIENT_BPMPR 0x93
+/* BPMP write client */
+#define TEGRA234_MEMORY_CLIENT_BPMPW 0x94
+/* BPMPDMA read client */
+#define TEGRA234_MEMORY_CLIENT_BPMPDMAR 0x95
+/* BPMPDMA write client */
+#define TEGRA234_MEMORY_CLIENT_BPMPDMAW 0x96
+
+#endif
-- 
2.33.1


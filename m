Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21F257435;
	Wed,  9 Jul 2025 22:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752099720; cv=none; b=n+/0ymmOLhGgFbpiugy0uHE01qBPdvWuzgD+YMHQtW9bbon9QsX1p9ck1PFA5/k3UHFpPslnCvfCdrYSwqZIa/Nyl93DYi3oQUoHa4GBBbum9giePAjhv/oqvTxFV07nZiDCdcPB89i57dhh6N6Q2ygATGmMU0b3xXk1WQjcG2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752099720; c=relaxed/simple;
	bh=MuVwd3qsZP9sX5kFIvnhB9e7qPm0DNKH4F/2GCuykvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRhoLYltvo7wsjNJaNzexuB4p39w+dbGnIVvzPR5z9gUuP5s0GTBtqkEWtoc+DY8Dpp0hGWtAMuA2Ss5rsb0ZF5YEeKziLYyRb17nXRv+2VwlsuWrC3oqYmIRk+JSkQ6yKQdZW0103FzTUXmA9XtLaemNltGn+du+gSzw85CJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdaN3VEs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdaN3VEs"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453634d8609so1930525e9.3;
        Wed, 09 Jul 2025 15:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752099717; x=1752704517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP/RBJzrYqxFcCb5hogwcHg8lpSNtTgTE+4LYKKy4RI=;
        b=SdaN3VEsbYY6vUZ8RTKD2+z4lDQhgCO/kPWBy9+VCIn0/Kd7PLNa2rlQg10c6FBiZ/
         SHvH9jDrDIvH7bL/DaaVJaqqm31DaiHVKJnEJyin13WG9Gxi7nmdGM9rW9rz+JUfm0er
         hMPvzKYQlMek25xqdc0/lS1LFxELwsbCf1GYKC/4gIc8YklU5pj48JmUiyOV5naefgDW
         EvqyOKyQgBJXDdud005IYn45NggCv8CwzD5IqJoaHarHKUFTG3FMQY7TkRGvOJLxXrBk
         2jHfbTVcKCdO4prZP4yaWZ0kHBFOpq+OJ93A7H8fZl3Ay1fWL4Lt9gfM6edXhKkA22+z
         YjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752099717; x=1752704517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP/RBJzrYqxFcCb5hogwcHg8lpSNtTgTE+4LYKKy4RI=;
        b=r8PeGjjbMM1BQubgJEu442+YxEe2HmkOZrqd1vfQXe1hVM80w2zqbgDiisu4bWQElD
         8mfHJAh8vw/Dhm2U9t3rXhcrGBjI5yYhDwa02g/KgcC5WsGYw/zaX5eR1apCOTmfffj/
         ISXA1YkMspKNuNCZ4EkAcGeM1JhCgSjc2hHiCnQCQ2pqC/U6swbcGOeuHrESnFri4InO
         0osf4PQxHZ5cmiiYENZpKK/D//8XgKPeMyBF9M+LS57aipEHloE5SKV/MCReOUOpNGaT
         mJeuIuq5UUKlqbx3cvKD1pxGJ/Wf22X1F/kgYdcI7rrWeKf+Hm7Ik92zosCp6R5i5aHM
         4MLg==
X-Forwarded-Encrypted: i=1; AJvYcCUfQqDh9G9XLFHUwK0CyrVghVvRkdq16oVdGThm38MhHCSRl863iCeX9K7LwzOxCmOAOj00wfIthYJaIOaf@vger.kernel.org, AJvYcCWiM+5UiBH7VZ/ajB1kqakE8nbWbMTM3FDf+xX8iaf7EwrySOs3VbsUO1zR5SZ/EWTnt7LPINyt+ply@vger.kernel.org, AJvYcCXkMxzvi3eoKG+etacBIoYvs37VzIDq6OBP1M1AFuWEY60yECxx1Gf3GIBvA/I0wHy1zNqqhSSJHIOYLOM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs5u+KJ5BEonMl7N7evWnY1q4OKSy2tvmtFEvdt05QcgJis4+A
	UuU/NaA5GrWjNMx5WUZ5xuFtpQ3qQXHMPtSCNFUNw1btT0ieMwS4t+2j
X-Gm-Gg: ASbGncsIg+N8FcS4uUzUwPk16cwoSQ09TVsSSWzRJSXTX9c+BJ+uxgyUX/iPz5GX4cN
	NkrxQ2k8+69KJaJWISGp0yLfMVaQKgpsj1qbDulh68CyGzr/QqjrvhCdyVwq/lDZ+GiUG6PDQld
	yRyKCQCkFPQk49MCjw6JrE7jqOdlajbaLF/vTx9LLu7xdI64xB4wB4rHD0JaIlnrF8son+fGko1
	fId/CO1j3eAffF3pVDSX0HApy1gz0eX37mp6bTmF4DREcwENNoCJ5x9kuTJWR4sSaH3ueRevKiD
	JKYC7NUM/DE7Qf9/1/yTVCIGgYnHdboMh4kItpE73vzKuZgDc1zkB3qsJSY9Xdol7/hclvs+VHA
	pRiSyz4KtRDl6EXH6r7Lfe1oTFFvop0D/ty28ByrWguMVJ9aYzgQ2SQ==
X-Google-Smtp-Source: AGHT+IFzydvA82wvqaqBE4IR0sN8b48o4WwlWi1q2m3nbfUE9vKoSCJcbeFYa2FT8cIBalfVvqg+Vg==
X-Received: by 2002:a05:600c:3b01:b0:453:7bd:2e30 with SMTP id 5b1f17b1804b1-454d539002emr42346935e9.29.1752099716437;
        Wed, 09 Jul 2025 15:21:56 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd439051sm1089815e9.8.2025.07.09.15.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 15:21:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: memory: tegra: Add Tegra264 support
Date: Thu, 10 Jul 2025 00:21:46 +0200
Message-ID: <20250709222147.3758356-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709222147.3758356-1-thierry.reding@gmail.com>
References: <20250709222147.3758356-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Gupta <sumitg@nvidia.com>

Add bindings for the Memory Controller (MC) and External Memory
Controller (EMC) found on the Tegra264 SoC. Tegra264 SoC has a different
number of interrupt lines for MC sub-units: UCF_SOC, hub, hub common,
syncpoint and MC channel. The total number of interrupt lines is eight.
Update maxItems for MC interrupts accordingly.

This also adds a header containing the memory client ID definitions that
are used by the interconnects property in DT and the tegra_mc_client
table in the MC driver. These IDs are defined by the hardware, so the
numbering doesn't start at 0 and contains holes. Also added are the
stream IDs for various hardware blocks found on Tegra264. These are
allocated as blocks of 256 IDs and each block can be subdivided for
additional fine-grained isolation if needed.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
[treding@nvidia.com: add SMMU stream IDs, squash patches]
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add interrupts and interrupt-names constraints for previous chips
- add missing maxItems for reg property on Tegra264
- squash memory client IDs and stream IDs patches

 .../nvidia,tegra186-mc.yaml                   |  84 ++++++++++-
 include/dt-bindings/memory/nvidia,tegra264.h  | 136 ++++++++++++++++++
 2 files changed, 218 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 935d63d181d9..b901f1b3e0fc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -32,6 +32,7 @@ properties:
           - nvidia,tegra186-mc
           - nvidia,tegra194-mc
           - nvidia,tegra234-mc
+          - nvidia,tegra264-mc
 
   reg:
     minItems: 6
@@ -42,8 +43,12 @@ properties:
     maxItems: 18
 
   interrupts:
-    items:
-      - description: MC general interrupt
+    minItems: 1
+    maxItems: 8
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 8
 
   "#address-cells":
     const: 2
@@ -74,6 +79,7 @@ patternProperties:
               - nvidia,tegra186-emc
               - nvidia,tegra194-emc
               - nvidia,tegra234-emc
+              - nvidia,tegra264-emc
 
       reg:
         minItems: 1
@@ -127,6 +133,15 @@ patternProperties:
             reg:
               minItems: 2
 
+      - if:
+          properties:
+            compatible:
+              const: nvidia,tegra264-emc
+        then:
+          properties:
+            reg:
+              minItems: 2
+
     additionalProperties: false
 
     required:
@@ -158,6 +173,12 @@ allOf:
             - const: ch2
             - const: ch3
 
+        interrupts:
+          items:
+            - description: MC general interrupt
+
+        interrupt-names: false
+
   - if:
       properties:
         compatible:
@@ -189,6 +210,12 @@ allOf:
             - const: ch14
             - const: ch15
 
+        interrupts:
+          items:
+            - description: MC general interrupt
+
+        interrupt-names: false
+
   - if:
       properties:
         compatible:
@@ -220,6 +247,59 @@ allOf:
             - const: ch14
             - const: ch15
 
+        interrupts:
+          items:
+            - description: MC general interrupt
+
+        interrupt-names: false
+
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra264-mc
+    then:
+      properties:
+        reg:
+          minItems: 17
+          maxItems: 17
+          description: 17 memory controller channels
+
+        reg-names:
+          items:
+            - const: broadcast
+            - const: ch0
+            - const: ch1
+            - const: ch2
+            - const: ch3
+            - const: ch4
+            - const: ch5
+            - const: ch6
+            - const: ch7
+            - const: ch8
+            - const: ch9
+            - const: ch10
+            - const: ch11
+            - const: ch12
+            - const: ch13
+            - const: ch14
+            - const: ch15
+
+        interrupts:
+          minItems: 8
+          maxItems: 8
+          description: One interrupt line for each MC component
+
+        interrupt-names:
+          items:
+            - const: mcf
+            - const: hub1
+            - const: hub2
+            - const: hub3
+            - const: hub4
+            - const: hub5
+            - const: sbs
+            - const: channel
+
 additionalProperties: false
 
 required:
diff --git a/include/dt-bindings/memory/nvidia,tegra264.h b/include/dt-bindings/memory/nvidia,tegra264.h
new file mode 100644
index 000000000000..521405c01f84
--- /dev/null
+++ b/include/dt-bindings/memory/nvidia,tegra264.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H
+#define DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H
+
+#define TEGRA264_SID(x) ((x) << 8)
+
+/*
+ * SMMU stream IDs
+ */
+
+#define TEGRA264_SID_AON       TEGRA264_SID(0x01)
+#define TEGRA264_SID_APE       TEGRA264_SID(0x02)
+#define TEGRA264_SID_ETR       TEGRA264_SID(0x03)
+#define TEGRA264_SID_BPMP      TEGRA264_SID(0x04)
+#define TEGRA264_SID_DCE       TEGRA264_SID(0x05)
+#define TEGRA264_SID_EQOS      TEGRA264_SID(0x06)
+#define TEGRA264_SID_GPCDMA    TEGRA264_SID(0x08)
+#define TEGRA264_SID_DISP      TEGRA264_SID(0x09)
+#define TEGRA264_SID_HDA       TEGRA264_SID(0x0a)
+#define TEGRA264_SID_HOST1X    TEGRA264_SID(0x0b)
+#define TEGRA264_SID_ISP0      TEGRA264_SID(0x0c)
+#define TEGRA264_SID_ISP1      TEGRA264_SID(0x0d)
+#define TEGRA264_SID_PMA0      TEGRA264_SID(0x0e)
+#define TEGRA264_SID_FSI0      TEGRA264_SID(0x0f)
+#define TEGRA264_SID_FSI1      TEGRA264_SID(0x10)
+#define TEGRA264_SID_PVA       TEGRA264_SID(0x11)
+#define TEGRA264_SID_SDMMC0    TEGRA264_SID(0x12)
+#define TEGRA264_SID_MGBE0     TEGRA264_SID(0x13)
+#define TEGRA264_SID_MGBE1     TEGRA264_SID(0x14)
+#define TEGRA264_SID_MGBE2     TEGRA264_SID(0x15)
+#define TEGRA264_SID_MGBE3     TEGRA264_SID(0x16)
+#define TEGRA264_SID_MSSSEQ    TEGRA264_SID(0x17)
+#define TEGRA264_SID_SE        TEGRA264_SID(0x18)
+#define TEGRA264_SID_SEU1      TEGRA264_SID(0x19)
+#define TEGRA264_SID_SEU2      TEGRA264_SID(0x1a)
+#define TEGRA264_SID_SEU3      TEGRA264_SID(0x1b)
+#define TEGRA264_SID_PSC       TEGRA264_SID(0x1c)
+#define TEGRA264_SID_OESP      TEGRA264_SID(0x23)
+#define TEGRA264_SID_SB        TEGRA264_SID(0x24)
+#define TEGRA264_SID_XSPI0     TEGRA264_SID(0x25)
+#define TEGRA264_SID_TSEC      TEGRA264_SID(0x29)
+#define TEGRA264_SID_UFS       TEGRA264_SID(0x2a)
+#define TEGRA264_SID_RCE       TEGRA264_SID(0x2b)
+#define TEGRA264_SID_RCE1      TEGRA264_SID(0x2c)
+#define TEGRA264_SID_VI        TEGRA264_SID(0x2e)
+#define TEGRA264_SID_VI1       TEGRA264_SID(0x2f)
+#define TEGRA264_SID_VIC       TEGRA264_SID(0x30)
+#define TEGRA264_SID_XUSB_DEV  TEGRA264_SID(0x32)
+#define TEGRA264_SID_XUSB_DEV1 TEGRA264_SID(0x33)
+#define TEGRA264_SID_XUSB_DEV2 TEGRA264_SID(0x34)
+#define TEGRA264_SID_XUSB_DEV3 TEGRA264_SID(0x35)
+#define TEGRA264_SID_XUSB_DEV4 TEGRA264_SID(0x36)
+#define TEGRA264_SID_XUSB_DEV5 TEGRA264_SID(0x37)
+
+/*
+ * memory client IDs
+ */
+
+/* HOST1X read client */
+#define TEGRA264_MEMORY_CLIENT_HOST1XR		0x16
+/* VIC read client */
+#define TEGRA264_MEMORY_CLIENT_VICR		0x6c
+/* VIC Write client */
+#define TEGRA264_MEMORY_CLIENT_VICW		0x6d
+/* VI R5 Write client */
+#define TEGRA264_MEMORY_CLIENT_VIW		0x72
+#define TEGRA264_MEMORY_CLIENT_NVDECSRD2MC	0x78
+#define TEGRA264_MEMORY_CLIENT_NVDECSWR2MC	0x79
+/* Audio processor(APE) Read client */
+#define TEGRA264_MEMORY_CLIENT_APER		0x7a
+/* Audio processor(APE) Write client */
+#define TEGRA264_MEMORY_CLIENT_APEW		0x7b
+/* Audio DMA Read client */
+#define TEGRA264_MEMORY_CLIENT_APEDMAR		0x9f
+/* Audio DMA Write client */
+#define TEGRA264_MEMORY_CLIENT_APEDMAW		0xa0
+#define TEGRA264_MEMORY_CLIENT_GPUR02MC		0xb6
+#define TEGRA264_MEMORY_CLIENT_GPUW02MC		0xb7
+/* VI Falcon Read client */
+#define TEGRA264_MEMORY_CLIENT_VIFALCONR	0xbc
+/* VI Falcon Write client */
+#define TEGRA264_MEMORY_CLIENT_VIFALCONW	0xbd
+/* Read Client of RCE */
+#define TEGRA264_MEMORY_CLIENT_RCER		0xd2
+/* Write client of RCE */
+#define TEGRA264_MEMORY_CLIENT_RCEW		0xd3
+/* PCIE0/MSI Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE0W		0xd9
+/* PCIE1/RPX4 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE1R		0xda
+/* PCIE1/RPX4 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE1W		0xdb
+/* PCIE2/DMX4 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE2AR		0xdc
+/* PCIE2/DMX4 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE2AW		0xdd
+/* PCIE3/RPX4 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE3R		0xde
+/* PCIE3/RPX4 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE3W		0xdf
+/* PCIE4/DMX8 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE4R		0xe0
+/* PCIE4/DMX8 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE4W		0xe1
+/* PCIE5/DMX4 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE5R		0xe2
+/* PCIE5/DMX4 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE5W		0xe3
+/* UFS Read client */
+#define TEGRA264_MEMORY_CLIENT_UFSR		0x15c
+/* UFS write client */
+#define TEGRA264_MEMORY_CLIENT_UFSW		0x15d
+/* HDA Read client */
+#define TEGRA264_MEMORY_CLIENT_HDAR		0x17c
+/* HDA Write client */
+#define TEGRA264_MEMORY_CLIENT_HDAW		0x17d
+/* Disp ISO Read Client */
+#define TEGRA264_MEMORY_CLIENT_DISPR		0x182
+/* MGBE0 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE0R		0x1a2
+/* MGBE0 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE0W		0x1a3
+/* MGBE1 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE1R		0x1a4
+/* MGBE1 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE1W		0x1a5
+/* VI1 R5 Write client */
+#define TEGRA264_MEMORY_CLIENT_VI1W		0x1a6
+/* SDMMC0 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_SDMMC0R		0x1c2
+/* SDMMC0 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_SDMMC0W		0x1c3
+
+#endif /* DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H */
-- 
2.50.0


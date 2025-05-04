Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9DB19924E;
	Sun,  4 May 2025 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746350630; cv=none; b=aB7SGaBaC76crmsQqTSNIRMx/HnPQQzwqKlFMTDAmb61oK2kGuWMgXgA6zIk1DYLQ7SJ/TLnXpabcJnkkggRsHsK4Rp0KcgiBUiR7MeBD/jSEw6ikBqZmpZtnkyhWdRIMhKddfKs6cGRwEZac3agPdLIn/4GksHfeWCUag9a2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746350630; c=relaxed/simple;
	bh=ArvBUw5P9wMfGkG9FAEqoapkXtqIGAY5331RPvtmztI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXn0V46Y6vQvfUhGEtBPvQjYSnL1QMsv78mGoduNYbksbkMGRFO9Rx/80zTjC56KvJveXC1Yzdrodb+SA6Ertf8VpyhpJ8mt0sDtyKVz5hKqqKTYTKNsnUH6KibbOWln9ZCN/Utv4ieYly5/zZYflTHOGwSRCnkKxbw6u/yzBXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXxfNJ5d; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXxfNJ5d"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb415dd8faso519169466b.2;
        Sun, 04 May 2025 02:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746350627; x=1746955427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hdd1tHb7dEHq6pGwHtRe0hs1j6z6TjkzeO/n/UeJjhQ=;
        b=eXxfNJ5d0nqxPIsPqOtvwxRQ5fFRKlFz5Q6owpNZmLFGOlA9Kj1ha/nIdhSU8JiwG4
         NvkNdfCOdRlxPfkwcG2GJh/80VSnbDb6gKne66L9GvtJn128Q7uExJk+pk7e6womWP1Z
         0r1JrN5X2buIbVLgKrgTu3tO2GF1e5xTdr2oH9cDafUMdOCGkNY5JIuTit0wG2fxXNUx
         nCiQKZk+Q6TgqYVjN5nNejaqeoK/td3ys9KfqkukUbCHhLmrZuIsrUUDsP+mhwRliWfs
         p4VlgnhMIV+FbETpJHiFW+MMBH+mnyv/vzGYnQeLC3atimCXiT9Lb3P8/UtH7qGCxF2h
         9Jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746350627; x=1746955427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hdd1tHb7dEHq6pGwHtRe0hs1j6z6TjkzeO/n/UeJjhQ=;
        b=DOFqPu60Wmm/VYqCzSxak2X8ktH1BmSMwl+1+a2PqHdhyjRO4OVxceVbGPy4IQzLkR
         tBKfcuRxpQCKKK3JzXMLjwYt2JkjvgTLO7g60+gxvrhU7cyjhUX0HV10M5BjifQ4/xfG
         Bty3DrJ40NMoUhv7YyHKji/KWtYTNvUd3I2mHgVLR52HyRJC+HIiBw3+7uRyyb9P9n0f
         RteZzaUNI0FU4i2dyu64jrr6rc+pZunOWJ3XNeIir7Sk5ITc33ovXfnZmcQX43mNFsiP
         h29U1xq0E8BUPS3Lf4+rQHRcs0Q0+6P+89om5z+I+1oK3uWK5z+8Uug/jGJ+DEwzd7hW
         k3xg==
X-Forwarded-Encrypted: i=1; AJvYcCU9COc3IDTTraQF47yTcMbHmGqowK1XzXQ45TH7fP64KnR2WdGNEfyBtlaolCXF8o++y+wg9EBCI7EnlRM=@vger.kernel.org, AJvYcCUA/rBBbBSrHiz0dAzAbU6+deM6/oI9Jo4rOl7sBCx1PYJ2IzZs8/TUOp5AjX25H2IfxujwVTEsupG3QI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLOKVJP7HkdUd/5N0RevzM773RqH1n6tG3EmtFo5n9lhXkVgz
	XQZPU1t2eWztXj5GHfExvaJHFd4XR5PMe5IRrEdCvJ3WF8ds4Qq/N453fw==
X-Gm-Gg: ASbGnct3CmWE9xdYMyRbAgLrw9j61+1aHPmPzRKzI6SWXGz+atWu2feXkEixRZb23CD
	BsqjtUoswYrDKGtn3kLHLar1TjTkDnnZdK/acp2kNh0hIymQv45Gmo9YzV65NZeGeAuCEOUck/7
	9lu2dk7iMANsY4Apqq6qU4IVxM+qWnQgo8onYTVagT98hAITvRQfqyTVOQeWequtLl7UHgkpGZl
	9sikPcUOFMJoaKSoUt/kTkVbL/n8Qm/jfbqTDBIeXCOraXvf4ToY6eErT2r+kpgd3nF6zkV1a7n
	hgCxZxEd0Aw4XAUV49Zp3I3cpAlqnZBy
X-Google-Smtp-Source: AGHT+IHdFTBKb4I5qD67bWfT1Lrj4yM1jCw+byy0NXFBe1dqNxGODTQHkLBgMJjTgfNclPKvMSLoAw==
X-Received: by 2002:a17:907:3d4b:b0:ac2:cdcb:6a85 with SMTP id a640c23a62f3a-ad1a496767dmr288110266b.22.1746350626368;
        Sun, 04 May 2025 02:23:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a26bdsm306050266b.43.2025.05.04.02.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 02:23:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114+
Date: Sun,  4 May 2025 12:23:22 +0300
Message-ID: <20250504092324.10802-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250504092324.10802-1-clamor95@gmail.com>
References: <20250504092324.10802-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current EPP, ISP and MPE schemas are largely compatible with Tegra114+,
requiring only minor adjustments. Additionally, the TSEC schema for the
Security engine, which is available from Tegra114 onwards, is included.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra114-tsec.yaml   | 79 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 14 +++-
 .../display/tegra/nvidia,tegra20-isp.yaml     | 15 +++-
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
 4 files changed, 113 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
new file mode 100644
index 000000000000..ed0a5a8a091b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Security co-processor
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: Tegra Security co-processor, an embedded security processor used
+  mainly to manage the HDCP encryption and keys on the HDMI link.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra114-tsec
+          - nvidia,tegra124-tsec
+          - nvidia,tegra210-tsec
+
+      - items:
+          - const: nvidia,tegra132-tsec
+          - const: nvidia,tegra124-tsec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: tsec
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: tsec
+
+  iommus:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  power-domains:
+    items:
+      - description: phandle to the core power domain
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - reset-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra114-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tsec@54500000 {
+        compatible = "nvidia,tegra114-tsec";
+        reg = <0x54500000 0x00040000>;
+        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA114_CLK_TSEC>;
+        resets = <&tegra_car TEGRA114_CLK_TSEC>;
+        reset-names = "tsec";
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
index 3c095a5491fe..334f5531b243 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
@@ -15,10 +15,16 @@ properties:
     pattern: "^epp@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - nvidia,tegra20-epp
-      - nvidia,tegra30-epp
-      - nvidia,tegra114-epp
+    oneOf:
+      - enum:
+          - nvidia,tegra20-epp
+          - nvidia,tegra30-epp
+          - nvidia,tegra114-epp
+          - nvidia,tegra124-epp
+
+      - items:
+          - const: nvidia,tegra132-epp
+          - const: nvidia,tegra124-epp
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
index 3bc3b22e98e1..ee25b5e6f1a2 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
@@ -12,10 +12,17 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-isp
-      - nvidia,tegra30-isp
-      - nvidia,tegra210-isp
+    oneOf:
+      - enum:
+          - nvidia,tegra20-isp
+          - nvidia,tegra30-isp
+          - nvidia,tegra114-isp
+          - nvidia,tegra124-isp
+          - nvidia,tegra210-isp
+
+      - items:
+          - const: nvidia,tegra132-isp
+          - const: nvidia,tegra124-isp
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
index 2cd3e60cd0a8..36b76fa8f525 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
@@ -12,13 +12,21 @@ maintainers:
 
 properties:
   $nodename:
-    pattern: "^mpe@[0-9a-f]+$"
+    oneOf:
+      - pattern: "^mpe@[0-9a-f]+$"
+      - pattern: "^msenc@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - nvidia,tegra20-mpe
-      - nvidia,tegra30-mpe
-      - nvidia,tegra114-mpe
+    oneOf:
+      - enum:
+          - nvidia,tegra20-mpe
+          - nvidia,tegra30-mpe
+          - nvidia,tegra114-msenc
+          - nvidia,tegra124-msenc
+
+      - items:
+          - const: nvidia,tegra132-msenc
+          - const: nvidia,tegra124-msenc
 
   reg:
     maxItems: 1
-- 
2.48.1


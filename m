Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0757E2D0C94
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600545; cv=none; b=JpECaUAFJHGs+Bi++SGVE2gFw4Jut6OPOQDGT/HrIevOwrn5W0OiN3Ibtqm+BLLlxoUOyP7jCBqcyAuOMtwW1Kkaq307MOOpkginsMmqgp8IgHDaX/FvlA7L+VB8x/UEEAEhyPKuQoTusMSr5v3BzM+Cz9K+5enIU1/t4M7ZJvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600545; c=relaxed/simple;
	bh=FkGRInyokXG5KJ+kNbqMo2+fNDp7XD2fsmE5VLy0RFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+pnmJRL5UJ/phPRYNQmkFw5GTJKeVAO01CtwA5EFVWcrLJqOPeLljWjXbQIB+EucFEMbPHypjRaXp5n9cg0igqjSQk4ZJSiTgtkljoya+2LYp94iJsMx+ESXMEGvK43j3D4eCRHL8jDIV0tN/jZJWMOTb9neSoxJeO4HLweEWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k637RR6X; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k637RR6X"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-586883eb9fbso516828e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 00:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760600542; x=1761205342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OFHVsoqdL4FPop43Q5nsyfcnf+4nWBxo0n9KE3mG1k=;
        b=k637RR6XHedi8yaJRkiZptXdraa3lA2GP7TsT49K7SQj80XRPDayVmTqb/x2yKZiOk
         libL9sQQL1Vik3M0loZJeyy6IhTh5z5kNIdzVaDMdkYRErTik3V1Y9DHoGD/du7u82DB
         hwqYK5Tvj3fw+encIewM2bMnBFQx3hgpzfKMoxzxGFOgMiRZrUjysyIf/HGZucDPmZRR
         n3KRZtUlPppan7+Po6FgNNjJ6RsZ4qlTYUmZ+Ttq1zUgNe34D2O/OgLDe49WsDU8ivBr
         Q3M8x1YhtHz3uEaENx01tiOyuNrqA3g4vNkZok7qYJ9yr0jWZ4fnXti70/xNE7LMRH0i
         66fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600542; x=1761205342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OFHVsoqdL4FPop43Q5nsyfcnf+4nWBxo0n9KE3mG1k=;
        b=VuREkZ2YFoDcd4ZUVXPaKjtW2EAE77wYZrm0OJnVzp+cRB9xAgBQKd7Nsz4HFAcLds
         S5dvorNNDed/3ih6aSHkYU0G6XjgPVw5cixC41ZTe4NY8CdR4l+7pRD671/H76jHsb3+
         KW/6O1WRTx5MSm/YuOFomamTQVYAOGeSkMOEr0wF0WEXVCuPlxSq8+AK8SBtWjVZi0W9
         MrgR3x3Zr//o77tCaNN5sKo6IIw4U3zPTgmboZYEhXGE6gyC5BaQ2WbNTDqPcgSnCqM8
         ka4MDRvEGsU2VbwYvjBDKD6n4cKQrFHG63SMF6Kc7anPX0WCLVLmKFcCqRalfFKTTFiT
         prsA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Rygi4ho1DaZ7G4FxsdKgPyBdupkZ4tGofQkFnWFoUmTw3k5nZdOu4yomtavGytnqV1FEmjj4rohT9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdswxOhmpG6qFIznzx6QVFQH6CEhN5L0YwHKb/ixnUY8hj3py4
	8/CAor5fXKsU3pOo5ZENVqEnVq4q87tIn7bpVrUORSyycD4PXc8/MlqR
X-Gm-Gg: ASbGnctsMGeBUUxuVcRTiDnkgYJYgfeSPWf4ELfiWX0NQQ61rZ7xvZU/Aaw2fMPwM00
	0d3Tk+EGK3AJdxfOj6k/F0IlZngzyEkdTnHKK0u+1/huY8PxXOH9CrRn9eu6OZodIBTGOwEEqde
	uCYt8HgmzBaNkVP5J7/jjvzf/xtDsj5as5vQdxi+Tsselre51gPaSEYNRPh7DrD5WW1rJdsRqow
	iCVNcc2R51Tcp5V4RXT1TbCNbf83wN+nSQvLqe6/yLBvft8tB67hbZ7jIXBx5TUyditStCZrxnk
	wtrEAoEL8/xQDVvvIcLCUJLgFZ53ZC9q+LJeFIH+M5inxCg5Mvb8g+wgCVtKyn+5ZCz8DmmeNK/
	GTK9dVvajPT5ynJ84y1Mj6VDJyfo9eFBoT7PSG4JByRgPJg/da8GlpkbZ3oTJdXnSENvCmwJd5u
	3Bm1zUbdHWrJ37
X-Google-Smtp-Source: AGHT+IEQ7WcXMMwyK2nxJArLctfo4cva0enT8AjYXTH9/BOo6BovSeeUah3crI2yt6sggvpHayBv2g==
X-Received: by 2002:a05:6512:308d:b0:579:ec3a:ada2 with SMTP id 2adb3069b0e04-5906d7738b2mr10869982e87.4.1760600541764;
        Thu, 16 Oct 2025 00:42:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d46sm53226121fa.34.2025.10.16.00.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:42:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4 RESEND] dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114+
Date: Thu, 16 Oct 2025 10:41:49 +0300
Message-ID: <20251016074152.8759-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251016074152.8759-1-clamor95@gmail.com>
References: <20251016074152.8759-1-clamor95@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../display/tegra/nvidia,tegra114-tsec.yaml   | 68 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
 .../display/tegra/nvidia,tegra20-isp.yaml     | 15 ++--
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
 4 files changed, 102 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
new file mode 100644
index 000000000000..2c4d519a1bb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
@@ -0,0 +1,68 @@
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
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  power-domains:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
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


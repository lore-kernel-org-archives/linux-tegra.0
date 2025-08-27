Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2328153A;
	Wed, 27 Aug 2025 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294676; cv=none; b=I1Rzf+hGG8i6avtLSIgj8lk0CczusQaXqOh/S3nh7Z0ahCGCveuv5vMRXaZ+Sd+RrPITOXsaMjy8MCQ4DiWBAUHMnHdkXBe8xHEazZLC6+BFPX5cDbpimaXO7fqjZZhkULfio3H4PVNTb5K5ZK5Fk6w81CEQBUcPG4Ne/o6p2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294676; c=relaxed/simple;
	bh=i4MgcvSNSXhpXwA0Joq8AfSjh70ku920C9QSWoCf6JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJbJxbg77x9Spl6pJyv4rBsh95Lqd9Vt1WuerowtFFXp6Zr56DouyEF7W3cCYwDn3nQ/JGHLAAeLG8gkBaNCZuOf1E0Dowr1bmHbok58Duj4ktjj3raUM2uEk2HZ+AQfYWlXJR6Cqd1HpS6z48tTklq0VL4Phfl6x9erczcWMxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4mdYF3h; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4mdYF3h"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afe9f6caf9eso330228466b.3;
        Wed, 27 Aug 2025 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756294673; x=1756899473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZCwVIm0BBUrI1isOlAHhb9IAUffQYjBbbKB31CrfK4=;
        b=M4mdYF3hkU2CYKrt7JKsUSlZjQ0G2OEAJ+FTgSS2nE2Wf3tBS9yMdLqwMo8cPAss+A
         ShwNRR2UwBQLSqJu5laeXAfuysly4lDpQWu6wBD2XJxxVge5NY9DBDh93Lf9rEEa0qmb
         IfGxMT0xjv8IeWvmVx/z0liIA+dslIQwIuBK/zu81Mte84RDyY4PzxHF1BXtc6Xyxwh3
         huaK10Wf3jleSDN8qmstScaBlvgFq6CpHFtwYBXRHOAbcnm4kieY7IJpCpdfCIg+OVQz
         nHZTZxA+Z1ow8wS1MOGGB7meFvE2PIkfU2KXHNlFe/NWt2M6VOhh/TyPVDq7JAk4KPI4
         V8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294673; x=1756899473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZCwVIm0BBUrI1isOlAHhb9IAUffQYjBbbKB31CrfK4=;
        b=W7K1s3dEsqlulBSqJGXxNYK3y/KVX0xPXLIZb6iL2t4VyC0bu+CwebUtwQm1YZVmlj
         hms3dDDzrbaLoDNp+ooqbmDiFo3bR2R0g7uR9YxRc25zgDODPLFLHxnuQhjm6RINa81j
         QBryT+pAJiP8ZIhHdxTeMTO5x3UvyI38UOsVNYesvBp7DeipFB9vb6TktsjgJSLF52+D
         tDjbNBgoJ8FOt7eVkAl9dr+g7A2cQGfmN7faiQEbDhGiNh4RQi+VQoMjrqewglzW+sgU
         ve5pJ5yaGLNaf3IefQ2AIu4cEZfawK002zNOyfJlC+Uka3bPYcktKf5dedDk3mmnGfmF
         lTBw==
X-Forwarded-Encrypted: i=1; AJvYcCUz7WrGEDHGDFH9aN/+vi9izGOYf4zzCie0w2ja8qpyro6BdaP7jCB/8/6+aFFQy7k7KKWldME227z0+0E=@vger.kernel.org, AJvYcCXwFQ4Rb7DmnhMCopzrnkgLLlKuVFFHZ7i7s4BWVsX1X8JT1BdWVAcFiTqCrKDcgpVRrtqdqifZm1CSHWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSrAmm8Dln9sFfG+hnn11QCZyozk6qMUiMRLp1T3Og2YD1VDiV
	tOqTbyHmw5oPnnVn0EZ7tbUBM+i7POIMS115Quz6CySd+QutRaaAy+75
X-Gm-Gg: ASbGncsimwAKdkXynZM9/rlNdU0YeJ1pdaL9ka6TDg8gVOwkGiEKd+J5YiDXhdMD03M
	v58PyOIq86o1LSeYB1pt+B2kzNNu0BIycWpUhW3fl9ocT/WqXY0j7YGXTNZ6DjqQt04ffINdZ0Y
	Len3kliQR4J0sCZC+URorDdq9yshz28g1pp5Z/zDeQDTTk6eiD5aW57Frmumhq6TBd+5exxWraV
	87pYfbeR/dqVCthZbj+b9jQHXLIArrbbSta0LW3sgccXopr17Zzn6gdMMuYXJLKrAvBl6fMR/uf
	qb+wMN+PDs0EgU4TkSXqQuxWuj0v7CvXvADrt7Ib8BP5mvczxadK31pkQiLo3mFlvuf1lWC7Oef
	oh1aG3qaz+wYGQvjTFpiqhnXU
X-Google-Smtp-Source: AGHT+IGJAxA4KBmmOR5bXwz703ra8BVtkjyV3qAc6z7tzN3EEb88a0QUSgAh9xLVP7HTf08aVPv3tg==
X-Received: by 2002:a17:907:72d4:b0:afa:17ef:be34 with SMTP id a640c23a62f3a-afe28ffbe95mr1695113866b.5.1756294672936;
        Wed, 27 Aug 2025 04:37:52 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7aad5d61sm675607866b.105.2025.08.27.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:37:52 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114+
Date: Wed, 27 Aug 2025 14:37:31 +0300
Message-ID: <20250827113734.52162-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250827113734.52162-1-clamor95@gmail.com>
References: <20250827113734.52162-1-clamor95@gmail.com>
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


Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE911B042E;
	Fri,  7 Mar 2025 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335084; cv=none; b=hFO7xzvW/P+WVa59LZvhGg1fUBzdmZuUrZ2tFmtY/qSMo2/mJF9xXE8hE6RU+a3JTM181UwX5yViH9q9c7+p5HDBLqPwaM88sVuKqVtuqoDpiG1h16PHrn52R5xYeH9itTNhDDFSPmD07nRX/yaMZ0tU2iKEvsV2/fZTu4FBMlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335084; c=relaxed/simple;
	bh=rKuUN7Qe+jJDcQWyID/ZVefSWORRrjA6ABeLRsK2Es0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvRWOJ6Ir4TTVB9M6aIO2s/k1VsL8b72fB2B/5oBtFD0BHEUJGz1VSbUgvFYqB3i/SedO4oPwzIbNJZyNGsIvdthtxYmnf08VBUvJ2UBSNBO60ySq3yQ1HAC+fsTGnE7zNF45+NkrbZvzGRsMofiOd7Jh9+vWyzBYUpX9Ul0F9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChiuAZU4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChiuAZU4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54954fa61c8so1725759e87.1;
        Fri, 07 Mar 2025 00:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741335080; x=1741939880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42CawO1fZg2jTFX/0TP8AoP4C6OazmbBXjPMb5Vn8Xs=;
        b=ChiuAZU4xWQ4ODF6/roM07bbIZxYqop0rJYSyeDcdGdG0py26OyR0nopXnkzbbsUYc
         AywwOPRRuWsbadp43YEljGpoK0aBKCGURzyj6F8CxeAT45gB0oXWx/rrcKm5/ujFUjeX
         FC3c7p8bmiHP8IaG24VWwKgXFoIvaYnsN0RYl8Z0EqzSKQa6dyW8oPehPERjkEdedWPe
         W1sqIMlkPl1KKT+QD9Ad5y5C4w9kP5NulKTyqJ1AFr/yGnd3FAnIJvfOxZg431A0iwhh
         aPF8TlGizQ4Pc/gf4uyDdxPZUl4l1HaTwT61ynzuqf4wCdhrS5U7spxmoupwWv9GtqHm
         qayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741335080; x=1741939880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42CawO1fZg2jTFX/0TP8AoP4C6OazmbBXjPMb5Vn8Xs=;
        b=poqkVK5mmHEMN4D3ObTug8S8YCmkOk4axMBRm43bp4avzL+zYgxDZ2n6i4LI+bsln1
         m6rLaHycAcpTkmXRzrWdBuyxm6ZNDod+qk7yO7wL7L0BLiGJB9Ae55Yu3CTNmhOzLDa4
         7N5ykBcd1eAMTrJF/GiKNaQokh9ALANupi7lsq5etleXaxkXnRMz8Z9iuqBmNjynEa/P
         9st8Hzq1xxgokt/UwKw4flI+KV+M2zSr+5Pj9s91t1rpIXsgn5ldpuVWA0INCMHhDPJN
         aI+2UuyiWPCMPnXJ16jgZ+CVmHqZMP1m+W92h2eM4NYZb9KIdawH8kIoDMGiPzn6vy2y
         vzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ06ybp+TGo2hK2U/l3pF600FHKFuno7zkPCLOAoUHywDnE9HVIXcmv35yQ0bWja6sA+hR7fbq3nqdpdQ=@vger.kernel.org, AJvYcCWosnNYgwgQqgclgCMYFvzmKsXojYZb1fsPeoTZd+UdC3VWpdHBQw0PiXcvQrjpyyYBJN39XSes47UJfF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxefv3ZIZaudWeskm3zZ8/RjKMlkmwfjvrHwpS9cWiSfCLOYlw1
	oi2uYiyt4cu0n+emii76g0cX+igMgXHjGHuPaMZJdbaRlM4vDysI
X-Gm-Gg: ASbGncsAz8PlyAYN+J5uwLJzMGzlh7RYaG4vo+3iamDnGQGd+Fxvbxmlz0zIZb4mA8O
	ZhL80umYEtAXGvXmsf+CM7mln93FKHjE5tDHpQONMMASm3FwQ5mcqm2Uwb3AVRp27aUKZKQR85G
	zjj7IPuBS/4askRzBrMym0YB47iX8G7I+Q6S9xGWOHoab43g05c5wV/RSv0C0xds7Tj6QiR5I/L
	/aH0NUji4ZJzsoRJjtHlQGO9uR1HVRrK3dphnYIg5tl3NUaPzRxD7wuGgJIefxEmBw2JtLIfAwD
	iGWXlWrTHq/lfPYm6ZEdyWb+VcDdAfVC5FwN
X-Google-Smtp-Source: AGHT+IEoZdsY0GD7VldQaVjNmHbeNZ8RzHXgb3AQWbFxB+BN+ZSNOWe3fCM+SIyVCmZDhKh4dhe74A==
X-Received: by 2002:a05:6512:1251:b0:549:903a:1b4 with SMTP id 2adb3069b0e04-54990ec1824mr722131e87.52.1741335079836;
        Fri, 07 Mar 2025 00:11:19 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd148sm409886e87.139.2025.03.07.00.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:11:18 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114 and Tegra124
Date: Fri,  7 Mar 2025 10:10:45 +0200
Message-ID: <20250307081047.13724-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307081047.13724-1-clamor95@gmail.com>
References: <20250307081047.13724-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current EPP, ISP and MPE schemas are largely compatible with Tegra114 and Tegra124,
requiring only minor adjustments. Additionally, the TSEC schema for the Security engine,
which is available from Tegra114 onwards, is included.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra114-tsec.yaml   | 70 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 12 ++--
 .../display/tegra/nvidia,tegra20-isp.yaml     | 16 +++--
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 30 ++++++--
 4 files changed, 114 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
new file mode 100644
index 000000000000..84d9ab9394d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
@@ -0,0 +1,70 @@
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
+properties:
+  compatible:
+    oneOf:
+      - const: nvidia,tegra114-tsec
+      - const: nvidia,tegra124-tsec
+      - items:
+          - const: nvidia,tegra132-tsec
+          - const: nvidia,tegra124-tsec
+      - const: nvidia,tegra210-tsec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: tsec
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 6
+
+  interconnect-names:
+    maxItems: 6
+
+  operating-points-v2: true
+
+  power-domains:
+    items:
+      - description: phandle to the core power domain
+
+additionalProperties: false
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
index 3c095a5491fe..a50e3261a191 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
@@ -15,10 +15,14 @@ properties:
     pattern: "^epp@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - nvidia,tegra20-epp
-      - nvidia,tegra30-epp
-      - nvidia,tegra114-epp
+    oneOf:
+      - const: nvidia,tegra20-epp
+      - const: nvidia,tegra30-epp
+      - const: nvidia,tegra114-epp
+      - const: nvidia,tegra124-epp
+      - items:
+          - const: nvidia,tegra132-epp
+          - const: nvidia,tegra124-epp
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
index 3bc3b22e98e1..bfef4f26a3d7 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
@@ -11,11 +11,19 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
 
 properties:
+  $nodename:
+    pattern: "^isp@[0-9a-f]+$"
+
   compatible:
-    enum:
-      - nvidia,tegra20-isp
-      - nvidia,tegra30-isp
-      - nvidia,tegra210-isp
+    oneOf:
+      - const: nvidia,tegra20-isp
+      - const: nvidia,tegra30-isp
+      - const: nvidia,tegra114-isp
+      - const: nvidia,tegra124-isp
+      - items:
+          - const: nvidia,tegra132-isp
+          - const: nvidia,tegra124-isp
+      - const: nvidia,tegra210-isp
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
index 2cd3e60cd0a8..35e3991f1135 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
@@ -12,13 +12,19 @@ maintainers:
 
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
+      - const: nvidia,tegra20-mpe
+      - const: nvidia,tegra30-mpe
+      - const: nvidia,tegra114-msenc
+      - const: nvidia,tegra124-msenc
+      - items:
+          - const: nvidia,tegra132-msenc
+          - const: nvidia,tegra124-msenc
 
   reg:
     maxItems: 1
@@ -36,7 +42,9 @@ properties:
 
   reset-names:
     items:
-      - const: mpe
+      - enum:
+          - mpe
+          - msenc
 
   iommus:
     maxItems: 1
@@ -58,6 +66,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/clock/tegra114-car.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     mpe@54040000 {
@@ -68,3 +77,12 @@ examples:
         resets = <&tegra_car 60>;
         reset-names = "mpe";
     };
+
+    msenc@544c0000 {
+        compatible = "nvidia,tegra114-msenc";
+        reg = <0x544c0000 0x00040000>;
+        interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA114_CLK_MSENC>;
+        resets = <&tegra_car TEGRA114_CLK_MSENC>;
+        reset-names = "msenc";
+    };
-- 
2.43.0


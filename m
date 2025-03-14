Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F4EEAD7;
	Fri, 14 Mar 2025 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938405; cv=none; b=f1wF1u8rVeE7A+vQabitjpFzUsbFg4SVOF4H8e9LsSFssZ8t81SxWCOC6CkOsjMCky826iUKz2PuCH6Rc8O0ZA/SshO3dhIIf+/TDrDRH0UfNJlJ2oOYeHnyVolRSoAEg5YdqvW1wg4LoOuhASGPa5pd89eARAPmSISGk8GDGFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938405; c=relaxed/simple;
	bh=8mmUBccWeS5FXde3WeuP5ZGiAo/+jJoGHrNO/gHHCv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5O0K3i0YFeyFsXPC/Ov90M72lIWn0GIir1uSBdHkP/G1X/Qi9SdVf3gvIl66qsc7/8EuLdU8eJccJf8O69U1qRHv9FI2Lhvd3PTruECCzdeLjIMm17wuWxR9EqW2Ym88yR227xg95pvdADIcRmB8qwcNNEA31vcBf6+7+JBu8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhGaFhUv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhGaFhUv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2b10bea16so363783666b.0;
        Fri, 14 Mar 2025 00:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741938402; x=1742543202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt5RH7NhVt3gEAR38HovjjZlw/fqTR4hQMaKaFS32AI=;
        b=AhGaFhUvnNSAgYwzMvOsBI1ooI1Rxt8wVCwHEHlJKhpwP/htTXvXDekoj8sxdDVcSn
         Wu4pnk68vmu5N2sNe2Xl52/RcXqs+Bkcply6tLvmgG9+y6KWg09op+ULWGFka3IjB+U0
         23vpiZsjKbtrfChIcMKdxAa40dbBP7nxXnEVhjkMK9nEDM//DYWdW9Lo1uGjrDG0BfjS
         kUyCp9tGYpI/YVkMFeaE+hxG2fNKDyptLw47/81uaPIzkyNEX2DcSdKFmy6kthFnI2QG
         Syt91c7N2sXW53Fq+OavhIFL7qvu1CYpGmPGdNQiwYo6l2sIcZ6EBFvF2yBi5gzdlCdv
         Nk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741938402; x=1742543202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qt5RH7NhVt3gEAR38HovjjZlw/fqTR4hQMaKaFS32AI=;
        b=bxP1UC0gWjS307kSCNIORM89PQ34/4/voM5Os1/sOR7lbGtiDjnIYvA4rSbj7EgEoA
         4YJkkVIyOIwum4u8CevkxCRUpUX6C+TjjrMvkIfMUcgR0KM1BOX/iteAEneE8TjLFlnH
         vE1vTVKXQlQHMV/4ECTGYhxzfwMpG1MLXFFXQTbo4uhK5I/aKcti0nZQuMuOK6WyNNzA
         XQPhFbn8u9w2v4NO53B3JizSQ6rRo73bNNAXFx0/bcj9dmVixZY1PMgvzffXm5kwZ1Ep
         fHMQ1+JNH254qB8lzrFydcd4UHLZkQKrOM89tZCONQiF3dyGpJuJ3FWi6mjj3Izk4/Vm
         31aA==
X-Forwarded-Encrypted: i=1; AJvYcCVmYceaThDZ6tH9fKcKhpKXqnXLrZnYxqvAjFhQm1P3biJCpKwdVKla7NPQ856jN/Hrhqu0OT9p7sjoVrk=@vger.kernel.org, AJvYcCXO829vBK9CzzSpJHWARqEvf/a3+JaTo1mgtnUPIK1GEi/wOSUEsQCgo+E8a637ZGZSIw7HIg9Kw2mB+pM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrctvMlmuwSfM96FXEQ/pe2KlQOn1SNgikqPoKy7duG0iw0SOt
	HtrCkB35c4LBZcqKBz7/x4DVDMts//+nDE+xJ8MUiifOZswQVcKv
X-Gm-Gg: ASbGncsNnenC+vpem/090zTRlgaOMqM98vfHbswS8fRKnkRDUVaTfb2u0QJNW+YW7v9
	crtK2/9AfwBdG4KKZCv+tCpx08XbCJJkvkdas3G4QmF0wRa/0krttWw3I9JKY/RkJOHdthzExTv
	6CtmgpkhuWuCkTiMMRlUP+8VFSPr6ueKHt69KnNbSooVCYjkWjC9kvQnETOL/t3FP8EiwR3gAWh
	RGl7kij8OUoWc8dQIEjoD9VUfIBQyYtDHYkyYK+2YxcuIB9pmnfQB4slrswNTCYZaxNA+jHJZLB
	A/HWgVBIhWF1u2wTzvve//Y5n6pxa5xfrkuLl5T4IMTcFyk=
X-Google-Smtp-Source: AGHT+IHg5lZTaDPkBybzbrptJcoafmPX6KLb13SsZc0RVbHA/RGA9oqaa7YeesNPQ3qWL/ZiWrHTNA==
X-Received: by 2002:a17:906:794d:b0:ac3:da3:a1a7 with SMTP id a640c23a62f3a-ac330105be6mr182707966b.3.1741938402214;
        Fri, 14 Mar 2025 00:46:42 -0700 (PDT)
Received: from xeon.. ([188.163.112.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9bce7sm185498666b.164.2025.03.14.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:46:41 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114 and Tegra124
Date: Fri, 14 Mar 2025 09:45:55 +0200
Message-ID: <20250314074557.16367-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314074557.16367-1-clamor95@gmail.com>
References: <20250314074557.16367-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current EPP, ISP and MPE schemas are largely compatible with Tegra114
and Tegra124, requiring only minor adjustments. Additionally, the TSEC
schema for the Security engine, which is available from Tegra114 onwards,
is included.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra114-tsec.yaml   | 66 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
 .../display/tegra/nvidia,tegra20-isp.yaml     | 14 ++--
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
 4 files changed, 99 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
new file mode 100644
index 000000000000..c66ac6a6538e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
@@ -0,0 +1,66 @@
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
index 3bc3b22e98e1..fbfcabb58fd5 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
@@ -12,10 +12,16 @@ maintainers:
 
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
2.43.0


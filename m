Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E64BEE2E
	for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403854; cv=none; b=mKH+TCOo2HU+aVCQ/InW03ICbCxZe2o+n6vRjfHdXKdJO8dNTMZJZGZVX06zS9i0C66odd1G9JEcJbQHCFaVx6h+iqTpdAR2Srkcd/DsyyJAWht0B8OH+ZqP6hc4Hv9N+h3r6c7DImd3YOsjEuUBhKxmvmhg0Q265CZ3NckNOP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403854; c=relaxed/simple;
	bh=DoVzbYZhKg/nfi+sdH5pzhfcQzW780wRFKK6MhQOPZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQ9dAaBurDeFQcw5JxJGNm2tHeGKzNonsmQ144uZ6hUI645DncESFmpbBzuuxrokvd0RyF7XyKDxEj1kQe0mhC49VZrvpfkVfwuf02c8+UdKcwB8UrrxKk1VnzuXAy6bgMDhOqVeB+sRPi6wqdP+M9O/4kcuhNeQ9ZEwPVxwiqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnpRyPUI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnpRyPUI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1375249f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403850; x=1793008650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBTLKDknRyoiYDKLKvNdQPQPMYptAQUNMVhu1Fol0ak=;
        b=DnpRyPUIcWJr/ly+ATJVLsqXmZJdI2/ci6KiGeF9gduvMTgmIpAF3f7aypnWFrLMVw
         HPaZLaT3Hg2Tlx4nqHkfDQlV3b5W2Ljsu43yZGUYvDq+piQqO4MW8L8DeVB8frFXu36y
         E9XwbJy9xpvCLPYqa0mFle2jzFeGmfex8pJsSyYgw3fDPKzdGK22VOw6KBHwz/4q4ZMF
         VqY/tbjI/bNIf8Pveo2U3MoJWEVCbNzkNjanVtgIA8vGiA5tlfjWrwu4CfB+RoM9bbvB
         ygjSeDmRbDmuvOjv8h8nTgGkIBrSYmW6Y3+UfqEKUf11w4kTdBT/kqCpZp0isxyklOPs
         FPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403850; x=1793008650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBTLKDknRyoiYDKLKvNdQPQPMYptAQUNMVhu1Fol0ak=;
        b=RO/7C81KHli5g/WfTOxfWlqiIeEWGG2Kxse0g8qDm082dh5p2izvSy3ZX1n2LUeuv5
         O/TpWYl5gTGX4uCwBOGrfq2F9gqE2xxOI+fq8ROT9wIQJvFRNyJRhyu8rBxDJ9+OFRjV
         uCVSR9mWeRb0JSZYDzMmAZW2Ek3t2rBr6WZx+ntNjV38JBfJ0Hggh8gxlXJz2UrXDguw
         QQ752IXk4r/e3G/trRmyhO1Z59C2PtUUaYiQJLg+WaYwd7I0OmZI1Acp6IT7zNttG3Yd
         FUzut/f8p7S6PT7fgieCeONoMwVbvFcpbYoo1utiWX//MtSeCIivG5iC3WqnMUT2zeqb
         9vgQ==
X-Forwarded-Encrypted: i=1; AKwUvBymop+dcuoxNuSr+oCnUvn5rqnWRrN+pzvqajCLr1qbWioRj0kjhWt9PtzOgzY0Rww9QNZyNcFVhzdeww==@vger.kernel.org
X-Gm-Message-State: AFq9FYLtyA5v4V096AgI0MpEE2g3VcH1Nj+omQtH75MIdUVPtOSO2zYx
	IVRmEI+XhklnfV1N+saD+gUx88toKGerv7Hx66GDV0HiYj9IhkcOdGNY
X-Gm-Gg: AYBFou1jfqLVmE5yHgZ0OmkSiZoFXfEIDBEtBgNy0mv/exwpHDPUicm19LlO0hm12Nb
	8LxLJDUfMkCazDlXVef3BMq94mzsu4iJ28LfafydyRwo8Wo32dUGHNhIsq0oLW8VrWk7/qv1sZC
	fCh6uevDPnAJscMobl6ebOQK3fKBU+JbSfeODQttzy9N3iFx95OnuP0Ty9NL9iN6/cm4CAWI0w3
	WRjFc2CvlazRXda8eD2lJpFg6b8g0J5SR9qr8kcmvnUqQPuo/e8/TrGUigDE9wcPGOT9JPZgfyG
	r3SnroxDTRzkvA6KzNGYdFvZ0VbxAMhRyMBNpTOQWEAfvyzwJ7p+xeuuwb3WWV3E/Y8u67+P6wT
	EDo+A31fr/0ZzgQvL9TeDJOqMCy5sCtUJm2HiOvXHYRrt+rhO7qJdtjsAYdrMClxt9ytQEMe4J6
	6etMc0WG71UFL8zK/J9/ZQ2fW4Rg0CQIMw34EenzQ4pw5U66Vj4REt07P6Buswp/or6uoQma0z2
	b03hbncU0G1tbXDIRk=
X-Received: by 2002:a05:6000:468d:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-48e07bab949mr9616378f8f.8.1792403850324;
        Mon, 19 Oct 2026 02:57:30 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/7] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Mon, 19 Oct 2026 12:57:01 +0300
Message-ID: <20261019095705.91062-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019095705.91062-1-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document 8-bit CPU parallel MIPI DBI Type B interface provided by
Tegra20/30 SoCs display controller.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra-dbi.yaml       | 138 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 ++
 2 files changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
new file mode 100644
index 0000000000000..ada7b35778933
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra DC based MIPI DBI Type B interface
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: The display controller in Tegra20/30 SoCs features an
+  8-bit SPI interface that closely resembles the MIPI DBI Type B
+  protocol and is referred to as '8-bit CPU'. Each display controller
+  provides two such interfaces, which can be used to send MIPI DCS
+  commands to initialize and control the panel while image data is
+  transmitted via 16/18/24-line RGB.
+
+properties:
+  dc-gpios:
+    description: Data/command selection pin.
+    maxItems: 1
+
+  rw-gpios:
+    description: Read/write pin.
+    maxItems: 1
+
+  cs-gpios:
+    description: Chip select pin.
+    maxItems: 1
+
+  data-gpios:
+    description: Specifies a set of 8 gpio pins used to transfer data.
+    minItems: 8
+    maxItems: 8
+
+  nvidia,init-sequence:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Device specific set of values used in DC DISP_SPI_INIT_SEQ registers.
+    minItems: 4
+    maxItems: 4
+
+  panel:
+    type: object
+    description: Node of supported panel driven by the bridge.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for RGB input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [ 16, 18, 24 ]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DBI output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - dc-gpios
+  - rw-gpios
+  - cs-gpios
+  - data-gpios
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dbi {
+        dc-gpios = <&gpio 110 GPIO_ACTIVE_HIGH>;
+        rw-gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
+        cs-gpios = <&gpio 108 GPIO_ACTIVE_HIGH>;
+
+        data-gpios = <&gpio 32 GPIO_ACTIVE_HIGH>, <&gpio 33 GPIO_ACTIVE_HIGH>,
+                     <&gpio 34 GPIO_ACTIVE_HIGH>, <&gpio 35 GPIO_ACTIVE_HIGH>,
+                     <&gpio 36 GPIO_ACTIVE_HIGH>, <&gpio 37 GPIO_ACTIVE_HIGH>,
+                     <&gpio 38 GPIO_ACTIVE_HIGH>, <&gpio 39 GPIO_ACTIVE_HIGH>;
+
+        nvidia,init-sequence = <0x0000002c 0x0 0x0 0x00005000>;
+
+        panel {
+            compatible = "hit,tx10d07vm0baa";
+
+            reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+            avci-supply = <&vcc_2v8_lcd>;
+            iovcc-supply = <&iovcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&bridge_output>;
+                };
+            };
+        };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                bridge_input: endpoint {
+                    remote-endpoint = <&dpi_output>;
+                    bus-width = <24>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                bridge_output: endpoint {
+                    remote-endpoint = <&panel_input>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..a2b7279a17930 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -76,6 +76,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A list of phandles of outputs that this display controller can drive.
 
+  dbi:
+    $ref: /schemas/display/tegra/nvidia,tegra-dbi.yaml#
+
   rgb:
     type: object
 
@@ -155,6 +158,18 @@ allOf:
             - const: wind
             - const: wint
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-dc
+              - nvidia,tegra124-dc
+              - nvidia,tegra210-dc
+    then:
+      properties:
+        dbi: false
+
 additionalProperties: false
 
 required:
-- 
2.53.0


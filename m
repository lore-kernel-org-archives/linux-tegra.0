Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887574;
	b=pMdwEUfKS84EpN2UIIqJ7XCkrh2WSdE2I7H/9nAyrNf2yBQuuIJxWNpclj8kEtRW3UGn
	 cJi3DmXD1M/3jxoILN5jCxvHCkq+pWzk3P5ColDbpsbsDukS4QNkOlVoGn7550H+zhvHu
	 FoV+tpxvWbXj6pq4BF4iXMe0FaTaWQ6Xi/URsNnF/MTfMdy0VmPiSULBVFr6XIHGcq1xd
	 a/snaM/t/GIIc60jonQmtn1/Y2iucxrHfUcP8grndJ+To2+XaceybfVpnrgHB0ieH2a1W
	 vYMYp+kVFUmnrzV7zxE3dh4WJb7dcA4Uk1jrCkfjmBF9ChHwalo2yPFK98E6BO+AY2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
	b=z/k1Pjjy9dppMoy3SUTeOhmKUj/U2LAi7mwJMTYGSV9TQBPi7T+x3Yy8exsVVgJKQE43
	 CDTs87AbOWrKgZ79QFbv+zxCGd9hQfSimKg3WzcisCaz8B0k+wghm1cWRYqV673Y+wjR7
	 JUT/Dgv7kzLtR9Dg6HreBT7n5Bv7PYtASl8mcjoWwdCEPLnqc0BtyboMK/S0tea0zA/qh
	 PyOL1t7y+TGFP3cpKaUHexH2/+kQBZtatxTlaOeEOvYznbTwHqZjCE1eufmQfHM3S341M
	 P8WEYfPvq7BIcoJJSH9JIYl9TPNB5lCNyhCSbnjdGZqDj+v3e+4Pfijqiyln5uJ0vNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BF7EnJZW;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024BA606D839
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 14:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024BA606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BF7EnJZW
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso422380f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 06:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887572; x=1794492372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=BF7EnJZWrDDMVMnvLvvW9/COpFbIB5VTaQZysOkiaudeopmGXy+tvSljlUNx5lDBHT
         +pqBPFzc7BqsAjj/CPhZZh7mRx7thAe4DiAAVJWReMuCIXgyrplxT3N4q6kCUuN6isgN
         XPmxG3PAUfpJ/IHTbWH6+5WNonERMZ12AVbRVYBby9PEho4Jvr6fuJ/UWdMIxiyJ6lHT
         p+aRHaIpJzR/d5/0ucQTQLYGAvlg8nkQCHM7rsbZEZFxoqbjKLQLMfNlK3RF7+99hjDo
         u6iga+s5+r00nCi6LQBiVy7fhbgpmP5K/OvNkZQlO8XB210pckUK+VP3r68Tz9vxHseh
         8OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887572; x=1794492372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=DguIf3MesoxuVSAG8fDeFfH/w4doYQnmYjyfG1z2KgXhy4RiIApa/MZKITA6Gb+Uad
         Y9ck4TdjywGS6EaZaQVFxrUEXvqbnfFFkiAHsiuzYuOiyWUMVFqeJGMI9Lya1b/PeIRX
         XobXcdvdDWFuWywK1v24BYkHk7gcGSH7KW8RfLo39y0b6PZotxj9c+WrOevGvhaUVF7q
         ehIMLQVMyv0RqqCO6u82x+EZpc4QonaQlHjFR93I0LHNvWItlsNviBi98/jXEr185Vag
         4+CknVinjJgJx/nrthDjBvk3cX1mlu5TG5m5SHZMr1qoYggjvRo7+w7mseMJ7l+EiDGW
         v0yA==
X-Forwarded-Encrypted: i=1; AKwUvBzzx6zZgRm4BZNQpz/Th1tB3yNQwRCECnJsHbWSXfKbh4EbevNqViUcEcZQJD7/2Dos0yhLvE5DF06d4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LODVMPxcjCkVyvIf1BcP2At+CaZNPUkbLdU4STcLKaGSeKpc4
	i5w+Xg3HSsog/Ts8otcfbPe5KbDLOMjbZvd7Jaxyo1f9R/wM+71NhOkb
X-Gm-Gg: AYBFou16ndhqwGTrtB0DystZxw1k1cuQGVjTqKO7t37iqr1ML2645q8QfHgj/JCMjUu
	gczIbHisCJkwscKMIaGOEvxfjCXsxNjZ7ft1iRN/BbiJ0KCXnRkKfGLBj7sWKm8wZzFIts25vBd
	cow9ZPnqLU/+SbxDmOO+H8QvcRAJ1cUPdgOr2dGLFM4aSGIOPgjXfr7NObdZlPYugC38DeKvS8A
	+qMLZGtWv/Q/aRDAfbUTCBuUCvk3X9GkYlz+xCKEPVEFxGtAkdjfL76wUtbHWO0qjHmENQJAkWo
	oLfjfRLMnRb1AMeRzmz8+S3WT+Mr5EBle5C6PzZeGv0LAROSvfox+XBXjoOoqxjZumEaFFGoA4R
	ItGQypCysP1V9+NVHAR4UvC5poRhrsskuTWuh57vFsDOQRlY4V9t01PNd9q4exqxbdfZ4rpBhNz
	nn73hngyaDvcjaBypB1iL3ABqgFpsSgk8prYZU3khfS/kdsSmOICjbiBv0Crfu+3cdvTZkooGdw
	HJe2WO6GW0DQma29wXC+/oQPFZojcaoK/BVwgHFCuNRXYLeB6NcFAhcrtA+ctBNFjtZIprp4I1X
	j5glDjWwVaFVog3eObMG9k5O4h5e1V0Cfxt/2wN9Yvv86DJMxGFfnHYir8os2CB+HtrM6js=
X-Received: by 2002:a05:6000:3c7:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-4911906d185mr4750001f8f.6.1793887572221;
        Thu, 05 Nov 2026 06:06:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:10 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Thu,  5 Nov 2026 16:05:09 +0200
Message-ID: <20261105140510.165165-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document 8-bit CPU parallel MIPI DBI Type B interface provided by
Tegra20/30 SoCs display controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
new file mode 100644
index 0000000000000..cd568d19c363a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra Display Controller based MIPI DBI Type B interface
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
+  reg:
+    maximum: 1
+    description: DBI interface used 0 - primary, 1 - secondary.
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
+  - reg
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dc@54200000 {
+        reg = <0x54200000 0x00040000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dbi@0 {
+            reg = <0>;
+
+            panel {
+                compatible = "hit,tx10d07vm0baa";
+
+                reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+                avci-supply = <&vcc_2v8_lcd>;
+                iovcc-supply = <&iovcc_1v8_lcd>;
+
+                backlight = <&backlight>;
+
+                port {
+                    panel_input: endpoint {
+                        remote-endpoint = <&bridge_output>;
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_input: endpoint {
+                        remote-endpoint = <&dpi_output>;
+                        bus-width = <24>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_output: endpoint {
+                        remote-endpoint = <&panel_input>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..ffeb124905dbf 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -79,6 +79,16 @@ properties:
   rgb:
     type: object
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^dbi@[0-1]$":
+    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+
 allOf:
   - if:
       properties:
@@ -155,6 +165,18 @@ allOf:
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
+      patternProperties:
+        "^dbi@[0-1]$": false
+
 additionalProperties: false
 
 required:
-- 
2.53.0


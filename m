Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675425;
	b=yRjVmUvw7iK7Z7SRSnJ8MBGSCzNJ5Uk54DfpRNcwwpah07gWLOP3agol5sfHDLuKnMy4
	 qBXYneD1orFakTJb1JjPl7dSgtYHheLaaKd9Bnyt87/TuxSvC6YWFEKHPvTfG3jKBhdto
	 3jk4fsQgsm/5ylo7QeaDxt+uTaroRueaoIFcIaYz0ZFi5xmW4l2mMoJcz7q4+sB3L3VnI
	 I59/ejmxb2JBBVn+3JQuVMUTEPBQ/FJZ/qIBKWHl5WHN0uHTui3ekFm3vgzgkXjj5QHEI
	 LYdrnmgsIWely0+USv4ncndYXdcu+32lAqBVNvmSFeC1opkLj81tEse6Af9xwKOxlnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6BEc3XMlABHl329Fy0hgFM4B7kKL6YNMCLfGD4LbgGM=;
	b=1XfXPpDLleN7dq3kymv4E8O3HKGBHzWJRTTY/b36rxTmNNv0XoCThe49Wo/3sRFpgCxQ
	 4n+v6OEsLeRA4knDF1zF3ZLBFsu2bUVcX5xMdkjHB4rJVzU+Z1AH4k9vlhxBec3VdP3KP
	 js2gCmGCAV87btfKRrYkETQSILDdnySAde+m8xSeZqmw1xD0m2TnBjY10iK3AVgWN/JUh
	 rUWk9J0gV5N3etf067EVip9clS2K+Bt3CRKXB0Jkbv+67UpDaED9nb+3iHmHPseoDGkoT
	 DTVPqSLVB2HhuBVipo8bVwEPOWKjMiFUEZ/JD22vElRVR/GR7pTtvibmYjsYKQ0klwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UhGW89rS;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6A60A260D
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 13:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F6A60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UhGW89rS
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2871335a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675423; x=1793280223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BEc3XMlABHl329Fy0hgFM4B7kKL6YNMCLfGD4LbgGM=;
        b=UhGW89rSt5wB1qy9LY1qNJaX001O7Flm+dSLt2mRohKtX8C7JjBNbkn9pRkhf+5bNU
         e31de51IONzV/T+WkUU9Rxoys965oazEcqspyNuLxwMXMNEAS64N3GgD6msZYiOEYpKn
         enc58RgyPuoBrDHu/7rREvjiVjmGiLXUI7DOSLMjVr7RUD9Air5l6TNwM4/vkzhh4G2c
         jcaiUkTSuOg3GiaszyXdoyOZX1Lk+gv/vl71IL/rYv1f4e3+sR8185OCwgkD4ftu3dW8
         olhwYsWUL/nHIxTIrAyMKQZZSo9F01igSsM0Wvq4ZbFChErBSvtcaOIl/NW13fTCpG05
         k+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675423; x=1793280223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6BEc3XMlABHl329Fy0hgFM4B7kKL6YNMCLfGD4LbgGM=;
        b=gJEuf+PvsSi2YZgdWLlk5jxq7krn4rzwGHd2aabCrjk1QnySC8j7FihZyYTS8DBKRl
         1xGEDvyai8+H0ajlr2c+AuSMAKEa4uz82i5h/vd7i2EKJAcRUCPb6+r+c+IXXtcZCzst
         lQxgy+DS6bScM+i8WHOplsC8Gm5mqTTZXjCkILNBRZ98fnzGni9uoXOAXCB6IW0BYcPL
         GIJBoUOkyzH4GsbEJ5PraN02YpRgK/H7zJZVTdCOQxTJk/w5fSHY+0KMHJOE9VcFmlC8
         yh5esf6d7WAHiqHGQbOw+OKQJjFSTso+SJEDoy1++n/Vu1CJtPGcwBFAmEDsSoIwOcCj
         XfeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr0dYfWO5MumQd3p7u9FGnBmDaF9VUK51EBznYx1CGZfzbmD/RskF79fD80ipli3wR+tW+jsTcAhdoeg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKW+bZXldJBk2V7UVBBIQ5LkgZPqOI9s6JcqAsulbODlc+b4MBW
	z9u8HknloQvGQlHk4/wxy9EQ2ixuypEB2h4mgeePKRd+AO5dgoYQip8/
X-Gm-Gg: AYBFou0yBm6LjOTB19a8nhpyX6nVPAkKZ7Hc2YAm+zCYiQIazymVil/iLs1cUNjtgZ3
	1gqx2qwqQYNu/D3dkVSq7zT6v4xElhQTs5zbpfU1/9zuF0Pk7cDw0Jak3CLg+8wG6rlcg8xZy84
	rBtCpypxLmOzL+e4imwREf0apjzKXrSpssVlm322NoYAvKgzXjn2VFaEo/aUFm0kIIfHzwJLNp4
	GGESGAOz67DEj8HFIYNqL4Ket//mbJ8pxQRAnU4lR1ye8axj10t4skaEqpYLTjzmtqbSzrp0aow
	mTs327d+vtTrgVJ1nT9sTBxgtf3G+ubxqQ6Vc1mBc4Ly+I71YfWP22t/Eicg3p++f53QC9oP1ak
	gBvmMBIc36XBJCDoAcNGBuFoBHTnlwtbzJD31z2E3o1lQTA8UlE659PUZB4A+vCVLT21Wwn9mut
	+B6wM6d6PLdcF66Ihx9rytXV8K4gs1mRpOLo3YPkgEejJQMS5VXzUBiFT2uw+9ZLg1jNUeOxKim
	opjrFZ/q13lk0pbnMIQq8JOtYIN/NATqcNJgVULfR7TvEOn3oumtlnrn83syCuN1UvLgax+TECt
	c5wl8/E81GxwjG27CZDTOw==
X-Received: by 2002:a05:6402:2b88:b0:6ac:b013:8648 with SMTP id 4fb4d7f45d1cf-6b408ee9375mr5181594a12.35.1792675423238;
        Thu, 22 Oct 2026 06:23:43 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:42 -0700 (PDT)
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
Subject: [PATCH v4 6/7] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Thu, 22 Oct 2026 16:22:58 +0300
Message-ID: <20261022132259.240717-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 108 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +++
 2 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
new file mode 100644
index 0000000000000..6b4fd20c5817c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
@@ -0,0 +1,108 @@
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
+  nvidia,index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of DBI interface used 0 - primary, 1 - secondary. If
+      property is not set, primary will be used.
+    enum: [ 0, 1 ]
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
+        nvidia,index = <0>;
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
index 69be95afd5627..a014bf0dd508d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -76,6 +76,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A list of phandles of outputs that this display controller can drive.
 
+  dbi:
+    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
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


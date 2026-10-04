Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB93B19BA
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131500; cv=none; b=eBDK6Albx5p8N+R49cc+LgsaNaPW1F3jfpQ+0D7qc84OenHvvAY0BJSs3X6iEbNw4d4cZt8EjN6V0NFzm7Abdzqd/HZGxgROXSAzEvwXgpHrqSQVttdX0jHnMHWsxWVobQd5S2dohCOcLPxXvFyOgeyIJlFqEYlTl73tLBMtkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131500; c=relaxed/simple;
	bh=6ZupL0yXoeDOJ3IbAEcyHUmrN0HUODbkzAMB3V5q9AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZ9Dcy7RvU3fYpKY4SMi8sF+RQ2Ev/byqXGWn3os5weq/uk7Vpf+49RkxNXrjAvxn7XmSZtRAnOAOayvbLVH77hrijhRWzklxFUpN//lHuprho6qBlGXRSRihC5ZZsRaQ63fuWIycfdPRhIu6SKomlGFs+U82WCZsqKSMvw5/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1ynIrvn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1ynIrvn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so731575e9.3
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131493; x=1791736293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rEldcoYDtpK/NBb1peZdgxu6IPeXXpzbTPYe4T4o64=;
        b=Z1ynIrvnO1dfkwSc0wOhUenGwdxx2thWNyvIyC2jW/0oxPWWTAERXcCXXVN4TpLwF6
         hrMKSOOvri0zn+xduwr5RfBvWauaAbiht2nzchbu/5r698IZTLjl9mALyxg94xbwJ6pV
         rZ3KN7InIJQo1kIqQmG0HcjGrdaX+lWVd4v3ABrJ+XCY5+CyCeqrIxNb4R3kCKGoWvwp
         gC5yhB4KHOPhtSPiEsX9fxdcb+Vq2tTRDonVc89pdGReoIXlO3y9RgPPBuKvxui4lDXm
         fjBH8JiY8DBxw64MC0bnyPTI8Cmzaecvlr2XluZYsk5JIA4uLTq4FzcvzumA388kS6jb
         RZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131493; x=1791736293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rEldcoYDtpK/NBb1peZdgxu6IPeXXpzbTPYe4T4o64=;
        b=ASlL8K45XVxmm5AXPEp3jX+a9FQ4p5QwwqPYtiRyXu0JRj1G3EBQCALACsqQeG6Xbv
         C3Xs1LoS3zubMs0tTtXoMEL0J70/h9D2aolFtsWuvBHsegaNXjsqsBGD72bid2nfylYI
         UjBFhmY4eTqCV9J4Vr2X+2rgMPhyQ/jwpbD/gD+NosxAFvu32Gy5SPw+VcqIPYCSpoTe
         rmoZkad3yHlDC9tvAAoJ6ko3QYmHrBB6zCQNahLGFkjqrwHCPtvdGINR6aPtXhgkeHKO
         jsZowmhzDFpI2r9hi49QyzO2LvUlYN1c2OD3DrZhdwG+Iw2Ouk8/tWuyKtBTzgwSy3YS
         uRMw==
X-Forwarded-Encrypted: i=1; AKwUvBxrBF6d0nXbOXLnSl81R6hc5zsQfoA3a6FQNPgjm3M2nkQFUQM0kAU5Kn0Mgg0Kk8qc8vLitwG8ooe7iQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lbeWBYU8sFEQtpttejFnnL1jgRTfBCNMbLw6mMGLJ556Ap/QKK
	7a8Yuky2qP7Gf+uaC8p98nOq5zyIYuwg1IWDfPK85Xp1c/yt0FUB1D79
X-Gm-Gg: AYBFou0/2uH/lOLKHi8CgnHZa/ro87IkvCBgvpMqQSn30X5g4pER0M87NjRM+tSqnig
	uRzfwyNst/pvbTs0mHUXkTvqWxZ3J+4udy+BxKeRhIx6wC4VUmAWgVcEovyvF8eMQzHzK5Pd3Dl
	un3cDkpW8PT55O3Hr1ZgOrzUxkanmkNOHC1r7NwCjbW7I/wkO0LIF9iBdv/zKJtIfkg2R49mBU9
	b2ppea/MLQ7VPCtk07OBXuG81K6fbBtWSgE/Ki/PB3uWJodyYWceu0WihwJietBtGkhSCb1G4To
	8eZSkcui18/05OB2VR+rtkJW8eeDG+tbItFfjHvok2ihvJaVBlwNibStbRnrB1x/TI2NxQ0rEqu
	9LnXqZWBDZMkCU2ieRG4s/zKvgDwLg9NV0DHf6+VQuSWnXokZh/oNXkebEsAqmiNBdQnCjQf+6q
	aulDIFGOW1sBxDcN0/9B5cEQBfaqv3yIdP7aUgg5oVpN198wOxjTHIWbHBgInf/tJnzThmdpKlI
	nkKUSb3FAoWY5rXQC0=
X-Received: by 2002:a05:600c:3490:b0:4a0:1723:2d90 with SMTP id 5b1f17b1804b1-4a02751934dmr142272115e9.4.1791131492912;
        Sun, 04 Oct 2026 09:31:32 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:32 -0700 (PDT)
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
Subject: [PATCH v2 3/7] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Sun,  4 Oct 2026 19:31:10 +0300
Message-ID: <20261004163114.181800-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004163114.181800-1-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
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
 .../display/tegra/nvidia,tegra-dbi.yaml       | 143 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |   3 +
 2 files changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
new file mode 100644
index 0000000000000..184c33d436308
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
@@ -0,0 +1,143 @@
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
+  - compatible
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
+    dc@54200000 {
+        reg = <0x54200000 0x00040000>;
+
+        dbi {
+            dc-gpios = <&gpio 110 GPIO_ACTIVE_HIGH>;
+            rw-gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
+            cs-gpios = <&gpio 108 GPIO_ACTIVE_HIGH>;
+
+            data-gpios = <&gpio 32 GPIO_ACTIVE_HIGH>, <&gpio 33 GPIO_ACTIVE_HIGH>,
+                         <&gpio 34 GPIO_ACTIVE_HIGH>, <&gpio 35 GPIO_ACTIVE_HIGH>,
+                         <&gpio 36 GPIO_ACTIVE_HIGH>, <&gpio 37 GPIO_ACTIVE_HIGH>,
+                         <&gpio 38 GPIO_ACTIVE_HIGH>, <&gpio 39 GPIO_ACTIVE_HIGH>;
+
+            nvidia,init-sequence = <0x0000002c 0x0 0x0 0x00005000>;
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
index 69be95afd5627..bb280f8dbfc7c 100644
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
 
-- 
2.53.0


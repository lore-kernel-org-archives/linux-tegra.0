Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601DE35BDD5
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144583; cv=none; b=IK2Mi+X6DRk4j+GaI9E6RTKv4wCpOTiCpsajRRuLyuDkgU4RoiMYBWHHgl6uolCtAWW7eK6UkMoNAVt0tORtI5bTcPelwmal0S5TQnofAzXwKlhdjgEeh+q3j0LoH5lFfYP7iH6L9vp5bk52BgnDSwN1D4CPz/CVbsu/jFQL8H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144583; c=relaxed/simple;
	bh=UxRv2Dj1eWAwuBaqoEAma5UyiLaBLfeYj5gZy8jzJSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQi1qnMa2j+HrH3lAkzOOHbKNQYoB9rJs1/Rl+R9lM4T+dwd5bgbGsC1kATHAuWbwdNjSlr1F6R9vvB+O//F38z3VmJX2TMNvXRSwh/0FGJi25M24CrjLr00anJSflflN48n707Gpk4pQ9vS+b5KA0PcWcZM+LfvEKafz4YM0xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mD0VQm4X; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mD0VQm4X"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4711f156326so55202515e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761144579; x=1761749379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeVW7KIs34xjHHALn+sD+JnpOfHDngShiO+k3xh4Ufc=;
        b=mD0VQm4XuASkoXtSYmRwMPsBeeCi23yjyFL3lfzV5nhh0p1pXZIvUnT82oz0GBeg6F
         kFxebY0r2xzPOT9vPQkwEm0pM6prkKehs4fTuh6acGL59xvI5PAZqsVgEQUA9CmNrXGI
         cQp/AvRvwbZQNKOfGV7UQLZCRlhXgs+pqGbuEJ8CnGSfX8aXywuD0Grl6O6RqA5XLrL4
         KfO+20oVqVgJf//k1DTgJltRhznPfqxHfdTkbo28DICeCN64kjbJSqK6Yp516FIPsdi4
         nehFIdRbUDDyaWYkZVH22OS0XWFQmK7z0qqETO4Sedbf9X24IZ3+ldASTH7meqGJ2NLt
         zpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144579; x=1761749379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeVW7KIs34xjHHALn+sD+JnpOfHDngShiO+k3xh4Ufc=;
        b=ucqcWwF9noazUXmio70f3xw5Y8SLDnk+y3HCFXKoNt2UDiPzlR2kMEPZe+vFzn04wd
         c8plaBLxu8Z2AsZKfkniunXPkDOg/rP/mRx6QbighSvELlhBltJKXDNtXt92iObG9lf3
         GkMDPGoPVMahs39yAOjuYSiblRtNDmC+WMn1eqHtsV46MUIWnOvBaAwWiOOG3Cin2fUE
         dEsJNUZ12xnH9qQAmpABHp0y5BwffelELQCZadrf+DHDBID4eL9kxSPEiuGen8Ir/xDv
         9yMNf/FvsEpaAnGbTbpWZTOngq5+TyjeeURz3AB0sZRkxVWmtRSD+0oYtrL/uBALq2LO
         1lTA==
X-Forwarded-Encrypted: i=1; AJvYcCWjWaAgYu0jAwDjk/VeEccV0zZljayVIUtIC6EHqpHm+Dh1T/kvfvJHz+rND+T0t8eMtbOtUyiVvfqovg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAWNqULgk9xb4BAWkdIjGJLQaPJB9qk6mes0bMSp7jW7VdfdSv
	GhGJegfx5p9OxGEMiOA1U2oIOckoSYXWWKUO/ElQXdO+DJgojhWkgK5h
X-Gm-Gg: ASbGncs8hx0WPkFrxFFHNqDwxZ9CPcSrC1Dyt2cBD1XWbn/Cyo1zYAQguXbFLgsQ1NJ
	AbBF9GW+VVQLi9dwpZbXgsuzwIXgWrn1iTnxVdTlXMe7GOwwMfsy/T2b0pb0cSRQ9wOzApBcO4U
	77CTPpWMNL2SWXeheXEQZYzBd6uxMTJVb5NXHNN+aV0QRNpBBDbWJl1xYD+KpCfRtFL6YXLlzEk
	EttHKLI+Q2CUvKvAUs0enwDQZTpd2nFAtvUHgIaZKQUIQAF+gdKdWdBuC0sV8H6yIR/+psj8XH2
	Pt4cQX88YoKigMcC8BzlGcIHO0llFjXwZYmAT/BgBaisG8ShXbKXZWPqjo6SSWcoMGppHVLNY2h
	H95dLDr5YAD2xMhseGvmII253likCsI+yqxcTt3skDt3rj7XnDJVUmqqXS8ddVrtxcqjzUaQmvV
	gOYQ==
X-Google-Smtp-Source: AGHT+IHr6Ob93t9v00uJwuP7yAAMfu4kGsf18j4jl3QNK0VUxssU6icvlb5KeKOe4fTOZz3h10i/+g==
X-Received: by 2002:a05:600c:3e0b:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-471178a3faamr101708965e9.13.1761144578447;
        Wed, 22 Oct 2025 07:49:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm49956525e9.3.2025.10.22.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:49:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Wed, 22 Oct 2025 17:49:28 +0300
Message-ID: <20251022144930.73272-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI HW block found in Tegra20 and Tegra30 SoC.

The #nvidia,mipi-calibrate-cells is not an introduction of property, such
property already exists in nvidia,tegra114-mipi.yaml and is used in
multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
mipi calibration function and CSI function, in Tegra114+ mipi calibration
got a dedicated hardware block which is already supported. This property
here is used to align with mipi-calibration logic used by Tegra114+.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..a1aea9590769
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-csi
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: module clock
+      - description: PAD A clock
+      - description: PAD B clock
+
+  clock-names:
+    items:
+      - const: csi
+      - const: csia-pad
+      - const: csib-pad
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description:
+      The number of cells in a MIPI calibration specifier. Should be 1.
+      The single cell specifies an id of the pad that need to be
+      calibrated for a given device. Valid pad ids for receiver would be
+      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: channel 0 represents CSI-A and 1 represents CSI-B
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pad is used by this CSI channel and needs to be calibrated.
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: port receiving the video stream from the sensor
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: port sending the video stream to the VI
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+        clock-names:
+          minItems: 3
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
-- 
2.48.1


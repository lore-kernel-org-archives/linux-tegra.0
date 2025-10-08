Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3B82FBDFF
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908716; cv=none; b=nYpTbzOnn6USfTXRUGZ2kDhEvOyAQ3DFDM8A3TW1IYHYYjvCHCoFF28bx1JfwdOeLRR3PEuK8k51Htc5wXfdfPPXESwstcTqeRAFqKlCtOJ+Qr9i216JNc6neO1pq1swbg5eAabHVxPsBUft+IrqL4VWJ6XonY/zJYl8TcNqi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908716; c=relaxed/simple;
	bh=c2pf6RUA6JS/iU2qUlSvT28AQiDs7K4PthlzccZwX40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYK7wv475MohBMhrXWqewPexQdD3docJQz0WfVjxUMQ7FEQJ5jBK0mNsvQwHkP1EQIYRPmgmKOaqgPzKr9KNAu+mZOalvN8UaCI94ycgtAEgbUk6lK2CpFqa+O8GrbAcNyWnpNEg8aWi1I2PKG1yl8HATmse3sb3V388XgK9MuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lz5ji5s+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lz5ji5s+"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5797c8612b4so9431359e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908711; x=1760513511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4Sd98a7JjnJau3gJskbN1AlGmAjhGwkl8sNjJesON0=;
        b=lz5ji5s+16C1x0LUOCyBrXXOcjxWbymnh8kSnSKaZk6tufTLNHTAL685jyCrdWyi5t
         GmDld4D9/NDixRSYDjRyj0Q0XwLi3wRzqi1537pZomhywmBApPy/FnejIKO0HcUZyq28
         rZQHzhw30PD0brmpPkQR+MAkP4VOe9O9Z7vL/rvKoHRkpbz2BDQZHDuV7st7XmlRTNpa
         CQBonfxVW4EJdVGU/Q6sR4x9BeJFmwnQX4O3Ge/eRKytR3OXu9DfmIWRH8Bho+FcS3wj
         QKNKSKfMv+Fb+W5pKeJdqiUQ8sWUrkRcvz2ioS0NVVuRchkK2unEkKbA+Hb+/p0pVLO1
         f78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908711; x=1760513511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4Sd98a7JjnJau3gJskbN1AlGmAjhGwkl8sNjJesON0=;
        b=PEAqAzlB0KyFxy82r58sQCNMvAL3dDWLYJnoV3uoslz+xMypR6udnef5y5svwHKP+l
         ob6GGSWnBkQ+RyGfn76THA1mp1Xfi2/kRtu5amrHUsADaXyQbvjuJkoFw9b6LcqS/22M
         /h51mLgS1T3zKJWZLlnlN+IOH/dUqcJtSjQSJ3hG5DTIMZn159i6TDAx6UPySfak1zDl
         dkWPKStuQQ+aYmILIjGdMk1N/BV8n7DHjhvBbcYo5JBeGth4doqWqpvIm2yd+l7Yh8ab
         9HufqpXLmEECY3++19SujGEN2f2sp3h93wCNEEXlWFwEq4IlhXQjfaatfeholYAp/mCw
         TZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVZOFqVPpLR6f3c0i+liibfAE1wjNTVmrR5RF8FD0MxH7Urf/+dURi1KETZly8QAkZA52bhZ86MJlLS7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8SuclNTGkLNYfKm+vvzx4PpkRvj4FZe8TQDVJy1lptEKnYW/
	cn3HCtLOVFTwJNrrlBah638+/A/wn/bJrA+HZgz2tmiROVHkgfCO1zhZ
X-Gm-Gg: ASbGnctrI0U8alMilO/zUcT8sDaX9wcMrGeCSIWvpRVOhfnV+/G2mMkmsB3l4X4v8YW
	E/eyJ1mlc+WtOE64KfCPMq4InY4pBlfsAvIcO9nHxW8P8ZwaGN6cs23dpugwgn1jpZwt73AwbyX
	8qpLb4BSN3PVEysN2VEcla6TKbxsu2y78fqD/Cn5Jxo5TOMrUTFf17CV96D2vEI+ny7+XT7jTeo
	B5vmrwBHlzPnB/rPAf4PNrsTHbEJS/eZa6rbI9aUhaSDOcGKphZw0vYn9W0n45NGDAODbxIZcCg
	SipG5J5NoS5S9WnSwJuBpmFGmh64fOp6Fvthx2B7AaNamzEyQWPSij2IP5fREJvrq7NsIxIWCbp
	gCRe7SIeatfmUoomNFeuc4pX/uFvLV5IDyewCzQ==
X-Google-Smtp-Source: AGHT+IG6FlNISKtPx2gRqF9MdRRkmvlkKIifRDzcNapSupdgygQ65tibf3VBpyfWyT/MoNFC/LyfEg==
X-Received: by 2002:a05:6512:1055:b0:590:5995:6dda with SMTP id 2adb3069b0e04-5906d896c12mr674942e87.7.1759908710509;
        Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Wed,  8 Oct 2025 10:30:44 +0300
Message-ID: <20251008073046.23231-23-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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
 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..817b3097846b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,135 @@
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
+  clocks: true
+  clock-names: true
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
+          items:
+            - description: module clock
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
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
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


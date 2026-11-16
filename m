Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841857;
	b=aDs4M2bkDTnVj6X+418oy/ZE3H4SCy6EyTT6ODCLdQqOusOL/Txvk4BlvY7SzluxlOrZ
	 7D4insmR5KLTMJEcF+F3MOfCOtAJs9tm78Wm03X0Kkd3nKNYAZmCrZtOZxsYh9AGSUJ56
	 9BzM3AVWdWcfEwViCyEWvuaIleBHfEzxiJm4kF6yLK++T2BnY0xwU0FWv8VvmXtvxKJtN
	 AsGdpWkj3X2f8jcClmhRMAKAJhPjw12Q4xurU8NTxZfFyImY+6UYolJExrSgyqMj4G2Ls
	 bjrmV4Q2D7ItDaUPbZueb6QP23+cDgaW1BzpnJY+49aTdnNWjPN+JdOSACZRID7yp8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
	b=5Ou9SczGQbk1/0/Px8+xHsiA6brpYatQWLzMqnBZjsBxiEPNH1TxfCmz5YAtZO5a9Pwj
	 soiciU982B8AluZMhaODGp7xYWC4/ikTIZx8QAonq/hd3UhfzdQ2uzGbk357M5/37SpAJ
	 HTyLRcBUnaipy5NrAL9gvtOGBGXE6P/+av7Bg8u0xLADZ/9uQV24L+ZlzsiZBFOgj96V+
	 EPGX++cknk5NiNZuP7xCf5ujp9u7swH6w20T4nAa2XySAamvLThPhidfMQ5I4wbIE4hG6
	 acbivVJEYYyJxoprITcuXL6pKsOyI8yo9lWWyVl7nE7Fi0RuhvGZiXmXt2Dz0X1kMgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwkv+RtD;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE922606A880
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE922606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwkv+RtD
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cdc606b47so620214966b.0
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841855; x=1795446655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=mwkv+RtDSuotE+NF47KVp3efHuF3DBRZQPS6kPQjSTVJbutdaYNFOo8NgD5HzA4hiy
         5+AFm3LX0856KhyzdO45jVxPhwN7dbxMkQh3QyH6+8QYRC+FWIW3Y3g1yLJ5kkEy14sP
         eN+a2v5E/SRrYIHrRZbkRSGf0TRiqnjm+KkJPheXy6czfoBoXlLtFnzxae+OmgprZ6ZA
         7xRoQiQIUIPCPmiOUv5jmDJcKgGezKiFZWVoJfbmLhUCjGuhRoCDfnnaRIcAvwAbHDOu
         Hgk9oXEPT0WJPE2VusOJr9b0ElrpcPAeUSBB1/46HOyKL59oGtuoo9tRg3azXvbj2Cju
         LUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841855; x=1795446655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=mrO46KKnc6IiYEWpdK7DTFZ70NC8Z6vnTJm9+pRcVBw8Uo+0tpfl5UH5AaN7PCYZVc
         RpoKrk48luqRpNfqKJJmlj7y7ijMopbmfL4knkcrUf49bNSgtPCLLP4jL2MBDLPrjym+
         /aIL3FsUw+maptp/yQr09f/QZztnLT7/wvGyYVU/pU3K9UgQ2ggZokXz7hYhH44KD7q1
         wxR+klzV7CUucFeMyZ3+XW8waIFLAQtcqHpTktEiYsUnkBz8XNBQSfpjTJH0QPpcI3ug
         MzI5CLdYR8eMzvIfaMjnJchopKEo8cjtQPiDYifIKcMtpvtK43gVQHlb2lmt9Ky74bzC
         WkCA==
X-Forwarded-Encrypted: i=1; AL+hErFo5eEgVfLHHg4aYGXPwFUqmLS+QOmSyENAz6gRqKyx6N2JTSkRV4gmgKZ2NSSe114RBjtOWFbnz1Jv4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2LlqzVig+bZuw7Kv+sjNActN99i0K5R9NWFJUT+XSKxN3y38G
	PtX1ys2mvGMu/+9fTfUtungRiR37/eemrT+mmmylvTFAZIQF8WIH4Ehz
X-Gm-Gg: AYBFou0va2pn1SR59Pf+eS3dZZSZBe633WPJO2h/boXfIn7YgPPl3mjWNgOSZSCWWEi
	hxAwYQpKzlHEiRQYRpAqW473sMGfMWUUXkEilQOBmbqQcAdYNhVrNnEj46Y8pxiW5pnX+G1/5gE
	YpX5ngbOCmU0tbPBTdP1Le3xkxqAZIpOHtGsDyfdykGPIx1yllT4zEdEHUAnkj3r3SSyFq7+AvU
	ZHTwjmvvoQ+oFAWrNknWTIGeUJaS17HGkB2hZwFmKMZbFe1buHB9PPi/JCXPe/vHM+KJMmS6R+P
	nDO19UALnHsd7HoO1OzV2bazTU9FFVSpA5I1PXF6oueS+0kLmrZ6FweUfTxSeGLaYzpE/K16s7v
	zX+2OfONge7dKqr1LwwE7rlHkEK0NcpjIhfkdqZVficw8a6uRkBpqnVEvewSvv+t9mt1kNR37sd
	pDGd45vq/817uCMZ1aE43hPZW1bRM03lmevIWhzRisEYISKnI19BEkA0OPiHZefx07sAWkZEK6o
	d8eXYojP4NI7mTnIfcyh+fCyocF6SNNNZ/jLQrvjjITjD1KlBN6yO9qIEEFb2WSz1w6/mgPiGgw
	m0eyMQkFBw/A6d8edj6GfeLJfi9JLwmYtEzbGmtoJ+xYUyYbR+hzCHz6GbkL+vBAhCPnbFoqq2A
	UH+FLNe8i2g==
X-Received: by 2002:a17:907:9612:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c50963fe3dcmr895394166b.36.1794841855283;
        Mon, 16 Nov 2026 07:10:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:53 -0800 (PST)
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
Subject: [PATCH v7 11/12] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Mon, 16 Nov 2026 17:10:16 +0200
Message-ID: <20261116151017.274764-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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
index 0000000000000..6a34202f80765
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
+  nvidia,interface:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of DBI interface used, 0 - primary, 1 - secondary. If
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
+        nvidia,interface = <0>;
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


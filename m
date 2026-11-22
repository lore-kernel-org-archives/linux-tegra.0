Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335555;
	b=Ul5uyTQHuZCFPp5L+69k7ECrUEQZvEVCRQ69x74DmSPSMSeWH0OoByRu6Nth/a4qTPye
	 EaZzSVXN7lPQ03RcDOkGJdvMNihlxwlTVHs0MTQdKmrCVwCO25BCsZIXH+caaecebmYTt
	 /24xIyT4Kd5/TOz9hwh4R6GgpsfdlbmYvR4zc8n78fGei2b9m+yj9hZBTkklw7jXa2plj
	 yox/m9CbC7Wzn5i8WIcJjjHs4m0VaQOIaix6mUUoSTQohPhPNCSn3WmsFXOACQRYH5qjG
	 u5DRsbCnAoU55o5qK9Kgy3P1jUNSPbZgd4OXSOAVAqiwu9oCyAHPuii6mEZLQ9DeKkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
	b=HRve/22Z0eLN5XeNGRwsbZpqU7dh8B0V47hRH0edfd7bgxRfIHszWHzQskgyLGmbwm3F
	 7hxJHzrRKXh862vIUJ+3ygo4JDPNO/GoQGeFXNsCrUQJgWiteNinBsI4FYQoGf8oGVAmK
	 IXB5jU3ZrT2sPZPCzE2dw/3riTX8dHDwJs/284plOmr0t/+cQqmmBVWFuCeekDwNj7QvN
	 dvJwQHxKQUcvcWScgpMBbNwjNc2ZAxpPD+mPtdEYtG3gVoojGK0PwpbxzEPUrUDT+qIrv
	 0PjTHlMhbKo0veARlUkMPe8bhxlhq0TXQxF96Ckjy0R9T/ibaroXfDiqJp29fJJHE+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6I0jWd4;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F2606A32C
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 08:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703F2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6I0jWd4
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso2461653a12.2
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 00:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335554; x=1795940354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=S6I0jWd46JjblZGAlLs4RFsDKuFGeS94c9BZRRtzar8dwKM+p//r8lstUq4/YNmlwr
         9lPnMQcLJO0UKcvMGbq8uv2TtdnPjflX2QXaq5BgdORQTlv0qzyY0T9l3ND/nIcMJKZy
         qGYQ1m/qdGRKlMrAgCIm/zPTzsW2wxUwWJIDjnY/M6TOtpwgeiwoDoxx7NU8CfEvYKT0
         WU9KY7Qd9u7Sb4q66kCmmkIAPXtjdKBGl0MObZYSTMZZeCBKHhXL5lQMq2wivfdYkvKZ
         7Woaev+4t5Zo2IMK4uf4/dUonjt5ZdB9S77OY1/XEau2iuABQVddDxCTqxDAKG5zz609
         63nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335554; x=1795940354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=ytOcn1RxYwsBUPD61a5JiDAoLqwc1p3iWbKrs6GKEnHLcc2eGvBrBFI/Gwu59MCj1U
         giEeWktdXgiFbF+BUPcQ2iR8ZlsEkVjcqdh9r2RT0p4ji96CxWtr72UvN7BVpujzcrU0
         /qdm8ha/7/kRpSv9csBd5gsqlg6Sd0DmB+VwVBn9wGfRxfA/sa2cXwvCuectqTWfMv36
         d61s0fMWoeMJ5FOPb/jZyVrvDgOSC4fwxLEkftN/lJnVw+BRH8xYXcQgikl+zmclx+bO
         Kxtczh7iqGT/lWkPIwH/jAXpGCAUpOmqqdEyXwZr+uB+7SHlNyZCxxuzsRSGnJAeE00e
         sgwg==
X-Forwarded-Encrypted: i=1; AL+hErGqZz5XeD5/pXBGZpIC/5I9bmLWZKLZALJVnaRn8H0q8m45dwpA2MLy60OTgbpCubIBPSSFiC3h+pOIMQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2V/76kpusiwhiN7Xs8lt9cI6s2Axl5WRFLl06P66SBYRZe9PL
	BKu82fR0/SFYxJJIIy0XGsMPSrXPhdwLmO37wqBR+iq0WZMb1QZBTQBJ
X-Gm-Gg: AZFdTZc4Zqf+qX2WyQMusOL4ixVU6Rl6D9Vwwk/Rk23B4IUjRAtbdUF0M7Rvdk+ARi9
	owKaq6eE/1pZ/0ut7IZW1C7G6diZPgK7dOIhd/DEixEeNUaN6WXHi4X1vSTiQ6C5OI56XhaGG0i
	iICm74J2g2URi7jAr3uh9p+FJ817nmcGxuAf2u70zeZHqHqvIK3SzzBWDl+P5kN6eRzbx9ibOTh
	y0+wjLXliJgr8jOsCP/cUyjKLsoqG2Z98E45JWPDJV9K4bxTJL2RpSuIGVwsluEmmsYsWzbGVaZ
	Q+Ia5VSLt8OXx9OMVH9KOFeU2YyHGEahzWqhnS8wkEv4Bowt5ICiQGIvcOAm7YHw+wX2ipRz707
	LKNWpegiak/7WFwb9PBygXUz8VV5A8VxBS0FjVAGOLMRP0MuilFYuRq1GT0amOSqGPIaMNSCtG5
	6GNyjaIX4H4sF1gW2g33Tm7ylnva+Fq+B0qtR1qBiIaHLBKUUS3wRsAXZem6obEIEwZRZRYxRUt
	GeXShY+hEfjK56Z0+prrdCAGHfWbkDLvzDxQgI/e8XIgDAdVUv+8IG0+dRdWkyUHIAcv9pfDkP1
	TgMjnpVAxGW7W8QRu9DCQX4ImBxskCZEyaqgFkbmVDrC3zUiBaS17+c4f/xrdLhzyQZeYrlQVG7
	eoaP47BUZk3M=
X-Received: by 2002:a05:6402:13cb:b0:6ba:4bf3:4a2 with SMTP id 4fb4d7f45d1cf-6ba4bf305c0mr4401281a12.17.1795335553806;
        Sun, 22 Nov 2026 00:19:13 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:19:12 -0800 (PST)
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
Subject: [PATCH v8 11/12] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Sun, 22 Nov 2026 10:18:19 +0200
Message-ID: <20261122081820.53199-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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


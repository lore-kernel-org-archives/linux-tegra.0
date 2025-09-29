Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0291307AD2
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155923; cv=none; b=FvCLe5g8D1Eo5oURw1Ab+YrujeJHhiJH3GOHsSAY+DBPDDAdTknwnP9dTasFjhJYP17pklFNFWDGBc6bp/sK29Q/ArH66LiWCzEBjISw0cacn3CnhuvrGx5VCDClFNcthJmdaZd4fQ4FxgrWcjzFDhtmnLbjBKuhSe6kSiJhm28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155923; c=relaxed/simple;
	bh=DvadToblCQTcVIF5apzEvP8l/eXojW3y4KnHvhcpa58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gqBjwMiqedhSxOYG0EGSanVdRTDgrRJPXkGnVhhBDwAYC8b2hN3T3xOp7+zdp7AWxTZm11s03fvX0hJTy4aYVVNbhDtMyYu2zaWhqNUg1q8Enos4rqrYj7q9y+hBt75VGSEX937AeRyrvj10Dn6ukG12bjdBaTPgbamuWQw3lhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJnclQXG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJnclQXG"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-367444a3e2aso53776781fa.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759155920; x=1759760720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSQFvg/0Op4ijZhmcHNRkV3VuLRSkHnJiSZzYGsOKnU=;
        b=OJnclQXGYJKJOy4CUU1BZfCMIDJavOaNWwqUn3zRvvGWqpm5VNwuWfvn6z6RMi8cVQ
         RDt6DM7rOloEXH1RkteIqinwWHlIYw44yWm/TJ79tr5CNd5bnUtU2VCR5We7s73QrkCK
         3GaCoUqKG4Thw0M951QeAs+kY9HMphisyjeG3b0oZHl1d/ALqy6O8AUPOKYQfnQqj6/D
         FR804bdUwYCpifu59PjEkv+ke9e6bU2hhT915A9ofPM/XPJolAFJ0UEdCedjHx3tgflZ
         DIDHqP4c7CDL4gC9AixLXl8Ze58fvgZkkDFtVtjsm5mkBefwx+G1sFUgrWcJKzRE2HE7
         s7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155920; x=1759760720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSQFvg/0Op4ijZhmcHNRkV3VuLRSkHnJiSZzYGsOKnU=;
        b=XLhyJ6vSe/y2VaaXf6MWCulxrebGRCbvqBu7xbT1YiCIs2BpxH9ZDDGH0u9D3drGDs
         5FqdmbJs/vPSvS1hxlbsLkp4UwadXBZ74WcVolLR33o4oeB6Rd4DXAVKdFpb47HBRKA4
         IqOtd+ngG7LLYLGyUzS5AypdI7fCicVBHcNmH0jal6mxViHdTXl8mQJ8TlzhCyo2hLwB
         Cent3qdZy2godK413GOrRmaI5d7UuF2k+VdxKdfxnq/4osBEMqa7HWFpZyNTw2I24Mgs
         8I1opARd606vX0eqgVSdKcwdRLBTmitVq3z0w7ZjUInzBsk1IzC6DL7RxCI9tw8aFBw4
         XATw==
X-Forwarded-Encrypted: i=1; AJvYcCUDJcAiVvTGm9cJIZPYMs86YPkrJMk6NWUgtAhr5/8v6L22tfiVghBATxcVKyVPcHYm6r6B81hFlpL1Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBntf5ORwIvinWoCTBJCtcbiDpQxFXBJjeDALdS5kxSiTn0Ma
	+M1Qe4CoxCkqrM/i9tqK3HuDRyuButiLTg+TPkQDdAPeghSerIbqKmq5
X-Gm-Gg: ASbGnctcqDCmHACmK6kLT9gE1VXAFPeW3S8qX0QmBrt5YBjGPI0fMr+oWrEEOg+IJFs
	6ODPpFelJO/vJ94OhhmjG9aMRZQ/Kt8DqVPa7opxKVBx5TF4YLNL76mqyMAUgm8HBHY0d+pzAyC
	pEKdVa+q2jx9AbnCLaWnJnStA6dnfEmOdx/j/p3si/z/8JHpIYN727XVlX9qr/12S8MO7piXtc/
	RKeNA8bwvIt2VT3z26ElFt/9/HNvyukbSfBFbPyLXOR41t5xdJCuOnpwCNbuwWjDenCf2N/09tD
	lt4EcVH1tcd/qUxyYRoIfIF/+e2XPUUXWUdqngOMr5ftGLDy0bZlo/p/gK9DfvO1Vc9YPHJR5in
	UONCq67Ntdck8Bw==
X-Google-Smtp-Source: AGHT+IEibrCwJezr+A8wOo2gVwCb6lK72bDzFcB4eV9MZWICPRGwz5lX+FlGpBMGd5346Nlox3jBSw==
X-Received: by 2002:a2e:a10b:0:b0:372:8ca0:15af with SMTP id 38308e7fff4ca-3728ca01b01mr21960021fa.35.1759155919667;
        Mon, 29 Sep 2025 07:25:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:25:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG LD070WX3 panel
Date: Mon, 29 Sep 2025 17:24:47 +0300
Message-ID: <20250929142455.24883-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which it
clearly is not. Address this by adding the proper schema for this panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
 .../display/panel/panel-simple-dsi.yaml       |  2 -
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
new file mode 100644
index 000000000000..0a82cf311452
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG Corporation 7" WXGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,ld070wx3-sl01
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vcc-supply: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - vdd-supply
+  - vcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,ld070wx3-sl01";
+            reg = <0>;
+
+            vdd-supply = <&vdd_3v3_lcd>;
+            vcc-supply = <&vcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 9b92a05791cc..f9f1e76a810c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -42,8 +42,6 @@ properties:
       - kingdisplay,kd097d04
         # LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
       - lg,acx467akm-7
-        # LG Corporation 7" WXGA TFT LCD panel
-      - lg,ld070wx3-sl01
         # LG Corporation 5" HD TFT LCD panel
       - lg,lh500wx1-sd03
         # Lincoln LCD197 5" 1080x1920 LCD panel
-- 
2.48.1


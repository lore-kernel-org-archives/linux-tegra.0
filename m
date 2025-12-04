Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD84275111
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828416; cv=none; b=IJymnOu3/RNJtsGE20n3EJiT7xieQ3fKo4jSMy/Y3ZgxvMARIASxICY59zc5KmtEccwoPQw5vFQElD2ZLYDOEh3b8hLh3NIpSagd3AiE7HRwWUduHFo17M/nnvUT1QxXaapEtBsqB/mJw9CCPJOBBxHqgMOV/WgZRnh8tR41Ksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828416; c=relaxed/simple;
	bh=M+TtnNRlKxmwNkWjOrflCvsVUhdbfnUnfwwEyraGfY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJo+VNrHLLimoJx4o/TnDdAEXVBfyORrxGZyeFkX/YYQ1E4dhbAwyYnHqrCEPcRUXbbit790mTS7eInS7TtaDTfVHn+uYPe2IOIDDwajXsSui073NPTDnnJJIWP3V3xKi6uZL/Ak7gWWMuF5tplkPVypqdKE759wRkaazZuRyx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/8rS38p; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/8rS38p"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so893345a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828413; x=1765433213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
        b=T/8rS38py4v6xYKP2WywA3gjEUgFbXTJAg/IgcXQ/+dUQ2DCGDA+EYa4DJ8jZuic5u
         8lGHHOPfBVIAO4oMzM9tYdzS1spZ1/RCx82r87V9evwhcIbeW4WrsF+1BBwGP12V0YQW
         vwsQYFBl1j+tI/07IC/kK6fzqHS5aPloT0c5AOAveHHckpWRCFGsVYr5ZZO80xGD5f3s
         gvpzsNRC3BsmF15KM2JmbXbyUtIG1QE5NDFlZ2HsiFmcHMzbtiWo+eUKxK6wxqr+NYuK
         YXShKMTSiJeL9+c0xLhwRu7uEiZp2V7pl0Id4LxDO/VaV8hPgMDnCWTMBmnDk1syKfvw
         KOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828413; x=1765433213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
        b=WdlCHyK2CQG8+Hd3n72gy1zMg2EfFXQcmRGYsjUJD7zT8oP1ZhYyQPNRVt50zwVxvV
         Iu1z2a98eNy5Oz2C1WTQIvjhD6iwHo/8Iv2B+I7vbLGFDpjWt7b7tELLPNLgGtbVgy/0
         7LYvVQ84Ypv0f5x15apfWaG2H1aI4G8gbSbmQ3TBf+MmCU+F12XtaNhG+LkWXls8T3Kc
         rHOZJLAWK3TSr7iazLQmHUTpwGXLMarK966bGs5Pqy5zdV+RZp2QF3j6Cv/Qk4dtUju2
         6dIuguosso56TKAS0Uy/+EgVnxzDlZeXmZfpEi3fe9a3rJdBWj/culp5R5bvS5Tdq214
         ahIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYJB0A8YYamYYYUEF22Y3UHu4esBrvphhLUfDGgWv8U+Gf+XzonZw5ZpkglLX7JHBjr7MIDGNp+RD05Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUtz3GKCO/A9/KG7libvSgYPycglz7nvHHfYuGbNw2esiXrBQv
	8Eica6amB8DBtsuO/f5eaLUdKVKB3i8quOIZa+5YCe4ZC2d1eITAVsxM
X-Gm-Gg: ASbGncsZocWuh36tdJZeZTuus9xrQVx2RECoSoW3KlwztNJdXCxk4HjfAgQ/qVgYpkT
	mH4nhZga4JhdD5fq8wybSJISTChBk35cBh0qHpXysaz5w+p/Y8/4Ky4gggAW0x2U7bR8cQBzhBx
	3u3bsDQbEy0TVRjuQDc9wE+G+Ik3jtqkIJ2eIwy5ERwxZa8V574yxUFDhFTQuFicszx515CM6/i
	T3u5fJfYhk3ZdNL7e3Y1Qhx6OjRAIXzihUIx6Eh/s6KExXXQLq7EbmEer4e//qWIYzkZdij9K58
	rjPslsSh0IMjAVF0yKG/Wf/1F2XbxREJPQAygnVoAMt2+X22rcGMjLZ07pGQrXzoTnUWqcUNWac
	bN0j0G/4NwUwkAUW3wkag/UXJaPxVn32+WoWncFnUcv83U8454/fIfq5fcek+7YeFH2tqQWIKz6
	8=
X-Google-Smtp-Source: AGHT+IG2uSp5m1pwmGBSyOtq4zqTrB1e5ASqxEmOOTHWvBiYa6jbXWwGQOIFNWn9z4op7aDbh7fbwA==
X-Received: by 2002:a05:6402:234a:b0:646:6de:a09f with SMTP id 4fb4d7f45d1cf-6479c4475e9mr4164767a12.2.1764828412441;
        Wed, 03 Dec 2025 22:06:52 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:06:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 1/7 RESEND] dt-bindings: display: panel: properly document LG LD070WX3 panel
Date: Thu,  4 Dec 2025 08:06:17 +0200
Message-ID: <20251204060627.4727-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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

There is only one user of this panel binding in the mainline Linux kernel,
which is the Nvidia tablet Tegra Note 7. Its panel is broken anyway since
it cannot initialize properly if the bootloader does not leave a
pre-initialized panel. It also cannot suspend or re-initialize properly,
since no DSI configuration is set and it has a loose regulator which
relies on an always-on property rather than being hooked to the panel
where it belongs.

Tegra Note 7 device tree is adjusted as a part of this series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../display/panel/lg,ld070wx3-sl01.yaml       | 60 +++++++++++++++++++
 .../display/panel/panel-simple-dsi.yaml       |  2 -
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
new file mode 100644
index 000000000000..0f0b9079f199
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml#
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287776;
	b=ViU0Wclr6JRx90GTlMS7M/58/tdQpGHICTVbXi8g5T2YVrP3zfmBHiGPacESzW+ogC+n
	 YAyNOB382NvTYB+hKHcTv/mWCcWVpSr/j5OZf6ld1yho/Ky19djdxH56mxUxjPdG2QV3C
	 cmMzn7cN1TXAtKUsOHESlazZoGLvewD8gLH82tEQTEDiAakgdl1r/MOUSk0n/53vKQzbK
	 Hf6Qk74BAxqhiPLCCjN1uMIriSg+65njwOdrfZSetvcxByQZnrttr+RXUKlMF0z9QvMry
	 6KY364F0fzWEFqtqQMzyCeg37IUp2v2K5ASJmbSrU6i/xKJJIMLiQi9riQSZUCFcNAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
	b=3zIaoYdgbmbqhrYZcJ9pP3wWS5tKuB1XqtA7re5BjKcv3wPeX06i57ZevADRjJJ5oV/s
	 feE7rwMHXErbvQLIOPA2ywrjXz4HKDCEG+7x5mQnayca1ejg/Wwg3ExBv5XS27aDUiF/E
	 af1RKCQM3UlRUeZdLnO5D7moteqWB/BsgFvHm3E40KGkz+RYkBMLFrCsQfvg4tY6M5nKD
	 867Nma7owpGC7kvbYZmHaq5Ra21aeX8QeoQzNLMExJ0Drll6ls+YzOEBULi75BzYqrAuz
	 99mzoQwUutmBlLeWYb50IBrWCBLqGqnVFUlss5/VNBsl/lNaABjdNe4mlhBbqkfYsTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJTkI1T0;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ABD606A333
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 15:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57ABD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJTkI1T0
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c37b612635bso325797066b.3
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287775; x=1793892575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=ZJTkI1T0FWKnoCCvIKAt80JZM78wIiwL3ZlTTnaOegxkGtq3PBa/KPsLh3bFnEX/xM
         dE6pHqkgeDepM7OIBtdjDyjoHytijTq25QTrFg4XnoD9DOHt7/aPi3Wua94feaPcFxl5
         2KuQhb7RLHiOjdLFPvzsWM+6g1jguedkNjQP7jgHOSnjin20sOH8EmEvsZy/8NtBaFEV
         FdYoLyKNz3QG+VfFXEnhbBNCPJ84LpBcLeIL6J43UY27+8GnSq8NpQ8VPCePNqJtOYts
         x4GwTXOyV+GXLzQCS+l/T7keiMU9abGJN443LNf5X+JmYNNNv8fnXwK4PtUWY0ps+KKG
         oLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287775; x=1793892575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=z5m9BEfZh90E+JnX6WrCOrWAU/7ejse+Fb2nlHLV1RxmJ/4SVPSlw+kyN9PMPfV2PA
         RaEQ8wn6CokQ6p9XkYfqXDH6qjbaZn1vIjAeecrE76foj6yjM+iydAg1QJv9Wn2c/Yd6
         AI9x1r8Ktt0CdvippmJjiGW+Dew8lE3Tr51zG6YumbBvanKELLVh5GAmCh+pOyKfQrUc
         Z89XW6ZSOegO0dR0SFzuNx4OJ3oDyF5Tn0APUN9CLRKFeuA+QsYAKbNNLYOMoYXx28RV
         Eg+BOUMP3jKOFT1Vwd9jSy0gQvu27hLuJfOYlmEIJ09hKbEhhSg2tr3lyDqgf5kZvgR5
         jumA==
X-Forwarded-Encrypted: i=1; AKwUvBwTqLe1m6zGS65ngsMh6vEK8nBZ4gx9TLGoHg3mExbooajH+8MSHPi0ecIZh9ZrKC9THXmIMmIqZvdHNQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLSJoeNW+M/qxoJbs5xo69lSU4Ot2lBBMl4vxdKdDanrAs217vO
	uYBe5x88/3D+xNz7JpIKUan5/t3EdP8NASFdbM327ObuDuDbxDGbmxxg
X-Gm-Gg: AYBFou10p9md+nwumGKJH5Mxm4D4Ls5j6uHFwx2qlm5qHGQYtzrSagsFo1/DXt1Fw/V
	NpPrJXUNNdc0sd4MnaGUJ7h98d0wuv1IhqWPPx+eaJhn2pOI+geDRfjIIExBp26Qc8K5gmqv2u1
	FUOWUx1S6yZ5bFvkv6ILvZIgMWaBFMZb0kASqQRxoKtIn9WpKfxZcuq/EKUvmKbs1eZJcztrHfs
	Zst2h3GMHfdOjMbLs2+EPwRGowfeSq6/P1d9i2VRRfKiCM3a88D7jakLJUmKIUwHVDa+zn+NBZm
	57uWXTCQZuJQY7Rqj8231FL9lSEnxoYPJZQmK7FiMFRhPucGPZT+yiKeBtzEa84nJgx2lu/T6vn
	xTU6Sz0WWm5h/b3Md5OiW4iOfjG/RDzkAhkqZJ44j/ongE3ihrSwZQXEqmEAh65PrLNWpKd1yB7
	qUYVPU8fGSv4cmj4+K7Qoaeu/0esAQMoAaiggL6UBrL13J+x55SFDF2QBeg5L4HIRtDMPz51wlr
	EoPQUWpBvlWFxmoAVWfAlevnIV2hvcCL+H5wnZofrH71jsW3j3U+bAldCv1Lk3zoKck9bZwr0El
	cinY7DAH00I2zJG0mqxuS04IoW6fk3GmB72WvGnRplhtKoImvg==
X-Received: by 2002:a17:907:6e8f:b0:c46:7645:86c with SMTP id a640c23a62f3a-c49bdff352emr527006466b.47.1793287774682;
        Thu, 29 Oct 2026 08:29:34 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v5 02/11] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Thu, 29 Oct 2026 17:29:00 +0200
Message-ID: <20261029152909.234584-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
found in LG Optimus 2X P990.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/hit,tx10d07vm0baa.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
new file mode 100644
index 0000000000000..4642dc14c42eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hit,tx10d07vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hitachi/LG 4" WVGA TFT LCD panel
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
+      - enum:
+          - hit,tx10d07vm0baa
+          - lg,lh400wv3-sd04
+
+  avci-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  reset-gpios: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "lg,lh400wv3-sd04";
+
+        reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+        avci-supply = <&vcc_2v8_lcd>;
+        iovcc-supply = <&iovcc_1v8_lcd>;
+
+        backlight = <&backlight>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&dbi_out>;
+            };
+        };
+    };
+...
-- 
2.53.0


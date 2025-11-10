Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75E2475CF
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766129; cv=none; b=gz0xsp4ZB45ssKd7kgFyccQ3R+XNWYPuaemmt+gONub1QZNMiY7tf84mnh+WQPFO70UeURuO3XjJzIOAJ4hMoOPIEV13vzv2I/il6/J9v2L1U+m95HRH+L09qb7LFkEZnUrMRpJ8ApkV00bPOzRhieI+nE+S3ek87CbsDf9SRU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766129; c=relaxed/simple;
	bh=M+TtnNRlKxmwNkWjOrflCvsVUhdbfnUnfwwEyraGfY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GT351/P/4R2rfRhMwhKpBX8jzc4gpRLH1E7XghLruorVgX2jOrZLpodKyJpoikwuGApOV1LEqtSz2KW4VCYG8FIr1sL/JrfLDTqEAXXG7AWtID4INn1yiInbzEjgYAX0HHafLCJBDNhB2qeNlGzX06Ku5bsv1I8yxcH3VueSa40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKGaGDD3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKGaGDD3"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5945510fd7aso2067864e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766125; x=1763370925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
        b=RKGaGDD3VtE/GLQK8rJR3NTOP7wu5Y1cYeHUHmeCbhsmnholaP0ZM39sTS3v8Hcfdn
         Y/w9cvPC8DKVfUpa1SW5Q+OpyVk9ruGzomVQeEKzdRDx8MkvB8xXui4ud3pWJVdFLza5
         5uJQUU32wKOqXDbrwGQBPOQ/j692mKssv49GBksKMTUnumucLE5bOIXocTixN39DUtFb
         Xr4Ionav27nXv6ih5iaAqXXOY9Jp3f2yryWH3FXWKVIlrCbVfMpGWgYHE757UYBVImc3
         WOEunKBJcC0YiUFFuBkDEt6d4PDlVQxlQwQPapJFRdZM5b4SG23CN0ZbMIJbsifMlq/b
         sUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766125; x=1763370925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
        b=t+XjmEvqKRqeQxTqIZpTP6/y/hnCnT/+t7PaHpanPZpwa+BMUTQHmqEYSJrOEbDU5v
         SNM3G5WE2gVSSiduYHCjruDsw3XH/iGXZLppwKpKSNbSZ4JRGyuvf9a8tYstvOFBb9IG
         Rwwi2DdWUYpK8xFzr9jtPuRDV7KwXBCLc/4sKn+9VKIEzC4dG8sOCTIFkMCn1fJ9UP+X
         OzI7QAL1pxNTweBdJ2FtLwex++0po1KWQABJ/bf61k4FeWyF912518jM3JTfSSV4S5Bo
         X9T23vMRZ37TwvoOp67TyssgGPFFSuhLGq9I10SqGtj3ZqAGTQM7n4vg0Rd0tclIQJKZ
         X5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLq5reybyqRLMuY5NY4BFIfVfllZI2lwKNymwp7/36wImEk6TaproeuEZswakOBjClO7o8yvqubt8pfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWFAamjwD+7Ldfp1IGxeQob88gymj9HCBhqikw2Db7zVIhsbBb
	9c7Z84EgTqpjj/NIrJYMsW/QIwz2mIoUXUH4uDVR+uiiUoP5Hw9K+nqQ
X-Gm-Gg: ASbGncuD9LjDPHRME3uPeTcOgBHaJTaemvQxoxOP9lVpl6BQePYb5QGm3fezsmZeZbM
	Zfe1l09kuHJQhVuPAaLw3ByKvegjZOOF8BvUwrqYnKuf6n6+bOLcv4YRbBddFvID7+MiZ2gx1YO
	gjqTOzimkxRDQdHcaXVKPU66MS2JEa8TMzoqstbyZcm0UVqo8o7YhkgQLKk3DSDx4M1D9Q1J+ch
	y/Yd3UN/UzUeMbpXAodIQwWTmfpTkAaJZgkRJ5Fvoz9SgLBVOF/tZsSyLXid9TkgMzanX9otfo3
	Ip2yGbuYXlm8gO0wu6q2Fu9keorpgYWFMAvSUCmOOE4xzWAT3S8jl9vu5Utp/hH+MAg3Q3OsvSv
	seTrwZfPs1Q2PeniMMSh/lL11CuwzkKp/zva9Y9iV4LN9wSKPN5w5UaxBfO3eEPG8
X-Google-Smtp-Source: AGHT+IEnre8euOUlJN4NOBJZ2nC+Kyrobg6JzCsMbW0vlCirl1sVxwVHvO40Hh8x69PfhvhcPyI0sQ==
X-Received: by 2002:a05:6512:a8e:b0:594:5236:2842 with SMTP id 2adb3069b0e04-5945f146023mr1871274e87.10.1762766124504;
        Mon, 10 Nov 2025 01:15:24 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:15:24 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: [PATCH v3 1/7 RESEND] dt-bindings: display: panel: properly document LG LD070WX3 panel
Date: Mon, 10 Nov 2025 11:14:31 +0200
Message-ID: <20251110091440.5251-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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


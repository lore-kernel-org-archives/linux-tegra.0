Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC663C1D75
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131502; cv=none; b=WM38Ag4bfl35FC2OepvjQcKfGN0OafWtmNQhsvaMYH/GTbOCcH6A2Qk3gt7BP0C557PsRJSAc+aX1Pz3wcEG+e8Wva3uBGZjD8xGlbjPChkeBiAociW4IFXUSpqAOQHua0JYkK3pMyaz/KEaf4YdUQlTJRE4Yt/+JsMLXMA0BC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131502; c=relaxed/simple;
	bh=Ms3kQzZFSAV0sF2Y4NJYiyIxnkk9I6e6pJVoEQlBmMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBYSSVHCdapAhuWnYRAOFDsHvUZqmmFdZ2kS9hVZ1X+uu+wLwCFISdQNumtJUDFp0gDzN/0nyWrdq2u/hZnVzRGXu1YDGFzC+BAVSIaZvvMke+k+1Wq2RLSiX2szvX5YlQJdUllAq6FgbNDyDxJXNraYPmF5HFvwqo79dQBN+Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTTxlYyJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTTxlYyJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so7084075e9.0
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131496; x=1791736296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrA01rti7Ay/Y5eHy2dsofO3a17OwFZMN974VKrytcs=;
        b=ZTTxlYyJkZPuArJvKwkUvk7OhRg5LhfT8GujqvAB0OeRUcidYfIltltxXzDbU/I4tC
         vOXt3WyDGS31WcrryQ/waqDnhGQ7e93IWoOgDjgdiikniObChgYEy1r7SMpFkj/g3d1H
         bC4ZnfGGx7xHvIsGG9yUAHD+wrDL4gUkq6hLe0wrIJS2OrH5IcQl+77XUARujZj54IAx
         UkzzkA1plorzkiMKIIJgIeD84EZdfdScGnQZ0qB73fSUdPEvHhk7RZyVSYPGNG9vzYFW
         uUnjETo9jAAh91D2MlcvCLlwJxsU2WfRr9cEKA5f073gsKR0f8wTX09jti0C784yQ0HT
         gqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131496; x=1791736296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrA01rti7Ay/Y5eHy2dsofO3a17OwFZMN974VKrytcs=;
        b=Sfr9pdyE5e9NxMlPi9SpBUFTFJbq1o2kB4yST84K2HvmxIS0RiNOfQvG5qKZZR+RjZ
         NKTmJm5pViC3DsJHhu9rZsJbqDfNt9Xn3WQU55L81S5nRFCyf5y9TzSG8DIftKqqzH4J
         CNv1kr++Z5xcxu4S9nk1va7SFBTHO/o5zZeYXr9J6YWuW4n86JCmtXM+IUx/W+CzmUsf
         +eNm01HKiePXboTb2wVTU7B/BjpCaQiTXnYA7m7CeIQmnyfd33BoEFypNFo9ofyO0eUe
         oOS9KVt/fr8m3QPZsqIpuSRqqa3UkiFPIP4s1DUT1qKQOjY4e7mnof0rjeJLrlbeUprQ
         36Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwKfo9pAVzdellEZ5BYntDMwbzuQd6L3aCvKanm4CWdLiSgHeUcSEu8kN2ZlwXU4UpSIQPOi+3z4Tni2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++n4nbXGyjdOGRUAMdtbm+TeLIABjUK70JmOXNR8JTUpbOoNwOKv
	a2sHuaYvgkS33wjUYbpCjV5qey0IjpepCEURMSLf8JS+rQssMn+IBfW4
X-Gm-Gg: AYBFou0cR9XySe9vdB4JsfkR1OBuWREqWxsEsRD2aZwmz0eEYzndRL9y91LgFqhaq5G
	BewmsG1xWK5UNdMyU23jUrbTky+4J6H+Pn14INz1i0BPKupY9AJOUdvBmVYRuVjg+7qrUnhtndn
	5Lbz6QSU5VLfRMpL/zzsZjJIq24xTizzq9idLuGPXg7zjajUSQKV+Fwf2dLWvki0cJujTD5gWQz
	conls+DSgDupJacwOjSOqOTBS1X1MeT7fEZF/kjKbj4ILjwcscZG53m9KLaOZERPl7e/Xzesvzv
	e5sUskKgdAGoxVOyUvOKu5zYdUqZZrFPhZSxRt9IG9WYek1HmChvyiftmoebnFaCLl5J4udHuhf
	xDmJLn+P7gM/+KEjivq+q7bK5l1Clm7BK0AoBrO8EcoPvGvxUZCzF4fUUmja6TpbVCYqcWPOIOp
	s2D39NRn4S1UT+WKPIkMHkiPoQFHQYxHv5vVWe3lrzWSvnGQ/rANu2cKvCZmKDo65DwzWCylJcF
	bDjQU3VD8qBI0VgFlGnMghttuVnHw==
X-Received: by 2002:a05:600c:1c04:b0:4a1:6be0:2926 with SMTP id 5b1f17b1804b1-4a16be02b8fmr80963555e9.18.1791131496375;
        Sun, 04 Oct 2026 09:31:36 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:35 -0700 (PDT)
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
Subject: [PATCH v2 5/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Sun,  4 Oct 2026 19:31:12 +0300
Message-ID: <20261004163114.181800-6-clamor95@gmail.com>
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

Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
found in LG Optimus 2X P990.

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


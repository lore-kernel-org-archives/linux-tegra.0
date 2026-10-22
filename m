Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675405;
	b=XCtq3Jbih5ytMHYW13F/T0+bNZJzbHmGFgx27YKEAaliU8v70gbUF8iPWFUN6Bq14KZU
	 gQ/V115WcxE3u8jHQdH4+TmxwDd4vnwyHc8ab/0Q92dZgdi0RFbxzcB0/79TdccQP1tuM
	 0BCLWJFaxF4kRq0Fc5DtTwJFI9+Pk2NuhwfgSkeG5MAOnyr6s8n/30LupU7HkkVATSRi8
	 DS6ApKFWAgaSvFPI47scPkbHLoQ+R8k9TqVBSVCBVn+8Y5bZu0c0PyxhHKywHekHcE6/q
	 phVniE8ysyjnnYJBYQip16iZaRK+u1GNLH3g03rn909cIQ1AcilQmP6mcsEgzM4pzHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
	b=0tXr5oVHhqAUX4nywPFNlBffER9SmPTEeYpT6RbFI1Xks6UlCkR6zqV8Yx6BGTzZ3wNY
	 dW+YSEGkhDt+cQhSzS8sbauo2IrOkI58Bz68qIrpHG5pYMCJfv7UguABK+Yfo+MXOJN4T
	 Ss9SbttrK0j3u9xEh9X/iVLvL2NhBaOY/AkRppNhDvHTGCKNweQBthkvNy8HQDr2GZMG+
	 XQoptXK6H44vYNVShFrBqihnZxziymCPgnzPrM6O6s9JD5frnheJVGDZA4OMGtf1olcWv
	 f7OY0b7104XwrUE4QV+tC2OqbVZs0L44gcXfLuQFPrOyDxWClmF9LBCZ+TYSU/EZzRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kxLes4fr;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E36606A336
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 13:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E36606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kxLes4fr
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2870814a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675403; x=1793280203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=kxLes4frZA1nQUMNbxWsOc+4K9YOsscYvhw/zBnNiif8C4/07HpOicqM1EkFxHZbDo
         Ec1WzxXUW3AYSCI0F6PBluvl9H3csMYIsUnKmyVNY6ySbg8rTyGBu4YdI1Hib281iVHI
         a3Pvl+ceQHY+aXp1KO0Aa45CChYSFkCWaCiMBrZ+AbfBizzIHp3pbn0BU32WtWL/M8Wh
         +CzKM7tbPeQfx1e3hHGFf8RyUavvmHrSZBK3YWFqz/m2lIL5neZwW6OL0fWQw0xcnSIT
         6Euv29SXRXq9SbqJuM+azuCSe4D9Q0PGkQGFQJJsCDFAarcf2yQ7MjIJ+0ImlC85kk2N
         ij3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675403; x=1793280203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=G5MJ2h4hCCZ7g2DZBGQqZOFE5QptLALErApewIL0j3KeCP1k7vqqVW7puqjf5WzT/n
         hxQLMmCPwecrPsdzrcuJqMvgEMWlwRkFIqiVme3enXR/DOKQRZnmV5WaSaa/FppLoYil
         +OpWH73XcqamB/qy8YJZYuCX3m7AsYd41OFQ5aJXj5R1I+ZjWHaAqIlfeYnS8e8fC/kT
         ftgsmNK4GutUr7TTBHtfDuVyemEi2zHt15PKCWzb2Y+SOmIYXT2r63L3O1CvYsJInxtr
         nXwrfKLKoOsRTS/33zILHpYnjjxTj1bt6zMBFN1LIEGaV0DRgvqdKYADe8CWMNc6CLYg
         eFYA==
X-Forwarded-Encrypted: i=1; AKwUvByX5M8deirlr/rsLHE6/Jea3ggKRhfrW6zzOFSVflwADSjiaIDUTfsqdCiK9Xs0LmmZkQmW5NoO4y8qLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIcQXYksM15iQScgk56fTLmR6MeNDUMmd8GCkF8i25+dPKi0fit
	v5MeP6eZ1SKcAd3JnPwBalFu0rv/5y1j9QJNqXPYvi4fPsuv07Wvm7va
X-Gm-Gg: AYBFou2Eha2/7LOGA413Z0EEVEQwmIJ8qgVnCb+gWT8lR5mWp9K6G05glBbzQbjiAos
	/mmSqBNKxD+0GhkunNo0/aXTQ95J1M93+dReioFTCj/tIT8akVpdI2hbQimpbm5sWMWOymy7zWg
	bKnReWDCvucxbRVLYE8hvGBXjbKc3SodL9HnNSZS/sFV/FPaCfskxI4me5/RuUoJv1dR8rI8ZPt
	5ENpkK22KQl4lo7j2GNmpbCajMpV/ccEXzwhBZOxay8UdtfrZWiYm3Bx65Mjt960HAj/3JRVUpX
	/xH3OlvyMa2obWPhRXnigE7QmN7maw+u3x+VdHwlq9vqWb5nJ/62VeDlQDAccFoSlV4YJMDHxwU
	rJNQG+LDftz7ShzT+fA0CTJmLqrsRaIuJfCSC18ySTS+VSiRQ2uiWHBJP8Foyp2sYsMrkCOPz7K
	6v+/bNKPvJw2OHLTMCdzd+GLkfbWiFbPGgnryW0vXQUYI8hvgD+46Biv/9w/CYHLIf/McC28fZp
	7xyxm9aHfHcYYfcZtir9Anyq258MP+YT+DAg6/6ZG73cwqDmdAAa96qD+44rqq4EeDLdHYe56oP
X-Received: by 2002:a05:6402:1951:b0:6ac:afa3:6f72 with SMTP id 4fb4d7f45d1cf-6b408dc32d5mr5323394a12.5.1792675402834;
        Thu, 22 Oct 2026 06:23:22 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:22 -0700 (PDT)
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
Subject: [PATCH v4 1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Thu, 22 Oct 2026 16:22:53 +0300
Message-ID: <20261022132259.240717-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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


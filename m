Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525BB37FF5C
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526284; cv=none; b=f1xecZkt6Fo150PiV1AxydSBXRL8DUdzNED9yFSbZD71qVaN0TZ7/AYpZIyZWjcLk4MzG9jIeaBF9ePXmdrwnbVP9syXCYlPFQTcI+paif16pMCE7CM5ThVfDFqRCKwyQKcLhGRgMsifnEyHK+Ygf8F82hhrDVbCN/H8shY/9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526284; c=relaxed/simple;
	bh=lOWy9eUNtVw3uHlGLztGJ2hKsmF/zmvpZUW7KvLTwus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRDSw23vaQ4KSFZIkXv+3na0gZdUHrmaEyRvfv3EHvTThXv01+L9ZjQ5WMG2GjWt7HC3DtJIny0wVe13aPWLLjaFcqc5IZAdR9O6plbkRYjiL6WKHpJNsGRvNDXMRpmxxv3NvfnnYXxod/QthqGKWlcOdXNYlCOyVv9KdPkHmso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7yiklst; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7yiklst"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso1686954a12.1
        for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779526282; x=1780131082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd13IJH48wsy3wb7Nhpj3jYUFTP23MxMKgJz3kfiVvE=;
        b=f7yiklstturutL/q2rxY5rnZgqUHLPhI7kT1FB4XTobmV/T8mHmIXSSFV6W7VoBe1c
         O5OxB+Ye5jmYLpQW914xgPSaqXcFB1rfqH3u+fReKDPF+0I+yM1MAVrseYyfbsMLtBWI
         +FrLlp8icmUAXNed7mVCB+qCRz1oMdjvDJ1dDVSFZzMgmKzhbw18YnK1zzvA9CwihL0U
         JNmo23c0pZ2UhqFLqzk5jR3QzBtpGs7xxSI5s56b90p4Zwgaq92q5h/HEE+gAZZY/306
         Pkzi8NrPTZHNjQ0eYU3E1VUJrzb+t4q3NBV2y4vOyqr0CwhSIKBFhXQcF3tsoA4Al7pJ
         uPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526282; x=1780131082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qd13IJH48wsy3wb7Nhpj3jYUFTP23MxMKgJz3kfiVvE=;
        b=PTsnxB1ReHf7cIXXXjQxd7m0FwZXyXBo1KBCTveI/Nv83q4A9tdYEE24h5xkIF4HXr
         SiqAbzLO0cnTLeJOgS4aHhWaBT0Mx9gJpt5RCMMzbG2Cd7B/uRNnak7WaWa6016BH8Mw
         H18qYJD3arT1opr73VtGROjfaBwI4o73pZItUZkMuAuDiPogclq11ljRoUhckdPlDoNO
         c0YDrcf5a+AVAbQCjZlLkrfgD/2Gd1bD9Hi4hPr5JUjBZ0RsoU/xJ/PgsRo15/m3JlhL
         zNK0jMXRrKzgYfWA9QJsZ0+hdwhpS260/KZ5oy1yQJzChpEJ1GdIypKvksuua+z89MPv
         9A4w==
X-Forwarded-Encrypted: i=1; AFNElJ8DL+J7WDMtUdGBIifjKm2u6mhkX75eaK2yyanUkwg7CmUx4FHQEVNobI0CifcIjq4/xvaJPCEcWgjIRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykyMkLSZnvsRlWpIB7Ox6M6kDwzA0ZarYxUQGyVaB86XgQi8lb
	E74xToyQZE0v6eXRnwtpDsDjcfXcy2wFZlGQByKiyS+6gtQkHgM4MOon
X-Gm-Gg: Acq92OFqsSNepIDSV7UyipUMXPUe0UrNACPBUO0zcjZVTqF4PrcBE4ZFE9ASs5ZORi9
	TXtcP0XJmIMyAyA27v0PMWQz/RjZvc3l+Z9w8EmfXwAQ6PYcJ+WgkhM9nFbal79nmKYhPtdxPna
	BwRpT/5DujnexCbVwGUpfGSV5y7pijHPIgvdn2+TSh+Gu7TUCzTeOQvfFjBNq38Tg3mErNid25o
	AS475ku2RTd9CL2Ygkc2qJN15flxqbJo7AtQYyLB1wqo6tdw7z/feu/IQhtdaoNLud2gepAyj6K
	Dlx4eGfwfK+mCppcrbldSS8khJnshAYeDaO/BiZFoxRWB9nGsnMjfhI8spHuwXMFJY0L4WJpK8O
	skaS/JanqNpUdRnFINlqRoM4GyIYtQw1KtaDw3/4vT6IrBNCD1hDjWB37eZJ8NEo8vnXOL25B0L
	GmjOGa8Zr6F75J
X-Received: by 2002:a05:6402:35d1:b0:682:d851:6df9 with SMTP id 4fb4d7f45d1cf-6889cc3160cmr4084555a12.15.1779526281695;
        Sat, 23 May 2026 01:51:21 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1f0afsm1642658a12.17.2026.05.23.01.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:51:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra modem pwrseq
Date: Sat, 23 May 2026 11:51:01 +0300
Message-ID: <20260523085102.51000-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523085102.51000-1-clamor95@gmail.com>
References: <20260523085102.51000-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Tegra modem pwseq used by various devices based on the Nvidia
Tegra SoC, describing its usage. The power sequence provides interaction
between the modem and SoC-specific interface configurations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../soc/tegra/nvidia,tegra-modem-pwrseq.yaml  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-modem-pwrseq.yaml

diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-modem-pwrseq.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-modem-pwrseq.yaml
new file mode 100644
index 000000000000..3770fd6dc2cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-modem-pwrseq.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/tegra/nvidia,tegra-modem-pwrseq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra modem power sequence
+
+description:
+  A configuration sequence used in Tegra SoCs to provide proper interaction
+  between the application processor and the modem, as well as control over
+  one of the SoC's USB lines for the modem.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra-modem-pwrseq
+
+  enable-gpios:
+    description: GPIO connected to the modem EINT1 pin
+    maxItems: 1
+
+  nvidia,usb-bus:
+    description:
+      Contains phandle pointing to the Host's USB controller
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  power-supply: true
+
+required:
+  - compatible
+  - nvidia,usb-bus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    pwrseq-modem {
+        compatible = "nvidia,tegra-modem-pwrseq";
+
+        enable-gpios = <&gpio 165 GPIO_ACTIVE_HIGH>;
+        power-supply = <&vdd_3v3_vbat>;
+
+        nvidia,usb-bus = <&usb2>;
+    };
-- 
2.51.0


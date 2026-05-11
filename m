Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEAA3F54CC
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507869; cv=none; b=PWGxbD1tGb6AT59h36ry0YGMEXYJEJNUC1R0fpiGOcdelkMws2+lXvNfsATETYs5kERuFRaqMi8ZcuQ4WkZimt3CvLxQ5J0juGFFlw+tiy6mTkNQstBcH/tG2KC41gZcYDE3N5xsbwu33KTv6BxpFQ+BFTvHLZAVLCwyxbHeLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507869; c=relaxed/simple;
	bh=Xp/TUYJI1eAs/D+9Nq+dELgCqu+Ss/welMktAjHcpbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJexrR+sS7KyDSm1Nv0GEmV9e2J9R2gHbgcdIBo4q5CjDJk5HlO4f29cNW0rjiieg8+nuZNwMsHJ9rrUW0kTFrs8Ol3uQHdutHpmpgU+xWER2E4rKiI9UFFCNvVrp8r84wo6YFiKvbVudNCubXDoh1/B1BBrrK7m35HrzcZy0kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTVG2x2U; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTVG2x2U"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so8987262a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507855; x=1779112655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnjnB0/XPfthXcOXqkhM1htDcff/BGb30MwU7TWoKRg=;
        b=jTVG2x2Uzv7Dt8V8cSlP4y777+8Umg8UZR4qC4X5tWhuFi4FWQFNdi99gObVcIVWYh
         oLpRMdYIKJRz+zUeMBhJnJe+itGJ90THEwF47hQ+KNBpGdZB6q5rFu9bf59ndsOdvCvM
         Pe+W8fTkPch001mxqd1ckVyc+AHxBBIQgZcEF0IqMap+LmMV52rvWEiXhqKR8Xn2SgxS
         SKuwV96wcJpgR+Ocjcc01yCZT91wqWZFCUf7QMF33+IHkiuZWvgV3uA5qGPksBook4i5
         2BuxZcWbQ9hMYGsLBMuuKGCerc0YwGOI6q9KSl4wRVofStDZ6PQBX7nYY3DJtUeE0fdq
         t1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507855; x=1779112655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnjnB0/XPfthXcOXqkhM1htDcff/BGb30MwU7TWoKRg=;
        b=ailAdYH1iL/Yek+AMW8Z4PaYst/iYz8mq7dPNcZYSJtdN5+kaqLSuGvdMIxGcmLCAT
         AwPIPvP4retQz/QkIp9VwuvjgGTha4C5AWEsD+dGX5xEt/ORyaiGh/bg3f6HkpqnzpJj
         e5Vsf/dTxk1P6TqMBwOugd2zcidYCKk1C0idlj6QGbrNWaCkx1ZLjVWSDM6xLWYog1/M
         kfF8fJDUBH8iCZwYCDMSow909QOgxOyP57euTTsf5ru2IY85Lf41cKIezUPOch9n/NIY
         ZE1Y2lGk/VFku6JVotyww3c80TzhIjNTOoHjISmlXzwMZA6zs+rl3qbeFsPjpyI1L4nx
         uf/g==
X-Forwarded-Encrypted: i=1; AFNElJ8JUi3Gfceff4vlBAVJK/bzFLth1gmSx2u8wFnc48z8K9w89vC502jjmsLLNGoxpZCkFLeWdonXVKzdzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJmvUzRbi+g5uWopy+lZ77NXUX9XG/okaixoDWB0/6zWOop0V
	iOw7uOGp5uUp6WhRNF38ehR2fMiqizIrK7PZ9KWWE2QfzjxKiPhf1PyL
X-Gm-Gg: Acq92OET9U+ahAmVPjvdNrKMatkYnMnkzr22+1zzjmGrIaCQc0Q3G8ZdN2x/E2m3ngm
	Hls0pgLjqhc3tI9ug7Letm5SNcti2pfkexv2lXcnoZWKVUkJgefW7EZ8E4BxPYgVbtbm/CLm1QY
	GvD47by8oPRclJ14lB0wWx1SJUidI6bxnykSGb3PqQkxItNPsJeByrLtnLyE2Q19WAt4rVtD/ER
	D+ww9UK3bwKHFR/UG6633bbVaR2zQFuTVMceZqmhjnIxwEUcN73Jqjo1o9t6E7jEVeFrdpez8B+
	NLcU3B65PkFYtCTJ9pv0mnzznUJ98fhonrybcMu0KJWHoWiNlFrh5Rd0oliLfAYfuAlOWtruq+m
	G6cUJSv5GEHvi0U51n7rMqtC/KKPjE3RyRCehISzCNNjkfY1+UqdME/O/QzRuViMNhATO2aaUG/
	+UAaddvDeaC7tU
X-Received: by 2002:a05:6402:b8a:b0:671:9dec:ba3 with SMTP id 4fb4d7f45d1cf-67e0ee9abb2mr5590673a12.13.1778507854968;
        Mon, 11 May 2026 06:57:34 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 5/6] dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
Date: Mon, 11 May 2026 16:57:00 +0300
Message-ID: <20260511135703.62470-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the XMM6260 PHY used by various devices based on the Nvidia Tegra
SoC, describing its usage

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/phy/nvidia,tegra-xmm6260.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
new file mode 100644
index 000000000000..0346433c9772
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nvidia,tegra-xmm6260.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra PHY for XMM6260 modem
+
+description:
+  A hardware configuration used in Tegra SoCs to provide proper interaction
+  between the application processor and the modem, as well as control over
+  one of the SoC's USB lines for the modem.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra-xmm6260
+
+  enable-gpios:
+    description: GPIO connected to the EINT1 pin
+    maxItems: 1
+
+  nvidia,usb-bus:
+    description:
+      Contains two phandles; the first is pointing to the Host's USB controller
+      and the second linking to the controller's PHY.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 2
+
+  phy-supply:
+    description: Supply powering the PHY.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - nvidia,usb-bus
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    phy {
+        compatible = "nvidia,tegra-xmm6260";
+
+        enable-gpios = <&gpio 165 GPIO_ACTIVE_HIGH>;
+        phy-supply = <&vdd_3v3_vbat>;
+
+        nvidia,usb-bus = <&hsic_usb>, <&phy2>;
+        #phy-cells = <0>;
+    };
-- 
2.51.0


Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB23F54BD
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507859; cv=none; b=J8iTZ8cjPgzFQEcXwDiuHAxyJfj3L+YsN8eXNx1rrOz2sYov99rlmInrv8Xu64+CYQkacQd8GYrb2/7vb7Z1cwTs+cYWipG2hdlefKKEISKMV5aOnrHAhOuhqiUCgJ7Z/P9Ohi5jaFPCtt1rw3WNXIj6Rr6T8XEh0axIfvyyoNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507859; c=relaxed/simple;
	bh=UGnwnynsk6MCY6H8VDntAGqr8yOAgR5+RJ5mxZdLHZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jo2dTFWoqfMwNN1hFFDDS0NGz66IISLWWrjBpch8uldeY/ED9265Qatz9Sg1KFqvmLm/NWvFROrslDRIBbEp0dnkaK1pksTUSbXXaHco6guLMUKpLq88NSTqulOnQOOOV42nECm19Oe/KnRUsF0QVlDjSuq1rpernqU7oieI4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9/+y0hs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9/+y0hs"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso9656549a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507849; x=1779112649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdX1Hn1whpHFxpnqtCP4cLwf/y3NxkK7GqmkakB9h2s=;
        b=R9/+y0hsEtFzQUpXgRzvAmmYxgz7ExkZm8O+9rT+NpyAQ+/o3KRP0XrYpX2R1BaRiD
         dCsIcCGAD2D5hCQtE8KM9A/7Gt+9IGEXFkHeOUdWfAEYp/pQR4+rSDaaE4FUMuFxQ+8h
         J600jYbyV3MjK/A5N53AEdRGi78N+3Z/KdK05SqBtl0gEnxxeVEQb7vX1y+9qI8w705L
         j+333xmAqAkVuIziNy4BOtLC+ykB50F9jwqVWcuxUa6Ua/HUBKL4yygjUJPUekW5esJS
         3haLAUCso3T0lB21StROK8z7cdSHI1Fd+lGnLQXbuA3RuBXWggRxuaSz3K7cCz7V5lFh
         SoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507849; x=1779112649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WdX1Hn1whpHFxpnqtCP4cLwf/y3NxkK7GqmkakB9h2s=;
        b=dvVeeEEp1Q8QOfesRtxtS7CwgNGBo1FBjK73gAq91USNDQl2EOiSqXfCgS7AW+MLl7
         zH4yMDFPvrPvi3+9tjv+lchTmKhacfz89Db97x2QzKS4nZKPJf4fhMhYDYIZEDEmYMU5
         +DVrBL8JKUp2p2s5pLk74BA7d/QHhKRY8Eme1AN02m5zKNIhTTewgLsGXM4Gyz5HsScQ
         kRTSRNZIFmCfwkEg19k3Hphtl9pktul4xDNZtKxtzlReCLkN2ZePB6Li0RLNoLsbGCCA
         KiLvKDkuIGrry03nrvntFcZOIRb6ev8fyyK3rT7wRGfTDooJjj97IpHGQ1BKlp9uiowS
         0YkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rLGFJYQY7FNzu0QBvEMYQJmcIxuqfFfvZZj7F7/W5NIA44IiHuzxpiiQRJFjCwcnjWdW4iJYgxuKDVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+uf8Burex7oF5BF9eKrjH7mq2V9VqaD5xSn84P5wEjWAOSY76
	3XoTtFW/s41E76RMSHVXrIP5QuD/2npJcqTP7Pq+sA1TRCWqX2cl+1hx
X-Gm-Gg: Acq92OG8p71CIP/E7H5T5b7QO4UrjKoLqok4QrW1UcrdbM7wXzGsVNZrY9/SNuj+Ab3
	BCsz47ufc0C96dTFouMcORRSZ9zJpqgyiVjz0ylyexh+7MQW7EaP6JkU+EBFw4DXzfri/wAkRP9
	IzTSiN4VZHn62BkpXwQJS6ksCRRBOa0W2+WHvTL3hK+0PABcuOOqBuz2d0BLZhehBBUMi9nzzWX
	DnVnvxUczbyD01dP089stKBgQzHT4USrq018ClZq1SJsbMc06H0rfZoKK9yIETR8ClnX12iCogP
	gJRLIOmPKXKYRkNe5RPCROx3MOuSxm1oa9hW8uPN8ufr12LqGs/+hnRSGepysFRcB73GxW2DDG+
	FfXJuLTBhBIfX7p5L9zDRqWXzc3ZfvZfehg5Q5RYsNfUHTGe4S4gwaH5FOdlUDUuQs3kPsqxitl
	hI7kVX6wqO9HDBIygH9Rgbdas=
X-Received: by 2002:a05:6402:4506:b0:670:d548:62a1 with SMTP id 4fb4d7f45d1cf-67e0ddef87amr8352750a12.3.1778507849153;
        Mon, 11 May 2026 06:57:29 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:27 -0700 (PDT)
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
Subject: [PATCH v1 3/6] dt-bindings: net: Document Infineon/Intel XMM6260 modem
Date: Mon, 11 May 2026 16:56:58 +0300
Message-ID: <20260511135703.62470-4-clamor95@gmail.com>
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

Describe the Infineon/Intel XMM6260, a 3G-focused, slim modem platform
designed for smartphones, data cards, and Machine-to-Machine (M2M)
applications.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/net/infineon,xmm6260.yaml        | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6260.yaml

diff --git a/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
new file mode 100644
index 000000000000..d34d7125274f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/infineon,xmm6260.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon/Intel XMM6260 embedded USB modem
+
+description:
+  The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
+  for smartphones, data cards, and Machine-to-Machine (M2M) applications.
+  The modem is usually connected via the application processor's USB line
+  in HSIC mode; however, to work properly, the modem must control this line
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: infineon,xmm6260
+
+  interrupts:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to the ON1 pin
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the RESET_PWRDWN_N pin
+    maxItems: 1
+
+  ap-wake-gpios:
+    description: GPIO connected to the EINT3 pin
+    maxItems: 1
+
+  cp-wake-gpios:
+    description: GPIO connected to the EINT2 pin
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  vbat-supply:
+    description: Supply connected to the VBAT lines.
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    modem {
+        compatible = "infineon,xmm6260";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <168 IRQ_TYPE_EDGE_BOTH>;
+
+        enable-gpios = <&gpio 112 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&gpio 169 GPIO_ACTIVE_LOW>;
+
+        cp-wake-gpios = <&gpio 151 GPIO_ACTIVE_HIGH>;
+        ap-wake-gpios = <&gpio 168 GPIO_ACTIVE_HIGH>;
+
+        phys = <&xmm6260_phy>;
+        vbat-supply = <&vdd_3v3_vbat>;
+    };
-- 
2.51.0


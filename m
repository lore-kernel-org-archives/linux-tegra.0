Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE01430CEC;
	Mon, 21 Sep 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988677; cv=none; b=Q+8SF1rIDVV75d6MUB6KomPhIycZ5kR4hc1wGROY6gyob4qI1Exr6JAzQZ/8JaTgvDP4PUEn/Yz3L8mrEeAj2ellXf1FjLzKjruWhSb7eDayLB11Ts7o7y2Jgny9AG4e62YgX+kHMB+zVpUM1IzVOwgnOMRLMAadf8anisrck7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988677; c=relaxed/simple;
	bh=jSuuVBlpSef5iuoN/mlS5h79+s0Sw155NGnBGKRWtBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d13yrfzmD9/XFwvXFPB1hplbZOTyDQN23+K7ovtRazXhObhqG80B7WS5O2v03eyuw6CQWDbf92iZ585czolR47LatRJKlkt4DumWAV7X6X90FM8kfmt98ybBZgii014uehv3KYGO6uhwZVua2JnKPUk+qdF4jxZPqZGbpKNunNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gU/qQHU8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gU/qQHU8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EC81F000FF;
	Mon, 21 Sep 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789988671;
	bh=iZCqbmeiHFb5rdxel++hBSJZRs8tjgQKm9/ukIOdAnU=;
	h=From:To:Cc:Subject:Date;
	b=gU/qQHU89z18qCQaUCE+09/PGmZM7ufVqHZ7UZs+D3KqgFlNZPUX6BwGTepQKkHmU
	 Bc1vZrHwcqRC3dzfkFbePdhhwuYBDw5VnTlHj6toIYKdeAk0ju6AMb8qH+HKEqdM1l
	 J1xCcJgk2cYdUUPf/Qan+4qyh35ae3Q8udkDcJLtueE4kKyn0R0K/bzK18MkkPfgE3
	 EALKTSAraLlN/H4O/1EiAydXWsbnfva4cT0jHOKYrauib8bvS8KVdwJC0VQJlGBKI1
	 /0qF1EbxNsZjdUVqQURAjwOQy3jsApt61XGkwYJmmo6NKOUVjXuRZhAmjWZ8EbPJG1
	 /XH5TApuzSuMw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: net: nvidia,tegra234-mgbe: Add missing properties
Date: Mon, 21 Sep 2026 13:04:22 +0200
Message-ID: <20260921110422.220832-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Being a DWMAC derivative, the Tegra234 MGBE supports AXI configuration
nodes named stmmac-axi-config and phandle references to them using the
snps,axi-config property.

While at it, add the 10gbase-r PHY mode.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- add Rob's Reviewed-by
- link to v2: https://lore.kernel.org/linux-tegra/20260902003004.453960-1-thierry.reding@kernel.org/

Changes in v2:
- move common properties to snps,dwmac-common.yaml
- link to v1: https://lore.kernel.org/linux-tegra/20260716212001.989872-1-thierry.reding@kernel.org/

 .../bindings/net/nvidia,tegra234-mgbe.yaml    |  8 ++-
 .../bindings/net/snps,dwmac-common.yaml       | 66 +++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   | 52 +--------------
 3 files changed, 73 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-common.yaml

diff --git a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
index 215f14d1897d..48e4798a039b 100644
--- a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
+++ b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
@@ -81,8 +81,9 @@ properties:
   phy-mode:
     contains:
       enum:
-        - usxgmii
         - 10gbase-kr
+        - 10gbase-r
+        - usxgmii
 
   mdio:
     $ref: mdio.yaml#
@@ -90,6 +91,9 @@ properties:
     description:
       Optional node for embedded MDIO controller.
 
+allOf:
+  - $ref: snps,dwmac-common.yaml#
+
 required:
   - compatible
   - reg
@@ -103,7 +107,7 @@ required:
   - phy-handle
   - phy-mode
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac-common.yaml b/Documentation/devicetree/bindings/net/snps,dwmac-common.yaml
new file mode 100644
index 000000000000..a38ff314b3cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/snps,dwmac-common.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/snps,dwmac-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare MAC common properties
+
+maintainers:
+  - Alexandre Torgue <alexandre.torgue@foss.st.com>
+  - Giuseppe Cavallaro <peppe.cavallaro@st.com>
+  - Jose Abreu <joabreu@synopsys.com>
+
+properties:
+  stmmac-axi-config:
+    type: object
+    unevaluatedProperties: false
+    description:
+      AXI BUS Mode parameters.
+
+    properties:
+      snps,lpi_en:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          enable Low Power Interface
+
+      snps,xit_frm:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          unlock on WoL
+
+      snps,wr_osr_lmt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          max write outstanding req. limit
+
+      snps,rd_osr_lmt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          max read outstanding req. limit
+
+      snps,blen:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          this is a vector of supported burst length.
+        minItems: 7
+        maxItems: 7
+
+      snps,fb:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          fixed-burst
+
+  snps,axi-config:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      AXI BUS Mode parameters. Phandle to a node that can contain the
+      following properties
+        * snps,lpi_en, enable Low Power Interface
+        * snps,xit_frm, unlock on WoL
+        * snps,wr_osr_lmt, max write outstanding req. limit
+        * snps,rd_osr_lmt, max read outstanding req. limit
+        * snps,blen, this is a vector of supported burst length.
+        * snps,fb, fixed-burst
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2449311c6d28..c5222c82e27a 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -195,18 +195,6 @@ properties:
       can be passive (no SW requirement), and requires that the MAC operate
       in a different mode than the PHY in order to function.
 
-  snps,axi-config:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      AXI BUS Mode parameters. Phandle to a node that can contain the
-      following properties
-        * snps,lpi_en, enable Low Power Interface
-        * snps,xit_frm, unlock on WoL
-        * snps,wr_osr_lmt, max write outstanding req. limit
-        * snps,rd_osr_lmt, max read outstanding req. limit
-        * snps,blen, this is a vector of supported burst length.
-        * snps,fb, fixed-burst
-
   snps,mtl-rx-config:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -558,45 +546,6 @@ properties:
     required:
       - compatible
 
-  stmmac-axi-config:
-    type: object
-    unevaluatedProperties: false
-    description:
-      AXI BUS Mode parameters.
-
-    properties:
-      snps,lpi_en:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          enable Low Power Interface
-
-      snps,xit_frm:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          unlock on WoL
-
-      snps,wr_osr_lmt:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          max write outstanding req. limit
-
-      snps,rd_osr_lmt:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          max read outstanding req. limit
-
-      snps,blen:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        description:
-          this is a vector of supported burst length.
-        minItems: 7
-        maxItems: 7
-
-      snps,fb:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          fixed-burst
-
 required:
   - compatible
   - reg
@@ -610,6 +559,7 @@ dependencies:
 
 allOf:
   - $ref: ethernet-controller.yaml#
+  - $ref: snps,dwmac-common.yaml#
   - if:
       properties:
         compatible:
-- 
2.55.0


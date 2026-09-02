Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A831B3925;
	Wed,  2 Sep 2026 00:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308985; cv=none; b=IYYRnDiRhFxeFpG+nzqSMEBX7qi3r9/Qa72maqa+Br6PXOBsxFAeLf+Ym+KDN6lyaM8ruXpbjd8LD2AgzjNFDX4v/R1OITJYXF+O1qYBic7Hejhkruz16nRTszZUdp/LKlv0bd/uR30XYlhwdNC3HBcMY0/zeH9HWRFks7GXi0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308985; c=relaxed/simple;
	bh=QXK/mriWN3GNGcNTGnDeVQKLwQeimxxRSqZx2Fmuf8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ano3QxTqqx6mB29MpQ66fIi0f7RcReWSe9f5lA26kfL6umQWI63O0NpLr/kS8rrYBZT9pYnfYT2daIQlviaq/qkSG8g248Un0jb8fHo6TUTtWrdThUHmpFxs/TcHSrvz5p6nKhX9hSvqYTDGcBwp8wUow1Qe6AUXTOt2B0IPgxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzuq4dcn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzuq4dcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09191F00A3A;
	Wed,  2 Sep 2026 00:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788308983;
	bh=flydqW+8fI41gXJurZxeh+9WwnzAF+RUMSX3VaAilHg=;
	h=From:To:Cc:Subject:Date;
	b=mzuq4dcnAQcL2+XvYA2vgmENAURdLjyojKs7TaT6oJUVw/Bvy4KR1JOH7QdgtBLcJ
	 ZORy271y5mC1bEp6ECzEPWZk+tijUrNouKRuk0s+XJ5wgkTijARHAfibaKSO38OncR
	 jG1wHH02CcXv4wujD5H89+kJzLx66DLGAv0X/EpWiWzidGdjVKhA+Z7h7hTRe+G0Xb
	 E8R56m1QaI7oFFeIgzSuf9n+6NMnkd/yG+dJBUote3crVyryFmHBfzv3Sg+yMmI++t
	 q6ApugnvO5XnZXdZFy+9oeW4viAdHKbKUVkPpRslVmQNonusj0wzs58bd+Z6lwwWKJ
	 zeW9TOmQTXx4w==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: net: nvidia,tegra234-mgbe: Add missing properties
Date: Wed,  2 Sep 2026 02:30:04 +0200
Message-ID: <20260902003004.453960-1-thierry.reding@kernel.org>
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- move common properties to snps,dwmac-common.yaml
- link to v1: https://lore.kernel.org/linux-tegra/20260716212001.989872-1-thierry.reding@kernel.org/

 .../bindings/net/nvidia,tegra234-mgbe.yaml    |  8 ++-
 .../bindings/net/snps,dwmac-common.yaml       | 66 +++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   | 52 +--------------
 3 files changed, 73 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-common.yaml

diff --git a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
index 215f14d1897d2..48e4798a039b0 100644
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
index 0000000000000..a38ff314b3cd1
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
index 2449311c6d28e..c5222c82e27a9 100644
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


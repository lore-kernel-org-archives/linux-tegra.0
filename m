Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A291824DFFE;
	Mon,  5 May 2025 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456482; cv=none; b=YVobqcYpFHWWH9qfoJfwu+hjb3bN8VDzS0Terw/e0k3uZfhb/ZBX1ETfXfiQiA4uPJWyk77LnWVH6ZatDEwQ8e/cF99LpUqvtbm3NgfsADrE48ksXcjQ/ERcX28Jr6xluR1khMJIZJ/j4yqGtWEN7PYn0PbNuTyr7OJu3CrSy+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456482; c=relaxed/simple;
	bh=c+pP4yQZXvYS3sVwWH2LIpaoNypsEQI8UTeEhqJ9hI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FrXpI3BEr+8nNht5oM1HwWUiVvEitNJVDtrEJbn1kzEGDFrlLEh0wDmkgvwlB1cvojPWH+tYL787h8WDgBi71RwKOGN2LwKL5CWf4AfKteLgkFWDRztGNe04IuTNKOYr6HxMrEforppHRkTO8Z2B3r1H7Wnq3JKCuUfiixQPYT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dpq3RVV7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dpq3RVV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC80C4CEE4;
	Mon,  5 May 2025 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456482;
	bh=c+pP4yQZXvYS3sVwWH2LIpaoNypsEQI8UTeEhqJ9hI0=;
	h=From:To:Cc:Subject:Date:From;
	b=Dpq3RVV7yLk0Xi0/nKkObZeulS8/ghbLaxUO280bsjU9BDrnWUfZmkWhorWT9eVhe
	 BRLGJMDTguBX9yguBiL6+6ttRACBjNMS+qSPLBxP67NrFpb7bxTv2xLovWnGa3niLc
	 PmlxiYh9erK7LSP5FjGvuE/8FAuc/8j7cXhZGS+z8cgLbWYKM2VEaRRweG7K6oxE7c
	 OXzT8zu70I9RrP7UNaoTG+Sc+m8DXV/JPahXJ/18pYEX+pLWOGgmaY7ipFQ9Gi5BB/
	 HKScGG0XIiM6YZrJYD5r7oGJsOe2Z0kwShmzbwrnjRZVZbMYut0t/kus6DcNwGx5m3
	 CULI6Dy0BXlGg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert nvidia,tegra20-ictlr to DT schema
Date: Mon,  5 May 2025 09:47:58 -0500
Message-ID: <20250505144759.1291261-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the NVIDIA Legacy interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

All the possible compatibles were not documented, so add the ones in
use.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../nvidia,tegra20-ictlr.txt                  | 41 ----------
 .../nvidia,tegra20-ictlr.yaml                 | 82 +++++++++++++++++++
 2 files changed, 82 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
deleted file mode 100644
index 2ff356640100..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-NVIDIA Legacy Interrupt Controller
-
-All Tegra SoCs contain a legacy interrupt controller that routes
-interrupts to the GIC, and also serves as a wakeup source. It is also
-referred to as "ictlr", hence the name of the binding.
-
-The HW block exposes a number of interrupt controllers, each
-implementing a set of 32 interrupts.
-
-Required properties:
-
-- compatible : should be: "nvidia,tegra<chip>-ictlr". The LIC on
-  subsequent SoCs remained backwards-compatible with Tegra30, so on
-  Tegra generations later than Tegra30 the compatible value should
-  include "nvidia,tegra30-ictlr".	
-- reg : Specifies base physical address and size of the registers.
-  Each controller must be described separately (Tegra20 has 4 of them,
-  whereas Tegra30 and later have 5).
-- interrupt-controller : Identifies the node as an interrupt controller.
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value must be 3.
-
-Notes:
-
-- Because this HW ultimately routes interrupts to the GIC, the
-  interrupt specifier must be that of the GIC.
-- Only SPIs can use the ictlr as an interrupt parent. SGIs and PPIs
-  are explicitly forbidden.
-
-Example:
-
-	ictlr: interrupt-controller@60004000 {
-		compatible = "nvidia,tegra20-ictlr", "nvidia,tegra-ictlr";
-		reg = <0x60004000 64>,
-		      <0x60004100 64>,
-		      <0x60004200 64>,
-		      <0x60004300 64>;
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		interrupt-parent = <&intc>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.yaml b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.yaml
new file mode 100644
index 000000000000..074a873880e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/nvidia,tegra20-ictlr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 Legacy Interrupt Controller
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jonathan Hunter <jonathanh@nvidia.com>
+
+description: >
+  All Tegra SoCs contain a legacy interrupt controller that routes interrupts to
+  the GIC, and also serves as a wakeup source. It is also referred to as
+  "ictlr", hence the name of the binding.
+
+  The HW block exposes a number of interrupt controllers, each implementing a
+  set of 32 interrupts.
+
+  Notes:
+    - Because this HW ultimately routes interrupts to the GIC, the
+      interrupt specifier must be that of the GIC.
+    - Only SPIs can use the ictlr as an interrupt parent. SGIs and PPIs
+      are explicitly forbidden.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra114-ictlr
+              - nvidia,tegra124-ictlr
+          - const: nvidia,tegra30-ictlr
+      - enum:
+          - nvidia,tegra20-ictlr
+          - nvidia,tegra30-ictlr
+
+  reg:
+    description: Each entry is a block of 32 interrupts
+    minItems: 4
+    maxItems: 5
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra20-ictlr
+    then:
+      properties:
+        reg:
+          maxItems: 4
+    else:
+      properties:
+        reg:
+          minItems: 5
+
+examples:
+  - |
+    interrupt-controller@60004000 {
+        compatible = "nvidia,tegra20-ictlr";
+        reg = <0x60004000 64>,
+              <0x60004100 64>,
+              <0x60004200 64>,
+              <0x60004300 64>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+    };
-- 
2.47.2


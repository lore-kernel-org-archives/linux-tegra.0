Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6529ACDD;
	Mon, 23 Feb 2026 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857210; cv=none; b=WSDDCtTkSQtSi/rjAtfdwvr9xcH5hgYZ+OLQPAQudZxfuPVF7XyOCjdMsXuIrGRX53K/gTPMOTCLNrHo2UtJjN6jEGNCBN5shgZQNhfNrVh5xX6EDz0FG/xp13lBbrIYbAVzXEoRERu7Hyw03SMQ8Mo4RTVmWEoSAPwKQDhCPAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857210; c=relaxed/simple;
	bh=pcEJP6M+2YimMpG4c++3ch724oeThYKZtO3hE64tZJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UauwBK490BDyylvwdwfMwBPTbIZkGwlFkBrMkxls9aggdFmyoeX9iE4v58YOkViGpTAfEcve3gmGD0o1BsxGCYazikS2E3gQbeabtM4OVZf2lygaOElkq7w/UukKw2/dVYWkZhEg1P2jCwJ7nfbyuTyOV6XgRFUazVjWCJkmGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMHITJMC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMHITJMC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC99C19423;
	Mon, 23 Feb 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857210;
	bh=pcEJP6M+2YimMpG4c++3ch724oeThYKZtO3hE64tZJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mMHITJMCSkWsiS5fWf8WN8Raj4yTTRoIRSTp0GM0oX3NJWjgOL3Si86jZU+qSUXlY
	 nVuLDTqXu7xwQIoI3oYGk++dbPUeTUCR+/YLF96MSpNdvsYNGMGcYrw00Uzp3LvWXw
	 l2DZuMQnbZ37oq/l9lcbf4C0/Y9cefrGxFGLxqekF62xFtE+7QhVf+hGtU7mrDvryr
	 1lOpDGfUS2DBypUbMikFrSAIrehyTf8AvmNcmyEAZoEw2Z2SiT74b5I+i5Vj929vBg
	 qdDm3T+gIZ8pvOG+ZlAKvrW8DoFAlTu3zG8j7HhiRKlY2ruM8eIwjZngvcyrKPl3w0
	 tyYfgHs6OQ4lg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 07/10] dt-bindings: memory: Add Tegra210 memory controller bindings
Date: Mon, 23 Feb 2026 15:33:02 +0100
Message-ID: <20260223143305.3771383-8-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223143305.3771383-1-thierry.reding@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Document the bindings for the memory controller found on Tegra210 SoCs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- drop unneeded node alias

 .../nvidia,tegra210-mc.yaml                   | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
new file mode 100644
index 000000000000..7f003fc422ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 SoC Memory Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The NVIDIA Tegra210 SoC features a 64 bit memory controller that is split into two 32 bit
+  channels to support LPDDR3 and LPDDR4 with x16 subpartitions. The MC handles memory requests for
+  34-bit virtual addresses from internal clients and arbitrates among them to allocate memory
+  bandwidth.
+
+  Up to 8 GiB of physical memory can be supported. Security features such as encryption of traffic
+  to and from DRAM via general security apertures are available for video and other secure
+  applications.
+
+properties:
+  $nodename:
+    pattern: "^memory-controller@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - nvidia,tegra210-mc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+
+  clock-names:
+    items:
+      - const: mc
+
+  "#iommu-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#iommu-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    memory-controller@70019000 {
+        compatible = "nvidia,tegra210-mc";
+        reg = <0x70019000 0x1000>;
+        interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA210_CLK_MC>;
+        clock-names = "mc";
+
+        #iommu-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.52.0


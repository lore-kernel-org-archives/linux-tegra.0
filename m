Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B21AB534;
	Tue, 10 Sep 2024 23:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726011868; cv=none; b=FMfpr88eXbZ1R8VnXXAsxT2iArF8iD3hQTHCzlzrWH3QaGjO80/LAEY5NQHm7RO7pQE6PO3SW7cIUZtthNWV87KPT/+I6HqSGUbeNPQM3xBI0Izj1chyO3IYyoRj30eLcM1kV3BYf4ar4HzaMYWW++/JgC07sFScA03f1NEQ2Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726011868; c=relaxed/simple;
	bh=K0LaUYF1SwsKZiGP09g/LWGz/cecN4xLr1fBYM3V/gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I7ZP0VdI98hMjgzT+KdH0iVOUvTvLmY7m7LlnkIrmOCk4YsshtkC214XDfCUit3p3soP3qpH9GUfwN/IWF2qJVFzdsg6PGYUER2ScQIbkDT2+aGp1QlOMDHsRBtKplTaCf1Ovw56x70h44wO7BADPROdFRNYDzJ02qft+ijht00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+hYP9V8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+hYP9V8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01273C4CEC3;
	Tue, 10 Sep 2024 23:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726011868;
	bh=K0LaUYF1SwsKZiGP09g/LWGz/cecN4xLr1fBYM3V/gw=;
	h=From:To:Cc:Subject:Date:From;
	b=K+hYP9V8+vDjNgJhT/PXAOeQQVXJIiklCRJMx30tfeR+R2319+N+PY58oZfsKEbNT
	 UNUXstjvCCs8aZRQojyT9rN1qW1/UOa9bK7UP7QmBlFP+mXVcfamX4UFZvrB9+L/is
	 W/Iz9YK0cjl6A2wg13cqtwSIA4E2cCkp3xFXj2/6E82t2Uj/DPzNf490ki0fhksQ63
	 qCRPepKmoh4QLoq52PhbBw+89poB6dIVRsyojo2NASibwhHZc1z5ZipzG2ZaD70f3Z
	 Zg0LReolWj9M0xNYsxyF9O7HzRtmHdWcHCp0f+OIEisBAci3g/e5XAbe0Cv0lVf9EN
	 EWivpwuVgtxjw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: cpu: Drop duplicate nvidia,tegra186-ccplex-cluster.yaml
Date: Tue, 10 Sep 2024 18:44:21 -0500
Message-ID: <20240910234422.1042486-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"nvidia,tegra186-ccplex-cluster" is also documented in
arm/tegra/nvidia,tegra-ccplex-cluster.yaml. As it covers Tegra234 as
well, drop nvidia,tegra186-ccplex-cluster.yaml.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../cpu/nvidia,tegra186-ccplex-cluster.yaml   | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml

diff --git a/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml b/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
deleted file mode 100644
index 16a448974561..000000000000
--- a/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
+++ /dev/null
@@ -1,37 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/cpu/nvidia,tegra186-ccplex-cluster.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra186 CCPLEX Cluster
-
-maintainers:
-  - Thierry Reding <thierry.reding@gmail.com>
-  - Jon Hunter <jonathanh@nvidia.com>
-
-properties:
-  compatible:
-    const: nvidia,tegra186-ccplex-cluster
-
-  reg:
-    maxItems: 1
-
-  nvidia,bpmp:
-    description: phandle to the BPMP used to query CPU frequency tables
-    $ref: /schemas/types.yaml#/definitions/phandle
-
-additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - nvidia,bpmp
-
-examples:
-  - |
-    ccplex@e000000 {
-        compatible = "nvidia,tegra186-ccplex-cluster";
-        reg = <0x0e000000 0x400000>;
-        nvidia,bpmp = <&bpmp>;
-    };
-- 
2.45.2


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A8932B13A;
	Thu, 16 Jul 2026 21:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236809; cv=none; b=RpvzkKusm8XXhy8ebI23FpgNZtWyKdEXXdrFxG4kS5SylLs2rNNwo1G0wAlcBnIX9xOO46W1qzp+qOX0OgZnrGCqUkCJxwnRXYuO7hE0brj+JKFN350aozS8t5xXBPK25pk1GNnMKtAIooz9FVxLUPjfWdPC35Gd+OxjXVPEvgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236809; c=relaxed/simple;
	bh=EcfhWibpFEPulYfMMQFW6Hr29cCrBKwkRnknXBDB/n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0e1PmgtgxIB5uFLd/AOSAnVxfEJcv97LHVdml6CX0Q7jNSc/nVpsaLcg+uETPWWCwjbLXJ7rxm6OkDPveq46eXaEzNhPOy7WwZIsto4M1hJTKisjVIEwndTF6gEABSpUECUMmKM92Btvq8gjmp3WYSPdzKBqgwWSQiiR5eJpPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaKf6paE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaKf6paE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1BE1F000E9;
	Thu, 16 Jul 2026 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784236807;
	bh=PQzSUOCuND+KiCs86J2t1+Zd0vha6kB16YYm6fQ37dg=;
	h=From:To:Cc:Subject:Date;
	b=TaKf6paEO6X9VDZ3SpKK/HWxCZBFb9+d9QAwgo0cUN2AE7eUCd90+nFMWM/IfZQ9o
	 fG6+q0z6mIsbIl3YSI2cyCJgXjHoE7BALhL8m+vMJhMSs7MyTJVptrH2fidXB+KE8C
	 OYMFIdYb4UhzOVu/7LItb/zPbqeGJsyc+tUdfxSelW3Gsx/hrpHK6mJMZU4Hv2GmdH
	 DMgC5i2X9qx12h1ANqPHXIqPLD6TTqVahaLUwPFtxTWHjMpdPAg5c+sivaXb0hEvzq
	 9IPdgZb/QxfMM3cvjPWQC+beAejUbx/N+rBy9yoy9kGXa7E32Cj9wsAoQN1R8LT0rJ
	 Z4x9NWVJnCjWg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: nvidia,tegra234-mgbe: Add missing properties
Date: Thu, 16 Jul 2026 23:20:01 +0200
Message-ID: <20260716212001.989872-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
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
This gets rid of the remaining warnings on half of the Tegra234 boards.

 .../devicetree/bindings/net/nvidia,tegra234-mgbe.yaml    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
index 215f14d1897d..dc897e312c55 100644
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
@@ -90,6 +91,12 @@ properties:
     description:
       Optional node for embedded MDIO controller.
 
+  snps,axi-config:
+    $ref: snps,dwmac.yaml#/properties/snps,axi-config
+
+  stmmac-axi-config:
+    $ref: snps,dwmac.yaml#/properties/stmmac-axi-config
+
 required:
   - compatible
   - reg
-- 
2.54.0


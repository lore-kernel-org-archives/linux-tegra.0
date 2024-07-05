Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7FE1CD02;
	Fri,  5 Jul 2024 23:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720223589; cv=none; b=eGK/wQv5Dd/MH2xNWw0X9lEe9JolwcHwmTBTrGPrUrdIWCcbhG9y48MqCsj9b0RYol3GPTuULmyOsFz5vO/z3v3Ig/7ZhtMXZkPM2njTktUgFwul8VZ/hvyWgXf3OiYH/ImNjvLvGDRubSMlVDdGwxX/PftFYGEEb5wGDyCVBII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720223589; c=relaxed/simple;
	bh=3air+A7ccHa6fsMOmaDa+MESI0V1oa0oHDRzEst3Yt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JePwr3Fkc0ddkN/baqFOmnlnHJzQjnqlBWpna1K9MAaz53fsUBdvyvIXuhqHLIQwgzIXlfzxQWren/4fms23sCcWkZWgAU9ejxPLdmldrRpW4sEZrNMZv3erabBXwdMY7hvbft8n5wr30HImGfxKRzlxh/YsLg4L2IHqW//d5Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=i5oKoVHp; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="i5oKoVHp"
Received: from newone.attlocal.net (76-224-187-148.lightspeed.sntcca.sbcglobal.net [76.224.187.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 85AF7161786;
	Sat,  6 Jul 2024 01:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1720223581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=juajFapR18+rbVIe+VNt3xVKZE6hUrFZ0A5oAknWLJw=;
	b=i5oKoVHpRHN3FLZ1ZMQggMLHzjgTx1B7KGZGxk+TgsCaVr4+rpgHT7vF1SjQaPVXZbjiyF
	UZVW0XCGtlanRZSRMSWs5cDzui32pTPxlL2bJo5xMe1sWYc2QJBz+TUjII9HMrdMJPChxW
	3a/eMRmGR9E8Go0ZQiozyMtqpL2qR9o=
From: David Heidelberg <david@ixit.cz>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: tegra: Document Nyan, all revisions in kernel tree
Date: Fri,  5 Jul 2024 16:52:43 -0700
Message-ID: <20240705235254.126567-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid firing useless warnings when running make dtbs_check

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/arm/tegra.yaml        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git ./Documentation/devicetree/bindings/arm/tegra.yaml ./Documentation/devicetree/bindings/arm/tegra.yaml
index 8fb4923517d0..2889fd0e6592 100644
--- ./Documentation/devicetree/bindings/arm/tegra.yaml
+++ ./Documentation/devicetree/bindings/arm/tegra.yaml
@@ -127,6 +127,48 @@ properties:
               - nvidia,norrin
           - const: nvidia,tegra132
           - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-blaze-rev10
+          - const: google,nyan-blaze-rev9
+          - const: google,nyan-blaze-rev8
+          - const: google,nyan-blaze-rev7
+          - const: google,nyan-blaze-rev6
+          - const: google,nyan-blaze-rev5
+          - const: google,nyan-blaze-rev4
+          - const: google,nyan-blaze-rev3
+          - const: google,nyan-blaze-rev2
+          - const: google,nyan-blaze-rev1
+          - const: google,nyan-blaze-rev0
+          - const: google,nyan-blaze
+          - const: google,nyan
+          - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-big-rev10
+          - const: google,nyan-big-rev9
+          - const: google,nyan-big-rev8
+          - const: google,nyan-big-rev7
+          - const: google,nyan-big-rev6
+          - const: google,nyan-big-rev5
+          - const: google,nyan-big-rev4
+          - const: google,nyan-big-rev3
+          - const: google,nyan-big-rev2
+          - const: google,nyan-big-rev1
+          - const: google,nyan-big-rev0
+          - const: google,nyan-big
+          - const: google,nyan
+          - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-big-rev7
+          - const: google,nyan-big-rev6
+          - const: google,nyan-big-rev5
+          - const: google,nyan-big-rev4
+          - const: google,nyan-big-rev3
+          - const: google,nyan-big-rev2
+          - const: google,nyan-big-rev1
+          - const: google,nyan-big-rev0
+          - const: google,nyan-big
+          - const: google,nyan
+          - const: nvidia,tegra124
       - items:
           - enum:
               - nvidia,darcy
-- 
2.45.2


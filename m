Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9C28DA0;
	Thu, 18 Jan 2024 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705588035; cv=none; b=b9CUYuSSMqrbYVzEXqMbCGHaSOCtyCyPo+GKUD9fT973kGRZ+Iy5YWtIndt0w7Aw1PjDUMjVKGSxffqyXeO8tEDAuXZFCqLNyq6WX0PNPoTFMIrDw+dxXSSP6rp6xVOTzQhqZum8rIzoUN4j8dje3QMDQrrr8tg9FuwVQ6khmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705588035; c=relaxed/simple;
	bh=D/j1GyU/L24O3ZaC2Hu+cNxDta/9tJtjWFVstkMIzIY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=DutxdlCXiCEW7IaEDbTc85kynNLvpJoSvbwlSwtr3jm/PNYDqJRpmHQ1tSHXE6Q8lHS68NBApIdH0EgnTCv7Qr3Mngls/yP02+EJ/BVsSRS0SNcs3IeymgKR/ZXcC4qIfO7fFp13u8raBlJ5QZjLcn3w7+wVGEMU58QvBI7QBPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PP0HN0nS; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP0HN0nS"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd33336b32so163120831fa.0;
        Thu, 18 Jan 2024 06:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705588032; x=1706192832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6jqBnJDEB9rQIrzONP7qHzsTRkK7g2PlbbDf8zY10U=;
        b=PP0HN0nSevwdZUvF+4XqFDhtWlArZqF7IFWBF7ngvzrsVET9k0sdNqkWLxvgzZ9SqW
         HCBVTiHcd371ourDs9tcOv2TdmueiIiT4h/S4ag3O9LpMMnhmxTd28KzF+X/ox4f06zO
         p4z5kxGyWZsrTx+DSfTaHVNNajsxLgycjYvcXMIjZ5UPZjx+SNe91Wt9/cdc+9xInQAs
         khl3nphv/FHKg8PV+sc+xrm55gs1S26h7FBPAyCtkijdbubLk1rcEpXulHvbkvZnOMgL
         2ejnyj1aFqyP9EJnNmXAA4lsrSdMkoEPpOuK+WPNCnRqK4CXd/34W+AanYjPaSyJbXUU
         DUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705588032; x=1706192832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6jqBnJDEB9rQIrzONP7qHzsTRkK7g2PlbbDf8zY10U=;
        b=ObtJq5fTaLl3PgCSgU+A2vGTNS0slU9g1FFnJElanCNp3bFvuSPWjVUepiMSmjEmku
         m+REDs+eDU6IZwXSdvjxiXk+VGiqavV3aiM5/0VR1bfT8JxbPMgMKq/bU3Zn3V/dOgDw
         9vz4iHubN0RSpdK1gywDaGY2hliKZMaxSEJGFxsJYosJwt4sPhFYuhp9JSgxdtpRckVY
         YMH65gK01f06S+mTRBoRaGHq7l2a6P/BLb01NRdDm9XZjztLjEI1vkZ3JVPAygZ0l+8F
         IHJ4Hr7TQeo5Xl7Qkb7dI1rwONuz6l8Oew+BRLX9afqh19xu/qU64bgmRguF0kKbN4VX
         FT2w==
X-Gm-Message-State: AOJu0Yx/rI13+/gRV04eNkFIFk+9siKsPq4oovNiDcF8ImDpgbuEjgEm
	x1gssQfw3OFvo7ZO8H3fEGRbpkN2eDlVKsmO4Zzo5oNcjnLMYPgx
X-Google-Smtp-Source: AGHT+IEeOM0dwWYDfghipCkz5lzmM8tdOo/kIrgn+dBJuNQ2p9ay+gQ2EYlkmJ0mDgcGiYSmvksD5Q==
X-Received: by 2002:a2e:9087:0:b0:2cd:9e7b:533b with SMTP id l7-20020a2e9087000000b002cd9e7b533bmr615313ljg.43.1705588031796;
        Thu, 18 Jan 2024 06:27:11 -0800 (PST)
Received: from localhost (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p16-20020aa7cc90000000b00558a7d36956sm9354556edt.0.2024.01.18.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 06:27:11 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: tegra: Document iommus and interconnects for ADMAIF
Date: Thu, 18 Jan 2024 15:27:05 +0100
Message-ID: <20240118142706.4179146-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The ADMAIF is responsible for accessing system memory on behalf of other
components of the APE, so make sure it can be hooked up to an IOMMU and
memory controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/sound/nvidia,tegra210-admaif.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index 15ab40aeab1e..59304f02d063 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -39,6 +39,18 @@ properties:
 
   dma-names: true
 
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    description: Description of the interconnect paths for the ADMA interface; see
+      ../interconnect/interconnect.txt for details.
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
-- 
2.43.0


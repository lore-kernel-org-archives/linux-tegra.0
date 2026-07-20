Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54F93932F4;
	Mon, 20 Jul 2026 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529080; cv=none; b=r+SMC6xqNrsW0xS5eNciUJAlk6EAUDN3R/SvkcK+eYa1Us7r+fUo28ESsIaxHi8yCfqP/RSpCKkux9ilIhdx6ynRjod37jOwmRrbzrrQlm2TYd1mwJ2OMHIsoJAT8Cu8CWB1hpjN+xyc0+HFmAmalFIAEfLe/BJo9gvQbywLzJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529080; c=relaxed/simple;
	bh=1hDSMLgLyG4r7aDcrmuTyFVxz5iMDULMMz9gLYjmuFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okdV/FaK8D0NP5NXIEPQA8M47C/mtnXgtGxLaYNmypJ2PZaQ6aJwBIeZHiERulWQ3wXQRFLUe81qeSarg6Xf6+6VyaIQkucRXrKoaLl6PRJVK9mvv/QaOH9tXBw3GwLd3EOYoXvC64+520T5qU1DKXh60BUpxr2yL5whPg7IVvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlndT2eg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlndT2eg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22181C2BCB8;
	Mon, 20 Jul 2026 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784529080;
	bh=1hDSMLgLyG4r7aDcrmuTyFVxz5iMDULMMz9gLYjmuFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AlndT2egxHJ8v0JIV4gTdyw6Y5BFSHHO/4f7RZISFcjUTloVFle7AC0qgcD13QZgh
	 s5Ha+FQ1TIH02bgPIwW60Fkhcf4yG6a7H6Y8I7Js58EAYAPMvesgU96zN+e0k5kyqF
	 Dx/M7lCWaQMVo4cCiOFcbMk9ZQuyNLvH/YJb14q6/47GksT3mSWyvawlREj48QzedT
	 8HHQ8Q5mikW1PIYC61DiHDXD+HQYaaubHcrZsPrU8yhc86+xvMnXzRak+yA4sfL19r
	 UMplhyah8Bd2Kd237TKmAvLAIJ3IfURsMuPjS0oN/VTeqRh51v/uqHy0msFSr+HW8i
	 Qrfm0EVLuo0Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B92C44515;
	Mon, 20 Jul 2026 06:31:19 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 20 Jul 2026 01:31:15 -0500
Subject: [PATCH v2 1/2] dt-bindings: soc: tegra: pmc: Document Tegra210B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-t210b01-pmc-v2-1-ca5317f8507b@gmail.com>
References: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
In-Reply-To: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784529079; l=1150;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=yw+m2fOBOYUMmvsIg1cUM1xOEdkHn5gdrf48UjW2H8k=;
 b=27TZwk3eilNkHuxizTrcGSCzkeKKTFvhxFV48HhzMR1bJ9B5+hw1tZZY8qi//lw1cRR+4dOCi
 Lg/chziQ9zPAL5pIqTUlpGW2nBcfmfDB3PHwZOw6OIefdPkSWu6LTT3
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The PMC in Tegra210B01 is very similar to the one in the original
Tegra210, but has a few powergate differences. Document this soc.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
index f516960dbbefb..8ec36c49f9594 100644
--- a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
@@ -18,6 +18,7 @@ properties:
       - nvidia,tegra114-pmc
       - nvidia,tegra124-pmc
       - nvidia,tegra210-pmc
+      - nvidia,tegra210b01-pmc
 
   reg:
     maxItems: 1
@@ -346,7 +347,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: nvidia,tegra210-pmc
+            enum:
+              - nvidia,tegra210-pmc
+              - nvidia,tegra210b01-pmc
     then:
       properties:
         pinmux:

-- 
2.54.0



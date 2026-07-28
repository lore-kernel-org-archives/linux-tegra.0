Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D692EBBAF;
	Tue, 28 Jul 2026 02:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204013; cv=none; b=PevzBArsNeM04Gt0BuhbkA1uwxtGvOlcVSMa2IGiJWt/gIcWS9Q9pErqMwLZgHy30fFpBeD/jAD0/OD4j2D7AOchG38JICtd2l3AiXxcmqDOuWABB1D/RPS0BwLlwSG2eaSAdMpQXZW8brxlI/2HOrIxzbhAq5kr06bCqjNSIf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204013; c=relaxed/simple;
	bh=z7y0OqKWQHRkAmpiXbkzZisXX3IcOL0u+hBa3ZmEwDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvCjOd3sBznYZejH6V/xSqUQBpwt6QfCDNlc2rUNhtDZX0efYb7u7ibBfiqKY5GIrCg2rmiwD3cM/2QZKF5pp+32Xjm/pJXXABp3RxGX3GdP6yMtxdekQZkvYe5E5gDppfJI24cqSIIIJkFuNSpUjA4gLs2lFovwQ3ipIMRkmM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6s8wL2j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6s8wL2j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E20F1C2BCF7;
	Tue, 28 Jul 2026 02:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785204013;
	bh=z7y0OqKWQHRkAmpiXbkzZisXX3IcOL0u+hBa3ZmEwDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U6s8wL2j5CHtR2NMuNF3QQsQA1a01z0bOk/OJapx6vMSrEMC2y4vagET0w3Jx/IsY
	 U4IeeYG0M+YN6lPgM1VcJaXP887CdS/SH6mbJ5gmR+6jGmmicFLTxkNdXogbhODpd5
	 ZAw+KXFDoXFbs82iB/NyWftteTGlKXm6eXwu04RHIygAxDV1klhWCCzOSPFxbJ3LZe
	 1NQhq3Ixt2Bbu6eJf1MwU1+Vvp0Lgm0kZphTRAfUPGkrXjZxP7fLmF3g6I+ZbhibAB
	 0Ilf8cyHTJiAaIfzND1F38bIbxsIelElGuaY8GD0dvTz0MnyFyKm2vFePybZchqQl1
	 NBDEhgCuII6Kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19BAC53219;
	Tue, 28 Jul 2026 02:00:12 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Jul 2026 21:00:10 -0500
Subject: [PATCH v4 1/2] dt-bindings: soc: tegra: pmc: Document Tegra210B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-t210b01-pmc-v4-1-af68a21cd746@gmail.com>
References: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
In-Reply-To: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785204012; l=1197;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=yRm/f+3SzoxTxtTfaa81bdhigcB8fmUxP2kKtIxqiLM=;
 b=V74wc8C5cA0q8JaHULgbddhEEJ0ybLI6TlykCAEMX8WZr+zab7zphBi23Z3LSr+8VkMQRUT5V
 J8vqpL7UQbWDEtmEkHrciN4PRAcVxoKxBHVGWxOjXcAWvt43j8Iaokg
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The PMC in Tegra210B01 is very similar to the one in the original
Tegra210, but has a few powergate differences. Document this soc.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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



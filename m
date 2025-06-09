Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6CD27FB3A;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443084; cv=none; b=YbuImzsi990rKMC/G5OOpV/FmjIFKooTdIhTA1thQ6FEowx/HDMlfKt7vmR3L4oOTHAEPjQwkYWfAhw/U5Zo3WdInwhS7xDkQQVs9BEd+dF6Mhr6oI4eM0TtWlXLYB7xO8jglA1weMZsBCHy7Un39UEHVRim4odA3XLDivB7P4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443084; c=relaxed/simple;
	bh=y2KDiGFVN2E0uNPrmpmKzbrLaLAG2mA/c4APtL9vVAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWkayd5Y+3y0+Hlulgu4KjUbwo56Iv2YDpBqhgVi8EVdq5JbUAShHMRuzZyFGhcWOjJKLYMHlAN2l7ODurQB6eJQPkumXHSDO3iY5fPqST/MMJrtZOsd+jjn+sKJPWfM9op76vgrIQJ1Q4M4e1RaZukESV4Jkx8joip3C3RMWFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vK3w2+tt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vK3w2+tt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EBBBC4CEF2;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749443084;
	bh=y2KDiGFVN2E0uNPrmpmKzbrLaLAG2mA/c4APtL9vVAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vK3w2+ttCixgOCXr91ClHManiJaOIAV3uvwdAvRvSy+tCWCDK0bGCZMC2LMqJV/vB
	 GR9FSBnNIjeT9FqFXT3hk/i43Y5JujkF05fonhdARa/9B2vZF8JnF+uWp4dzNWylMC
	 PO44BuMnpp3JR+RtH+IfpEnM6Oco9ClmY31v+MbMFVmRvzTaF3vBVa/xlLnyQ0zQTy
	 MVQrd9+wtXVJ8KmrmVptBDQZiWmAyT3rDQQbhswZ48VO99h1wNW2sdRl7FMgkASEAn
	 noWQv1ZYHz04+54fQPIYJYXja/P6QZllj73FmPezvE3Yot6p7lc0Mn0g68+z27MLxp
	 ki0C8wrON+STg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F52BC67861;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 08 Jun 2025 23:24:35 -0500
Subject: [PATCH RFC 1/2] dt-bindings: arm: tegra: Document Jetson Nano
 Devkits
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-p3452-v1-1-4c2c1d7e4310@gmail.com>
References: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
In-Reply-To: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749443083; l=966;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Mf60xnJQd3ZVdGzSrZSW00tSIcBNG74s7GMDdM+0Kik=;
 b=2Lqh4fWdLX5T76tTOiUCOHGqxsOJHofXlBPX1SLJRZfgOtlT+ysSxbp0sK9pKJCH77n9V34R0
 eXgzORgn2g2DNtX9ORP4Yz+VL1xGE/ijEwGyLxwBUd/S0hdBZaVaOdN
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add compatibles for the Tegra210 Jetson Nano Developer Kits

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 9cae3268a8274fd3a38580939c79a6f21de48a3f..d06d6474776ec679080aed62cab729af73ade53a 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -173,6 +173,11 @@ properties:
               - nvidia,p2371-2180
               - nvidia,p2571
               - nvidia,p2894-0050-a08
+              - nvidia,p3450-0000
+          - const: nvidia,tegra210
+      - items:
+          - const: nvidia,p3541-0000
+          - const: nvidia,p3450-0000
           - const: nvidia,tegra210
       - description: Jetson TX2 Developer Kit
         items:

-- 
2.49.0



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5B7283151;
	Wed, 11 Jun 2025 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668026; cv=none; b=VB8UKEsFKi/Yp8f9ngI18UTVJNjKA6pnxjsH8GJN+qRpug3Stox7upg+lB2OgNsrPvNTkMhPSMdZzkK18wO6QWzLjKnuS82fT5Q+13iDxawfdFgBJ88f/y9fTu+E8wyqKaRvTpxHODAY6HYRPz8J3yD1LY3NwMQVTQFueY2gPMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668026; c=relaxed/simple;
	bh=y2KDiGFVN2E0uNPrmpmKzbrLaLAG2mA/c4APtL9vVAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5G/YCsGNZSWXTnY/nSgL85qUWVDSFmOlibO4EqGSwJ56K1pT706T5xvnmwDZDlsB2Axgx0OYt8B8nTsiayOgoQ6I6b97xkION0t2/c/Kty9NE7xstgn8MJXUhadgfmbYk/AnCYdekCJgD8/Nit9F1bsL42IKZRfYw2YTmlTc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnXj/WpL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnXj/WpL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBEF6C4CEEF;
	Wed, 11 Jun 2025 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749668025;
	bh=y2KDiGFVN2E0uNPrmpmKzbrLaLAG2mA/c4APtL9vVAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FnXj/WpLw2s68lCA4eBK1+e9a54t9z59X0+bgppx3rNylgPp0cLNvXrxw7Xxg/Un6
	 oi8dxuZV1hXCt63/Oe/zMI2xiVJrKLq/EuAIc7KuSScQcCcbqowtYw4tVic8wEZAFP
	 0sS6BPvFDAsde/DEVHZ7Qg1HtQYPYoki5n60tj+CrHEfQTMc99PtUeMWctKy3jYlXq
	 zaqj6Q1wAnYXtARh5HYRUbUEGIjXsR9/aYALczlWY5YQqK4guqIw0PCV+cpVcSgjJp
	 THfAq7GsiOJsagjcxxQ6jIRTsQSjyrHmoUnGut6rXtLOIcwtDeH5TX6XKuHXuI9dHW
	 pcCfQvhQSFqWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5F1C71143;
	Wed, 11 Jun 2025 18:53:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 11 Jun 2025 13:53:37 -0500
Subject: [PATCH v2 1/2] dt-bindings: arm: tegra: Document Jetson Nano
 Devkits
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-p3452-v2-1-fd2679706c63@gmail.com>
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
In-Reply-To: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749668025; l=966;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Mf60xnJQd3ZVdGzSrZSW00tSIcBNG74s7GMDdM+0Kik=;
 b=Xe068+lWKL4lGkaMLThe2Yderci7TkHRZdiLjhgEWE4TX+Soqt1G5+9RUNHZKCMIpsT6Z5A8E
 H3Upl2W5Bt7A2XLViaJQAW8mQD92+bYd4tlNTLcTwm19dM0N0YcWP7S
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



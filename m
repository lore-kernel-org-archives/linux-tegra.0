Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A631E5B70;
	Sun, 18 Oct 2026 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363577; cv=none; b=Em3Aez1S2mzCk3DjBOm+EFZNS18Az6Ju4gnYZRXwSXNcn7ZNxUnSdt9dy+oZA4FkNZrwWa4C3MegS4waoOG3i/EK4Fopa6Ot0eij+aeRIRCehehc7m02YLjKni0b5YCZUB7cOaNYhtqXw844nyZUvXbzYElOuYb1QcGQEMYN3go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363577; c=relaxed/simple;
	bh=LBCu2KRVqOfit/MkRfMvnK2hUgec8JaeoTFyoYDlpAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAVIIg0JA0d2x8K5sLzDn2m/EKIyAQujm23/eCKdGVqxgYWenNCrTDutA1JEd2Yh81BElLcxROWyesYw9wtVdy+7eQAF3kwHUzYavee7cELDOMq5Oa5jUxI9Dt0s1su2rYgeITjGPa5osEv/BRUotSGSKNW+0K/4dUPVgf/piVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUlcNj8Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUlcNj8Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01897C2BCF7;
	Sun, 18 Oct 2026 22:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792363577;
	bh=LBCu2KRVqOfit/MkRfMvnK2hUgec8JaeoTFyoYDlpAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IUlcNj8YwjNdjmevTXyoT3ZVxRPdCe06AuUT/hoMB6Qz3sWjUmSdN+pQ64ID/Zpb/
	 lckwVLHrt72SMJn3dqIdbGzbxlG3faxTk5QDTyzepP6UJwfUIweU0B3BcxLXSeSR8N
	 XSzhHPpigWOkWdlA+Igj0XhNy3+GhpFFCoDoBwxw7P0BHc/uMwF+0X5GaZd7s7pcB8
	 VXaKEWVGQ05pp5Gavky3mDx1NKAY31/lD+/7wd5N0+GRO4PtvZPmOBY9188ZB0CTSv
	 m6PswGTZCTJ6DZbpdIDn6tCPZDduiNKqsUJ7Pe/zxBZycRE/UG0+WUHFtDVA1mCRZA
	 aBLkc3x0DAWRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BFBCCA490;
	Sun, 18 Oct 2026 22:46:16 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 18 Oct 2026 17:46:05 -0500
Subject: [PATCH 1/2] dt-bindings: clock: tegra: Document Tegra210B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-t210b01-clocks-v1-1-d9e980925925@gmail.com>
References: <20261018-t210b01-clocks-v1-0-d9e980925925@gmail.com>
In-Reply-To: <20261018-t210b01-clocks-v1-0-d9e980925925@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792363575; l=1492;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=+2MT5ALtyU9NySHAX4cBnfOT7/nZv03MJwQ+eZjNuOQ=;
 b=6Nu7zPnaMhSe2cnNejDPmLjT1ha3b/3jbdEPO5JJBDG2m4nu4x/lRgN0A1ddZlbop/zB+ZJe9
 fScb8lzQBj6B/xs4szhI3S+PCg0h4TjxDUNA2BC4fgbhACussP1cZ0z
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

* Add the compatible string for Tegra210B01 clock and reset
* Add Tegra210B01 specific clock bindings

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml | 1 +
 include/dt-bindings/clock/tegra210-car.h                        | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 73cccc0df424d..d215cc6a0581e 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -32,6 +32,7 @@ properties:
       - nvidia,tegra30-car
       - nvidia,tegra114-car
       - nvidia,tegra210-car
+      - nvidia,tegra210b01-car
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 9cfcc3baa52c6..27485d9b80f68 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -409,6 +409,9 @@
 #define TEGRA210_CLK_DMIC3_SYNC_CLK 392
 #define TEGRA210_CLK_DMIC3_SYNC_CLK_MUX 393
 
-#define TEGRA210_CLK_CLK_MAX 394
+#define TEGRA210_CLK_UTMIPLL_60M 531
+#define TEGRA210_CLK_PLL_P_UPHY_OUT 532
+
+#define TEGRA210_CLK_CLK_MAX 533
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA210_CAR_H */

-- 
2.54.0



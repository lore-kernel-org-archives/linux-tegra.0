Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3318435DA78;
	Thu, 23 Jul 2026 02:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774816; cv=none; b=PZs/mxLBVKT0sniw17HYrABrwCWOul3tsO91lCpoorjXMCrybS5u85ALuZmOKZ1QEHVPZVnQmhEzki1kInsmPtms4dr/naXp348raNs8MHbWeS4JDGwkWWszEd0VQNYZqoFgabpGJ2MlemA1nI/7Lwmo5WjMiMROB5ngbWCreLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774816; c=relaxed/simple;
	bh=z7y0OqKWQHRkAmpiXbkzZisXX3IcOL0u+hBa3ZmEwDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciCMkb1fvqJneE9cfSr/+e9krpBWoMlzD8DOx+4zerKH50cXCR2DRg2LxMsrKMf+nEtLsH6s09JCz9mRm2GRLT7GTfR4WZpsroNbmdlvXifwKhodLAGihcVEmnQr958P22M+PgiH+4saFqxhpC+AxYtUaaAQTsh0FVR6Wg/nev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S74YrDv4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S74YrDv4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96E23C19425;
	Thu, 23 Jul 2026 02:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784774815;
	bh=z7y0OqKWQHRkAmpiXbkzZisXX3IcOL0u+hBa3ZmEwDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S74YrDv4TPGy1jQ/dslMNyn7Mlm0KlHwC4mWQRzWN3IdEkoVIy+3YlqOAp0j5xpu2
	 YnyWDZ6bYvYRPqKAtlmXvD4ZK5i09KTJyrfoIFcse6iPPmFyD9GUa6bt8tvX0UbfwT
	 fXXYfZryh60FIwUOEcT1vgVDu9Er2irCNOkMON8MFd3ofNy2u5r33yuxFaCGEBvoyh
	 1g6LdKb7TEioKbE/NngkFdiInHP5bkrDvQLRGjDgkneEEaah714wnIfLsMmGe+bUz+
	 2HIAJfto5L+wdu78n6NQvcX3ma889ZhIU6nuCLam9QErRO1fYYUmE63ozBXLcsktRI
	 fCngN3amC7wwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AF5C531C9;
	Thu, 23 Jul 2026 02:46:55 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 22 Jul 2026 21:46:47 -0500
Subject: [PATCH v3 1/2] dt-bindings: soc: tegra: pmc: Document Tegra210B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-t210b01-pmc-v3-1-1c5b970788f2@gmail.com>
References: <20260722-t210b01-pmc-v3-0-1c5b970788f2@gmail.com>
In-Reply-To: <20260722-t210b01-pmc-v3-0-1c5b970788f2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784774814; l=1197;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=yRm/f+3SzoxTxtTfaa81bdhigcB8fmUxP2kKtIxqiLM=;
 b=txDgun87iW4pToVMkZEvm8YopArM8oO+f50PpeF8biTV95ViyEE7XvT9I6nUWP/ozsclF39i6
 Q5IQYDRPiukAEjtGdgx35w3Nw3lP5VVX0dZyhwlTIdArN9wwRrvYSdR
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



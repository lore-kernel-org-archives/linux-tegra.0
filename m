Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372A729405;
	Sat, 18 Jul 2026 00:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784333828; cv=none; b=PmEdJmY9/v8rruWmr2aKxnTF08Ecsd/YvSGdOfNxjlOeECo1YfDtymLFIH1Plx1yM5V3bhyWIDduxIepuL76EuiPSC9XFmfz57evp0b8yOZ/rNPzfLaL8Fjg7EwKjE867/5CTkbZdmvUhde9ZGDZ7X/WEG0XTQIS3M6rtHky98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784333828; c=relaxed/simple;
	bh=IjhF3bJG7lpE5hPCToTh4KEJBQS+j04w+NF+bWNNLRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfY24N+77Joa8guKzXxA+YwrjxAQ9+sqoypqw+WsCxPp0BZ/dAd1ulBl8AbZT5SyAasnC+5hpPrvzJ/YN+0T+4RFj3KSUBZWAl5jEE1yxfCVxqWce4+5vN2/cRWUD3nnfHQlhWAVkWMeIERQT2TI3x6SgNvkuze1ai/IBt4DIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwbd1lyV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwbd1lyV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6B10C2BCB8;
	Sat, 18 Jul 2026 00:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784333827;
	bh=IjhF3bJG7lpE5hPCToTh4KEJBQS+j04w+NF+bWNNLRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Iwbd1lyVu8QzOIKwVq2l5yUP10AVcgG8R4uExGWX6F5+5/TWXmwkdV870ClfDIlrm
	 xtgHkpAVwANzywyBiIuG/ymc74NzcMwrDrN88kwMAMIw3MR56TN7PxZFOlZVJ5GHOH
	 Ugvuvdt0S2vr23kYlGISX0v4BPH21oQc+cqWxA4DZ1VIRWqwYuL9RfGGEy60OE1vPx
	 XFfh3lOwu7FA0j2sjQFSSM1rDuy98Od7nppIzY+HpGYVGdnZfhwkKmjlyXiu85XDyR
	 LrRUOKjRhVL+aQpcD33M5j5hwHf4kfNzAaAOE59mtrvuh0kww172TIDlalBrvprd2+
	 id1xRKR2P+Tgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E83C4451B;
	Sat, 18 Jul 2026 00:17:07 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 19:17:02 -0500
Subject: [PATCH 1/2] dt-bindings: soc: tegra: pmc: Document Tegra210B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-t210b01-pmc-v1-1-bf776be8b3a7@gmail.com>
References: <20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com>
In-Reply-To: <20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784333826; l=1159;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=z8MVuT3Opy0H7p0Pt9awDs1uMy1qRf8KVNgyT854Yos=;
 b=XsB/DS8y6v/k7RXEqzTUnFyXB+PzGvsNxv3DGFJa+UywfR4Tug+7qmEZfUfvVifwri9xsCiaf
 lSg31jpknrAACPljVcVo3UTVPiQ1wB2z640kiNQMbjk+Qro6E9EpqkX
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The PMC in Tegra210B01 is very similar to the one in the original
Tegra210, but has a few powergate and pad differences. Document this
soc.

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



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAEB43C06F;
	Wed,  2 Sep 2026 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344250; cv=none; b=W1MD2xClUwa2J/GG0D/PR9CDeqNYWHGnpe35FZ2MRkSP7dg73CCi9t/ZuKLPMQxdAdmo9YWCukHDdAndXr31f0rjEIuG2HNGa6d+7CiClo0Qu4DzXi64AZc7EBrYSL7ucL+Ed3A111o8poSONd4FKpnxBc+y+K7C5Ne17CdFSUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344250; c=relaxed/simple;
	bh=U6R197fFwdLhDB06IPqQN5TUuZMxPlCmFMyf28IUyPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fd/5Z0mjB+8NsZf3vVla/6ODkJmyBGIFHNdmADdfimT0iRlHon+tKOnLJe3as3rFjvGpZXfRvdXaVVY0ar3WqXTe+mE2ea/ok7alnNT8Qhrbo7PbDJc3b8GWwFjNWWkmAJXtEfZGR8eE9USRaULXFCZnAdTt8JLT6rDB22C0lS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOWCYsDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOWCYsDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679981F000E9;
	Wed,  2 Sep 2026 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344248;
	bh=xwolLhVYbLS+NCUHzB9LyX1wqc1RgZdvyWU0IsBjDSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AOWCYsDTNJN1YAlhH/2VuVPWYfrHJTUa/1ogPDZ0bwjCSEo2bATnXmbF+pKxqJa08
	 HLkO+exVYreyV9a0cAh9BcCew6kocbSzcjBxRwjJZ9X9pSl19iRa2ihPruW0W8+sN6
	 dU2tC7Jk1JD+jpuBXkT6mtlKMi9Ihz92BHLaBqfkwaMS5bJzQZE/ZeQPcbp2TkquGQ
	 Hg5LcZ+zgqQlZfl5U86PkMM/ssi/et8Wi6Uqq8lJRZwVWIY94txlz17mArB7Zxj7dq
	 8H8ILRWmBiwk/WzezZzmRujgRELWdnl1bbm+0Bw7f6v83hFA8cLXIFjkF6jERoOtmx
	 Dv2gEpVrp+7gg==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 02 Sep 2026 12:17:39 +0200
Subject: [PATCH 3/8] arm64: tegra: Adjust AHUB range on Tegra210
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-3-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=841; i=treding@nvidia.com;
 h=from:subject:message-id; bh=j2QeGDdLi3Pfkmm8GVjvi6aTVuQVWiFjUiv8lznn5bU=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fGxibOyse/eie02ewvyqVZyvFLVO0Q3+OYo
 wnhcYVLp2CJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xgAKCRDdI6zXfz6z
 oablD/488HzPMDrp6qBFp5D449qcuH0XlGfIjLoWrsQwRMsD9XpbwmmkYi5uor7qBfWPrkkmmAk
 N2+wZbmaDtXc06KqqHYatLkzKwVbrl/P5fK2pyoq5CAfnet6OtvD/A7zwq7gd3fxqcVXqa1pEZB
 irPsMKfN0zU7DNlgohbqLOds5Ost41NwMG8vR/9VlPQocs5XLD92XjHS4b/+792b+tpeg2QLDIf
 DBcrqFC2ezZQCjTIxoo9sInh7ZqGj2htNVx9gYNYkOMBny2VxSX9lGvVA2hCrlqwnYL2mtXN8PS
 IS0GRtXg2AJu9++5/SNpNTERAu9ZiGxi/GhziodoIJSqZ24KQg14HTh6aPuHPOdiYSMnrZIaysj
 +cluZcnYOMFbyrTFihvuCTkUmUnkbiTbHNpstCLC61xFa9iCVF029TW/8Tc0IMWrRzwHZokNHPL
 pWtCJQFYQ8NEr7/bRNHa5KGUvwrVHcQDR54BYTbsPCqlm3V6CYjD3KYIE3o7I6cAZL5/+6I5+/M
 DIoUpH2kEBze9+a/st07SPq3vs/nNJn7NEqFts4S/i9a8QXFrMJPdj3py7RlExvRinOuntDSqfX
 ftwy0pQfBgCRZ4LYwibtJeoTP4dOV4Fna6h9Nm9C8hhaUykVFwC/k6o+ntJeV2uBGzKksMSjB6J
 RMlm/ODYgXnmV9w==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

The AHUB range is a full 64 KiB according to the TRM, so update the
ranges property accordingly. This is merely cosmetic.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d709..9cc4c89dd1d6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1461,7 +1461,7 @@ tegra_ahub: ahub@702d0800 {
 			assigned-clock-rates = <81600000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x702d0000 0x702d0000 0x0000e400>;
+			ranges = <0x702d0000 0x702d0000 0x00010000>;
 			status = "disabled";
 
 			tegra_admaif: admaif@702d0000 {

-- 
2.55.0


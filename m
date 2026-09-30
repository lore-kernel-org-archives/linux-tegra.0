Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7C503900;
	Wed, 30 Sep 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776916; cv=none; b=AmAo6tCUPbkP26pRbwG99y2c4ezrpHWZ+cG25Z8OBcE8RSubVv+uVNWfcTfYNeuJbpXqIe588Hl7ScN7vBlpHeaBqV/o9G9pVQp0VYy4K6MkhybcNbEgdUbwBhwMS5K6XouA68Ja46ghsXs/t5PbmpbiTobQCtn54dTRBZb9u/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776916; c=relaxed/simple;
	bh=X/L/98Axwn/uXnmFnrFOTIk61KxGSsua3yBHEUbtquE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLeMZmZfrXzgzBOTWKbonpBMKjXIV7ChWJZZAsBQ6g0HkBAmZGJhlp+bF6II18qz0eTlkuuq9zVmdQD8QsTzEdFGiAbFzY1RHNfFxxCzeZDd+CCc8xMIUbASYF+k406ASS+pHZArFSl6sEdN8NpA8m0IfxEvQJxbj3//4bi1+Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuT/Fpao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuT/Fpao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B571F000FF;
	Wed, 30 Sep 2026 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776903;
	bh=8Lj6q5XU6JhM44roHTVfqUiJhoqsZ3blqG5shOu900w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CuT/FpaoigXuNX4MA9MU72GWNntcTv9qldN7Ku6RKsszuLJiGqfIuDOTcP+3HwF+z
	 qYrDV64NJfOvRFn10BkVCwaj0DrTNCvA8PF783x9AVVqWoMGI+ZJbzDcPkyndDhEmo
	 mn7tMGxc3Clifs687wXsBgI8mIpRLuj29MZlrWkEHvjXiyU97wXoBAyjXWgcW+AbS4
	 BLGaKDlTb29TeMaC8unkXxSfOipjP8xDxL+K7NE7KlRywttnxgQqDzoMp3h3WHlHlZ
	 +fRkVRLNzLv+kG/OEVMuCcF72zBwi86zMLA2BM8kOMBU6X2SfHktSA5snmiuMWmiJk
	 53GM1j6585DCA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 30 Sep 2026 16:01:25 +0200
Subject: [PATCH v2 3/3] arm64: tegra: Add Tegra132 specific compatible for
 AHUB
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-as3722-bindings-v2-3-a3bba649ebf9@nvidia.com>
References: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
In-Reply-To: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=treding@nvidia.com;
 h=from:subject:message-id; bh=7Ad9jY12fMOEkyY06XfEXlx3a1uy4HQfBw9/dyfFbsM=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqvRY8slNt/h6gvuaWnrgB4EehQMagkVwovT+S7
 mWGdSQRCkaJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCar0WPAAKCRDdI6zXfz6z
 oWXHEAC6Nvf/PjSybaWOVfL2CVj/tPvJog2VST9BqauwtpnGtOj9WrO8bkknxr4y8dlQKuHBu5Y
 41lf4IBD7zD5GvxILsERY1T+4XKK9DDixu7IbxLKxAOQNb5+1s/gV8KgMdwpLI3OAlI+VWl7QoB
 feIgvvxjWQihGTxxiQ2zeC6k7t2/GS8Dv5i/9f/hYZsV7MjhbHKohSMGbGx9PgFHEm0KuWguZrl
 bWldRtl3yi+c549zdsW9ODajJHQwO2aO7ntUmw08UcgTJJdyfieuWOlA6m3i99LhloZKEnLO3Gr
 hB/FyjxWhYTAEQa112go5oJihdEuDxneLiHtnV4HcFqroUaojgAxGUZIRSsCBY2lJHnm7rF2qdR
 ztMKEhbU/Ssj0IgfqK/bg2gQl8Q6KwZKR0t6FGLue+sb55n+oGm/FpPjzXd86iQoXQMFBSQFy2G
 IzLGdhNNlt8gL5EI29yLfC7izmiw7DOtWcxqWS8rWiGgiV9l50fA9f+BDbGlLby61K/JVfYjr0i
 n5yEIyy6OI0wtoUl+/pCo3X++h1VRPtf5XCajNQlZSDKCFigh5tAJTGyYc2jzWnjdRCc3Z7zlHD
 n9NIYihXmRPTFMYbktKBw73fXk6ZW6PJFt6WjiMRvOy3YQw8dqWLoXO+oTbqxIHyoTATwN9fhcz
 oqTUaicBjOPNwcg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

The AHUB on Tegra132 is backwards-compatible with the one found on
Tegra124, but it needs a specific compatible string anyway, so add
one.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 3463fa637b37..3e9e123eceeb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -889,7 +889,7 @@ throttle_heavy: heavy {
 	};
 
 	ahub@70300000 {
-		compatible = "nvidia,tegra124-ahub";
+		compatible = "nvidia,tegra132-ahub", "nvidia,tegra124-ahub";
 		reg = <0x0 0x70300000 0x0 0x200>,
 		      <0x0 0x70300800 0x0 0x800>,
 		      <0x0 0x70300200 0x0 0x600>;

-- 
2.55.0


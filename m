Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE35B446BE0;
	Fri,  2 Oct 2026 07:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926758; cv=none; b=dmZIZBfaJ6+hYFWH8TElzq57qEWSnsAYScvQoHYw8zOczss9W2WbM3t5I6llGTXEIIA5QcX5Mxro82/YLvA1+9U0+LL4yMLIVWH75v64Lz866C/ps1cU89i7miaXi7OY19sRw0lxlmXA65BMZBXE/YZyg1Jbxth8oJYH0Jbj/fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926758; c=relaxed/simple;
	bh=X/L/98Axwn/uXnmFnrFOTIk61KxGSsua3yBHEUbtquE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OykgdK2hhwlwLeRhZG1EEKrjRL9vJBXgmUTjsQLXl8NRT5GPgIRZgWBg+M+o82zu2faFjBUOqD7b3T+/kZGg14dCeuP1S1D8gMZvJb9b1MFNREo2jERoZlr6Bp+7TwPp5eSgZuph+9KbcMMiI+//LfTI8+IbvLItUlNg+MJ76z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUMMd+qz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUMMd+qz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74831F000FF;
	Fri,  2 Oct 2026 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790926756;
	bh=8Lj6q5XU6JhM44roHTVfqUiJhoqsZ3blqG5shOu900w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OUMMd+qzKJrWpIxVqdCHY1f/1EpZYvub86f2YYg6CHO5yGP2MDujwwP9Fn6Rpk8FJ
	 Q9vbmY7+RSWef6gV1LENzQgWlRYrVRkei4qEDUQVMF1JgLxWTnyFlk95elho3YAA2M
	 yxJwjG5fhsRDMLvvCaljkBhNFUjHLVcvIaf5JoFI1PJ5ty36Cew/+ZMEhbJnWPE83s
	 VIiNX3ruJ+L8zt4uzUiQfFYUJ83fV9LWpGRrKVUsT4FFEOgqsCeYcXeucpBPsJTnc0
	 IqxrKWh5HuN5ciuYUAKuN2YdqzZ8hy4H6dfKxXlFnhd9GDPmeAivQPKACQWhVHYF4l
	 kSMArPNff9UaA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 02 Oct 2026 09:39:00 +0200
Subject: [PATCH v3 3/3] arm64: tegra: Add Tegra132 specific compatible for
 AHUB
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-as3722-bindings-v3-3-21c179b72a95@nvidia.com>
References: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
In-Reply-To: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
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
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqv1+Zl0Y2vb1ghaccjiZ+/pZsUgwtVpeFsOue6
 7ditMZozfeJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCar9fmQAKCRDdI6zXfz6z
 ocd1D/9207Ic09i+kw+ro4g2kptiURJdGLHm3e9F7XYLiEhgBSk9kq+zRsBc4fWwi8olKCfWqCA
 nMsn8QD1Jymw9ck5RbqDOuY+I6h7ia23aaLC7CISFDDei110i3Jq9DQEqrm4eEZHaWdTg3iNlMv
 6Zzt8hn9UxjvlWd2j88tSJqlRywz1tBqOTnKVw5m5fLahnMWGvqsawL/HdQyfBDWhv0Q88D37F0
 FxN+c47dwSbKgdWrnQeXLLit4knIKF9oPno5BlIjL+E1mdLjTi69Q2hYYkuCBb0jN6VaICSy/nG
 LD2dasBz2nfRvJdYN0j2SmXhu+qz5OmWn5FCjhX6lu5ocf84kkmdsKMQLefTcRFk4VTkUyvaisN
 O+YFBEFYNet22IsY3h0MXhhayz+3kL8URApqG8tZYULIG6hAVZJwFAuih8Jqbaam1JxYiWytIK+
 4J39rolMtyzn4wObO6UeFuTJPOJ33sZVUNpXPQxN8ECXgxjzqaar6+UjTIb8+ct3lQrg5mYU/mi
 yRLC/9aLTfWC7jmIy0qrgxDxpxblk1L2sDdtv8MWixNFuHATGHxQw/AhVKiBjyxbhDGc6VT1aBC
 wba8Nh98XDsiAmlXuBWnEQ/UOg/WowPXTbL6WzVCkGTA84B0RAmN9iNbnvQYqoVbzrUMX8rg3oE
 mA7ePvNzkScmK/Q==
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


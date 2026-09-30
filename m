Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8504DA9DC;
	Wed, 30 Sep 2026 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776910; cv=none; b=Pf+wBQnP0yTeSCOTPQ24UFOigjRXJVIk6qlfLDK51tSQ4YuBkiwYtwz28XjamoRwwxWtTCduyPtPEk22EtM97jMjgMgI22KRkfz2XZQPuyvgjsK8B/gnsZ0WVvMNj07LyR6OxMNapg2rjFYJe81RKNa1MpcV/HNE9B8QwyQEGP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776910; c=relaxed/simple;
	bh=WzzV3Z90RUanWlFOxkw9NWDFepEehGCmrgVGV3640yQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D4lkA5csD5TuGEPWifFsymt6Bfw+X+FZ4dgCZGUEuduuXzMHRuGEyz9AtRJ869kZp9Z/j0NVwOev92WmpI6F7KpMzodzkErXNWUnktF/ElNlSGD7rJx3uSLaXMmTwtlVY8zCXMzaAHxOns8qpT0JikI8cM2aDP0f/td/Lw9t60Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rp6ny2Ub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rp6ny2Ub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72FC1F0089D;
	Wed, 30 Sep 2026 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776895;
	bh=tVnOdIUfx+CYqGqkUsqNk8zTor7J74KOBz4r9FuUs4c=;
	h=From:Subject:Date:To:Cc;
	b=Rp6ny2UbYZf08B/kwTWRlQiHt2mscY6zoSJ4HYR0MU4113XICgRHC9jpHuBPOuJDR
	 vxFH2ZpL6Tw9wEshb54hChTF2en2ihDyxhD8lRKWuQemEOFQVKmrF0cygG9K4ZFzi9
	 cn0GlXY5E1IPIAJN/g9Fkylr3ze7Tmr4WvNDoOL2M2R9ushq+INnXYYjHb9SIbHWr5
	 s9T/YOlE0LWaYbQu1pc4YpUVI0pmW53Zwe/YcWUl14yrcNZeWiKgV0nV9AWhaspFcF
	 LbyEngghDLMY+J9cabdKIoKVA/8bYwlNSIEIsnlVNtWIGjPf7ynf/wnUYoHQJab3U3
	 31idIhb1vGAPQ==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH v2 0/3] arm64: tegra: Fix DT validation issues for Tegra132
Date: Wed, 30 Sep 2026 16:01:22 +0200
Message-Id: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbQ0MItaV9zAs2jKFMbGQDjYaw
 t0FXLt8yfvvzyAUmQSu2QyREgsPYQU8ZOB6EzpS3K4MmOM513hRRsoaUVkOLYdOFKFzdVFZrX0
 F62qM5Pm9F+/Nj+VlH+SmLbMZPcs0xM9+mYrN+19PhcpVWfkTlkZ7tHgLiVs2Rzc8oVmW5QvVL
 7HpwQAAAA==
X-Change-ID: 20260928-as3722-bindings-e2cc715b99f5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064; i=treding@nvidia.com;
 h=from:subject:message-id; bh=WzzV3Z90RUanWlFOxkw9NWDFepEehGCmrgVGV3640yQ=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqvRY2GL7wRj9GQe5L7pSvJWi32cAaYeCLnKwKI
 JBb4Ohwzs2JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCar0WNgAKCRDdI6zXfz6z
 of2hD/4jfys5UEc1ud2AwWSOtvradHLkiW+YAf0VCoMRhl8JaRhDXsB4Wn9TiaAlJ6sK6hD2kwr
 f7X2kXcNQ4otSRt76XpGQao4Gt5BSj/QHyhgrtXCBi4HmrucTpHFe3fQdt3np7ssSbcq8+kXaSc
 NBiE9HRYXwkVyIlUHgp4bYOlLKC+T40K/eKyDVx7Om5N/JbKTT+zGzfu3iWR9QHoOn7A2CfhnUD
 GTwIGP4sWFFcKPwzJw4ddZZzSa1Vqp+4WY0x398+WCRsIci4P7388Mlb+cdkqdyXA/uGoM7CkVI
 lRcAtopy4CBd9k7eG6+pJmRfeZy9yS2myYB+bYwrbkFXlaMVpeR/DLqtaT/KI/ohrFCde7fS+gq
 neH2JnpqrBw5vh0AKQl9xttH8IelP3r9PBz5oFN+W6dRq8OIxwKHe+7xmCYjqCuG59RoaUELPzF
 OaxSHdPwHO47XGRMhiG7bDv0hlUD51tzk8iJBIYxxOrFyoAqzp/b/67c8GsRSJ+cD/AH293UD4p
 K6CSP7OkxIjJxcGshwVBSrxD/hP73xPJfnWDNLAViuyqUVfhX9b70Gw+cocfD0qW2SCFm5J3spr
 I1fiFYTu68an3j3dyd/VzXvp3j2Tvty3SCmUon3rOAu23We9e3n+sCaT74sWvLhmwft9M1YS7DB
 072YSUtdTY8ZkMg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

The following set of changes fix all remaining issues on Tegra132 Norrin
as well as some collaterals. The two json-schema conversions in this
series are shared with some 32-bit ARM platforms and they fix similar
issues there, too, and I've verified that no new issues are introduced.

This brings down the total number of DT validation issues for Tegra to
44 and 16 of them unique.

Thierry

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- address review comments from Rob, Mark and Sashiko
- Link to v1: https://patch.msgid.link/20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Laxman Dewangan <ldewangan@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-tegra@vger.kernel.org

---
Thierry Reding (3):
      dt-bindings: mfd: as3722: Convert to json-schema
      dt-bindings: sound: tegra-ahub: Convert to json-schema
      arm64: tegra: Add Tegra132 specific compatible for AHUB

 .../devicetree/bindings/mfd/ams,as3722.yaml        | 293 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/as3722.txt   | 214 ---------------
 .../bindings/regulator/as3722-regulator.txt        |  91 -------
 .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
 .../bindings/sound/nvidia,tegra30-ahub.yaml        | 288 ++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   2 +-
 6 files changed, 582 insertions(+), 394 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260928-as3722-bindings-e2cc715b99f5

Best regards,
--  
Thierry Reding <treding@nvidia.com>


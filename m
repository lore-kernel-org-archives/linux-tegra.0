Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96393442399;
	Fri,  2 Oct 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926750; cv=none; b=ucpUj8keEKWYNJYq3f1AQ3i4u76MOUIkGG7DxzBa46sVUaW4qjOocs1i6fxpTqGwFlsVZLFusyHBUZwmdHe2kxei4/22++CYK/6VBnWgQ+QFYrL2Zohn8JMrqL2KSsMjwcBJXCQr2zdsu6x0BDfjx5hN3itcJVdL4n6sls4jFII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926750; c=relaxed/simple;
	bh=5BFVq8ffo1QqLdJRbTDlVy7wmmmk7uEFZ9KPNIl4w4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nX0PbZOs3a+llxcsnjQgP+K5PO9VBHQ76bG/sbMuYkPBKBdTK8nkAm2GMa9vSrh4PQEdH3VxuCEC1VF0+OThophetT2ZTqmPOO7phynGkufx2DSktQwVGIJsE4UxkpcLOwDR3RUd1dKaYej/msvS1TXJIP/nFeIF1bTEgKB0IGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l68mmSFa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l68mmSFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48D21F000FF;
	Fri,  2 Oct 2026 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790926748;
	bh=/ykEFIXNpa+hm5Pcanjx941BUKY55WL5z7zwr6WIafY=;
	h=From:Subject:Date:To:Cc;
	b=l68mmSFa39sIm3KCj2Zl/tbzFLnjFrSDQD77VNcHsl6aABH21roQxPReE8Nec4/bR
	 pbaoE5DZ4aOyE9Qz2f3zgbEQ9H0QEqViJAt0hbRR0hN6BPHrOYr8k2qxjPmWEOus5g
	 yNSrntaJspdEBJbSdi6NabL1fz+gc+Fk9zT9Pn/GHcLJtBpYRH+vWR//U1l6XU462L
	 RMYUPJOLHD6il+UCfD0yKo0Rle4LoftSKHKZtcMA2Tbt6xNx8vKcyjjxU3c6mgyQtW
	 GddLrbvQunDySxPEbBKZTxABcyzFJl7U9jdmwe2JEUwZ+rWQxREn/Xv0aH9iMex16q
	 F8tr239zd2bTA==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH v3 0/3] arm64: tegra: Fix DT validation issues for Tegra132
Date: Fri, 02 Oct 2026 09:38:57 +0200
Message-Id: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ7CIBCG4asY1mLaoT/iynsYF0CHdkykBirRN
 L27UDca4/JNvnlmZgE9YWCHzcw8Rgo0uhRiu2FmUK5HTl1qBgU0hYQ9V0G0AFyT68j1gSMY05a
 1ltLWLF3dPFp6rOLp/O5w1xc0U2byYqAwjf65voxl3v3XY8kLLmpbgVDSgoaji9SR2pnxyjIf4
 QMQxS8ACVBCa9VUErWVX8CyLC/2ymRPAgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2410; i=treding@nvidia.com;
 h=from:subject:message-id; bh=5BFVq8ffo1QqLdJRbTDlVy7wmmmk7uEFZ9KPNIl4w4o=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqv1+VO6vHLKS/n2JS6eugYe3dV9NJDK/DseskQ
 O2G3XDiZM6JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCar9flQAKCRDdI6zXfz6z
 obtqD/99remcsjQ8FJ7rVRfbIDA9FCpNcuSMLbDe6svLg72rC8dLBR30WybrFM+/Fl5/Xs84n5C
 MiR0sK3zZvm5Dc5RV3Ix+7kkPyQyIpm48TOhVixpWXLqEAFFhYUdaN/Ieq4ubF5IcYwygmz01lx
 aiVq4yBVy1Wk+FQsnD8IZns6TNBkGyNZ8NG42+jy9oXZEPmpUrgxmCMdXv2wFjuZGAZ8thiLoJK
 1ePzBqcTceTVhcQ2kcL9GsefdcfmeHYYiDbdePvaXVRyl7jPjl7yvQ0krK92q5F3hgVK1gdwp33
 Vgm5j8sTwNlib+RWP5RJBzEHfr3I60azbTOHF/KAWR9HGOwWe+gx7K+8t3ErJhb2zeWE2CdIPhJ
 0d5ffroG39jKDi9W4n2fHaNfGX++fRDddyP7/zfjWwx4PkxyBl5qntYRjMfmZp5qBeWEZ1BUyRb
 cpqencQyb3DYSUJEYZD+pmBgF1bf0xiU7vF0LyaIRo8zF6XqmNZHruwV9VVQ24xS9WmtkcMA5m0
 XYnvagONwmFWoDkFGvbdRpRvQpu+4+wvJ9/64oBX0anu9hHPeNReFE2o9UYo9iVK4SOwX41UiAi
 fmFheE7Q5UqHPSO2qgeM1MiWdU6gCm1d4LYuVz0QQeTq3jGPQ0V+XaYk4OUYoo3D6HjbEoPWsJL
 HcxT8HQ7t4OYrRw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

The following set of changes fix all remaining issues on Tegra132 Norrin
as well as some collaterals. The two json-schema conversions in this
series are shared with some 32-bit ARM platforms and they fix similar
issues there, too, and I've verified that no new issues are introduced.

This brings down the total number of DT validation issues for Tegra to
44 and 16 of them unique.

Lee, Mark, do you want to pick up the device tree bindings conversion
patches, or should I take them through the Tegra tree?

Thierry

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- fix compatible string matching for per-SoC constraints
- fix subject prefix for ASoC binding
- Link to v2: https://patch.msgid.link/20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com

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
      dt-bindings: ASoC: nvidia,tegra30-ahub: Convert to json-schema
      arm64: tegra: Add Tegra132 specific compatible for AHUB

 .../devicetree/bindings/mfd/ams,as3722.yaml        | 293 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/as3722.txt   | 214 ---------------
 .../bindings/regulator/as3722-regulator.txt        |  91 -------
 .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
 .../bindings/sound/nvidia,tegra30-ahub.yaml        | 289 ++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   2 +-
 6 files changed, 583 insertions(+), 394 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260928-as3722-bindings-e2cc715b99f5

Best regards,
--  
Thierry Reding <treding@nvidia.com>


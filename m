Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909AF429827;
	Wed,  2 Sep 2026 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344242; cv=none; b=d3SYIvJCRdlRasiyiHNTT7YOc32b2UwQCMaE49mTmaTK063slQ2AJtWMmJjBp1H57/CDn7Qw+g/cy2EWv5CLouO2VK4f+fMuBm6Y50AAjxQCBeaYGpl8NWlaKqxtpUzlNE4tdZ6/ilUus9+nvxSebM+OjW0L8e8QXRq68Zg14VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344242; c=relaxed/simple;
	bh=XO4c4hLp32Yn43hEsSb2rEE42jubjl+TbiG2DThMRWc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YQhG24ROX0OX4b+8z91L8HLQABdQlgG3qy0FLEfGKwcor4p9T3rntkCLbP/FUJD9nhOMxj1ro81foVITOhDo8dxHmhrzn3uQWQm4Ce8p19UTG0R0Mug1Lg5bI8vXnuuiJRgSZ9d3xjk8RTNnCvbPbsNYQ65TzD9C+eTMaEbOPIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrvR9oMS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrvR9oMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967D41F000E9;
	Wed,  2 Sep 2026 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344241;
	bh=YIaTwV3APJT2IAqyMvVhjdVGyinas70syw/TPBgdghM=;
	h=From:Subject:Date:To:Cc;
	b=YrvR9oMSedrbbEcXoBxiyAkxRNG4FT65dzTyFu297+tUnRPBjnqkJ5C3kI+oMcE/k
	 SFWRx/z3kAji3grkPRwH+4Ra6TqwavB3qav0I781L6d8p7TdYTRUcjxBOBCanRKuXl
	 YEayJHjo0JoO0Tuka8+cIfuFg176Gpdz4k0GuTWdujcxeFM7PtfbJs+rfQrit3LNVh
	 h23nrDAGIp6K5AyP/FM3bcQPL0Tz3gOkeMeVDLDG/7ZHGE0UYtvAPuZ8bRYbDseq6Q
	 o6Z0Y8uId727jAqOS5klweWwPudTEmyVrr/OMuYnSTX5QgqqT4Y9/d3KZy0xgmnfho
	 e3Aj5m1fdEknA==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH 0/8] arm64: tegra: Clean up AHUB device tree nodes
Date: Wed, 02 Sep 2026 12:17:36 +0200
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm1SRoHgVYyLzlCgxoxkfowJ4
 e4OsPwW760QJahEuFcrBPlq1I8vqC8VuJn9JKhDMRgyLfVkMMkUGHnOFoeE7i3s84Ij3zqiq2H
 bMJR2CTLq7/g+nqdjti9xaZ/Btv0BZw84EnkAAAA=
X-Change-ID: 20260902-tegra-ahub-dt-cleanup-fa470032ab5a
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024; i=treding@nvidia.com;
 h=from:subject:message-id; bh=XO4c4hLp32Yn43hEsSb2rEE42jubjl+TbiG2DThMRWc=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fGpjYoqKNbuw0vWzqMTho/3NSFv0FCn9l5y
 Xj75NtKMjOJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xgAKCRDdI6zXfz6z
 oXi4D/0Qe19xijhkLQoG7F3T/6nzq9GFdy5i7DcDFoINf6l+M79RQVBLON72Qw/wzi44uiZP+GY
 nXldVk7UagA9TYt/9aJ4yF2+a7u47P9c1V/1Y161zh0Xm1HGAGuMv6s6DfTULgIloZUIms7RyVU
 atRq3+AMJt1A83m8ELEd1rArT85v60YHoATZwtmETrzsvbT7sMfgIbGbe1V3/rPFfXpfAVXH0/T
 6Y0nfw0H6CscYcRcHKGpXQngMwfsyBDaPHMSy1mRXsPcNHlzKGb33tIa4RojZzt28xitjRRzHqh
 2KSxoVB+WhyJkdHPUOfYXPSxrFX7gXK2X0HXwBH3QyK21IMe5RMXoBa0FT4Db7SDczToHh/CHmj
 Vc9Bdn6G0BVz1KM3txBdj5g1HsEGxdskLivyO+mBDxdTcf8y1gKgLGXrM18qjmKyvzhhwnR9pEl
 cx0pw5yKu+quxda4fEHBgzYzWfI3NtDJ+slo0zLESYDipZ4uiDtnEmhs1cdkXNMNZnowdq67oVn
 c5Tg/JV+7Mua7hUkFpfhOA6abSiP9VpdlZKH0Z7giZyYoqk5urKXjxT4ItzJ4n3cbS3zVxKRlYc
 p0uwj8PTkofS2hFMqngGeL0LzOfl0gmaLO29wgHpVrW/t4PAYqdOpZE/v7NgcbBtlLmDSfz0PZF
 +XvwR8Ov9Cu8G1g==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

This series was prompted by some discussion on this thread:

  https://lore.kernel.org/linux-tegra/20260705-nvidia-ahub-v3-1-bacb7e05bf68@gmail.com/

In a nutshell, yes, the AHUB can do with #address-cells = <1> and the
corresponding #size-cells = <1> since all of the children are in a
fairly small register region. I suspect the primary reason we stuck to
the #address-cells = <2> was so that the ranges property wasn't
required.

Anyway, this series attempts to rectify this by making the necessary
changes to the #address-cells, #size-cells and ranges properties across
all the impacted boards. After this, the AHUB bindings can simply use a
fixed #address-cells of 1.

On that note, I haven't seen any response from Charan on v3 and there
hasn't been a new revision either, so I'm thinking of adopting that
patch and make the #address-cells change so we can move things forward.

Thierry

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Thierry Reding (8):
      ARM: tegra: Clean up AHUB on Tegra124
      arm64: tegra: Clean up AHUB on Tegra132
      arm64: tegra: Adjust AHUB range on Tegra210
      arm64: tegra: Clean up AHUB on Tegra186
      arm64: tegra: Clean up AHUB on Tegra194
      arm64: tegra: Clean up AHUB on Tegra234
      arm64: tegra: Clean up AHUB on Tegra264
      arm64: tegra: Clean up some whitespace issues on Tegra264

 arch/arm/boot/dts/nvidia/tegra124.dtsi   |  16 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi |  16 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi |  74 ++---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  74 ++---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi |   2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi |  74 ++---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 494 +++++++++++++++----------------
 7 files changed, 364 insertions(+), 386 deletions(-)
---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260902-tegra-ahub-dt-cleanup-fa470032ab5a

Best regards,
--  
Thierry Reding <treding@nvidia.com>


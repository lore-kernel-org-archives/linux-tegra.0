Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1713F20E4
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089655; cv=none; b=oO/QPM4sK48/AFyLzYChAsML7JAXOzVthXSiU3tmCatAAzGnS6vNxtsCBslvbutoqUUwS1MKzGGs51d5MovV5aOZnd7qUq6jSD8q6181AOwviMLwCzBEtk5bRRv/FYiNtbNjIFgAr3i5uaiPARXc/9Epb3V9QMJoT5byHM8WQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089655; c=relaxed/simple;
	bh=69TJ16CzymasswDrlc/ToWezqe5HUuaMu1QaCnJXU+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BTgydyzHbJbXjYZpjC89/EAFmLOZzZkRRKXqYfeBuIucMcmvng+3Qsaj1ePfEW8J6sgLqMm9vzvLkyTWi69vDbXv49ZFNPzpFXrbC00xW93F8uYUPrhbsPt4P3wK6hfAOmjlXudR0Mzu+7DCsYbtTjvi9hkcMvFWalmQHOcZMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aA1qpJQk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aA1qpJQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2771F000E9;
	Fri,  3 Jul 2026 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089650;
	bh=wrc7+qLgdBCAc/eLa/IBcxhk+BlROS47gbZmBQJufnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aA1qpJQk2IiXSlIyaHnaB/JjsDUHEvqU/fhEBcAtm+KpyzplcKGMk83QcYGpW6FcH
	 7pVo4xL2ZVuRVoscxXmQQ1gU3M6LUv1xwuQst9OTLPeH3CAEkAPQTuOJoD12QP1Z/7
	 UwjeFdsNVcLp+TOgMK8kQU0PDEzzx9QM7rKZdpQs5m4SFWITulPreZIEGzvb2WUfju
	 jmfYp7eQOGmU+gYWB2b+nlHiRqgQ7PpOo0d44ULZjZVRoYncZYs/AGHw1Q3jWSJhZm
	 9Znnq3wUPP1NnzX5bYq60ZBq3Er5ztbnyg+itOphj/IBDxATTmyzTkts5+6BbkZnpb
	 QTEzVzHMRCT1A==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree fixes for v7.2
Date: Fri,  3 Jul 2026 16:40:37 +0200
Message-ID: <20260703144042.1190046-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703144042.1190046-1-thierry.reding@kernel.org>
References: <20260703144042.1190046-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit e1215cd6d3b9338e72573cc1cc60922b5bd34da4:

  arm64: tegra: Enable SMMU on Tegra194 display controllers (2026-05-29 14:33:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-arm64-dt-fixes

for you to fetch changes up to 806a66f926c2b6652aeb88983d01f25081b41a73:

  arm64: tegra: Fix CPU1 node unit-address on Tegra264 (2026-06-25 11:13:27 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v7.2

These changes fix an invalid compatible string combination for GPC DMA
on Tegra264, change the compatible string for the CPU found on Tegra234
and update the unit-address of CPU#1 on Tegra264 so it matches the value
in the "reg" property.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Remove fallback compatible for GPCDMA

Sumit Gupta (2):
      arm64: tegra: Fix CPU compatible string to cortex-a78ae on Tegra234
      arm64: tegra: Fix CPU1 node unit-address on Tegra264

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 24 ++++++++++++------------
 arch/arm64/boot/dts/nvidia/tegra264.dtsi |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)

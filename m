Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A23EFFCC
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021313; cv=none; b=lXDbRcTa3XuXgvWMLnJus58+YHC2EDzSlarz5cWIOeo5XDpbKEKpvMmVIpGpj/WmcVJVt1suPivnSmrIeRzHNQNnwzmP0YpzzzAWLgB13bx6lbPAaE07vP3QJN2PHtnr2wSG3sIFfXY0Z+7tigYniumtFVLX+t9pDKvaRN+grRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021313; c=relaxed/simple;
	bh=sxdbgpUYElv1uPxmQV7EnlwSLpADe1h4TzE8ADqWaq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FKYKeqqwemuJr65dbrnk6ZQzHnugRu7cYUhKaIckcHBz1g0rXzuRPcr0kBxlYLe3roGI6IizpI6b4b2k95gPWpqOepC/8LV306+t762HoXlajw5hvi4Md2ji+881OivRYWIT/rUomOMkdeceen96joDx/ba2HFtw3bNnNVPjYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3j55Hk0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3j55Hk0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C861F0089B;
	Sat,  3 Oct 2026 09:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021310;
	bh=KU4kJGQayYFAkD8rvd0S8uhRZ14L3OxviWvXPNVCttE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L3j55Hk0hM0BkDubNicANS74lSr32Hx3vTam27V0EC8OC0FgZ6osT+ggQnWqgc/DG
	 Twlo1nhFhlqHlWHlc+sxBa93mXJl2i1EYLNaM3SVQlnM7RlXDS0PKAqE7DvUhZaWzg
	 j96QSzffJkb1e7bAcWb4xQDNOJHYy0hjQwcP+DtpeejaCYe50b1PPUOWAv6nrv8jBN
	 BHWB9H/EroLPjGnmI2DFSOCZjb6KCsjByv0ItPaOhRDi45FuurH4g1BjteYXgfpoHh
	 ZVw1DRX7QC1oE/5ZRVQaV+9TRVB/80LDr41FgnrQe1Kl8bB0kfbQtrHmDvEAbPrKOQ
	 H5yvgj5cvGWUg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/2] arm64: tegra: Device tree fixes for v7.3
Date: Sat,  3 Oct 2026 11:55:02 +0200
Message-ID: <20261003095505.1369507-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095505.1369507-1-thierry.reding@kernel.org>
References: <20261003095505.1369507-1-thierry.reding@kernel.org>
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-arm64-dt-fixes

for you to fetch changes up to b86eaddf467a9ddb69dbaa46eea9dda7f93347a3:

  arm64: tegra: Add PCIe root ports on Tegra264 (2026-08-31 15:14:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v7.3

This contains various fixes for Tegra264. While the PWM and fan patches
look like they'd be feature additions, I'd like to get them into stable
kernels because without them, these devices either end up with the fan
running at full speed or not at all, neither of which are great, but in
case of the fan not running at all, it can cause the system to overheat.

The remainder are some minor fixes for PCIe, mostly to satisfy the
device tree validation.

----------------------------------------------------------------
Thierry Reding (4):
      arm64: tegra: Add PWM controllers on Tegra264
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Reorder reg and reg-names to match bindings
      arm64: tegra: Add PCIe root ports on Tegra264

 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  13 ++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 180 ++++++++++++++++++---
 2 files changed, 169 insertions(+), 24 deletions(-)

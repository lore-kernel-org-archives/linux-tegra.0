Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242B730CDB6
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780207726; cv=none; b=JncVLVwElP1XCT0SA5/d8T3KJkyr9l50hjEGqdRFj1NCrcjOSnKc/KKwfa/yseA/k6Hyg5JYrJ8nXS8mt162p09lr3JdvNsOx23Dl8pJWMZp7FfIDdw+UJfAJ69Do9FzRLPeSIrvxbPjT2soLa2tb/N6O2ndLDcZKL7qsloUPb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780207726; c=relaxed/simple;
	bh=obTKii19n3Fr58xQ9XTnT0LbNjnDGvC46Xif7q1rNzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iF1RjUvqy8i9B67MpVxjyz+Ee/0XaWKdjDAY7101wYP7BSKVRdHDKVqg+8hr6ESP1ff5+7yxt4U6f3S1bQKsuC4Og0UqFu7eleZtBDlEk/9A/ZFZte1zlugiztENtSDAIQTuG+wFFmpuL5F32+7z+8+W5eD56CLcqMw2qGSrJeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwMipyGY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwMipyGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730881F00893;
	Sun, 31 May 2026 06:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207725;
	bh=D++U1nkKs5wRw2cqvZO4MKORFcaw0F53yOnifOad0po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iwMipyGYfxQXHLbuQYTrR+ffNueQpMdDdALkh5TmKxXOb7e9BjyTI0SYxMrviWX7H
	 So6tXHFaXfkeMy0V798kiR1DNLKCn7hzH0iNGkVRqsxG9Df2/jlsJIB/TkeR26xj9F
	 0GR1f8iQORay/oK4UFbfZnefIZWeazgYo8la7Fr8UmPoTrxJD4B0bgenricwC9lSli
	 6VSWWI+WZ08tlS5nUtXcGyhPHvKPAltRWhBNeBpoc+2+2MRS8MNJgAp2w5lgxpsCzk
	 jBE2DZTyTHsflRSvWcaZ56BmBmgxs728PFKZobTPpm1hoZgv3TDmxqRJXf0K9dlvIq
	 yC32kx1XL7VyQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:23 +0200
Message-ID: <20260531060825.1855391-6-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-arm64-dt

for you to fetch changes up to e1215cd6d3b9338e72573cc1cc60922b5bd34da4:

  arm64: tegra: Enable SMMU on Tegra194 display controllers (2026-05-29 14:33:29 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v7.2-rc1

This contains a fix for GPIO on Jetson AGX Thor and enables the PCIe
controllers used on this platform.

Smaug (a.k.a. Pixel C) devices can now be properly powered off via the
PMIC.

Miscellaneous improvements are made across a number of different boards,
such as SMMU enablement on Tegra194 platforms and some better bootloader
interoperation on Chromium-based devices.

Finally, various minor fixes to device tree properties round off this
set of changes.

----------------------------------------------------------------
Aaron Kling (2):
      Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
      arm64: tegra: Enable SMMU on Tegra194 display controllers

Brian Norris (1):
      arm64: tegra: Add #{address,size}-cells to Chromium-based /firmware

Diogo Ivo (1):
      arm64: tegra: Mark MAX77620 as system power controller on Smaug

Jon Hunter (3):
      arm64: tegra: Fix Tegra234 MGBE PTP clock
      arm64: tegra: Fix address of Tegra264 main GPIO controller
      arm64: tegra: Enable PCIe for Jetson AGX Thor

Manikanta Maddireddy (2):
      arm64: tegra: Add aspm-l1-entry-delay-ns to PCIe nodes
      arm64: tegra: Fix aspm-l1-entry-delay-ns L1 latency cells

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  5 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 17 ++++-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  7 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 24 +++++-
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  | 12 +++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 88 +++++++++++-----------
 6 files changed, 103 insertions(+), 50 deletions(-)

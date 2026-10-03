Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E544F2F5A06
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021586; cv=none; b=B67GJD4VXAgDTEEU1rBcN69ERSztJSe3E31EMKg89NKwA55zLWAVMzRVt44vqehDgdUD4kJAm1Ku1MpQACU1WjXIRD1kV57Sz7z8dp/f7apGqIU2xY3nMZ3CDBF5i8ewNvc9cV0PBtY3M9jgut4u8vIn871h7GfFqRr9h19SyQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021586; c=relaxed/simple;
	bh=t6AIxpf4ZdhME/KdrH3gzRH9NkdX0K0IexW+vsWHGRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z/TwS++9k1koMJP0CcEdVNJo2RIvkyZtSWNRfI1zz1wpk2xlpAQtyaeJnK9k/xDQ9b2htqVl+4dX5Uhp2MzA6elfDXeKkCyoSih/ONCGEKpijDcBYUTde49EtdZ4nkiOZ+7PW9dsxRwh6VE8bsQx9AhB5hUlGZaFn2RP+OvmwcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIpx29mN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIpx29mN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B972F1F008A0;
	Sat,  3 Oct 2026 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021584;
	bh=iDyRWil47bGyThquFijRBaS0VEfSp1CCoYZFzfGdrxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bIpx29mNT5f+TrYf8/DE1Sd+Qio9F5rZJSKsZrnSTF+/xEoxNeMac4phRmAgdRado
	 jmijyyInDBYSVWvEpIptx2lhxPDLey2QZy8P7t1omsThSGGC9MdpBWzlrfcs7h+gTI
	 WjblhfA9AJmXnTAav68OgfS4UodhZKb/Sispj/2mqfpbjCQCpZpxfnIBCuMlDP5qw3
	 3vCjcB7dtoj3Fkvxe1DYnhFTLatuzdfqplZ2r2Wl0KVWVhxax4N9EzUbxI2GaLQXpG
	 JG0GUkPhAqbyKu1q8THdS/k9/P2rh6566Em5c/i8iTiJQhYilVgjnViC3vv8j3Y8wH
	 7LHo+lKX9QJ2A==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:22 +0200
Message-ID: <20261003095924.1370238-7-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-arm64-defconfig

for you to fetch changes up to d33a04d2712104a84357c6f485605a0a5528c5e3:

  arm64: defconfig: Enable I3C and SPD5118 hwmon (2026-10-03 00:49:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v7.4-rc1

This is a single change that enables the I3C subsystem and the
DesignWare I3C master controller, along with the SPD5118 temperature
sensor, all of which are used on NVIDIA Vera devices.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: Enable I3C and SPD5118 hwmon

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

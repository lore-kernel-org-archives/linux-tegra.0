Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9973C1097
	for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2026 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785688780; cv=none; b=UwVFS5H8WJ+1IQ+AkOlqKcSPoR0F2v4YDPCGbSIqd/tVBm8nAIsoTTJ/FlzJbe3NDYp9IKFu73MfY2Zr+qVTzwvesTlXuU2SkzIFWsDw+j2LH/Xd0RYmfwv/Hvlcg5f/IhtmrSwW/GnyZ5C8A8yH3E5wqfiJAGZucthMXZxiFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785688780; c=relaxed/simple;
	bh=w9AKpo1ItJL1eWSN973YUQVelPwaD0oZ+s+4nSiIz1E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Yc20IQ2iAAc6eQC44xfv4et2B6o4YvgXQVoABa3qU15JaIATIXbXVV5y5th1tCku/kHdg2nzTrt0PlPgE24b3bjrfSFtAw9ZRNehVPJtBxAqA0th/s32tWO+Jn70COsASGKiGZ0Px0GZBRWmHSJxGV87Yfj3uyK/ZDNY+JSiCFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTzDUMcO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTzDUMcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A546D1F000E9;
	Sun,  2 Aug 2026 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785688779;
	bh=VjSayV/sJlc3KNTb3fMX3RwzhLQRHzSBn4xsieBjaMg=;
	h=From:To:Cc:Subject:Date;
	b=GTzDUMcOi0HIaAgBOvcoh1pnhBh51/HQ812MNtZ6w31c/CoctTee1fxFdK4DYfAfX
	 YBPnww/cEUl85c/4RacqmPnYfixjYnmn0W2/SBksUnT163OiFR/5R3Rj4jdHa6BNxO
	 E1eDj54fYFKB2iyEybMKFxnSmJPJnXT6lgW4CVAbaqZXDOxt56HfJTSB6ly1G1eQRt
	 9Rn+0qwoQEW6gQqldDzc5zy5GLmEKznrgVbSwXAX6ucJphU4aEp+qdfP+Z825FePGE
	 plev8wAwJiSDJILQMPCG8ztLUFvCbKUcjVGAPmTuzgFk7NH1+UpqT+fcVm4NSQsPTX
	 WHlci5SrGvAxw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] arm64: tegra: Device tree fixes for v7.2
Date: Sun,  2 Aug 2026 18:39:34 +0200
Message-ID: <20260802163936.1257450-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
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

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-arm64-dt-fixes-v2

for you to fetch changes up to a7c28483fd57dd0e1487024af70622315320774b:

  arm64: tegra: Add EL2 virtual timer interrupt for Tegra194 (2026-07-29 18:05:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v7.2

This contains a single fix adding an interrupt to the architected
timer's device tree node for the EL2 virtual timer. This prevents
a warning from the driver at boot time.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add EL2 virtual timer interrupt for Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 ++
 1 file changed, 2 insertions(+)

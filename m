Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00A225F7A9
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 06:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780207720; cv=none; b=fEIqVIF3/cJFIQGNzj6CrEUiigZhD3mDX0CveLObum91M86KvmMYNvHDoqvD3nQip6zWC+GStUNWiQ21Yve7Bbm1enrObtAtALIF2Ki4gYRZQjukyDHupPqDKY2GMKrnXGl9pS4bJPY6cF0Uv1p81JGmxIzM+5QG3ef/uNG4WjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780207720; c=relaxed/simple;
	bh=UnJ/oDnevSY6VxNICJu6cuOWaICmHvtxtpUxasosxGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n13x4rj8UekeKKNIIUPNcPbGjrlIqgvgg00BI6zrCuWTjGe8ooj3GEKfNExMiBsFBeQZjoWyVDC0u66aQeXRxf+s+jm/qIPt8jxlaeFkeJ2RrYcYKWs3kyWMmnaToHsjzSfvm8STmWA1kZ/1lbsujHl0gKC79G+kMiVg6dH7ECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0QC/JhV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0QC/JhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82931F00893;
	Sun, 31 May 2026 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207719;
	bh=qljV4zxhAkYcJit8Mh3AtbiLJnmTxV3doedwBWh3bcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c0QC/JhVuMFZoZcLYGcbXBzl0/3sjT2Ds9RZRFdXH0FT+97SZcFrFxMfpLLEr0uNw
	 ++6/s7Km3FpVwbSClW8NavPjG2/mRCYr+RSeK8uR55E4rN9sRJbKxcd/YOp7imxk2B
	 SmnCWe/NlM9T0Q2n6dXfp9+20y3oydGU+3/nowyy98mb8dQqwC0TnEF05T4rSf1sPc
	 B+H+Uzy5vAOJsK45eqSJ8cUxLL4AlEnJEEbxiipEP0JYnt42bngC2c3jAE6scllxJC
	 wgJf2N9ykVBmTiWIyGztLeYyaWReJ3kBLFgHdwvA8qc/E2PJbMJMXbq79MDixwTZvn
	 SPVUMWk9HiJQQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] firmware: tegra: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:21 +0200
Message-ID: <20260531060825.1855391-4-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-firmware

for you to fetch changes up to 040eeafee0146b9d046caef501f387e107a59960:

  firmware: tegra: bpmp: Add support for multi-socket platforms (2026-05-31 07:25:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v7.2-rc1

This set of changes contains another attempt at resolving a Kconfig
dependency, propagates debugfs error codes and adds support for multiple
sockets to the BPMP driver.

----------------------------------------------------------------
Jon Hunter (2):
      firmware: tegra: bpmp: Propagate debugfs errors
      firmware: tegra: bpmp: Add support for multi-socket platforms

Sasha Levin (1):
      firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol

 drivers/firmware/tegra/Kconfig        |  2 +-
 drivers/firmware/tegra/bpmp-debugfs.c | 55 ++++++++++++++++++++++++++++-------
 2 files changed, 46 insertions(+), 11 deletions(-)

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386AD262808
	for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2026 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785689516; cv=none; b=SAIKvnBwVB0aLaxLCMkWKwF6cPzlIZnZ/RUlD1SnLUv9+FM/fFRo/LnbTESDi5ck7caPskPWMrS0EU/5EuMZfwNoneDfSx37XkwnIayINbcvNjCKbHlTjkXXfm01aHKU4xxDthfFFm8ppo5dGl8Rb2F7STYsFrARhUUa0Sr00Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785689516; c=relaxed/simple;
	bh=uGp9miZgZQmhFf4dsjBixuIUQWTyrQKCwEs71y4jEe0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MxziiuzLqHjcD71Qr31oAp4RAmUDW5hnkDCB7JwNlmfdEQcz2Elr0GeRO2v8fmBmfxAYG/a3o0pHQY9PiKp7UYOGEM4JenPs2wKvbRuHZE4fh4NlUBukySWpm43GjvbV1k+M62jrKptBRzqb24ubd2ldo46/dIj8trST/2h9kMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6tax8HF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6tax8HF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FC91F000E9;
	Sun,  2 Aug 2026 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689515;
	bh=psWYm2H9AyU6tcCSv/QCflLAmPilw42Vzi6vK5pI7hs=;
	h=From:To:Cc:Subject:Date;
	b=X6tax8HFSXE68l189gziI6nb/mV0+pDQZ5wSazKrSYAvJGmdzUYkfZNC9dQshO5TF
	 MH/wChIu7UgSuzxFxIWvXFopUhJOmcYbXjnZP8i9tqEDvaFTpNnrvObmD3YxykfKhC
	 6srcXd0kQMnH86AekL+P/7l3b6mvzXu70fFaAQeLBUJo5rDJPMHc1WNpBQEOyahAyv
	 3ZRVh84l+ZoiL8/yo3ecNoYZSy5AuzWwmqthgKi3l2TEWagEI8FwvqwT4JGfQvc2MM
	 gMeLvw5egNdqwgQgLGCGnldMbrO5Z1kTB+fSe/tS04wq8LqDqqV32U+lTxPDjcCsA8
	 nv3QdtiVwcKqg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] dt-bindings: Changes for v7.3-rc1
Date: Sun,  2 Aug 2026 18:51:44 +0200
Message-ID: <20260802165148.1259649-1-thierry.reding@kernel.org>
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-dt-bindings

for you to fetch changes up to f63ecc70c341682f2f78403be84069876d3eac0c:

  dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string (2026-07-31 17:35:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v7.3-rc1

This contains a few fixes for interrupt types and email addresses as
well as the addition of a compatible string for the Lenovo ThinkEdge
SE70 Edge Client.

----------------------------------------------------------------
Ashish Mhetre (1):
      dt-bindings: iommu: Fix interrupt type in example

Jiqi Li (1):
      dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string

Thierry Reding (1):
      dt-bindings: gpu: host1x: Fix email address

 Documentation/devicetree/bindings/arm/tegra.yaml                     | 5 +++++
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml        | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml        | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml        | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml        | 2 +-
 Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml   | 2 +-
 6 files changed, 10 insertions(+), 5 deletions(-)

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8239A406270
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021568; cv=none; b=YWIXGgTu3orhTkeazq9a5tMfg3vvdYaRJ5STp/KGBtuhbuK8y64QDbHLGipxtDxXW1NmP107QU8H/kR37q2REdBEm/Uz8Al9zt/x/7CPhDFWGNDBcNHInLohoW6OQDYLsDsfTwfO0Clp9MWpKzysbe3XwXNzpUs5j8ffTBI8W38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021568; c=relaxed/simple;
	bh=+ZFj+AawtR6kmt8/Eud/NI71QPXom/bfrQyaX0KUGpI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=io60yuXK1hanv/yn7m/yDyvOOyg+Q8/l8Us6VLExWJlrNAg/LocbThyZJtDVE/Cjf7BgLA7JqlwtaoyPyS3qZmyr2qyPzYT+jI7h3lgbbQORtqqVEnONUl42J/MEuS0Hgb1dRK0vcXHHaUX4mlo8phsXSpFP8ZzzPrewuaYWNFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+wEVs18; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+wEVs18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5201F0089B;
	Sat,  3 Oct 2026 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021567;
	bh=P3afzIZFLbpKaON2kpJxPPKXtSWU1Ph/FvDwlHtFc9Y=;
	h=From:To:Cc:Subject:Date;
	b=F+wEVs18jg0US1SSIgzSUD9bH/WU+qaTSvpZPBSUP/Ql85miX54WEcHAQuIbIp+Nh
	 xWu7H8pkEsSA1d+8yk1fhP9M/PKIRJ9tOyLUjeTWqmXIY40oEMPgzx7Lhgn/SQOATD
	 SilEOI4kTrw2UFU9si0oQg4aohd72QJQQHbHMYH7ZJk3GPzLh8TXGHOcMJUqDxrk0P
	 tTWRGYZuZ6fBCJFOQO6uUlyyveUokKUwsGGbgZKodmA8e6PQ398MYEkFCH6eGjYxOz
	 dfi6ejckY8e6Rwpu8lK4FUNdy+heb83jmG8i//ZiK94Eu+9DRP63K7ZKE/J255MJPK
	 btNrWpzASzjUw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] Device tree bindings changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:16 +0200
Message-ID: <20261003095924.1370238-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-dt-bindings

for you to fetch changes up to 8370532640fa15b9480ba19af9314d3266c92aef:

  dt-bindings: soc: tegra: pmc: Document Tegra210B01 (2026-10-03 00:39:13 +0200)

Thanks,
Thierry

----------------------------------------------------------------
Device tree bindings changes for v7.4-rc1

This contains a minor fix for the Tegra132 external memory controller
bindings as well as additions of compatible strings for Tegra264 and
Tegra210-B01 to existing bindings. Also, the new Motorola Artix 4G and
Droid X2 devices are documented.

----------------------------------------------------------------
Aaron Kling (1):
      dt-bindings: soc: tegra: pmc: Document Tegra210B01

Svyatoslav Ryhel (1):
      dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2

Thierry Reding (2):
      dt-bindings: memory: tegra: Fix Tegra132 compatible string
      dt-bindings: fuse: Document compatible string for Tegra264 FUSE

 Documentation/devicetree/bindings/arm/tegra.yaml               |  6 ++++++
 .../devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml          |  1 +
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml       | 10 +++++++---
 .../bindings/memory-controllers/nvidia,tegra124-mc.yaml        |  1 +
 .../devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml      |  5 ++++-
 5 files changed, 19 insertions(+), 4 deletions(-)

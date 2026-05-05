Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D433F5AB;
	Tue,  5 May 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989269; cv=none; b=OFuIbga120Dl48AZ6PCw1R/R3hGDWfj3LxjrsC5Csl2goVpqj/hmAUmMfqtYvX3qjGef6zLTsGZOlSpUO3JYNh9EdgVZog8qrRiQjVB3tnN/DCyc204XwqfInM4XBnGBw+bXK07WxybLjZRgzcR7wp4BT8PCa2wIRdA63YeXi3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989269; c=relaxed/simple;
	bh=HgMDzCsD6nKDEpte2Nom5A3uyp8JErThwaHo4rnlPUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=apkmzjPpzsInpx9ZbQn+0JZr+qwWslKdkEzuahOZbGf/7G7WBwWa9D+xpkhDpWBCd3k/kYoLzxvbWZUO22+jPZ+UovFdMvizaVoTaKTH8tWc3kUZb0WzrpWiK2kqVH5jLGc0TQLk6ECeLCnmlSVujExwBqKsiyp3zO6WM3v/ApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnBW2Wyk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnBW2Wyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39206C2BCB4;
	Tue,  5 May 2026 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989268;
	bh=HgMDzCsD6nKDEpte2Nom5A3uyp8JErThwaHo4rnlPUw=;
	h=From:To:Cc:Subject:Date:From;
	b=UnBW2Wykn4e2i8bLpXDRMto01W8hcWii8yMFtHAUsf3FMfqRWmr9ZtLNylPinQe79
	 FIE2sVtGTChfbVpK2baeH9JrECnKhxGM0R4evuMZej8hDhTBf7Uzl1TBi+LGabV6Fz
	 6aUz7SdJEG6UawGlDjGpUVODLAtb/6syB0Vs0FzgU4xlipR4Jl3pk7vQukbFdUQaq3
	 YnwVku34NuTSnFLtRWrXMsGtni9HnL9SGoRjT6J+wSFhMPGKTTebQQojglAy24I62L
	 4JFeuxnN8+Ka5dRYUCW3mZosyhnbd+Ccolq6mKCsgUkVbmM2KI8pfrABTkMIXD+ICi
	 1uUJKojqC0T5Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: dt-bindings: tegra for v7.2
Date: Tue,  5 May 2026 15:54:17 +0200
Message-ID: <20260505135417.282344-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=krzk@kernel.org; h=from:subject; bh=HgMDzCsD6nKDEpte2Nom5A3uyp8JErThwaHo4rnlPUw=; b=kA0DAAoBwTdm5oaLg9cByyZiAGn59omi7SUl927zYQ10duy0wGG+dkSmpVuGGBT/iuXoKaWoQ YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJp+faJAAoJEME3ZuaGi4PXFoIQAIZ6 Sm7H9o53PeCWz0oNI1rSWfZV0MyTwfCXtbiOaCG791V9zksNBmhnDQRnzHxLjI/bnDcHX2hpcKC IWh2qELjILbZ9REFDS+WQ8mSfdcstbb7QMQphrKW9I2RRgWRt+c7icN7Bl9Vg3+ezcEiyyq2jEr L+kPNZlYMgPMxEdwAKrgecOWAc/ng5qBnhgiodlv2/tBOdzbpzyI7xQ/2FrIRXha8lVvUikhtqH wA1Mb3yE0qoz1ZZZip53LVFRgM7zt1WwFKO8MQJGdau8uZOaQNQE0OYPacay95ymdzUvyY3sjyt jdUPWqB7ITNQS/22ijyfhVC8WrQtbuswnHNNCm25c4fXaTYbbg90R0Xz2N9SnW+VZ3Nv9wCV9Bj PSMpuoKRF1xAYKyAqWq57AmUcq8/EyRakIletCRlCrpQu3y/HSypPwvEPBMgTFfLSjAX71sFLFD e4jBXCTbwMAM51PlGRvaOH4eF528521/FWm1rjWUpK5k4TMzwPsSFFcJTfj68w1P4Kp8DnN1BfR NivEZF/Ad8qOEcJ6gYLGdh6FfAZlWMsLriwq6NlyvUFgjKs3dl4mWIs4F/c/Fg1fRNp74kPz1OK Cx9UZx+D5ygyE5pqmu4zK9rc2W7KVtyF1WRngfeCNfq6oYw6QIuYBFV4Juyt9lxl9Ir20+Yf9ts iRzAo
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Thierry,

Shared tag between memory drivers and Tegra.

Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-dt-bindings-7.2

for you to fetch changes up to a4f97f9467661602bd6bf614bcee884502794d43:

  dt-bindings: memory: Document Tegra114 External Memory Controller (2026-05-04 20:45:47 +0200)

----------------------------------------------------------------
DT bindings for memory controller drivers Tegra SoC

Devicetree bindings used by memory controller drivers and DTS for Tegra
SoCs.

----------------------------------------------------------------
Svyatoslav Ryhel (2):
      dt-bindings: memory: Document Tegra114 Memory Controller
      dt-bindings: memory: Document Tegra114 External Memory Controller

 .../memory-controllers/nvidia,tegra124-emc.yaml    | 174 +++------------------
 .../memory-controllers/nvidia,tegra124-mc.yaml     |  31 +---
 include/dt-bindings/memory/tegra114-mc.h           |  67 ++++++++
 3 files changed, 101 insertions(+), 171 deletions(-)

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5E33D903D;
	Thu, 22 Jan 2026 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098244; cv=none; b=T6vaex23JmrkdlINT2ZQPeNxOvUh06pRWF7VTFPfQi0qb4dkGZ0V5DnMyfn23HqbLnZe2Ond5D57zWqTW+J27usw5CYvTcaAjPChOafmkk31CPbF7DyzhUkanMk6ESWlPcaBJa88ifBs5K4VzJyXauBOBwknqYuxsRd9V3UW6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098244; c=relaxed/simple;
	bh=03W+miu9snDAt7mFvXpzGvadHlBQWH/FakrfAMWKksA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGWJBqzb8mqivkVrcF4CmgtWzGOJ17p0m81+72VaN2a0lkmrSx8wFeSfwABYwrQs8sIT9E1gFMCaMMeYsUs+/C0fwUP+FWZVEpzkocMxtPwWn+No+Xw+giwtyBU0V/bmKRtp1hYdmfKUbMLcj4J8KObjFgi+59ipKPoWJa4r0Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTGUpU3Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTGUpU3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0395BC2BCAF;
	Thu, 22 Jan 2026 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098241;
	bh=03W+miu9snDAt7mFvXpzGvadHlBQWH/FakrfAMWKksA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uTGUpU3ZmFiFvnjDXKELVR1KdEj2L7iy6TSUNG9eYUXeIteqryu0VBNTFn9B3W1a6
	 hjZGmjAuLTXkBVKn+uWqQfrFkscEMjBipQgzR0Ic/gDLWHXfwb7GtnI5Yp13zlzMtJ
	 i5uKRoBz8IAsSCEkbnweSF+AcfjkxnaOA0Z/KKTuAfgiYJs/Azupp1VUfCSl7txw8T
	 BfIVNQerwdBwKwDYx1V85Fps4MFUwOcOWC94GZit9kYDF+vW1CpUAMjkmdn29+RyHP
	 6NnTuC97wKAoi5VkqI6OFrEpyv3EcC7sGn1pL4QV+e7KOvNG3Kj0tftF19Jw8DTjTT
	 xvpJA4fIdhQdQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org
Subject: [PATCH v2 09/10] arm64: tegra: Hook up VPR to host1x
Date: Thu, 22 Jan 2026 17:10:08 +0100
Message-ID: <20260122161009.3865888-10-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122161009.3865888-1-thierry.reding@kernel.org>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The host1x needs access to the VPR region, so make sure to reference it
via the memory-region property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 5f67d9b57226..cfffa4f2f196 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4474,6 +4474,9 @@ vic@15340000 {
 				interconnect-names = "dma-mem", "write";
 				iommus = <&smmu_niso1 TEGRA234_SID_VIC>;
 				dma-coherent;
+
+				memory-region = <&vpr>;
+				memory-region-names = "protected";
 			};
 
 			nvdec@15480000 {
@@ -4492,6 +4495,9 @@ nvdec@15480000 {
 				iommus = <&smmu_niso1 TEGRA234_SID_NVDEC>;
 				dma-coherent;
 
+				memory-region = <&vpr>;
+				memory-region-names = "protected";
+
 				nvidia,memory-controller = <&mc>;
 
 				/*
-- 
2.52.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC83D9047;
	Thu, 22 Jan 2026 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098245; cv=none; b=FG1Xekt3ez+E5xZy+0WnhGGIXS02zw7nU0NFrG2/jgUPAcmxUHyK5buaJ8Ay0L1Bi/jZjBw+0MxasD8aB7OOXehe50BELoMWIWGVjKLOtR2VEE5aa7VOL7b5gVf/Q5goBupEUOUpWJsMGVhfsTGy58ngf7e+KYGxA94nwPIfJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098245; c=relaxed/simple;
	bh=QijF92eYDRa+yIK2vhm3tFsLRnjMqoXf04XxHtZ1MqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJiB3+XpS6Eu4gYrt/xrUMoWUVGPVZtjDuoOyxKi4rkti5nyehf3hapVktrYq2rBc+lPbYeyBZJSGH0VIrVh8DuqTuX7DGR7jWsxPb/3i7ACVJn9zApzJHD7r4g0daOd9sdVSmO0h3hZqszUusEY8APrU34yyM0580uJMjSOXnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNmNHAwh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNmNHAwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D3AC116C6;
	Thu, 22 Jan 2026 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098244;
	bh=QijF92eYDRa+yIK2vhm3tFsLRnjMqoXf04XxHtZ1MqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aNmNHAwh6+Ee4JCUL4XYjXlSPA2GuhsMMlfHRnFJ6eE5hI52R5FhC4VvVlVsVK+JO
	 lSQ5dkSapp/JDxlyK2cEO8GQZP7Q/9+d4PHDlMoUX3+KX2V/V7GN+pFy+nXWOnPAjB
	 U5/uIxdgKucOEy9mOvYK6rmUaFPTD88lcW7WPzYuGyyQibKL/6Mn9MKWAfFdAM8lR8
	 t1wh6jYr2oHCbwVJ5PEK7wNKP1q36BAZHinnOMwwLtL8Ax95HNWPVSne5iLwxdxxD/
	 26apQxbErgrDUBUos5ALL/Cc5k44dWIBDqG3h0M/k/DTF8X3yvxvmRlpzUN4w9Z2Ai
	 vYcGFh2zIDG9Q==
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
Subject: [PATCH v2 10/10] arm64: tegra: Hook up VPR to the GPU
Date: Thu, 22 Jan 2026 17:10:09 +0100
Message-ID: <20260122161009.3865888-11-thierry.reding@kernel.org>
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

The GPU needs to be idled before the VPR can be resized and unidled
afterwards. Associate it with the VPR using the standard memory-region
device tree property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index cfffa4f2f196..21db5d107bc4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -5338,6 +5338,9 @@ gpu@17000000 {
 			 <&bpmp TEGRA234_CLK_GPC1CLK>;
 		clock-names = "sys", "gpc0", "gpc1";
 		resets = <&bpmp TEGRA234_RESET_GPU>;
+
+		memory-region-names = "protected";
+		memory-region = <&vpr>;
 	};
 
 	sram@40000000 {
-- 
2.52.0


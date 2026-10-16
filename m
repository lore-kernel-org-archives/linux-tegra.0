Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0851CF70;
	Fri, 16 Oct 2026 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166832; cv=none; b=JNeP9ZIhcDNHeyJug45VJvtX3eyaEJ6loKz5cpZJX9TUfA0XjRCRfieJOueJRxNidfjL1MoEuUIm7s3TA/smX7S9oqyixr4nCb6DFX9f0WFDTwWLRxxH4Q92INiEEBqbEpsDlRbxWDAW9N2a2oGUdSaRA0nsvbN5wR4i3ibKXjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166832; c=relaxed/simple;
	bh=cXFizJmXKUZx5MnO0+6LShUGVYjiH0jQOl2THgZ/u9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IE8F8nIeg5Hq+hdglCiyvZRgfMR6wiVUFQjxFda7R2Lil7oQ7CeH21Sn+QiU5nGWvqQbwg19YpSknnih+JnbK0OvrAPvmHBZRZdpvPOKpy+kBG+DoVbb7Va2vbPWuVntjriUNTJH89ShcGSwJ+AP7CGYRIxAwm1l3NCKrF0BzCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/Epq7AM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/Epq7AM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B691F000C5;
	Fri, 16 Oct 2026 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166830;
	bh=HoQcf7n8Q8ynNDAuwTEGdl/f27l9+9gdRy/4HNnkOVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F/Epq7AM1gSU+en4YO89dvsAJYKFrWxlTyCrAOyJJiNbc6OeZ/X2SNmQ6iYSi2onm
	 esSIfTLvS62+8UY9Onu8T823en0EK/29yiaTsTsoMI+TLTYvWyBuDVaYHh7O01yhOI
	 v1BiekT1LXDDQ/pyrQUP1EOKhUPfNJVqn94Cu/OK3GxoEE4EXOAbWYX6XEn/fGKyNa
	 bqbZ6ixFMf2tSJp0cGSBK92yXZTxYsj4HQLcclbpoIyHRP5coDVgRix7KAo3gKyXb7
	 /JDuuI+tLr0uybOzpo0YIu8Acp3Okj+YoNNpWQ4zGiwCsjxongmJGMm5rKTDXHHi4/
	 Ul4ClICsVsldQ==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Diogo Ivo <diogo.ivo@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] arm64: tegra: Add the fuse clock to the Tegra132 GPU
Date: Fri, 16 Oct 2026 12:06:56 -0400
Message-ID: <20261016160700.3831336-4-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016160700.3831336-1-sashal@kernel.org>
References: <20261016160700.3831336-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPU needs the fuse clock running while it is powered: the GM20B
on Tegra210 often fails to initialize without it, and the GK20A on
Tegra132 is expected to have the same requirement. Describe the fuse
clock so that the GPU driver can keep it enabled.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 26cd11a8a4a12..30f0d87aa70c2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -195,8 +195,9 @@ gpu@57000000 {
 			     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "stall", "nonstall";
 		clocks = <&tegra_car TEGRA124_CLK_GPU>,
-			 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>;
-		clock-names = "gpu", "pwr";
+			 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>,
+			 <&tegra_car TEGRA124_CLK_FUSE>;
+		clock-names = "gpu", "pwr", "fuse";
 		resets = <&tegra_car 184>;
 		reset-names = "gpu";
 		status = "disabled";
-- 
2.53.0


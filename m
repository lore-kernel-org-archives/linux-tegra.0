Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFEE51DE1D;
	Fri, 16 Oct 2026 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166834; cv=none; b=py/KqgO4fPRTBCBcwXuCdbNPu38m7d5SFbpx480Zny24SdAEx6OyIPen5RI29riV8YADeEHqlFMOkOimwNUex8rSOKwuCw4CMhbe02tlPZEoyCe2Qt68KYxD+SvXlLYtcm1v7jj1mFKlANn1pF6FmvwPe1kMYMWYfxC2H2wZlEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166834; c=relaxed/simple;
	bh=u4yIoPDpFwNxIk2tPnuMOUb70kXiRIwgkJ5RWOQp0cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bg27qN/hYSAOZc3Lr6e52edVCcP/I/Urt8KdkTiZLeo3pN2fl4rnkuCPk+u5RsJ2pjOk00KlShSQLoAKSSHx8DLMv3pVNZcUTF4U7+64OClO8LuDGSvZBZGkZ8FIzlOl5+EXxArQLoInBtO5+8au4Fabu+FJia5uE7vmvTO8V0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvBbqpzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvBbqpzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C9B1F000C8;
	Fri, 16 Oct 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166833;
	bh=HkcaHoVEuEF6jyX7l2/gwSTBl3pJicibI4BqOQZqGyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DvBbqpzt1HA3rimcovjh1Gl6D1s64mWvD0b6KWVHdMToeVDnOKkWRBgmIQHS9Hzpe
	 wRpnmM3H37XPHKalWCSDp5Ue6nVO2XHqQqk6YJ78Cyb8Hv1O5q6uB8tKSTYOFUTYsY
	 XjToLrg9EV3Fl6zZmt+OV/O4+3vuU9XJnA+fZ7+rSnJ5SGKsH8BeBMMjRz0G2/rbui
	 DB3jhcYvGMG+yV4dMKCrodHK21CRfrMTTtecKfR5UFhH5pc4f1CoBKjYZLSX5uqRoo
	 JEG+DzsFjdphHa3imjdX1ekHS9ju4HrmrOzpYZjTb8+8I/F14t5BBRgVRsbhriRCH+
	 MLFOdwl7bfr/g==
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
Subject: [PATCH v2 4/6] arm64: tegra: Add the fuse clock to the Tegra186 GPU
Date: Fri, 16 Oct 2026 12:06:57 -0400
Message-ID: <20261016160700.3831336-5-sashal@kernel.org>
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

The GPU needs the fuse clock running while it is powered: Tegra194
already describes it for its GV11B, and the GM20B on Tegra210 often
fails to initialize without it, so the GP10B on Tegra186 is expected
to need it as well. Describe the fuse clock so that the GPU driver
can keep it enabled.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 705af0373a090..7d2dd0713de5c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1883,8 +1883,9 @@ gpu@17000000 {
 		interrupt-names = "stall", "nonstall";
 
 		clocks = <&bpmp TEGRA186_CLK_GPCCLK>,
-			 <&bpmp TEGRA186_CLK_GPU>;
-		clock-names = "gpu", "pwr";
+			 <&bpmp TEGRA186_CLK_GPU>,
+			 <&bpmp TEGRA186_CLK_FUSE>;
+		clock-names = "gpu", "pwr", "fuse";
 		resets = <&bpmp TEGRA186_RESET_GPU>;
 		reset-names = "gpu";
 		status = "disabled";
-- 
2.53.0


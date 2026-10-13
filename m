Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D54398F1;
	Tue, 13 Oct 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903136; cv=none; b=uKFhiW1+Sf2McUztvw2hGMQQP2vZxtcWMeimEW1PZfKgi/tr2b315r+1+xs75tXclIA/EnT4Nz1bieAu65qOzlzBHc+cuhaT/Zqm6VssndY5nvGFJx4oWRVldOx3Ffod9wxF5rzGLoZV/m9ap2SEhwWaOKTxS8/xa6Pnb9ObuHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903136; c=relaxed/simple;
	bh=/u7EvFooTlLqPtHcEbarIAc47xfRty4LAnLOQukkS+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xkg8lmBLQEjbJ/rbqlrCKMmIbZf6KaaYhW84icLNO4+A/pQvjNlloVUIcwjrgzDju+f2jxXf6l6H+HghHAe4p12aqTuJFBo2cpOlyCWFyNGKJPtdFlUlUzMU3HdVMfzvh2o+OojAgWw5uVbRt9SnXn+REQPiksqR9j2kMmhV5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW5uHOaq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW5uHOaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF571F00893;
	Tue, 13 Oct 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791903135;
	bh=hbNHU1fsqSqBvlLyyjwsZtUfV6L8Ck8u/6m0aKnYvpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PW5uHOaqNfFerh7XvA6GccwyPteZU9o8lgMSsFD0lKj/nqtlSw1zXQTbIZhNUdDCJ
	 N1zCLyQ413MsGAVS2S1kaxYHFVpSeF6Tuu+E1a3f2GtU/FNNRAUk3OSYJI/tvSPA9o
	 rsO0sVofrj0M173tBhgjLW4CjMl9JlgjjDg4lYOjWPctqXbW023GwAKvDbO5NWe0va
	 9xXUljmjyv5UgFrYRL8ngvS7Q9rshiXjMkfmL7gXl6sCmFJHAJDHd6rCuMJwVblU4J
	 Q3uLgBBmO3SryQZ+vnsgvnJ9uFUD+aG0wmDy9gPthyD97CC0yAW+yzImho9jX3zI5c
	 cgm4uHE/+ud9w==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>,
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
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 2/3] arm64: tegra: Add the fuse clock to the Tegra210 GPU
Date: Tue, 13 Oct 2026 10:52:09 -0400
Message-ID: <20261013145210.103565-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013145210.103565-1-sashal@kernel.org>
References: <20261013145210.103565-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GM20B GPU on Tegra210 needs the fuse clock running while it is
powered. Describe it so that the GPU driver can keep it enabled.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d709..2e84b2bda314 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -446,8 +446,9 @@ gpu@57000000 {
 		interrupt-names = "stall", "nonstall";
 		clocks = <&tegra_car TEGRA210_CLK_GPU>,
 			 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>,
-			 <&tegra_car TEGRA210_CLK_PLL_G_REF>;
-		clock-names = "gpu", "pwr", "ref";
+			 <&tegra_car TEGRA210_CLK_PLL_G_REF>,
+			 <&tegra_car TEGRA210_CLK_FUSE>;
+		clock-names = "gpu", "pwr", "ref", "fuse";
 		resets = <&tegra_car 184>;
 		reset-names = "gpu";
 
-- 
2.43.0


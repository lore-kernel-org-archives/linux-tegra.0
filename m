Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C6E51DDE8;
	Fri, 16 Oct 2026 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166837; cv=none; b=t2nXMb5+yI+8FcHVfdeqXxmWMpO0luH7XFFb3Clp3db8V5QfQeqIrE3Ngi9iN6+p3Pfpr+zzDTcq3znC2X7uJ9U5vWxnuABxg2iNKdhpeaujQWyw7O+dXljxOBH6FgzkO8OrYSkl880Pu0ZUkd4kfto2XFw50yGw0lsa53A8VOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166837; c=relaxed/simple;
	bh=wkYgRpj7hAritirMdr6bVOohvOhh8vutY+i4MfuPKmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdUjyq37QUA0qqe00Nrwcsb6Gjo7GzYOf6l+shvYa5D5a3aH540PsAocKb6LvSsU9cai4dVu/GyAovvjtGv8PTHJTaed1qO1pxMLaqOYfoCvkMkWqUu1iLEKIAD3xrVhCXtvPleejAVcgAS5XPyquBbGvN1MlvUUOvTpS1MhNU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAe7Td8X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAe7Td8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10A11F000C7;
	Fri, 16 Oct 2026 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166835;
	bh=bTnvzmPBqQO5bnBnm+XgGen3Y38ypytnbj4pLgrXzZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lAe7Td8XOZeaj/f4Z6IveolOWQxjThgFB7mKy/zV25BfXtHsOup8Bu0G9/vSewuAt
	 4167jHC7JTF54vSJsqo0sWRQJuJWoNPzrIPxswwflYqFS6MMkOZZ6Patq5gNUfhHub
	 ONYn57NtbuUSCg3JKpjcfkaaLX0U70n0qzwSMKPYGXezcBNMsy3uiAvLmO8oFJbXbG
	 zWGG8BZbYvt03LYoLhf6Ud7BD23Mh2TJK1uFRM6jw48JEB61iCdX+yo+pF7gY8GPt+
	 QaaB04gDG8Xgyt+8bp8xMGKr/E4xsNPRmJ3OOccR2xg1Rf1qVQoD4oHMMZdERA4tvk
	 RKH2Tpr6CgTDQ==
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
Subject: [PATCH v2 5/6] arm64: tegra: Add the fuse clock to the Tegra210 GPU
Date: Fri, 16 Oct 2026 12:06:58 -0400
Message-ID: <20261016160700.3831336-6-sashal@kernel.org>
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

The GM20B GPU on Tegra210 needs the fuse clock running while it is
powered. Describe it so that the GPU driver can keep it enabled.

Fixes: d1b725476104 ("arm64: tegra: p2180: Explicitly enable GPU")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d7096..2e84b2bda3142 100644
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
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E567425CF7;
	Wed, 10 Jun 2026 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104201; cv=none; b=HVftAj9Z1wYgMKSRI5YkShDFOUO4ZycfwTs4JaZXZqoXGfsStDYDBIiKOuw9aZWFb9i31qkROE1geZea5DEvFdviUYJ31xSkrMd/pWjf58CyuI4P0xao7xCdEhpWpqBLhK8ran7DBN16/Qvx06ltgmMWXP/t5HcRWiCxSJNng4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104201; c=relaxed/simple;
	bh=Xyit1Mn22alQb3q43N8r2vQqBnCOxf8gMWyJmYGj5ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mDWNQnieRuyjozYUJiO3w6RnL58PoBv4YqBNFos54oAV3Z3154SzpNP8gHHv/gGh3wXPi3TqDuFlK0bgd+mAwZS28XHJsAco85b3dqK72ziYSs8nyNgoHqcyut+6fxrHm9BraeQEJEH26LX2FnwhLHZrpRWXuZJ3hPjtb3wNa28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FB71F00893;
	Wed, 10 Jun 2026 15:09:56 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
Date: Wed, 10 Jun 2026 17:09:52 +0200
Message-ID: <cover.1781103355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
series drop all such masks where they are still present.

Changes compared to v1:
  - Drop applied patches,
  - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
    EL2 virtual timer interrupt") in soc/for-next.

This has been compile-tested only.  But note that all such masks were
removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
systems")).

Thanks for your comments!

[1] "[PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts"
    https://lore.kernel.org/cover.1772643434.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: tegra: Drop CPU masks from GICv3 PPI interrupts

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
 arch/arm64/boot/dts/nvidia/tegra234.dtsi     | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

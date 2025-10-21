Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4876350A00;
	Tue, 21 Oct 2025 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761076031; cv=none; b=MjtDy5gBcqUb3EPoeMxA/27Prttzc8oTZhxB1pkF1lHuvqrYtEn/DA3ydnjtec575+YZONx3cP7YcHZ81+KEIpVIJJXeLFvGHH9zPP5VwWeLWiO9uDG61/k6jjf8JeeY7aOjrakNh9faxy8pdEKNsVUF7qWZb956StpujBeB+bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761076031; c=relaxed/simple;
	bh=hDZb4pyqS83PXcuQ5I2j7XXbTUMJgMNauRG0Gmqa7K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BIdHaCXNN75Exf7RnnWEEkdmGraftr8EhiA866aOBbMonpKjwP+YvfUZYLJM9lh6aRnfZ5WE3GjzDvBVASuyLbC825Qsm49U/l9EpJUimd8GznkCRFtk3BJcR2Vz3Ob+KTdaD0yKiqVmoNvRU7L/O98ZnSdbKYBKJQQZ6HvLUvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttonAvUB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttonAvUB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58E80C4CEF1;
	Tue, 21 Oct 2025 19:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761076028;
	bh=hDZb4pyqS83PXcuQ5I2j7XXbTUMJgMNauRG0Gmqa7K8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ttonAvUBvwtQtZB/mn3LpRSYT02+MKNYgEsHlhz6UQ06Dw5Lj2JPa1LCKXZ3EMZHl
	 FBiMyim0Q4B/G2Nhehv1NdcRUVfxtyaF4ASlKjwsIiZ52aw9RiBUxbGAdQ4dAo2TRz
	 bWvnbF/2PMuMtAJq+jST0m8c3chCCik2zVnv5lLslk46fMHBSL6VIiLQ5DzBLIRlw1
	 Fqj3Xzd+aeYCdiUld/mWM7K5wTuhJuvy2Q4+ZmtrDkisnAfGF3318H1M+QLVMxBu/r
	 On/cwjxb+F/yyrYvclnpiNCfAZROIoxW2G2mCfqC2oUnwJGoiZTYds4mvnLdKWEF7h
	 iqhiX9AWZ+fCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49791CCD1AF;
	Tue, 21 Oct 2025 19:47:08 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 14:47:06 -0500
Subject: [PATCH] memory: tegra210: Fix incorrect client ids
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-t210-mem-clientid-fixup-v1-1-5094946faa31@gmail.com>
X-B4-Tracking: v=1; b=H4sIADnj92gC/x2MQQqAIBAAvxJ7bsE1FOor0aF0q4Wy0Iog+nvSc
 RhmHkgchRM0xQORL0myhQxUFuDmPkyM4jODVtqQ0oSHJoUrr+gW4XCIx1Huc0frjeN6GKyqCHK
 9R87iP7fd+35l7UmeaQAAAA==
X-Change-ID: 20251021-t210-mem-clientid-fixup-6d5ce9bb6031
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761076027; l=1235;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=LT4M0FZugp2BvBr6W8Smqc6NSDGFFyx1kOqJIqzRmDo=;
 b=Y7UbDNdsPxaxd6U4wZtJN2c+50XyeiJkpq1l16Ni3Vr0iTDH8dMmMvv2On+fjKVXPPAbnx0dJ
 tVnE8a45EgHCw+A8SginP61YLlGxpQ1xHdzPN9YFPWBoPrCcgqS2xxp
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The original commit had typos for two of the memory client ids. Fix them
to reference the correct bindings.

Fixes: 3804cef4c597 ("memory: tegra210: Use bindings for client ids")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/memory/tegra/tegra210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index cfa61dd885577a8fbd79c396a1316101197ca1f2..3c2949c16fdef4911682da5e3cbfb91899e34c87 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1015,7 +1015,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			},
 		},
 	}, {
-		.id = TEGRA210_MC_SESRD,
+		.id = TEGRA210_MC_SESWR,
 		.name = "seswr",
 		.swgroup = TEGRA_SWGROUP_SE,
 		.regs = {
@@ -1079,7 +1079,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			},
 		},
 	}, {
-		.id = TEGRA210_MC_ETRR,
+		.id = TEGRA210_MC_ETRW,
 		.name = "etrw",
 		.swgroup = TEGRA_SWGROUP_ETR,
 		.regs = {

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-t210-mem-clientid-fixup-6d5ce9bb6031

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



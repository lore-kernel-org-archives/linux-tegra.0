Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E358A268683;
	Fri, 20 Jun 2025 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418384; cv=none; b=sg8Ovj11HnRbbA8OW49ndyET+beselJLRKffJnMzGLgG/rWYzUYnMVQh9oQfmAnfJg8EVWLIIDusG2zGqTrvVQFE7b6ndaT+ougRVLABC3Zi+hTYxgoGURONOvu7rC54gy1+0YLueRi40KvUwYNMbdD1HkYaBAZxvUVEL0y758o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418384; c=relaxed/simple;
	bh=v4CSPeGlTth/fyAsN1KxvH9LcX2LADhaZVDWoO+/GwU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bkpWL/Iz3u8xg8uznCF4ZLFvztTvkT7VL7d/kA/cF1K6qP2b0LymwseKYLMJvv/kTcO8YvRg7x9BehxiP6Lww/p1zZlmsRFrJZtE9FoCFbh9V5dMAescz+reTOmZw9NYgQJiEGwfaQ2s5/m0sSOtaIOb7bV1fQ9NF7P2/cZSnEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZNHFMLM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZNHFMLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3B6C4CEEE;
	Fri, 20 Jun 2025 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418383;
	bh=v4CSPeGlTth/fyAsN1KxvH9LcX2LADhaZVDWoO+/GwU=;
	h=From:To:Cc:Subject:Date:From;
	b=XZNHFMLMOwJs1tRC9UEfBSfA5v9xqXp3vhC2nC7TtET0tRZikVz7OeRertU+daUAw
	 LA3TF/NWE9VMthu1Hwj6dNdd/4jDOoDN9ChBMwWhOB7a0/f28nQhvV+WktLGe0OBak
	 2ZA0/JyGoMqX8Ky7ivixNDebHthm32Fjht9dJQpUyaTVjZ0jpF2ghqIaxPpcwC8AJQ
	 lZWVGxErxouSemnabSzvHNF0EpcUzktj/EuRyuwPPNjeI+Tn1nxBFDCaFsTY+yCWPA
	 RhQxY2Kw4a8kXLXevWjHy8YI0hUOkXuVkjuDzUd2pW8iCW9O9WitKpUeGFytoPJEek
	 zUUE4oc2J6EOQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Pohsun Su <pohsuns@nvidia.com>,
	Robert Lin <robelin@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] clocksource: tegra186: avoid 64-bit division
Date: Fri, 20 Jun 2025 13:19:35 +0200
Message-Id: <20250620111939.3395525-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added function causes a build failure on 32-bit targets with
older compiler version such as gcc-10:

arm-linux-gnueabi-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
timer-tegra186.c:(.text+0x3c2): undefined reference to `__aeabi_uldivmod'

The calculation can trivially be changed to avoid the division entirely,
as USEC_PER_SEC is a multiple of 5. Change both such calculation for
consistency, even though gcc apparently managed to optimize the other one
properly already.

Fixes: 28c842c8b0f5 ("clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clocksource/timer-tegra186.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e5394f98a02e..bd3d443e41cd 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -159,7 +159,7 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 	tmr_writel(wdt->tmr, TMRCSSR_SRC_USEC, TMRCSSR);
 
 	/* configure timer (system reset happens on the fifth expiration) */
-	value = TMRCR_PTV(wdt->base.timeout * USEC_PER_SEC / 5) |
+	value = TMRCR_PTV(wdt->base.timeout * (USEC_PER_SEC / 5)) |
 		TMRCR_PERIODIC | TMRCR_ENABLE;
 	tmr_writel(wdt->tmr, value, TMRCR);
 
@@ -267,7 +267,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
 	 * counter value to the time of the counter expirations that
 	 * remain.
 	 */
-	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
+	timeleft += (u64)wdt->base.timeout * (USEC_PER_SEC / 5) * (4 - expiration);
 
 	/*
 	 * Convert the current counter value to seconds,
-- 
2.39.5


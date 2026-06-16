Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B053793AA;
	Tue, 16 Jun 2026 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639868; cv=none; b=n2cRGoxOghc6XjzlWwxyHEHPrZE22asAeK8aBuZ0dMus5tsIntHeKidusHbD5uCOVRJq37xk95M0u2pM2zcavRlgyW8AwMvSUi7caLcjU571OkWaBwtJTVemi2tNaw4+Ab9TS0W5OeE9lXA/X9nsgFN9bpyKoPisP2T8eb9+ALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639868; c=relaxed/simple;
	bh=K0JBJWLO4NAe2eCxxp+GMFYZDRSP/vFVHfI189TROv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eBwy5EZPOzPD/CJIKQ2rxf3qqtnjpCey79lvNJ+Yev0UCp9K2FG/ypPyW5rSPfP53Rw04uUG4e9agdRFRkivwG2s2mdVVZHU6EbbJxJN17EqnUK5+3M5IgfL8KYeV8N6pHmSVh6ekbDPdLc0Q5xHmImBJpmzUcQexfKxUJlVQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vg7YGJe8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vg7YGJe8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A031F000E9;
	Tue, 16 Jun 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781639867;
	bh=eo9U1LCEnWJbnw1BK68fdgqOLkAk04qnrlma4R/O3+I=;
	h=From:To:Cc:Subject:Date;
	b=Vg7YGJe8w3N0M4R8zH54/AthtZ9jU/F+tUM7dxYRl7jgbAs9i9c5h7qkoeflINJfG
	 gkD6/AXmTG5E2yAxeB10j48qk0u+3FpbfIfOsMX5AGDzXUJM/JaTD9rT+wxpk6ya1C
	 ZhEA90PDN6EkIiB+bPEaqqaJ+yCpr+MSEpOsiZWJj3PoE2qFuzWtYXnfyRxIcaqNOT
	 CZ4ChZ2bBYNvF9rJR30azmOFc90KitXlajnP9WEslusfkoCWC9D3sXTv/AScJJ8V3T
	 8qxUeUhaAbbuypJZ/HcQ8KJA8EHcHOaRSD2qZreadhdYcV/EiBTNdi6VEr7jP+gcZr
	 5X1vNRw1t9yww==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc/tegra: pmc: fix #ifdef block in header
Date: Tue, 16 Jun 2026 21:57:35 +0200
Message-Id: <20260616195742.2345903-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When build testing on ARM without the PMC driver, the other drivers
fail to link:

ld.lld: error: undefined symbol: tegra_pmc_core_domain_state_synced
>>> referenced by regulators-tegra30.c
>>>               drivers/soc/tegra/regulators-tegra30.o:(tegra30_regulator_balance_voltage) in archive vmlinux.a
>>> referenced by regulators-tegra20.c
>>>               drivers/soc/tegra/regulators-tegra20.o:(tegra20_core_rtc_update) in archive vmlinux.a

Adapt the checks in the header to cover both cases on other architectures
and without PMC.

Fixes: 8318af5dd29c ("soc/tegra: pmc: Move legacy code behind CONFIG_ARM guard")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/soc/tegra/pmc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 4bcbf19d75ac..53f6d02889db 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -210,7 +210,6 @@ tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id)
 bool tegra_pmc_cpu_is_powered(unsigned int cpuid);
 int tegra_pmc_cpu_power_on(unsigned int cpuid);
 int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
-bool tegra_pmc_core_domain_state_synced(void);
 
 #if defined(CONFIG_SOC_TEGRA_PMC) && defined(CONFIG_PM_SLEEP)
 enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
@@ -230,6 +229,10 @@ static inline void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 {
 }
 #endif
+#endif
+
+#if defined(CONFIG_ARM) && defined(CONFIG_SOC_TEGRA_PMC)
+bool tegra_pmc_core_domain_state_synced(void);
 #else
 /* needed for COMPILE_TEST */
 static inline bool tegra_pmc_core_domain_state_synced(void)
-- 
2.39.5


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F872DF132;
	Thu, 18 Jun 2026 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793420; cv=none; b=O/wkybTSnd5UwqswXTTtJvprjNjv0a/rZEGKELgjiS1Cv7cEvxCvzTQjT8jlWtjLb1xDUDXb686tmksNXfcnTl0vQX7k5UlQAERtHM8uqAVZxnnZslwbF75b5dkkT1QR3WXvfXRHTyxzcaDWjbHilCqIoyk4HJLUVrK4qi7TJI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793420; c=relaxed/simple;
	bh=K0JBJWLO4NAe2eCxxp+GMFYZDRSP/vFVHfI189TROv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ac6sVkptXEAQ6T9zkmhyNZI1wJ1p1tyhqrEsifi7rFZHjwaxHq3XpwAfR498r+7LTpM7M/afchwdy6GOynLAmJCdezOlIZC2y2CjRbgEB+CYH4fdFGAOKi4KnXt6CwxNMtP+ge9k0z8ffOIrzR7f1Gl7HX9jl1xecOEagT9ekbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFcbwaqY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFcbwaqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304211F000E9;
	Thu, 18 Jun 2026 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781793419;
	bh=eo9U1LCEnWJbnw1BK68fdgqOLkAk04qnrlma4R/O3+I=;
	h=From:To:Cc:Subject:Date;
	b=XFcbwaqYOS5xTQif5DVTYyTephdWPivw0hGcvAO1tpSP1TV5k47z9iEF0cW/gKibT
	 JqYa5zOUeE1/6vynNDCyI+DsWkyKtpwK5u5wtQjCR8RPplPwrWRV5oPsRjIH2hMT3A
	 b2WTU6FjTRn3OE8Ng2Y6hVpu1srrjCmquzmLtlCjevtp3sk3O+NlZir7eDOueOfERS
	 9mKlGhb30kdB//pLavh7bkjRZGGZGKXNQTWhNPQ6NDFMKCMTjBxvGCseaIDzNRSHQL
	 4955lDYF3aBrYh2taEKJz9j1H2YYRb3C9mQT3Yo8hbsiiVS122IpKR3cwHdPHnF4VO
	 HcJNnNPR3xIFQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc/tegra: pmc: fix #ifdef block in header
Date: Thu, 18 Jun 2026 16:36:50 +0200
Message-Id: <20260618143654.2102062-1-arnd@kernel.org>
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


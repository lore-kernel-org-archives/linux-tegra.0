Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73840DFDA;
	Sun, 26 Apr 2026 00:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161787; cv=none; b=W+G0INebiluUQunIlCbxk5J0DK5blBuNgR7IPLs1ip/S3AyoWXwaoiWYn4QGq1Zj2DI/Tv1dHJFniL8anrSaeAyIpDfheUESZH1F2crGUugLePsehkQPr7zILnBRnFFqGf/I33Yukbewoo02o39Jk1av7SZIiGjYVEEGtTxYw9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161787; c=relaxed/simple;
	bh=UKRM1hcCiFIy3YjCIeGUJWgvZ2WNyZQxMIWelrm3mcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vArk0T8j4lS17LOKfKfwbkpX7FgnXrD2GAQtmR4InM8UGequMcDjHz4UOl0f8AVgfdUvszDxrUSxZA0Mijkyki8L3ygPvs4VSccrxvCI8lUho6Rd5o1jgAtQZMGmNCSbNH5KGA6qBHtGVsTLHGcOAWxTqRMILB6Ul9Rc3g1Nj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1tc8J6/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1tc8J6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57194C2BCB0;
	Sun, 26 Apr 2026 00:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161787;
	bh=UKRM1hcCiFIy3YjCIeGUJWgvZ2WNyZQxMIWelrm3mcU=;
	h=From:To:Cc:Subject:Date:From;
	b=r1tc8J6/pSGk4TiJfden2r5oxgFtwTU6Md6EH247cB+uHzJApefCYJemuWjoOZDx6
	 fs+oW/mCskvGDyCpBk6diLy0PLey0voKlyhYCb6oocxKcy/+e5/WCnL3ol2HPojCZo
	 WiMDBhVuIL045YvxwXG5hRQZjKPBTRPozO+pxCgwKMHo2eHpMsOOWiX6ekKy4NLTS3
	 697C70+ldpRMpgIYEA1QcaibZFwOD7R6absLisbrEQg/TD8vTK97Ze66yzpaIpSGl2
	 CGBxnOBqv7iDJoY6CTJei8llLZ1HGcoPPG7rjVU7fidGQ5fQAbROBWpbMAlSe4yIFN
	 W02LcAmRfWz6Q==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc/tegra: Add PM dependency to SOC_TEGRA_PMC Kconfig
Date: Sat, 25 Apr 2026 20:03:04 -0400
Message-ID: <20260426000304.54912-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kconfiglint reports:

  K006: config SOC_TEGRA_PMC selects PM_GENERIC_DOMAINS which depends on PM,
        but SOC_TEGRA_PMC does not depend on PM

SOC_TEGRA_PMC is an internal bool symbol (no prompt) that is selected by
ARCH_TEGRA_*_SOC options to enable the Power Management Controller driver.
It was originally introduced in commit 5e7d4c652941 ("soc/tegra: Implement
Tegra186 PMC support") as a bare `bool` with no
selects of its own.

Over time, additional selects were added:
- Commit 5098e2b95e8e ("soc/tegra: pmc: Select GENERIC_PINCONF") added
  select GENERIC_PINCONF
- Commit 28dbe8231066 ("soc/tegra: pmc: Select IRQ_DOMAIN_HIERARCHY") added
  select IRQ_DOMAIN_HIERARCHY
- Commit f880ee9e9688 ("soc/tegra: pmc: Add core power domain") added select PM_OPP and select PM_GENERIC_DOMAINS to
  support core power domain voltage scaling

PM_GENERIC_DOMAINS is defined in kernel/power/Kconfig as:

  config PM_GENERIC_DOMAINS
      bool
      depends on PM

When commit f880ee9e9688 ("soc/tegra: pmc: Add core power domain") added
the select, it did not add a corresponding `depends on PM` to
SOC_TEGRA_PMC. This was not a functional problem because all callers of
SOC_TEGRA_PMC are inside `if ARCH_TEGRA` blocks, and both the ARM32
definition (arch/arm/mach-tegra/Kconfig) and the ARM64 definition
(arch/arm64/Kconfig.platforms) of ARCH_TEGRA select PM. Thus PM is always
enabled when SOC_TEGRA_PMC is selected in practice.

However, the dependency chain is implicit rather than explicit. Add
`depends on PM` to SOC_TEGRA_PMC to make the requirement explicit and
prevent a theoretical misconfiguration if SOC_TEGRA_PMC were ever selected
outside the ARCH_TEGRA context.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 073346c1542ba..8b6fdb9ad1ea3 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -171,6 +171,7 @@ config SOC_TEGRA_FLOWCTRL
 
 config SOC_TEGRA_PMC
 	bool
+	depends on PM
 	select GENERIC_PINCONF
 	select IRQ_DOMAIN_HIERARCHY
 	select PM_OPP
-- 
2.53.0


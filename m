Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C743CC7DC;
	Fri, 21 Aug 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302361; cv=none; b=Y7T2TL8GXYbSyMC7kGzqSVTnJqqadn7mkF9vp4i/vQdNmbvPHJrVGLw5r3rGh4MOnJiTqYP/QuVOOqwG8wO7DJtc0+HdHjpsFez+u8KwYEvs5aC+qQnXm9/3Z0PPsCizAhls9od8fqWI5O1CJaNwtSCfnhR3iGzDbcA9JwYMJR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302361; c=relaxed/simple;
	bh=6MIpAIjsNKT6YBbfOqDBk0/mf3JmeShl2eOh6eNJ53M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HG2QWUEbUJXUCo+6iimNGKWHqDu0whKEi2dSNjj6C1Qt4Sashcl6O9J7Sfrnm/2UYG4NjOV3tyKBNc7jFpeQHORhTmHLR6zjwC74qb54MV2zBA7DV5bg/A11dyCVYVIo17LvCbWq3mCvOv3vhRukJuloeZvmx1sbEmQ1ChGfZs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55311F000E9;
	Fri, 21 Aug 2026 08:52:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] soc/tegra: pmc: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:25 +0200
Message-ID: <70aca0e57b9900db051aade5a1af2e42c4d30ea5.1787239869.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787239869.git.geert+renesas@glider.be>
References: <cover.1787239869.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 41ed716d5857317d..c42e28fe2b8b0ff9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2694,7 +2694,7 @@ tegra_pmc_clk_out_register(struct tegra_pmc *pmc,
 			   const struct pmc_clk_init_data *data,
 			   unsigned long offset)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct pmc_clk *pmc_clk;
 
 	pmc_clk = devm_kzalloc(pmc->dev, sizeof(*pmc_clk), GFP_KERNEL);
@@ -2752,7 +2752,7 @@ tegra_pmc_clk_gate_register(struct tegra_pmc *pmc, const char *name,
 			    const char *parent_name, unsigned long offset,
 			    u32 shift)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct pmc_clk_gate *gate;
 
 	gate = devm_kzalloc(pmc->dev, sizeof(*gate), GFP_KERNEL);
-- 
2.43.0


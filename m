Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD39F18C07;
	Wed,  3 Jan 2024 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ampy0Lnh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8B6C433C8;
	Wed,  3 Jan 2024 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704277619;
	bh=bwPa+UgEb5z2NAdP7yUFxx39nJFh5accHKjXgI6k0So=;
	h=From:To:Cc:Subject:Date:From;
	b=ampy0LnhALFtLAPVGhLCTWVuBGoJkW6eSriFlLyjzlL0eoew1I76wqwMhrD2Lp3sW
	 HhMhsdyHIE8T+yUHSoQQYDuYIuIdExRcT22RQjfFIjn10H5UTyM5pS1mss894AkZfo
	 aemajxFEu2vPJK502mCL5XD3+PjyuSZYF81lgXU07aN2X2DNy90Gou46qVCMwtw7b9
	 x34+DSM58dYhAybsJohRnvxV8K20vK3ZflfNh5uELhb1UI24mX4w7ueLFU5o1Ji/+W
	 vn/PPRf0y0SltQkNjxYknKqxziValL5fAXMWOpdjwKCfZ0t2nXSoZSntZ+MgDO3I1g
	 6Guv3HiS8E5Tg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kartik <kkartik@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc/tegra: fix build failure  on Tegra241
Date: Wed,  3 Jan 2024 11:26:49 +0100
Message-Id: <20240103102654.3779458-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

If all the other SoCs are disabled, the driver fails to build:

drivers/soc/tegra/fuse/fuse-tegra30.c:684:17: error: 'tegra30_fuse_read' undeclared here (not in a function); did you mean 'tegra_fuse_readl'?
  684 |         .read = tegra30_fuse_read,
      |                 ^~~~~~~~~~~~~~~~~
      |                 tegra_fuse_readl
drivers/soc/tegra/fuse/fuse-tegra30.c:694:17: error: 'tegra30_fuse_init' undeclared here (not in a function); did you mean 'tegra_fuse_info'?
  694 |         .init = tegra30_fuse_init,
      |                 ^~~~~~~~~~~~~~~~~

Fix the list of SoCs using this function to include the newly added one.

Fixes: dee509eb9cd5 ("soc/tegra: fuse: Add support for Tegra241")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 2070d36c510d..eb14e5ff5a0a 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -38,7 +38,8 @@
     defined(CONFIG_ARCH_TEGRA_210_SOC) || \
     defined(CONFIG_ARCH_TEGRA_186_SOC) || \
     defined(CONFIG_ARCH_TEGRA_194_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_234_SOC)
+    defined(CONFIG_ARCH_TEGRA_234_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_241_SOC)
 static u32 tegra30_fuse_read_early(struct tegra_fuse *fuse, unsigned int offset)
 {
 	if (WARN_ON(!fuse->base))
-- 
2.39.2


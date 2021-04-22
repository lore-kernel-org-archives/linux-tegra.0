Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1B0C433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 13:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 143C661460
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 13:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236426AbhDVNfC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Apr 2021 09:35:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236424AbhDVNfC (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Apr 2021 09:35:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD1316145B;
        Thu, 22 Apr 2021 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619098467;
        bh=M4gtxOQ2wfWhXhavoI25WZyeG6DPnIuVBk7gtqGyo78=;
        h=From:To:Cc:Subject:Date:From;
        b=mHy/NX6btZoxdSzXT9qQFFWD3SKtJBkyd015oGHWEHuLQs8GNJqR8aRVljaqly5ue
         L0Lvjo05BLOQou6rYdE0Dg2izYCtRDrhxFmNGqNrz4Le5fmy4MIX9gBJANIP3UPqTn
         vqYOc43kD54cH1Ly1AEqwmsNbrD9oIXFswALdb6pgmeUFFFHR5Izk5Uf0hIWR5ZTwG
         fxWLlbyxF5rOJQYIU0zDHqIGJNAooSECH/Pq0/3YrWPtAKTo/qng8wb3mAdP7qs1Xc
         VdA6CDlNut/7agw2uWAJEnKWV7mQFzIwkRxlLYSCICrKSJKshDcL2tAvSIGcOu99cX
         YVPqx1LbLFBxw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Qiushi Wu <wu000273@umn.edu>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tegra: mark runtime-pm functions as __maybe_unused
Date:   Thu, 22 Apr 2021 15:34:00 +0200
Message-Id: <20210422133418.1757893-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A reorganization of the driver source led to two of them causing
a compile time warning in some configurations:

tegra/tegra20_spdif.c:36:12: error: 'tegra20_spdif_runtime_resume' defined but not used [-Werror=unused-function]
   36 | static int tegra20_spdif_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
tegra/tegra20_spdif.c:27:12: error: 'tegra20_spdif_runtime_suspend' defined but not used [-Werror=unused-function]
   27 | static int tegra20_spdif_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tegra/tegra30_ahub.c:64:12: error: 'tegra30_ahub_runtime_resume' defined but not used [-Werror=unused-function]
   64 | static int tegra30_ahub_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
tegra/tegra30_ahub.c:43:12: error: 'tegra30_ahub_runtime_suspend' defined but not used [-Werror=unused-function]
   43 | static int tegra30_ahub_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Mark these functions as __maybe_unused to avoid this kind of warning.

Fixes: b5571449e618 ("ASoC: tegra30: ahub: Remove handing of disabled runtime PM")
Fixes: c53b396f0dd4 ("ASoC: tegra20: spdif: Remove handing of disabled runtime PM")
Fixes: 80ec4a4cb36d ("ASoC: tegra20: i2s: Remove handing of disabled runtime PM")
Fixes: b5f6f781fcb2 ("ASoC: tegra30: i2s: Remove handing of disabled runtime PM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra20_i2s.c   | 4 ++--
 sound/soc/tegra/tegra20_spdif.c | 4 ++--
 sound/soc/tegra/tegra30_ahub.c  | 4 ++--
 sound/soc/tegra/tegra30_i2s.c   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 1b27f81c10fe..b280ebd72591 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -34,7 +34,7 @@
 
 #define DRV_NAME "tegra20-i2s"
 
-static int tegra20_i2s_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra20_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 
@@ -45,7 +45,7 @@ static int tegra20_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra20_i2s_runtime_resume(struct device *dev)
+static __maybe_unused int tegra20_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 7b597ee63cb5..de698ff2a69c 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -24,7 +24,7 @@
 
 #define DRV_NAME "tegra20-spdif"
 
-static int tegra20_spdif_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 
@@ -33,7 +33,7 @@ static int tegra20_spdif_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra20_spdif_runtime_resume(struct device *dev)
+static __maybe_unused int tegra20_spdif_runtime_resume(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 	int ret;
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d1718f3af3cd..4692c70ed933 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -40,7 +40,7 @@ static inline void tegra30_audio_write(u32 reg, u32 val)
 	regmap_write(ahub->regmap_ahub, reg, val);
 }
 
-static int tegra30_ahub_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra30_ahub_runtime_suspend(struct device *dev)
 {
 	regcache_cache_only(ahub->regmap_apbif, true);
 	regcache_cache_only(ahub->regmap_ahub, true);
@@ -61,7 +61,7 @@ static int tegra30_ahub_runtime_suspend(struct device *dev)
  * stopping streams should dynamically adjust the clock as required.  However,
  * this is not yet implemented.
  */
-static int tegra30_ahub_runtime_resume(struct device *dev)
+static __maybe_unused int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 8730ffa0f691..36344f0a64c1 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -36,7 +36,7 @@
 
 #define DRV_NAME "tegra30-i2s"
 
-static int tegra30_i2s_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra30_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 
@@ -47,7 +47,7 @@ static int tegra30_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra30_i2s_runtime_resume(struct device *dev)
+static __maybe_unused int tegra30_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
-- 
2.29.2


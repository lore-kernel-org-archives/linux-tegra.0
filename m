From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: soc-core: Fix probe deferral following prelink failure
Date: Mon, 4 Mar 2019 13:31:14 +0000
Message-ID: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Jonathan Hunter <jonathanh@nvidia.com>

Commit 78a24e10cd94 ("ASoC: soc-core: clear platform pointers on error")
re-worked the clean-up of any platform pointers that may have been
initialised by the function snd_soc_init_platform(). This commit missed
one error path where if any of the prelinks for a soundcard failed to
initialise, then these platform pointers would not be cleaned-up. This
then prevents the soundcard from being initialised following a probe
deferral when any of the soundcard prelinks cannot be found.

Fix this by ensuring that soc_cleanup_platform() is called when
initialising the soundcard prelinks fails.

Fixes: 78a24e10cd94 ("ASoC: soc-core: clear platform pointers on error")

Signed-off-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 sound/soc/soc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 93d316d5bf8e..5a5764dba147 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2797,6 +2797,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 		ret = soc_init_dai_link(card, link);
 		if (ret) {
+			soc_cleanup_platform(card);
 			dev_err(card->dev, "ASoC: failed to init link %s\n",
 				link->name);
 			mutex_unlock(&client_mutex);
-- 
1.9.1

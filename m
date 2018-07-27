From: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
Subject: [PATCH 1/4] ASoC: tegra: i2s: Fix typo/broken macro
Date: Fri, 27 Jul 2018 13:59:28 +0100
Message-ID: <20180727125931.9794-2-jorge.sanjuan@codethink.co.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Edward Cragg <edward.cragg@codethink.co.uk>

Fix typo in macro TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
Signed-off-by: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
---
 sound/soc/tegra/tegra30_i2s.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
index 774fc6ad2026..2e561e946de2 100644
--- a/sound/soc/tegra/tegra30_i2s.h
+++ b/sound/soc/tegra/tegra30_i2s.h
@@ -173,7 +173,7 @@
 /* Number of slots in frame, minus 1 */
 #define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT		16
 #define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK_US	7
-#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK		(TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOT_MASK_US << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOT_SHIFT)
+#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK		(TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK_US << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT)
 
 /* TDM mode slot enable bitmask */
 #define TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT	8
-- 
2.11.0

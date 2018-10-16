From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 9/9] ASoC: tegra_sgtl5000: fix platform name
	vs. of_node assignement
Date: Tue, 16 Oct 2018 12:47:30 +0200
Message-ID: <20181016104730.4598-10-marcel@ziswiler.com>
References: <20181016104730.4598-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181016104730.4598-1-marcel@ziswiler.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This fixes the following error as seen post commit daecf46ee0e5
("ASoC: soc-core: use snd_soc_dai_link_component for platform"):

tegra-snd-sgtl5000 sound: ASoC: Both platform name/of_node are set for
 sgtl5000
tegra-snd-sgtl5000 sound: ASoC: failed to init link sgtl5000
tegra-snd-sgtl5000 sound: snd_soc_register_card failed (-22)
tegra-snd-sgtl5000: probe of sound failed with error -22

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: New patch

 sound/soc/tegra/tegra_sgtl5000.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 901457da25ec..eb702925cac3 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -168,6 +168,11 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 	return 0;
 
 err_fini_utils:
+	if (tegra_sgtl5000_dai.platform) {
+		devm_kfree(&pdev->dev, tegra_sgtl5000_dai.platform);
+		tegra_sgtl5000_dai.platform = NULL;
+	}
+
 	tegra_asoc_utils_fini(&machine->util_data);
 err_put_cpu_of_node:
 	of_node_put(tegra_sgtl5000_dai.cpu_of_node);
-- 
2.14.4

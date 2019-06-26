From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: soc-core: don't use
	soc_find_component() at snd_soc_find_dai()" to the asoc tree
Date: Wed, 26 Jun 2019 12:32:43 +0100 (BST)
Message-ID: <20190626113243.CFACC440046@finisterre.sirena.org.uk>
References: <878stpyvky.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <878stpyvky.wl-kuninori.morimoto.gx@renesas.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-tegra@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: soc-core: don't use soc_find_component() at snd_soc_find_dai()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From e3303268f9cfa4eb7c2217df471417d4327109fd Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 26 Jun 2019 10:40:59 +0900
Subject: [PATCH] ASoC: soc-core: don't use soc_find_component() at
 snd_soc_find_dai()

commit b9f2e25c599bb ("ASoC: soc-core: use soc_find_component() at
snd_soc_find_dai()") used soc_find_component() at snd_soc_find_dai(),
but, some CPU driver has CPU component for DAI and Platform component,
for example generic DMAEngine component.
In such case, CPU component and Platform component have same
of_node / name.

Here soc_find_component() returns *1st* found component.
Thus, we shouldn't use soc_find_component() at snd_soc_find_dai().
This patch fixup this it, and add comment to indicate this limitation.

Fixes: commit b9f2e25c599bb ("ASoC: soc-core: use soc_find_component() at snd_soc_find_dai()")
Reported-by: Dmitry Osipenko <digetx@gmail.com>
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 358f1fbf9a30..8ccaf63e428c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -786,6 +786,14 @@ static struct snd_soc_component *soc_find_component(
 
 	lockdep_assert_held(&client_mutex);
 
+	/*
+	 * NOTE
+	 *
+	 * It returns *1st* found component, but some driver
+	 * has few components by same of_node/name
+	 * ex)
+	 *	CPU component and generic DMAEngine component
+	 */
 	for_each_component(component)
 		if (snd_soc_is_matching_component(dlc, component))
 			return component;
@@ -813,8 +821,9 @@ struct snd_soc_dai *snd_soc_find_dai(
 	lockdep_assert_held(&client_mutex);
 
 	/* Find CPU DAI from registered DAIs */
-	component = soc_find_component(dlc);
-	if (component) {
+	for_each_component(component) {
+		if (!snd_soc_is_matching_component(dlc, component))
+			continue;
 		for_each_component_dais(component, dai) {
 			if (dlc->dai_name && strcmp(dai->name, dlc->dai_name)
 			    && (!dai->driver->name
-- 
2.20.1

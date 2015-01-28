From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v3 06/10] ASoC: tegra: Add a control for the
	headphone switch
Date: Wed, 28 Jan 2015 11:51:04 +0100
Message-ID: <1422442278-10405-7-git-send-email-tomeu.vizoso@collabora.com>
References: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: linux-kernel@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>, Simon Glass <sjg@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org

To be used by userspace when the headphones jack is plugged in.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 sound/soc/tegra/tegra_max98090.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index af3fb99..8df71a4 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -136,6 +136,7 @@ static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
 };
 
 static const struct snd_kcontrol_new tegra_max98090_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 };
 
-- 
1.9.3

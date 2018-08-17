From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: core: Don't schedule DAPM work if already in target state
Date: Fri, 17 Aug 2018 16:35:43 +0100
Message-ID: <1534520143-29266-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When dapm_power_widgets() is called, the dapm_pre_sequence_async() and
dapm_post_sequence_async() functions are scheduled for all DAPM contexts
(apart from the card DAPM context) regardless of whether the DAPM
context is already in the desired state. The overhead of this is not
insignificant and the more DAPM contexts there are the more overhead
there is.

For example, on the Tegra124 Jetson TK1, when profiling the time taken
to execute the dapm_power_widgets() the following times were observed.

  Times for function dapm_power_widgets() are (us):
     Min 23, Ave 190, Max 434, Count 39

Here 'Count' is the number of times that dapm_power_widgets() has been
called. Please note that the above time were measured using ktime_get()
to log the time on entry and exit from dapm_power_widgets(). So it
should be noted that these times may not be purely the time take to
execute this function if it is preempted. However, after applying this
patch and measuring the time taken to execute dapm_power_widgets() again
a significant improvement is seen as shown below.

  Times for function dapm_power_widgets() are (us):
     Min 4, Ave 16, Max 82, Count 39

Therefore, optimise the dapm_power_widgets() function by only scheduling
the dapm_pre/post_sequence_async() work if the DAPM context is not in
the desired state.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/soc-dapm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 461d951917c0..2e9231aeabb9 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1953,7 +1953,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	dapm_pre_sequence_async(&card->dapm, 0);
 	/* Run other bias changes in parallel */
 	list_for_each_entry(d, &card->dapm_list, list) {
-		if (d != &card->dapm)
+		if (d != &card->dapm && d->bias_level != d->target_bias_level)
 			async_schedule_domain(dapm_pre_sequence_async, d,
 						&async_domain);
 	}
@@ -1977,7 +1977,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 
 	/* Run all the bias changes in parallel */
 	list_for_each_entry(d, &card->dapm_list, list) {
-		if (d != &card->dapm)
+		if (d != &card->dapm && d->bias_level != d->target_bias_level)
 			async_schedule_domain(dapm_post_sequence_async, d,
 						&async_domain);
 	}
-- 
2.7.4

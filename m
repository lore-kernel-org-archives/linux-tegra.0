From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: core: Don't schedule DAPM work if
	already in target state" to the asoc tree
Date: Mon,  3 Sep 2018 15:19:03 +0100 (BST)
Message-ID: <20180903141903.5AA7811227AE@debutante.sirena.org.uk>
References: <1534520143-29266-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1534520143-29266-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: core: Don't schedule DAPM work if already in target state

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From e03546ddd3db5352a74dec247dbdaa29889e93f7 Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Fri, 17 Aug 2018 16:35:43 +0100
Subject: [PATCH] ASoC: core: Don't schedule DAPM work if already in target
 state

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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d7be3981f026..9feccd2e7c11 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1952,7 +1952,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	dapm_pre_sequence_async(&card->dapm, 0);
 	/* Run other bias changes in parallel */
 	list_for_each_entry(d, &card->dapm_list, list) {
-		if (d != &card->dapm)
+		if (d != &card->dapm && d->bias_level != d->target_bias_level)
 			async_schedule_domain(dapm_pre_sequence_async, d,
 						&async_domain);
 	}
@@ -1976,7 +1976,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 
 	/* Run all the bias changes in parallel */
 	list_for_each_entry(d, &card->dapm_list, list) {
-		if (d != &card->dapm)
+		if (d != &card->dapm && d->bias_level != d->target_bias_level)
 			async_schedule_domain(dapm_post_sequence_async, d,
 						&async_domain);
 	}
-- 
2.19.0.rc1

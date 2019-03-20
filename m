From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PROBLEM] ALSA: hda: PCM streams are suspended while
	opening
Date: Wed, 20 Mar 2019 16:04:14 +0000
Message-ID: <1553097854-10287-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Jonathan Hunter <jonathanh@nvidia.com>

This issue is not observed on the latest mainline kernel since the
'ALSA: PCM suspend cleanup' series has been applied and the
snd_pcm_suspend_all() function call in the HDA codec driver has been
removed. However, this issue impacts stable kernel branches and so I
am trying to find a solution for these branches.

When stress testing audio playback across multiple HDA streams
simultaneously, the following failure is sometimes observed when
starting playback ...

 Unable to set hw params for playback: File descriptor in bad state

The problem is caused because ...
1. Playback is starting for one HDA codec and so the chip->open_mutex
   in azx_pcm_open() has been acquired.
2. Playback for another HDA codec is starting but is blocked waiting to
   acquire the chip->open_mutex in azx_pcm_open().
3. For the HDA codec that is blocked, its runtime-pm status is still
   enabled from a previous playback session that has since completed and
   been closed, however its autosuspend timeout has not expired yet.
4. For the HDA codec that is blocked, the runtime-pm autosuspend timeout
   now occurs calling the runtime-pm suspend callback and this calls
   snd_pcm_suspend_all() placing all PCM streams in the suspended state.
5. The block HDA codec is now unblocked and fails to set the HW params
   because the PCM stream is in the suspended state.

The above has been observed on Tegra platforms where the autosuspend
delay is set to 1 second and there is a delay to an AZX command. This
highlights that there is a window of time where autosuspend can place
the HDA PCM stream in the suspended state while opening the stream
and cause playback to fail.

Looking at commit 3d21ef0b49f8 ('ALSA: pcm: Suspend streams globally via
device type PM ops') it appears that the call to snd_pcm_suspend_all()
has now been moved to the to the suspend handler for PCM streams and so
I am wondering if it would be equivalent to make the following change to
the HDA codec driver to achieve the same behaviour but only for the HDA
driver. So far the issue has not been observed with this change.

Please note that I am not sending this as a formal patch as I wanted to
get some feedback/comments on the above.
---
 sound/pci/hda/hda_codec.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 9f8d59e7e89f..26ecc6e1f524 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2923,12 +2923,9 @@ static void hda_call_codec_resume(struct hda_codec *codec)
 static int hda_codec_runtime_suspend(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
-	struct hda_pcm *pcm;
 	unsigned int state;
 
 	cancel_delayed_work_sync(&codec->jackpoll_work);
-	list_for_each_entry(pcm, &codec->pcm_list_head, list)
-		snd_pcm_suspend_all(pcm->pcm);
 	state = hda_call_codec_suspend(codec);
 	if (codec->link_down_at_suspend ||
 	    (codec_has_clkstop(codec) && codec_has_epss(codec) &&
@@ -2948,11 +2945,22 @@ static int hda_codec_runtime_resume(struct device *dev)
 	pm_runtime_mark_last_busy(dev);
 	return 0;
 }
+
+static int hda_codec_suspend(struct device *dev)
+{
+	struct hda_codec *codec = dev_to_hda_codec(dev);
+	struct hda_pcm *pcm;
+
+	list_for_each_entry(pcm, &codec->pcm_list_head, list)
+		snd_pcm_suspend_all(pcm->pcm);
+
+	return pm_runtime_force_suspend(dev);
+}
 #endif /* CONFIG_PM */
 
 /* referred in hda_bind.c */
 const struct dev_pm_ops hda_codec_driver_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+	SET_SYSTEM_SLEEP_PM_OPS(hda_codec_suspend,
 				pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(hda_codec_runtime_suspend, hda_codec_runtime_resume,
 			   NULL)
-- 
1.9.1

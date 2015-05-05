From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/6] ALSA: hda/hdmi - Implement Tegra-specific patch
Date: Tue,  5 May 2015 14:56:20 +0200
Message-ID: <1430830584-3113-2-git-send-email-thierry.reding@gmail.com>
References: <1430830584-3113-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430830584-3113-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The HDMI codec on NVIDIA Tegra SoCs has a feature that doesn't exist on
the MCP or GPU variants. The highest bit in the vendor-defined scratch
registers can be used to trigger an interrupt in the HDMI codec, which
is signalled to the HDMI driver. This can be used to pass information,
such as the HDA format, to the HDMI driver so that it can reconfigure
itself accordingly.

While at it, change the name of the codec to Tegra124 since there are no
other SoCs in the Tegra12x family. There isn't really a Tegra12x family.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/pci/hda/patch_hdmi.c | 167 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index e8d847819d71..17c04544c9a0 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2932,6 +2932,171 @@ static int patch_nvhdmi(struct hda_codec *codec)
 }
 
 /*
+ * The HDA codec on NVIDIA Tegra contains two scratch registers that are
+ * accessed using vendor-defined verbs. These registers can be used for
+ * interoperability between the HDA and HDMI drivers.
+ */
+
+/* Audio Function Group node */
+#define NVIDIA_AFG_NID 0x01
+
+/*
+ * The SCRATCH0 register is used to notify the HDMI codec of changes in audio
+ * format. On Tegra, bit 31 is used as a trigger that causes an interrupt to
+ * be raised in the HDMI codec. The remainder of the bits is arbitrary. This
+ * implementation stores the HDA format (see AC_FMT_*) in bits [15:0] and an
+ * additional bit (at position 30) to signal the validity of the format.
+ *
+ * | 31      | 30    | 29  16 | 15   0 |
+ * +---------+-------+--------+--------+
+ * | TRIGGER | VALID | UNUSED | FORMAT |
+ * +-----------------------------------|
+ *
+ * Note that for the trigger bit to take effect it needs to change value
+ * (i.e. it needs to be toggled).
+ */
+#define NVIDIA_GET_SCRATCH0		0xfa6
+#define NVIDIA_SET_SCRATCH0_BYTE0	0xfa7
+#define NVIDIA_SET_SCRATCH0_BYTE1	0xfa8
+#define NVIDIA_SET_SCRATCH0_BYTE2	0xfa9
+#define NVIDIA_SET_SCRATCH0_BYTE3	0xfaa
+#define NVIDIA_SCRATCH_TRIGGER (1 << 7)
+#define NVIDIA_SCRATCH_VALID   (1 << 6)
+
+#define NVIDIA_GET_SCRATCH1		0xfab
+#define NVIDIA_SET_SCRATCH1_BYTE0	0xfac
+#define NVIDIA_SET_SCRATCH1_BYTE1	0xfad
+#define NVIDIA_SET_SCRATCH1_BYTE2	0xfae
+#define NVIDIA_SET_SCRATCH1_BYTE3	0xfaf
+
+/*
+ * The format parameter is the HDA audio format (see AC_FMT_*). If set to 0,
+ * the format is invalidated so that the HDMI codec can be disabled.
+ */
+static void tegra_hdmi_set_format(struct hda_codec *codec, unsigned int format)
+{
+	unsigned int value;
+
+	/* bits [31:30] contain the trigger and valid bits */
+	value = snd_hda_codec_read(codec, NVIDIA_AFG_NID, 0,
+				   NVIDIA_GET_SCRATCH0, 0);
+	value = (value >> 24) & 0xff;
+
+	/* bits [15:0] are used to store the HDA format */
+	snd_hda_codec_write(codec, NVIDIA_AFG_NID, 0,
+			    NVIDIA_SET_SCRATCH0_BYTE0,
+			    (format >> 0) & 0xff);
+	snd_hda_codec_write(codec, NVIDIA_AFG_NID, 0,
+			    NVIDIA_SET_SCRATCH0_BYTE1,
+			    (format >> 8) & 0xff);
+
+	/* bits [16:24] are unused */
+	snd_hda_codec_write(codec, NVIDIA_AFG_NID, 0,
+			    NVIDIA_SET_SCRATCH0_BYTE2, 0);
+
+	/*
+	 * Bit 30 signals that the data is valid and hence that HDMI audio can
+	 * be enabled.
+	 */
+	if (format == 0)
+		value &= ~NVIDIA_SCRATCH_VALID;
+	else
+		value |= NVIDIA_SCRATCH_VALID;
+
+	/*
+	 * Whenever the trigger bit is toggled, an interrupt is raised in the
+	 * HDMI codec. The HDMI driver will use that as trigger to update its
+	 * configuration.
+	 */
+	value ^= NVIDIA_SCRATCH_TRIGGER;
+
+	snd_hda_codec_write(codec, NVIDIA_AFG_NID, 0,
+			    NVIDIA_SET_SCRATCH0_BYTE3, value);
+}
+
+static int tegra_hdmi_pcm_prepare(struct hda_pcm_stream *hinfo,
+				  struct hda_codec *codec,
+				  unsigned int stream_tag,
+				  unsigned int format,
+				  struct snd_pcm_substream *substream)
+{
+	int err;
+
+	err = generic_hdmi_playback_pcm_prepare(hinfo, codec, stream_tag,
+						format, substream);
+	if (err < 0)
+		return err;
+
+	/* notify the HDMI codec of the format change */
+	tegra_hdmi_set_format(codec, format);
+
+	return 0;
+}
+
+static int tegra_hdmi_pcm_cleanup(struct hda_pcm_stream *hinfo,
+				  struct hda_codec *codec,
+				  struct snd_pcm_substream *substream)
+{
+	/* invalidate the format in the HDMI codec */
+	tegra_hdmi_set_format(codec, 0);
+
+	return generic_hdmi_playback_pcm_cleanup(hinfo, codec, substream);
+}
+
+static struct hda_pcm *hda_find_pcm_by_type(struct hda_codec *codec, int type)
+{
+	struct hdmi_spec *spec = codec->spec;
+	unsigned int i;
+
+	for (i = 0; i < spec->num_pins; i++) {
+		struct hda_pcm *pcm = get_pcm_rec(spec, i);
+
+		if (pcm->pcm_type == type)
+			return pcm;
+	}
+
+	return NULL;
+}
+
+static int tegra_hdmi_build_pcms(struct hda_codec *codec)
+{
+	struct hda_pcm_stream *stream;
+	struct hda_pcm *pcm;
+	int err;
+
+	err = generic_hdmi_build_pcms(codec);
+	if (err < 0)
+		return err;
+
+	pcm = hda_find_pcm_by_type(codec, HDA_PCM_TYPE_HDMI);
+	if (!pcm)
+		return -ENODEV;
+
+	/*
+	 * Override ->prepare() and ->cleanup() operations to notify the HDMI
+	 * codec about format changes.
+	 */
+	stream = &pcm->stream[SNDRV_PCM_STREAM_PLAYBACK];
+	stream->ops.prepare = tegra_hdmi_pcm_prepare;
+	stream->ops.cleanup = tegra_hdmi_pcm_cleanup;
+
+	return 0;
+}
+
+static int patch_tegra_hdmi(struct hda_codec *codec)
+{
+	int err;
+
+	err = patch_generic_hdmi(codec);
+	if (err)
+		return err;
+
+	codec->patch_ops.build_pcms = tegra_hdmi_build_pcms;
+
+	return 0;
+}
+
+/*
  * ATI/AMD-specific implementations
  */
 
@@ -3330,7 +3495,7 @@ static const struct hda_codec_preset snd_hda_preset_hdmi[] = {
 { .id = 0x10de001a, .name = "GPU 1a HDMI/DP",	.patch = patch_nvhdmi },
 { .id = 0x10de001b, .name = "GPU 1b HDMI/DP",	.patch = patch_nvhdmi },
 { .id = 0x10de001c, .name = "GPU 1c HDMI/DP",	.patch = patch_nvhdmi },
-{ .id = 0x10de0028, .name = "Tegra12x HDMI",	.patch = patch_nvhdmi },
+{ .id = 0x10de0028, .name = "Tegra124 HDMI",	.patch = patch_tegra_hdmi },
 { .id = 0x10de0040, .name = "GPU 40 HDMI/DP",	.patch = patch_nvhdmi },
 { .id = 0x10de0041, .name = "GPU 41 HDMI/DP",	.patch = patch_nvhdmi },
 { .id = 0x10de0042, .name = "GPU 42 HDMI/DP",	.patch = patch_nvhdmi },
-- 
2.3.5

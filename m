From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] ALSA: hda/hdmi - Add Tegra186 and Tegra194 support
Date: Mon,  3 Dec 2018 16:53:17 +0100
Message-ID: <20181203155317.16627-2-thierry.reding@gmail.com>
References: <20181203155317.16627-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203155317.16627-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra186 and Tegra194 contain the same codecs as earlier chips and can
be supported using the same patch function.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 67099cbb6be2..5fb3fa660b89 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -3834,6 +3834,10 @@ HDA_CODEC_ENTRY(0x10de0020, "Tegra30 HDMI",	patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0022, "Tegra114 HDMI",	patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0028, "Tegra124 HDMI",	patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0029, "Tegra210 HDMI/DP",	patch_tegra_hdmi),
+HDA_CODEC_ENTRY(0x10de002d, "Tegra186 HDMI/DP0", patch_tegra_hdmi),
+HDA_CODEC_ENTRY(0x10de002e, "Tegra186 HDMI/DP1", patch_tegra_hdmi),
+HDA_CODEC_ENTRY(0x10de002f, "Tegra194 HDMI/DP2", patch_tegra_hdmi),
+HDA_CODEC_ENTRY(0x10de0030, "Tegra194 HDMI/DP3", patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0040, "GPU 40 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0041, "GPU 41 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0042, "GPU 42 HDMI/DP",	patch_nvhdmi),
-- 
2.19.1

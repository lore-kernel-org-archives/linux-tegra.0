From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/2] Support built-in Mic on Tegra boards that use WM8903
Date: Fri, 20 Mar 2020 23:55:02 +0300
Message-ID: <20200320205504.30466-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This small series adds audio route for built-in microphone on NVIDIA Tegra
boards that use WM8903 CODEC. In particular this is needed in order to unmute
internal microphone on Acer A500 tablet device. I'm planning to send out the
device tree for the A500 for 5.8, so will be nice to get the microphone
sorted out. Please review and apply, thanks in advance.

Dmitry Osipenko (2):
  dt-bindings: sound: tegra-wm8903: Document built-in microphone audio
    source
  ASoC: tegra: tegra_wm8903: Support DAPM events for built-in microphone

 .../sound/nvidia,tegra-audio-wm8903.txt        |  1 +
 sound/soc/tegra/tegra_wm8903.c                 | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.25.1

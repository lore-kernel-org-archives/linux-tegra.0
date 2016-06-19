From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH v4 0/3] ASoC/ARM: tegra: apalis t30/tk1/colibri t30: sgtl5000
 audio
Date: Sun, 19 Jun 2016 02:59:59 +0200
Message-ID: <1466298002-12576-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@wwwdotorg.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Thierry Reding <thierry.reding@gmail.com>, Tuomas Tynkkynen <ttynkkynen@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


This series adds/integrates Freescale SGTL5000 analogue audio codec
support.

Changes in v4:
- simple-audio-card does still not allow for more advanced use cases
  like Tegra SoCs
- further platform drivers have been accepted since my last attempt
  (e.g. rt5677 one)
- relevance for one further board the new Toradex Apalis TK1
- drop unused sound/jack.h include
- in tegra_sgtl5000_driver_remove() pass return value of
  snd_soc_unregister_card() on to caller
- no longer set owner property in platform_driver to THIS_MODULE
- re-based/resend

Changes in v3:
- revert to not using simple-audio-card being incompatible with tegra
- rebased to for-next

Changes in v2:
- using simple-audio-card as suggested by Fabio

Marcel Ziswiler (3):
  ASoC: tegra: add tegra sgtl5000 machine driver
  ARM: tegra: apalis/colibri t30: integrate audio
  ARM: tegra: enable sgtl5000 audio

 .../bindings/sound/nvidia,tegra-audio-sgtl5000.txt |  42 ++++
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  49 +++++
 arch/arm/boot/dts/tegra30-colibri.dtsi             |  49 +++++
 arch/arm/configs/tegra_defconfig                   |   1 +
 sound/soc/tegra/Kconfig                            |  11 ++
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_sgtl5000.c                   | 212 +++++++++++++++++++++
 7 files changed, 366 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
 create mode 100644 sound/soc/tegra/tegra_sgtl5000.c

-- 
2.5.5

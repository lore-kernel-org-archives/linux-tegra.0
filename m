From: Leon Romanovsky <leon@leon.nu>
Subject: [PATCH 0/5] Add device tree support of audio (ALC5632)
	on PAZ00 board
Date: Tue, 31 Jan 2012 09:25:57 +0200
Message-ID: <1327994757-26950-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: broonie@opensource.wolfsonmicro.com, lrg@ti.com, swarren@nvidia.com, alsa-devel@alsa-project.org, olof@lixom.net, linux-tegra@vger.kernel.org
Cc: Leon Romanovsky <leon@leon.nu>
List-Id: linux-tegra@vger.kernel.org

The following patchset is going to:
	* add device tree support of audio (ALC5632) on PAZ00 board. 
	* enable headset autodetection.
	* enable headset microphone.

---
I will update the ALC5632 codec to routing names used in documentation, in the later patches,

Leon Romanovsky (5):
  ASoC: Tegra+ALC5632: Implement device tree support in board file
  ASoC: ALC5632: Add device tree binding documentation
  ASoC: Tegra+ALC5632 machine: Add device tree binding documentation
  ASoC: dt: tegra: Enable headset autodetection on PAZ00 board.
  ASoC: tegra: Remove unused DAPM route structure.

 .../devicetree/bindings/sound/alc5632.txt          |   24 ++++
 .../bindings/sound/tegra-audio-alc5632.txt         |   57 +++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/boot/dts/tegra-paz00.dts                  |    1 +
 sound/soc/tegra/tegra_alc5632.c                    |  129 +++++++++++++++----
 5 files changed, 185 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/alc5632.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt

-- 
1.7.3.4

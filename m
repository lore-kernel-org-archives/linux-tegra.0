From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 0/5] ARM: tegra: audio-related changes for
	Tegra30
Date: Fri, 30 Mar 2012 17:11:32 -0600
Message-ID: <1333149097-17894-1-git-send-email-swarren@wwwdotorg.org>
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
To: Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

This is the arch/arm/mach-tegra changes that match the ASoC series I just
posted.

This depends on the previous GPIO/pinmux work that I posted. We should be
able to apply this to the Tegra tree independently from the ASoC driver
series.

Stephen Warren (5):
  ARM: tegra: provide clock aliases for AHUB configlink
  ARM: tegra: set up audio clocks for tegra30 dt
  ARM: tegra: add AUXDATA required for audio
  ARM: dt: tegra30.dtsi: Add audio-related nodes
  ARM: dt: tegra cardhu: basic audio support

 arch/arm/boot/dts/tegra-cardhu.dts     |   61 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi         |   32 +++++++++++++++++
 arch/arm/mach-tegra/board-dt-tegra30.c |   15 ++++++++
 arch/arm/mach-tegra/tegra30_clocks.c   |    9 +++++
 4 files changed, 117 insertions(+), 0 deletions(-)

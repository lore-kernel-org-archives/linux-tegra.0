From: Wei Ni <wni@nvidia.com>
Subject: [PATCH 0/5] ARM: tegra: enable wlan for t20 and t30
Date: Wed, 4 Jul 2012 17:34:43 +0800
Message-ID: <1341394488-13169-1-git-send-email-wni@nvidia.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: swarren@nvidia.com, olof@lixom.net, ccross@android.com
Cc: Wei Ni <wni@nvidia.com>, linux@arm.linux.org.uk, arnd@arndb.de, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, ldewangan@nvidia.com, linux-tegra@vger.kernel.org, cjb@laptop.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Set up clocks, pinmux, gpios and configs to enable wlan for
following tegra boards:
Tegra30: Cardhu.
Tegra20: Seaboard, Ventana.

Wei Ni (5):
  ARM: tegra: set up wlan clocks for tegra dt
  ARM: dt: t20 seaboard: add pinmux, gpio for wlan
  ARM: dt: t20 ventana: add pinmux, gpio for wlan
  ARM: dt: t30 cardhu: add pinmux, gpio for wlan
  ARM: tegra: enable wireless in defconfig

 arch/arm/boot/dts/tegra20-seaboard.dts |    5 +++++
 arch/arm/boot/dts/tegra20-ventana.dts  |   20 ++++++++++++++++++--
 arch/arm/boot/dts/tegra30-cardhu.dts   |   30 ++++++++++++++++++++++++++++++
 arch/arm/configs/tegra_defconfig       |    6 ++++--
 arch/arm/mach-tegra/board-dt-tegra20.c |    1 +
 arch/arm/mach-tegra/board-dt-tegra30.c |    1 +
 6 files changed, 59 insertions(+), 4 deletions(-)

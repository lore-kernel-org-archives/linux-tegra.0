From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/5] ARM: tegra: Enable SLINK controller driver
Date: Thu, 18 Oct 2012 16:26:30 +0530
Message-ID: <1350557795-31487-1-git-send-email-ldewangan@nvidia.com>
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
To: swarren@wwwdotorg.org, linux@arm.linux.org.uk
Cc: linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

This series modify the dts file to add the slink addresses,
make entry of slink in clock tables, defines SLINK addressed,
enable slink controller in Tegra30 based platform cardhu.

Laxman Dewangan (5):
  ARM: tegra: Add slink controller base address
  ARM: tegra: dts: add slink controller dt entry
  ARM: tegra: fix clock entry of slink controller
  ARM: tegra: dts: cardhu: enable SLINK4
  ARM: tegra: config: enable spi driver for Tegra SLINK controller

 arch/arm/boot/dts/tegra20.dtsi            |   40 +++++++++++++++++++
 arch/arm/boot/dts/tegra30-cardhu.dtsi     |    5 ++
 arch/arm/boot/dts/tegra30.dtsi            |   60 +++++++++++++++++++++++++++++
 arch/arm/configs/tegra_defconfig          |    2 +-
 arch/arm/mach-tegra/board-dt-tegra20.c    |    8 ++++
 arch/arm/mach-tegra/board-dt-tegra30.c    |   12 ++++++
 arch/arm/mach-tegra/include/mach/iomap.h  |   22 +++++++----
 arch/arm/mach-tegra/tegra20_clocks_data.c |   16 ++++----
 arch/arm/mach-tegra/tegra30_clocks_data.c |   36 +++++++++---------
 9 files changed, 166 insertions(+), 35 deletions(-)

From: <pdeschrijver@nvidia.com>
Subject: [PATCH v9 0/3] Add support for tegra2 based ventana board
Date: Wed, 12 Oct 2011 14:53:02 +0300
Message-ID: <1318420387-6802-1-git-send-email-pdeschrijver@nvidia.com>
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
To: pdeschrijver@nvidia.com
Cc: Russell King <linux@arm.linux.org.uk>, Erik Gilling <konkers@android.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver@nvidia.com>

This patch set adds support for the tegra2 based ventana development board.

Boot tested on ventana.                                                                                                                               

Uses a table based approach to select the correct init function.

Provoke kernel warning when no suitable pinmux table can be found.

Peter De Schrijver (3):
  arm/tegra: prepare Seaboard pinmux code for derived boards
  arm/tegra: add support for ventana pinmuxing
  arm/tegra: device tree support for ventana board

 arch/arm/boot/dts/tegra-ventana.dts         |   32 ++++++++++++++
 arch/arm/mach-tegra/Kconfig                 |    6 +++
 arch/arm/mach-tegra/Makefile                |    1 +
 arch/arm/mach-tegra/Makefile.boot           |    1 +
 arch/arm/mach-tegra/board-dt.c              |    5 ++-
 arch/arm/mach-tegra/board-seaboard-pinmux.c |   63 ++++++++++++++++++++++++---
 6 files changed, 101 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-ventana.dts

From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 0/5] ARM: DT: tegra114: Add DT entry for different
 controller
Date: Sat, 9 Mar 2013 23:41:13 +0530
Message-ID: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com>
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
To: swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, pdeschrijver@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

This patch series add DT entry for APB DMA, I2C, UART, KBC and SPI.

This patch series is generated on top of CCF work for T114 done by Peter
and hence it should be applied on top of T114 CCF patches.

Changes from V1:
- Add reeason why APBDMA is not compatible with older driver
  in description.
- Remove UARTB car id correction. Make the compatible with tegra114 and
  older chip.
- Add compatible for kbc as nvidia,tegra114-kbc and nvidia,tegra20-kbc.

Laxman Dewangan (5):
  ARM: DT: tegra114: add APB DMA controller DT entry
  ARM: DT: tegra114: Add i2c controller DT entry
  ARM: DT: tegra114:add aliases and DMA requestor for serial controller
  ARM: DT: tegra114: add KBC controller DT entry
  ARM: DT: tegra114: Add spi controller DT entry

 arch/arm/boot/dts/tegra114.dtsi |  200 ++++++++++++++++++++++++++++++++++++++-
 1 files changed, 196 insertions(+), 4 deletions(-)

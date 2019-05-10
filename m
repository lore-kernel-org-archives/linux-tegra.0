From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 0/8] Add EMC scaling support for Tegra210
Date: Fri, 10 May 2019 16:47:11 +0800
Message-ID: <20190510084719.18902-1-josephl@nvidia.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob
 Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series introduces the EMC clock scaling support for Tegra210. The
new version has a significant change, which drops the EMC table bindings
and replaces by memory region node of EMC table.

And most of the comments in V1 have been addressed.
Thanks.

Joseph Lo (8):
  dt-bindings: memory: tegra: Add external memory controller binding for
    Tegra210
  clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
  clk: tegra: Export functions for EMC clock scaling
  memory: tegra: Add Tegra210 EMC clock driver
  memory: tegra: Add EMC scaling support code for Tegra210
  memory: tegra: Add EMC scaling sequence code for Tegra210
  clk: tegra: Remove the old emc_mux clock for Tegra210
  arm64: tegra: Add external memory controller node for Tegra210

 .../nvidia,tegra210-emc.txt                   |   55 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |   33 +
 drivers/clk/tegra/clk-tegra210.c              |   85 +-
 drivers/memory/tegra/Kconfig                  |   10 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1953 +++++++++++++++
 drivers/memory/tegra/tegra210-emc.c           | 2123 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc.h           | 1037 ++++++++
 include/dt-bindings/clock/tegra210-car.h      |    4 +-
 include/linux/clk/tegra.h                     |    5 +
 10 files changed, 5288 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h

-- 
2.21.0

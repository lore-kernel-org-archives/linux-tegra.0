From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 00/13] memory: tegra: Add Tegra186/Tegra194 support
Date: Sun, 22 Dec 2019 15:10:22 +0100
Message-ID: <20191222141035.1649937-1-thierry.reding@gmail.com>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this set of patches improves the Tegra186 memory controller support and
extends it with Tegra194 support. The first three patches add the needed
device tree bindings and headers. Patches 4-10 first refactor the driver
to make it easier to support multiple SoC generations and finally add
EMC frequency scaling support (via debugfs) as well as Tegra194 support.
The last three patches enable the memory and external memory controllers
in device tree.

Thierry

Thierry Reding (13):
  dt-bindings: memory: Add Tegra186 memory client IDs
  dt-bindings: memory: Add Tegra194 memory controller header
  dt-bindings: memory: Add Tegra186 memory subsystem
  memory: tegra: Rename tegra_mc to tegra186_mc on Tegra186
  memory: tegra: Add per-SoC data for Tegra186
  memory: tegra: Extract memory client SID programming
  memory: tegra: Add system sleep support
  memory: tegra: Support DVFS on Tegra186 and later
  memory: tegra: Only include support for enabled SoCs
  memory: tegra: Add support for the Tegra194 memory controller
  arm64: tegra: Add interrupt for memory controller on Tegra186
  arm64: tegra: Add external memory controller on Tegra186
  arm64: tegra: Add the memory subsystem on Tegra194

 .../nvidia,tegra186-mc.yaml                   |  130 ++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |   22 +
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |    4 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |   43 +
 drivers/memory/tegra/Makefile                 |    3 +-
 drivers/memory/tegra/tegra186-emc.c           |  293 +++++
 drivers/memory/tegra/tegra186.c               | 1122 ++++++++++++++++-
 include/dt-bindings/memory/tegra186-mc.h      |  139 ++
 include/dt-bindings/memory/tegra194-mc.h      |  410 ++++++
 9 files changed, 2110 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
 create mode 100644 drivers/memory/tegra/tegra186-emc.c
 create mode 100644 include/dt-bindings/memory/tegra194-mc.h

-- 
2.24.1

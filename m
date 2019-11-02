From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 1/8] dt-bindings: Changes for v5.5-rc1
Date: Sat,  2 Nov 2019 15:45:14 +0100
Message-ID: <20191102144521.3863321-1-thierry.reding@gmail.com>
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
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-dt-bindings

for you to fetch changes up to 641262f5e1ed5c96799e17595893fa1a703616ac:

  dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory Controller (2019-10-29 20:22:34 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.5-rc1

This contains various updates to device tree bindings and includes that
are related to driver changes in other Tegra branches.

----------------------------------------------------------------
Dmitry Osipenko (4):
      dt-bindings: regulator: Document regulators coupling of NVIDIA Tegra20/30 SoCs
      dt-bindings: memory: tegra30: Convert to Tegra124 YAML
      dt-bindings: memory: Add binding for NVIDIA Tegra30 Memory Controller
      dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory Controller

Thierry Reding (1):
      dt-bindings: clock: tegra: Rename SOR0_LVDS to SOR0_OUT

 .../memory-controllers/nvidia,tegra124-mc.yaml     | 152 ++++++++++
 .../memory-controllers/nvidia,tegra30-emc.yaml     | 336 +++++++++++++++++++++
 .../memory-controllers/nvidia,tegra30-mc.txt       | 123 --------
 .../memory-controllers/nvidia,tegra30-mc.yaml      | 167 ++++++++++
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 ++++
 include/dt-bindings/clock/tegra124-car-common.h    |   3 +-
 include/dt-bindings/clock/tegra210-car.h           |   3 +-
 7 files changed, 724 insertions(+), 125 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt

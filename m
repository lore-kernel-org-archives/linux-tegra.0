From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 1/6] dt-bindings: Changes for v4.21-rc1
Date: Fri,  7 Dec 2018 15:17:34 +0100
Message-ID: <20181207141739.9085-1-thierry.reding@gmail.com>
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

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-dt-bindings

for you to fetch changes up to b4c7bf003cb57220af64b59e887581e74f0ce527:

  dt-bindings: tegra186-pmc: Add interrupt controller properties (2018-11-28 16:42:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v4.21-rc1

This contains a few cleanups of and additions to existing device tree
bindings, such as XUSB, EMC, PMC and thermal.

----------------------------------------------------------------
Dmitry Osipenko (3):
      dt: bindings: tegra20-emc: Document interrupt property
      dt: bindings: tegra20-emc: Document clock property
      dt: bindings: Move tegra20-emc binding to memory-controllers directory

Jon Hunter (1):
      dt-bindings: usb: xhci-tegra: Add power-domain details

Thierry Reding (2):
      dt-bindings: thermal: tegra-bpmp: Add Tegra194 support
      dt-bindings: tegra186-pmc: Add interrupt controller properties

 .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt |  3 +++
 .../tegra => memory-controllers}/nvidia,tegra20-emc.txt   |  4 ++++
 .../bindings/thermal/nvidia,tegra186-bpmp-thermal.txt     |  3 ++-
 .../devicetree/bindings/usb/nvidia,tegra124-xusb.txt      |  8 ++++++++
 include/dt-bindings/thermal/tegra194-bpmp-thermal.h       | 15 +++++++++++++++
 5 files changed, 32 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt (95%)
 create mode 100644 include/dt-bindings/thermal/tegra194-bpmp-thermal.h

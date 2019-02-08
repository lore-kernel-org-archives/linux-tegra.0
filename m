From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 3/9] dt-bindings: tegra: Changes for v5.1-rc1
Date: Fri,  8 Feb 2019 16:09:29 +0100
Message-ID: <20190208150935.32108-4-thierry.reding@gmail.com>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208150935.32108-1-thierry.reding@gmail.com>
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

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-dt-bindings

for you to fetch changes up to c79a3ccb191809c356044564859c275fba8e5b0f:

  dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required properties (2019-02-06 14:27:52 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: tegra: Changes for v5.1-rc1

This contains device tree binding updates for CPU frequency scaling on
Tegra210, BPMP support on Tegra210 and support for NVIDIA Shield TV.

----------------------------------------------------------------
Joseph Lo (3):
      dt-bindings: clock: tegra124-dfll: add Tegra210 support
      dt-bindings: cpufreq: tegra124: remove vdd-cpu-supply from required properties
      dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required properties

Mark Zhang (1):
      dt-bindings: tegra: Add Shield TV device tree binding documentation

Peter De Schrijver (1):
      dt-bindings: clock: tegra124-dfll: Update DFLL binding for PWM regulator

Thierry Reding (1):
      dt-bindings: firmware: tegra186-bpmp: Remove name property

Timo Alho (1):
      dt-bindings: firmware: Add bindings for Tegra210 BPMP

 Documentation/devicetree/bindings/arm/tegra.yaml   |  2 +
 .../bindings/clock/nvidia,tegra124-dfll.txt        | 83 +++++++++++++++++++++-
 .../bindings/cpufreq/nvidia,tegra124-cpufreq.txt   |  6 +-
 .../bindings/firmware/nvidia,tegra186-bpmp.txt     |  1 -
 .../bindings/firmware/nvidia,tegra210-bpmp.txt     | 35 +++++++++
 5 files changed, 118 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt

From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 1/5] dt-bindings: Changes for v4.20-rc1
Date: Thu, 27 Sep 2018 22:59:38 +0200
Message-ID: <20180927205942.30878-1-thierry.reding@gmail.com>
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

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.20-dt-bindings

for you to fetch changes up to d9be10edf7d6040468f89824df0dfcfcbf3a693b:

  dt-bindings: Add Tegra PMC pad configuration bindings (2018-08-27 12:21:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v4.20-rc1

This contains the PMC pad configuration bindings which are used to
control the voltage of various pads found on Tegra chips. Among other
things this is required to enable faster modes on SDHCI.

----------------------------------------------------------------
Aapo Vienamo (1):
      dt-bindings: Add Tegra PMC pad configuration bindings

 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  93 +++++++++++++++++++
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 103 +++++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h |  18 ++++
 3 files changed, 214 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h

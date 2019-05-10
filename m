From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 3/3] arm64: tegra: Device tree fixes for v5.2-rc1
Date: Fri, 10 May 2019 13:35:46 +0200
Message-ID: <20190510113546.15698-3-thierry.reding@gmail.com>
References: <20190510113546.15698-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190510113546.15698-1-thierry.reding@gmail.com>
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

The following changes since commit 2f03e39b5bfe41f3a0d9a8b01231e7e5045cb9c4:

  arm64: tegra: Remove regulator hacks on Jetson TX2 (2019-04-17 16:48:44 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm64-dt-fixes

for you to fetch changes up to 7278358407be770130b6b72567c1b5831c6eef28:

  arm64: tegra: Disable XUSB support on Jetson TX2 (2019-05-08 14:42:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.2-rc1

This contains one patch to disable the recently added XUSB support on
Jetson TX2 which is reported to cause boot and CPU hotplug failures in
some cases and doesn't allow the core power rail to be switched off.

Furthermore there are some changes to enable IOMMU support on more
devices. This is needed in order to prevent these devices from breaking
with the policy change in the ARM SMMU driver to break insecure devices
that is currently headed for v5.2.

----------------------------------------------------------------
Jonathan Hunter (1):
      arm64: tegra: Fix insecure SMMU users for Tegra186

Thierry Reding (2):
      arm64: tegra: Enable SMMU translation for PCI on Tegra186
      arm64: tegra: Disable XUSB support on Jetson TX2

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

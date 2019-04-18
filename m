From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 7/9] ARM: tegra: Default configuration updates for v5.2-rc1
Date: Thu, 18 Apr 2019 17:07:18 +0200
Message-ID: <20190418150721.8828-7-thierry.reding@gmail.com>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418150721.8828-1-thierry.reding@gmail.com>
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

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm-defconfig

for you to fetch changes up to a6f3d883a6ef19feee1d80bfd90701627b01b98a:

  ARM: Enable Trusted Foundations for multiplatform ARM v7 (2019-04-17 16:36:34 +0200)

Note that this pulls in a stable tag from Tony that brings the multi_v7
default configuratio up to date.

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration updates for v5.2-rc1

Enable Trusted Foundations support in the default configurations for
Tegra and multi-v7. This is necessary because the symbol is no longer
selected by default.

----------------------------------------------------------------
Thierry Reding (4):
      Merge tag 'multi-v7-defconfig-for-v5.2-signed' of git://git.kernel.org/.../tmlind/linux-omap into for-5.2/arm/defconfig
      ARM: tegra: Update default configuration for v5.1-rc1
      ARM: tegra: Enable Trusted Foundations by default
      ARM: Enable Trusted Foundations for multiplatform ARM v7

Tony Lindgren (2):
      ARM: multi_v7_defconfig: Update for dropped options
      ARM: multi_v7_defconfig: Update for moved options

 arch/arm/configs/multi_v7_defconfig | 133 +++++++++++++++++-------------------
 arch/arm/configs/tegra_defconfig    |  36 +++++-----
 2 files changed, 81 insertions(+), 88 deletions(-)

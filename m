From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 5/9] ARM: tegra: Core changes for v5.2-rc1
Date: Thu, 18 Apr 2019 17:07:16 +0200
Message-ID: <20190418150721.8828-5-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm-soc

for you to fetch changes up to 36841ba2796324507452f9854bf08b2c65836cce:

  ARM: tegra: cpuidle: Handle tick broadcasting within cpuidle core on Tegra20/30 (2019-04-18 11:32:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.2-rc1

One of these patches enables PM by default on 32-bit ARM, following the
same default that we already have on 64-bit ARM. The other patch fixes a
cosmetic issue in the cpuidle driver for Tegra20 and Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: cpuidle: Handle tick broadcasting within cpuidle core on Tegra20/30

Sameer Pujar (1):
      ARM: tegra: enforce PM requirement

 arch/arm/mach-tegra/Kconfig           |  1 +
 arch/arm/mach-tegra/cpuidle-tegra20.c | 11 ++---------
 arch/arm/mach-tegra/cpuidle-tegra30.c |  9 +--------
 3 files changed, 4 insertions(+), 17 deletions(-)

From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/3] arm64: tegra: Core fixes for v5.2-rc1
Date: Fri, 10 May 2019 13:35:45 +0200
Message-ID: <20190510113546.15698-2-thierry.reding@gmail.com>
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

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm64-soc-fixes

for you to fetch changes up to 2e988a83874b689f9e095cf60b40f1a8aff6731a:

  arm64: tegra: Select ARM_GIC_PM (2019-05-08 14:41:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Core fixes for v5.2-rc1

This enables the ARM_GIC_PM driver by default for Tegra in order to
increase build coverage.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: tegra: Select ARM_GIC_PM

 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

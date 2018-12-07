From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 4/6] memory: tegra: Changes for v4.21-rc1
Date: Fri,  7 Dec 2018 15:17:37 +0100
Message-ID: <20181207141739.9085-4-thierry.reding@gmail.com>
References: <20181207141739.9085-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207141739.9085-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-memory

for you to fetch changes up to 96e5da7c842424bcf64afe1082b960b42b96190b:

  memory: tegra: Introduce Tegra20 EMC driver (2018-11-08 12:50:34 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v4.21-rc1

This contains a single commit that adds support for the EMC driver on
Tegra20.

----------------------------------------------------------------
Dmitry Osipenko (1):
      memory: tegra: Introduce Tegra20 EMC driver

 drivers/memory/tegra/Kconfig       |  10 +
 drivers/memory/tegra/Makefile      |   1 +
 drivers/memory/tegra/tegra20-emc.c | 591 +++++++++++++++++++++++++++++++++++++
 3 files changed, 602 insertions(+)
 create mode 100644 drivers/memory/tegra/tegra20-emc.c

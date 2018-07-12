From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/5] memory: tegra: Changes for v4.19-rc1
Date: Thu, 12 Jul 2018 17:41:25 +0200
Message-ID: <20180712154128.22705-3-thierry.reding@gmail.com>
References: <20180712154128.22705-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180712154128.22705-1-thierry.reding@gmail.com>
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

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.19-memory

for you to fetch changes up to 1662dd641f596e5517c7b7a23e4f8ddf36741b5f:

  memory: tegra: Correct driver probe order (2018-07-10 17:29:15 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v4.19-rc1

This contains a single fix for the initialization order of the various
parts of the Tegra memory controller driver.

----------------------------------------------------------------
Dmitry Osipenko (1):
      memory: tegra: Correct driver probe order

 drivers/memory/tegra/mc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

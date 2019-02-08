From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 5/9] firmware: tegra: Changes for v5.1-rc1
Date: Fri,  8 Feb 2019 16:09:31 +0100
Message-ID: <20190208150935.32108-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-firmware

for you to fetch changes up to fe45ab552955ee93b492cbf86603eb02b3c77a66:

  firmware/tegra: Enable Tegra186 BPMP support on Tegra194 (2019-02-07 18:52:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.1-rc1

These changes add support for BPMP on Tegra210.

----------------------------------------------------------------
Thierry Reding (3):
      firmware: tegra: bpmp-tegra186: Remove unused includes
      firmware: tegra: Conditionally support SoC generations
      firmware/tegra: Enable Tegra186 BPMP support on Tegra194

Timo Alho (3):
      firmware: tegra: Reword messaging terminology
      firmware: tegra: Refactor BPMP driver
      firmware: tegra: add bpmp driver for Tegra210

 drivers/firmware/tegra/Makefile        |   3 +
 drivers/firmware/tegra/bpmp-private.h  |  34 +++
 drivers/firmware/tegra/bpmp-tegra186.c | 305 ++++++++++++++++++++++++++
 drivers/firmware/tegra/bpmp-tegra210.c | 243 +++++++++++++++++++++
 drivers/firmware/tegra/bpmp.c          | 376 +++++++++++++--------------------
 include/soc/tegra/bpmp.h               |  13 +-
 6 files changed, 742 insertions(+), 232 deletions(-)
 create mode 100644 drivers/firmware/tegra/bpmp-private.h
 create mode 100644 drivers/firmware/tegra/bpmp-tegra186.c
 create mode 100644 drivers/firmware/tegra/bpmp-tegra210.c

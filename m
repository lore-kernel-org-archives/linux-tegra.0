From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v4.21-rc1
Date: Fri,  7 Dec 2018 15:17:36 +0100
Message-ID: <20181207141739.9085-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-firmware

for you to fetch changes up to af51c25fb59d4365c259ab93f388462e0998a2ed:

  firmware: tegra: Use in-band messages for firmware version query (2018-11-08 12:49:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v4.21-rc1

These changes update the BPMP ABI header and implement a new variant of
the BPMP firmware version tag query if supported.

----------------------------------------------------------------
Timo Alho (5):
      firmware: tegra: Add helper to check for supported MRQs
      firmware: tegra: Switch to global mrq_is_supported()
      firmware: tegra: Print version tag at full
      soc/tegra: bpmp: Update ABI header
      firmware: tegra: Use in-band messages for firmware version query

 drivers/firmware/tegra/bpmp-debugfs.c |   29 +-
 drivers/firmware/tegra/bpmp.c         |   77 ++-
 include/soc/tegra/bpmp-abi.h          | 1188 ++++++++++++++++++++++++++-------
 include/soc/tegra/bpmp.h              |    7 +
 4 files changed, 1024 insertions(+), 277 deletions(-)

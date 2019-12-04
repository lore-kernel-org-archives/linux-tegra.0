From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/3] soc/tegra: Fixes for v5.5-rc1
Date: Wed,  4 Dec 2019 14:07:52 +0100
Message-ID: <20191204130753.3614278-2-thierry.reding@gmail.com>
References: <20191204130753.3614278-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191204130753.3614278-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: soc@kernel.org, arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 69dfb3d4a89afccca1d8f282e49ad1362100cc43:

  soc/tegra: pmc: Remove unnecessary memory barrier (2019-10-29 14:36:24 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-soc-fixes

for you to fetch changes up to 48914c4ecb0c0fa1d70ea7b97d758ce5fadacfb0:

  soc/tegra: pmc: Add reset sources and levels on Tegra194 (2019-11-18 13:56:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Fixes for v5.5-rc1

Fixes a regression for wake events on Tegra194 caused by the Tegra210
support that was added in v5.5-rc1 as well as wrong reset sources and
levels on Tegra194.

----------------------------------------------------------------
Thierry Reding (3):
      soc/tegra: pmc: Use lower-case for hexadecimal literals
      soc/tegra: pmc: Add missing IRQ callbacks on Tegra194
      soc/tegra: pmc: Add reset sources and levels on Tegra194

 drivers/soc/tegra/pmc.c | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

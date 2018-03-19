From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL v2 4/7] soc/tegra: Changes for v4.17-rc1
Date: Mon, 19 Mar 2018 09:52:45 +0100
Message-ID: <20180319085245.25834-1-thierry.reding@gmail.com>
References: <20180316141850.4876-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180316141850.4876-4-thierry.reding@gmail.com>
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

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.17-soc-2

for you to fetch changes up to 4c817ccf73abaf7b06a2630e8352d82648c8bc70:

  soc/tegra: pmc: Use the new reset APIs to manage reset controllers (2018-03-19 09:42:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v4.17-rc1

This contains more Tegra194 support as well as an implementation for the
MBIST workaround needed to avoid some memory-related issues on Tegra210.

----------------------------------------------------------------
Mikko Perttunen (2):
      soc/tegra: Add Tegra194 SoC configuration option
      soc/tegra: pmc: Add Tegra194 compatibility string

Peter De Schrijver (1):
      soc/tegra: pmc: MBIST work around for Tegra210

Thierry Reding (1):
      soc/tegra: pmc: Pass PMC to tegra_powergate_power_up()

Vivek Gautam (1):
      soc/tegra: pmc: Use the new reset APIs to manage reset controllers

 drivers/soc/tegra/Kconfig | 10 +++++
 drivers/soc/tegra/pmc.c   | 98 ++++++++++++++---------------------------------
 2 files changed, 38 insertions(+), 70 deletions(-)

From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/3] soc/tegra: Updates for v4.20-rc2
Date: Wed,  7 Nov 2018 15:53:49 +0100
Message-ID: <20181107145350.29127-3-thierry.reding@gmail.com>
References: <20181107145350.29127-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181107145350.29127-1-thierry.reding@gmail.com>
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

The following changes since commit 4a37f11c8f57ffd6f7397eaf372109d67edd3769:

  soc/tegra: pmc: Implement pad configuration via pinctrl (2018-08-27 12:25:18 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.20-rc2-soc

for you to fetch changes up to 87f9bf3040485ff13e6a5c1c83d0cc46165bdf9c:

  soc/tegra: pmc: Don't power-up XUSB power-domains (2018-10-25 14:30:45 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Updates for v4.20-rc2

Contains a single change to remove a workaround that's no longer needed.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Don't power-up XUSB power-domains

 drivers/soc/tegra/pmc.c | 16 ----------------
 1 file changed, 16 deletions(-)

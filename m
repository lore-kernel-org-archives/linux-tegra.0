From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/5] memory: tegra: Changes for v5.3-rc1
Date: Fri, 21 Jun 2019 17:02:03 +0200
Message-ID: <20190621150206.19037-2-thierry.reding@gmail.com>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190621150206.19037-1-thierry.reding@gmail.com>
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

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-memory

for you to fetch changes up to 76ce48bdb303afa6e33cfbadca9d6bee23a4f559:

  memory: tegra: Fix -Wunused-const-variable (2019-06-14 18:02:02 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.3-rc1

A single fix for an unused constant variable, due to it being declared
outside the only #ifdef that it was being used from.

----------------------------------------------------------------
Nathan Huckleberry (1):
      memory: tegra: Fix -Wunused-const-variable

 drivers/memory/tegra/tegra124.c | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

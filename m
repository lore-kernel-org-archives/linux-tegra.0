From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/8] firmware: tegra: Changes for v5.5-rc1
Date: Sat,  2 Nov 2019 15:45:15 +0100
Message-ID: <20191102144521.3863321-2-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
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

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-firmware

for you to fetch changes up to befc1bab91171d25de22dbcbf41309582a63ecd7:

  firmware: tegra: Move BPMP resume to noirq phase (2019-10-01 16:38:45 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.5-rc1

This contains a single fix for suspend/resume on Tegra194.

----------------------------------------------------------------
Vidya Sagar (1):
      firmware: tegra: Move BPMP resume to noirq phase

 drivers/firmware/tegra/bpmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

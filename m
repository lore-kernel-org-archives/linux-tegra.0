From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 1/3] memory: tegra: Fixes for v5.5-rc1
Date: Wed,  4 Dec 2019 14:07:51 +0100
Message-ID: <20191204130753.3614278-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

The following changes since commit 141bef44e123c101c0da0443ab6b3cfa750f251a:

  memory: tegra: Consolidate registers definition into common header (2019-11-11 14:55:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-memory-fixes

for you to fetch changes up to 030d2829f4c22e675e21904f32ab60f659174e72:

  memory: tegra30-emc: Fix panic on suspend (2019-11-18 13:54:40 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Fixes for v5.5-rc1

This contains a fix for a kernel panic that can occur on suspend if EMC
timings are not available in device tree.

----------------------------------------------------------------
Dmitry Osipenko (1):
      memory: tegra30-emc: Fix panic on suspend

 drivers/memory/tegra/tegra30-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

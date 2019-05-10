From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 1/3] bus/tegra: Fixes for v5.2-rc1
Date: Fri, 10 May 2019 13:35:44 +0200
Message-ID: <20190510113546.15698-1-thierry.reding@gmail.com>
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
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1427736e64c3a8b513cd984332f596055a7ca196:

  bus: tegra-aconnect: add system sleep callbacks (2019-03-28 17:26:14 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-bus-fixes

for you to fetch changes up to 6d6165603e162e3d391f35853a4ab232ab0db064:

  amba: tegra-ahb: Mark PM functions as __maybe_unused (2019-05-08 14:40:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
bus/tegra: Fixes for v5.2-rc1

This contains a single fix for a potential PM-related build issue.

----------------------------------------------------------------
Arnd Bergmann (1):
      amba: tegra-ahb: Mark PM functions as __maybe_unused

 drivers/amba/tegra-ahb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

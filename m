From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 1/9] bus/tegra: Changes for v5.2-rc1
Date: Thu, 18 Apr 2019 17:07:12 +0200
Message-ID: <20190418150721.8828-1-thierry.reding@gmail.com>
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

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-bus

for you to fetch changes up to 1427736e64c3a8b513cd984332f596055a7ca196:

  bus: tegra-aconnect: add system sleep callbacks (2019-03-28 17:26:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
bus/tegra: Changes for v5.2-rc1

This pair of patches adds support for system sleep to the ACONNECT bus
found on Tegra SoCs.

----------------------------------------------------------------
Sameer Pujar (2):
      bus: tegra-aconnect: use devm_clk_*() helpers
      bus: tegra-aconnect: add system sleep callbacks

 drivers/bus/tegra-aconnect.c | 66 ++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 20 deletions(-)

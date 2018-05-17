From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v4.17
Date: Thu, 17 May 2018 18:04:36 +0200
Message-ID: <20180517160436.12180-1-thierry.reding@gmail.com>
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
Cc: Bhadram Varka <vbhadram@nvidia.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.17-fixes-2

for you to fetch changes up to 9df50ba76ac1485b844beffa1f3f5d9659d9cdaf:

  arm64: tegra: Make BCM89610 PHY interrupt as active low (2018-05-03 11:48:16 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v4.17

This contains a one-line update to the device tree of the Tegra186 P3310
processor module, fixing the polarity of the PHY interrupt. Originally,
this was queued to go into v4.18, but the PHY ID matching patch has now
found its way into v4.17-rc5, which means that the PHY driver will know
how to identify the PHY on this board and try to use the interrupt. This
will unfortunately cause networking to break on P3310, hence why I think
this should go into v4.17.

----------------------------------------------------------------
Bhadram Varka (1):
      arm64: tegra: Make BCM89610 PHY interrupt as active low

 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

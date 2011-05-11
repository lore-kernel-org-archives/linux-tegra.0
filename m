From: Mike Rapoport <mike@compulab.co.il>
Subject: [GIT PULL 0/3] TrimSlice updates for 2.6.40
Date: Wed, 11 May 2011 14:07:37 +0300
Message-ID: <cover.1305105580.git.mike@compulab.co.il>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Colin Cross <ccross@android.com>
Cc: Olof Johansson <olof@lixom.net>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Erik Gilling <konkers@android.com>, Mike Rapoport <mike@compulab.co.il>
List-Id: linux-tegra@vger.kernel.org

Hi Colin,
Please consider pulling TrimSlice updates for 2.6.40 merge window.
These patches add registration of i2c, audio and USB devices.

The following changes since commit 9f381a61f58bb6487c93ce2233bb9992f8ea9211:

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6 (2011-05-10 17:39:01 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux-tegra.git trimslice/upstream

Mike Rapoport (3):
      ARM: tegra: trimslice: register i2c busses and devices
      ARM: tegra: trimslice: add audio devices and clocks
      ARM: tegra: trimslice: enable USB ports

 arch/arm/mach-tegra/board-trimslice-pinmux.c |    2 +-
 arch/arm/mach-tegra/board-trimslice.c        |   92 ++++++++++++++++++++++++++
 2 files changed, 93 insertions(+), 1 deletions(-)

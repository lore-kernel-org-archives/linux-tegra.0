From: Dmitry Artamonow <mad_soft@inbox.ru>
Subject: [PATCH/RFC 0/2] Couple of Tegra2 PCIe fixes(?)
Date: Tue,  6 Mar 2012 12:45:41 +0400
Message-ID: <1331023544-6439-1-git-send-email-mad_soft@inbox.ru>
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
To: linux-tegra@vger.kernel.org
Cc: Stephen Warren <swarren@nvidia.com>, Dmitry Artamonow <mad_soft@inbox.ru>, Thierry Reding <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>, Mike Rapoport <mike@compulab.co.il>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

These are more of RFC, because I can't test if 1/2 is really fixes anything,
and not sure how much 2/2 is needed - maybe error it fixes happens just in
my setup (and also I'm not sure if 2 seconds is a good value for timeout,
because I have no idea, how much time it takes for PLL to lock when everything)
But anyway...

While trying to make PCIe work on Harmony board, I've noticed
that pinmux groups for PCIe related signals are tristated, which 
looked suspicious. So I fixed that - that's the patch 1/2.

Sadly, even with this fix and 3.3v regulator patch[1] applied, PCIe still
doesn't work for me. Usually driver just loops infinitely in PLL lock
waiting code (that was the reason for writing patch 2/2 in this
mini-series). Couple of times I observed that after about 20-30 seconds of
waiting it passed PLL lock test and continue further, but then it failed to
detect a link with PCIe card. And I can't even reproduce this anymore.

Does anyone have working PCIe on Harmony? Can you please share the details
of your setup - what bootloader are you using, which version of kernel,
some additional patches maybe? Is there some secret tricks which are needed?
I've tried several combinations of different kernels and bootloaders, but
still can't find even a one which works.

[1] http://www.spinics.net/lists/linux-tegra/msg04148.html

Dmitry Artamonow (2):
  arm/tegra: fix harmony pinmux for PCIe
  arm/tegra: add timeout to PCIe PLL lock detection loop

 arch/arm/mach-tegra/board-harmony-pinmux.c |    6 +++---
 arch/arm/mach-tegra/pcie.c                 |   14 +++++++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

-- 
1.7.5.1.300.gc565c

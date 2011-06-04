From: Colin Cross <ccross@google.com>
Subject: ARM Tegra fixes for 3.0-rc2
Date: Sat, 4 Jun 2011 15:59:56 -0700
Message-ID: <BANLkTikqRkiRKVBsAfEmrO+O9m19KEMzBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, lakml <linux-arm-kernel@lists-infradead.org>, linux-tegra <linux-tegra@vger.kernel.org>, Erik
Cc: Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Linus,
Please pull one fix for Tegra from:

 git://android.git.kernel.org/kernel/tegra.git for-linus

Thanks,
Colin

The following changes since commit 55922c9d1b84b89cb946c777fddccb3247e7df2c:

  Linux 3.0-rc1 (2011-05-29 17:43:36 -0700)

are available in the git repository at:
  git://android.git.kernel.org/kernel/tegra.git for-linus

Stephen Warren (1):
      ARM: Tegra: Harmony: Fix conflicting GPIO numbering

 arch/arm/mach-tegra/board-harmony-power.c |    4 +++-
 arch/arm/mach-tegra/board-harmony.h       |    3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

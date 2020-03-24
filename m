From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/3] Enable LP2 CPUIDLE state on NVIDIA Tegra30
Date: Wed, 25 Mar 2020 01:43:32 +0300
Message-ID: <20200324224335.5825-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series enables LP2 CPU idling state on Tegra30. Previously,
Michał Mirosław reported that this wasn't working on ASUS Transformer
device and we found that replicating the Transformer's downstream kernel
behavior (in regards to the firmware) helps. Later on Michał told that
LP2 works without the firmware changes using a different kernel version /
config, we don't know for sure what was the cause of the original problem.

This series makes the TF firmware changes that are known to work well
in regards to LP2 idling on all devices and then the LP2 idling state
is enabled.

Please review and apply, thanks in advance.

Dmitry Osipenko (3):
  ARM: tegra: Initialize r0 register for firmware wake-up
  firmware: trusted_foundations: Different way of L2 cache enabling
    after LP2 suspend
  cpuidle: tegra: Support CPU cluster power-down state on Tegra30

 arch/arm/mach-tegra/pm.c                     |  4 ++++
 arch/arm/mach-tegra/reset-handler.S          |  7 ++++++-
 drivers/cpuidle/cpuidle-tegra.c              |  1 -
 drivers/firmware/trusted_foundations.c       | 21 ++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 5 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.25.1

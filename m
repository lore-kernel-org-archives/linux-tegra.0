From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RESEND PATCH v2 0/3] Tegra30 clockframework
Date: Mon, 9 Jan 2012 17:33:38 +0200
Message-ID: <1326123224-32522-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "open list:TEGRA SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset introduces the tegra30 clockframework. Clocks which require
voltage scaling are not included in this version. The implementation doesn't
use the generic clock code yet. It's the intention to move to it, once the
semantics are fully clarified.

---

Changes in v2:
 * Fix parent clocks for TWD. This makes the SMP configuration booting again.

Peter De Schrijver (3):
  ARM: tegra: add support for new clock framework features
  ARM: tegra: implement basic tegra30 clock framework
  ARM: tegra: enable tegra30 clock framework

 arch/arm/mach-tegra/Makefile           |    1 +
 arch/arm/mach-tegra/clock.c            |   22 +
 arch/arm/mach-tegra/clock.h            |   15 +
 arch/arm/mach-tegra/common.c           |    1 +
 arch/arm/mach-tegra/include/mach/clk.h |   10 +
 arch/arm/mach-tegra/tegra30_clocks.c   | 3099 ++++++++++++++++++++++++++++++++
 6 files changed, 3148 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/tegra30_clocks.c

-- 
1.7.7.rc0.72.g4b5ea.dirty

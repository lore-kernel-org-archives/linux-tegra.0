From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v1 0/3] Tegra30 clockframework
Date: Mon, 2 Jan 2012 17:18:02 +0200
Message-ID: <1325517486-22458-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patchset introduces the tegra30 clockframework. Clocks which require
voltage scaling are not included in this version. The implementation doesn't
use the generic clock code yet. It's the intention to move to it, once the
semantics are fully clarified.

Peter De Schrijver (3):
  arm/tegra: add support for new clock framework features
  arm/tegra: implement basic tegra30 clock framework
  arm/tegra: enable tegra30 clock framework

 arch/arm/mach-tegra/Makefile           |    1 +
 arch/arm/mach-tegra/clock.c            |   22 +
 arch/arm/mach-tegra/clock.h            |   15 +
 arch/arm/mach-tegra/common.c           |    1 +
 arch/arm/mach-tegra/include/mach/clk.h |   10 +
 arch/arm/mach-tegra/tegra30_clocks.c   | 3080 ++++++++++++++++++++++++++++++++
 6 files changed, 3129 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/tegra30_clocks.c

-- 
1.7.7.rc0.72.g4b5ea.dirty

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] arm/tegra: Fix section mismatch errors in pinmux
Date: Mon, 19 Dec 2011 11:01:56 -0700
Message-ID: <1324317718-24464-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Patches in Tegra's for-3.3/soc branch introduce some section mismatch
errors when building with CONFIG_DEBUG_SECTION_MISMATCH=y. This series
fixes them. I patched each file separately in case you want to squash
these into the original patches.

tegra20: 6996e08 arm/tegra: prepare pinmux code for multiple tegra variants
tegra30: 241682c arm/tegra: pinmux tables and definitions for tegra30

Stephen Warren (2):
  arm/tegra: Fix section mismatch errors in tegra20 pinmux
  arm/tegra: Fix section mismatch errors in tegra30 pinmux

 arch/arm/mach-tegra/pinmux-tegra20-tables.c |    2 +-
 arch/arm/mach-tegra/pinmux-tegra30-tables.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

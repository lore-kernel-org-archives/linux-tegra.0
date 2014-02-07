From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/6] ARM: firmware: improvements to Trusted Foundations support
Date: Fri, 7 Feb 2014 13:35:00 +0900
Message-ID: <1391747706-1847-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

These (mostly minor) patches fix a few typos, improve points that
were agreed upon when the Trusted Foundation series was initially
submitted, and more importantly add support for a prepare_idle()
firmware operation that informs the firmware a CPU is doing idle.
Tegra's cpuidle driver is then also updated accordingly.

These patches should be the last step before device trees for NVIDIA
SHIELD and Tegra Note 7 can be submitted.

Changes since v1:
- Do not remove TF support from tegra_defconfig (will automatically be taken
  care of during next configuration update)
- Add a new prepare_idle() operation to firmware_ops that informs the firmware
  a CPU is going idle (vs. asking the firmware to do it itself as do_idle()
  does)
- Fix idle states names in TF implementation of prepare_idle to sound less
  Tegra-specific

Alexandre Courbot (6):
  ARM: trusted_foundations: fix vendor prefix typos
  ARM: trusted_foundations: fallback when TF support is missing
  ARM: firmware: enable Trusted Foundations by default
  ARM: firmware: add prepare_idle() operation
  ARM: trusted_foundations: implement prepare_idle()
  ARM: tegra: cpuidle: use firmware for power down

 arch/arm/firmware/Kconfig                  |  3 ++-
 arch/arm/firmware/trusted_foundations.c    | 20 +++++++++++++++++++-
 arch/arm/include/asm/firmware.h            |  4 ++++
 arch/arm/include/asm/trusted_foundations.h | 13 +++++++++----
 arch/arm/mach-tegra/cpuidle-tegra114.c     | 11 ++++++++++-
 5 files changed, 44 insertions(+), 7 deletions(-)

-- 
1.8.5.3

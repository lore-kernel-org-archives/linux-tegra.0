From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 0/8] Support Trusted Foundations firmware on Tegra30
Date: Fri, 22 Feb 2019 20:59:18 +0300
Message-ID: <20190222175926.23366-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This patchset adds support for the Trusted Foundations firmware on
NVIDIA Tegra30. Pretty much all of Tegra30 consumer devices have that
firmware and upstream kernel can't boot on those devices without the
firmware support.

Changelog:

v5:     - Fixed machine hanging on disabling D-cache during suspend,
          turned out there are slight variations in behaviour between
          firmware version in regards to cache-management. Thanks to
          Robert Yang for reporting the problem and helping with the
          solution.

v4:     - Fixed Thumb2-kernel hanging on Tegra20, turned out it was not a
          good idea to switch CPU into Thumb2 mode right after jumping into
          the reset handler.

        - Moved LP2-mode-set firmware call invocation to a later stage to
          better replicate what downstream kernel does. This change was
          suggested by Robert Yang and fixes system hang on Ouya game
          console.

        - Added references to the original work made by Michał Mirosław
          into commit messages of the relevant patches.

v3:     - Implemented suspend-resume support.

        - Reworked arm/firmware/trusted_foundations.c a tad. Now cache
          is getting properly initialized, cache enabling / disabling is
          supported.

v2:
        - The "Don't apply CPU erratas in insecure mode" patch got some
          cleanup, in particular resolved the messiness in
          __tegra_cpu_reset_handler_data.

        - Added a comment to tf_cache_write_sec(), justifying the warning
          message.

Dmitry Osipenko (8):
  ARM: trusted_foundations: Implement L2 cache initialization callback
  ARM: trusted_foundations: Make prepare_idle call to take mode argument
  ARM: trusted_foundations: Provide information about whether firmware
    is registered
  ARM: tegra: Set up L2 cache using Trusted Foundations firmware
  ARM: tegra: Don't apply CPU erratas in insecure mode
  ARM: tegra: Always boot CPU in ARM-mode
  ARM: tegra: Support L2 cache maintenance done via firmware
  ARM: tegra: Add firmware calls required for suspend-resume

 arch/arm/firmware/trusted_foundations.c    | 80 +++++++++++++++++++++-
 arch/arm/include/asm/firmware.h            |  2 +-
 arch/arm/include/asm/trusted_foundations.h | 13 ++++
 arch/arm/mach-tegra/cpuidle-tegra114.c     |  3 +-
 arch/arm/mach-tegra/pm.c                   | 49 +++++++++++++
 arch/arm/mach-tegra/reset-handler.S        | 50 +++++++++++---
 arch/arm/mach-tegra/reset.c                |  3 +
 arch/arm/mach-tegra/reset.h                |  9 ++-
 arch/arm/mach-tegra/sleep-tegra20.S        |  4 ++
 arch/arm/mach-tegra/sleep.S                | 14 ++--
 arch/arm/mach-tegra/tegra.c                | 10 +++
 11 files changed, 215 insertions(+), 22 deletions(-)

-- 
2.20.1

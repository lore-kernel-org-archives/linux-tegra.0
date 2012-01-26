From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v1 0/3] Add support for LP3
Date: Thu, 26 Jan 2012 18:22:00 +0200
Message-ID: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Introduce support for LP3 (CPU core clockgating) for Tegra20 and Tegra30.

Peter De Schrijver (3):
  ARM: tegra: definitions for flow controller
  ARM: tegra: assembler code for LP3
  ARM: tegra: cpuidle driver for tegra

 arch/arm/mach-tegra/Makefile   |    2 +
 arch/arm/mach-tegra/cpuidle.c  |  107 ++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/flowctrl.h |   37 ++++++++++++++
 arch/arm/mach-tegra/sleep.S    |   91 ++++++++++++++++++++++++++++++++++
 4 files changed, 237 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/cpuidle.c
 create mode 100644 arch/arm/mach-tegra/flowctrl.h
 create mode 100644 arch/arm/mach-tegra/sleep.S

-- 
1.7.7.rc0.72.g4b5ea.dirty

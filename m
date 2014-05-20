From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Use Tegra's microsecond counter for udelay()
Date: Tue, 20 May 2014 18:36:08 +0300
Message-ID: <1400600176-435-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patchset introduces support for Tegra's microsecond counter as the
udelay() timer. This is useful on Tegra SoCs which do not have an arch timer
such as Tegra20 and Tegra30. Using the microsecond counter instead of a delay
based loop avoids potential problems during cpu frequency changes.

The set consists of 3 patches:

Patch 1 introduces a new call which is used by the ARM architecture delay
timer code to prevent changing the delay timer after calibration is finished
and thus can be in use.

Patch 2 adds logic to choose the delay timer with the highest resolution. This
allows the same registration code to be used on all Tegra SoCs and yet use the
higher resolution arch timer when available (eg on Tegra114 or Tegra124).

Patch 3 adds the actual delay timer code.

Patch set has been verified on ventana (Tegra20), beaver (Tegra30),
dalmore (Tegra114) and jetson TK1 (Tegra124).

Peter De Schrijver (3):
  kernel: add calibration_delay_done()
  ARM: choose highest resolution delay timer
  clocksource: tegra: Use uS counter as delay timer

 arch/arm/lib/delay.c                |   26 ++++++++++++++++++++++----
 drivers/clocksource/tegra20_timer.c |   13 +++++++++++++
 init/calibrate.c                    |   12 ++++++++++++
 3 files changed, 47 insertions(+), 4 deletions(-)

-- 
1.7.7.rc0.72.g4b5ea.dirty

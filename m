From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/7] Tegra124 clock support
Date: Thu, 17 Oct 2013 16:12:44 +0300
Message-ID: <1382015565-20139-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series introduces support for the Tegra124 CAR clocks.
Based on '[PATCH v4 00/15] Introduce common infra for tegra clocks'

changes since v1:

+ suspend/resume for LP1 (Joseph Lo)
+ fixed some comments
+ account for changes to the common infra code

changes since v2:

+ simplified PLLSS support
+ added binding document
+ minor fixes

Joseph Lo (2):
  clk: tegra124: add wait_for_reset and disable_clock for
    tegra_cpu_car_ops
  clk: tegra124: add suspend/resume function for tegra_cpu_car_ops

Peter De Schrijver (5):
  clk: tegra: Add support for PLLSS
  clk: tegra: Add periph regs bank X
  clk: tegra124: Add common clk IDs to clk-id.h
  clk: tegra124: Add new peripheral clocks
  clk: tegra124: Add support for Tegra124 clocks

 .../bindings/clock/nvidia,tegra124-car.txt         |   59 +
 drivers/clk/tegra/Makefile                         |    1 +
 drivers/clk/tegra/clk-id.h                         |   20 +
 drivers/clk/tegra/clk-pll.c                        |  124 ++
 drivers/clk/tegra/clk-tegra-periph.c               |   54 +
 drivers/clk/tegra/clk-tegra124.c                   | 1428 ++++++++++++++++++++
 drivers/clk/tegra/clk.c                            |   10 +
 drivers/clk/tegra/clk.h                            |    5 +
 include/dt-bindings/clock/tegra124-car.h           |  340 +++++
 9 files changed, 2041 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 create mode 100644 drivers/clk/tegra/clk-tegra124.c
 create mode 100644 include/dt-bindings/clock/tegra124-car.h

-- 
1.7.7.rc0.72.g4b5ea.dirty

From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 0/3] Introduce shared and cbus clocks
Date: Tue, 13 May 2014 17:06:53 +0300
Message-ID: <1399990023-30318-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Cbus clocks are virtual clocks which implement coordinated changes to
clock rates. They are used to change PLL rates with active child clocks.
On some SoCs (eg. Tegra) this requires the active child clocks to be moved
to a different parent durint the rate change.

Shared clocks are virtual clocks which implement clock policies such as
minimum required rate or maximum allowed rate.

Peter De Schrijver (3):
  clk: Implement cbus and shared clocks
  clk: tegra: Implement common shared clks
  clk: tegra: Implement Tegra124 shared/cbus clks

 drivers/clk/Makefile                     |    1 +
 drivers/clk/clk-shared-cbus.c            |  448 ++++++++++++++++++++++++++++++
 drivers/clk/tegra/Makefile               |    1 +
 drivers/clk/tegra/clk-id.h               |   58 ++++
 drivers/clk/tegra/clk-tegra-shared.c     |  128 +++++++++
 drivers/clk/tegra/clk-tegra124.c         |   50 ++++
 drivers/clk/tegra/clk.h                  |    1 +
 include/dt-bindings/clock/tegra124-car.h |   70 +++++-
 include/linux/clk-provider.h             |   56 ++++
 9 files changed, 812 insertions(+), 1 deletions(-)
 create mode 100644 drivers/clk/clk-shared-cbus.c
 create mode 100644 drivers/clk/tegra/clk-tegra-shared.c

-- 
1.7.7.rc0.72.g4b5ea.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

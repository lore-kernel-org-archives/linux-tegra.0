From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/6] Add missing Tegra210 clocks
Date: Tue, 28 Feb 2017 16:37:16 +0200
Message-ID: <1488292648-16876-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series adds a number of clocks which were missing from the Tegra210
clock definition. It applies on top of the 'Tegra210 clock bug fixes' series
posted earlier.

Change log:

v3: fixed compiler warnings

v2: fixed a few useless lines moving around


Peter De Schrijver (6):
  clk: tegra: add cec clock
  clk: tegra: define Tegra210 DMIC sync clocks
  clk: tegra: fix constness for periph clks
  clk: tegra: define Tegra210 DMIC clocks
  clk: tegra: add super clk mux/div
  clk: tegra: add aclk

 drivers/clk/tegra/clk-id.h                      | 10 +++
 drivers/clk/tegra/clk-periph.c                  |  4 +-
 drivers/clk/tegra/clk-super.c                   | 87 +++++++++++++++++++++++--
 drivers/clk/tegra/clk-tegra-audio.c             | 85 +++++++++++++++++-------
 drivers/clk/tegra/clk-tegra-periph.c            | 22 +++++++
 drivers/clk/tegra/clk-tegra114.c                |  1 +
 drivers/clk/tegra/clk-tegra124.c                |  1 +
 drivers/clk/tegra/clk-tegra210.c                | 20 ++++++
 drivers/clk/tegra/clk-tegra30.c                 |  1 +
 drivers/clk/tegra/clk.h                         | 11 +++-
 include/dt-bindings/clock/tegra114-car.h        |  2 +-
 include/dt-bindings/clock/tegra124-car-common.h |  2 +-
 include/dt-bindings/clock/tegra210-car.h        | 13 +++-
 include/dt-bindings/clock/tegra30-car.h         |  2 +-
 14 files changed, 223 insertions(+), 38 deletions(-)

-- 
1.9.1

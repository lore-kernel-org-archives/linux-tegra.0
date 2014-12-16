From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] clk: tegra: add support for the Tegra132 CAR IP block
Date: Tue, 16 Dec 2014 12:38:24 -0800
Message-ID: <20141216203813.22980.2301.stgit@chromeos-P9X79>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series follows up on Peter De Schrijver's posting of a Tegra132
CAR series in July of this year.  It adds common clock framework
support for the Tegra132 CAR IP block.

The patches are based on next-20141209 and have been compiled and
boot-tested on a Tegra30 Beaver board, a Tegra114 Dalmore board, and a
Tegra124 Jetson TK1.  They've also been tested on a Tegra132 Norrin
FFD board, with some other patches applied since support for that
board isn't completely upstream (but is coming shortly).

Intended for v3.20.

- Paul

---

Paul Walmsley (2):
      clk: tegra:  split Tegra124 clock header file
      clk: tegra: Add support for the Tegra132 CAR IP block

Peter De Schrijver (2):
      clk: tegra: make tegra_clocks_apply_init_table() arch_initcall
      clk: tegra: Update binding doc for Tegra132


 .../bindings/clock/nvidia,tegra124-car.txt         |   10 -
 arch/arm/mach-tegra/tegra.c                        |    2 
 drivers/clk/tegra/Makefile                         |    1 
 drivers/clk/tegra/clk-pll.c                        |   10 -
 drivers/clk/tegra/clk-tegra124.c                   |  130 +++++++-
 drivers/clk/tegra/clk.c                            |    7 
 include/dt-bindings/clock/tegra124-car-common.h    |  345 ++++++++++++++++++++
 include/dt-bindings/clock/tegra124-car.h           |  345 +-------------------
 include/linux/clk/tegra.h                          |    2 
 9 files changed, 494 insertions(+), 358 deletions(-)
 create mode 100644 include/dt-bindings/clock/tegra124-car-common.h

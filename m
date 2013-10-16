From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: pull request for tegra clocks based on clk-next
Date: Wed, 16 Oct 2013 19:53:56 +0300
Message-ID: <20131016165356.GA1696@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


The following changes since commit f61027426a5bc7093aa8359a411b053a35bb4b68:

  clk: of: helper for determining number of parent clocks (2013-10-07 23:13:33 -0700)

are available in the git repository at:
  git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-patches-1

Andrew Chew (1):
      clk: tegra: Set the clk parent of host1x to pll_p

Mark Zhang (3):
      clk: tegra: Correct sbc mux width & parent
      clk: tegra: Fix vde/2d/3d clock src offset
      clk: tegra: Set the clock parent of gr2d/gr3d to pll_c2

Peter De Schrijver (3):
      ARM: tegra114: add missing clocks to binding
      clk: tegra: replace enum tegra114_clk by binding header
      clk: tegra: PLLE spread spectrum control

Thierry Reding (1):
      clk: tegra114: Rename gr_2d/gr_3d to gr2d/gr3d

 drivers/clk/tegra/clk-pll.c              |   30 ++-
 drivers/clk/tegra/clk-tegra114.c         |  442 ++++++++++++++----------------
 include/dt-bindings/clock/tegra114-car.h |    8 +-
 3 files changed, 235 insertions(+), 245 deletions(-)

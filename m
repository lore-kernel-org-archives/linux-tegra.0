From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: pull request for Tegra clock updates for 3.18
Date: Fri, 19 Sep 2014 15:30:20 +0300
Message-ID: <20140919123020.GA12341@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mike,

A few fixes to enable PLL_M scaling for Tegra124 and improved error handling
for clock initialization.

Thanks,

Peter.

The following changes since commit 9e82bf014195d6f0054982c463575cdce24292be:

  Linux 3.17-rc5 (2014-09-14 17:50:12 -0700)

are available in the git repository at:
  git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-3.18

Mikko Perttunen (2):
      ARM: tegra: Add PLL_M_UD and PLL_C_UD to tegra124-car binding header
      clk: tegra124: Add PLL_M_UD and PLL_C_UD clocks

Tomeu Vizoso (1):
      clk: tegra: Make clock initialization more robust

 drivers/clk/tegra/clk-tegra124.c         |    8 ++++++++
 drivers/clk/tegra/clk.c                  |    9 +++++++--
 include/dt-bindings/clock/tegra124-car.h |    6 +++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

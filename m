From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: pull request for Tegra clock updates for 3.17
Date: Thu, 3 Jul 2014 19:17:40 +0300
Message-ID: <20140703161740.GA6078@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mike,

A few bug fixes for Tegra124 clocks and some updates for the SATA driver


The following changes since commit a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee:

  Linux 3.16-rc2 (2014-06-21 19:02:54 -1000)

are available in the git repository at:
  git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-3.17

Mikko Perttunen (2):
      clk: tegra: Enable hardware control of SATA PLL
      clk: tegra: Add SATA clocks to Tegra124 initialization table

Peter De Schrijver (3):
      clk: tegra: fix vi_sensor clocks on Tegra124
      clk: tegra124: init table updates
      clk: tegra: export clock names for debugging

 drivers/clk/tegra/clk-pll.c          |    8 ++++++++
 drivers/clk/tegra/clk-tegra-periph.c |    4 ++--
 drivers/clk/tegra/clk-tegra114.c     |   31 ++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk-tegra124.c     |   10 +++++++++-
 drivers/clk/tegra/clk.c              |    6 ++++++
 5 files changed, 55 insertions(+), 4 deletions(-)

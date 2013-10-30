From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: pull request for Tegra clock rework and Tegra124 clock support
Date: Wed, 30 Oct 2013 02:47:52 +0200
Message-ID: <20131030004752.GH22111@tbergstrom-lnx.Nvidia.com>
References: <20131021135638.GA10943@tbergstrom-lnx.Nvidia.com>
 <20131022101904.7554.73999@quantum>
 <20131023084631.GG22111@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023084631.GG22111-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mike,

This is an update to the previous pull request which fixes some late bugs.

Thanks,

Peter.

The following changes since commit 6c984fc8c6314596c302bbecf79dc59d9f98f348:

  clk: tegra124: add suspend/resume function for tegra_cpu_car_ops (2013-10-21 16:39:24 +0300)

are available in the git repository at:
  git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-tegra124-0

Mikko Perttunen (1):
      clk: tegra114: Initialize clocks needed for HDMI

Peter De Schrijver (1):
      clk: tegra: use pll_ref as the pll_e parent

Thierry Reding (2):
      clk: tegra: Initialize secondary gr3d clock on Tegra30
      clk: tegra: Properly setup PWM clock on Tegra30

 drivers/clk/tegra/clk-pll.c      |    7 ++++---
 drivers/clk/tegra/clk-tegra114.c |    5 ++++-
 drivers/clk/tegra/clk-tegra30.c  |    5 ++++-
 3 files changed, 12 insertions(+), 5 deletions(-)

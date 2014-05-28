From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] debugfs entries for Tegra clocks
Date: Wed, 28 May 2014 19:51:06 +0300
Message-ID: <1401295868-18697-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch set introduces the 'regs' debugfs entry which shows the
contents of all registers related to a clock.

Peter De Schrijver (2):
  clk: tegra: Add debugfs infrastructure
  clk: tegra: periph, PLL and super clk debugfs entries

 drivers/clk/tegra/clk-periph.c |   24 +++++++
 drivers/clk/tegra/clk-pll.c    |  144 +++++++++++++++++++++++++++++++++++++---
 drivers/clk/tegra/clk-super.c  |   24 +++++++
 drivers/clk/tegra/clk.c        |   61 +++++++++++++++++
 drivers/clk/tegra/clk.h        |   11 +++
 5 files changed, 255 insertions(+), 9 deletions(-)

-- 
1.7.7.rc0.72.g4b5ea.dirty

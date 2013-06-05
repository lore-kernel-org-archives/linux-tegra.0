From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] PLL m,n,p init from SoC files
Date: Wed, 5 Jun 2013 16:51:24 +0300
Message-ID: <1370440301-3562-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The m,n,p fields don't have the same bit offset and width across all PLLs.
This patchset allows SoC specific files to indicate the offset and width.
It also provides the data for Tegra114.

Peter De Schrijver (2):
  clk: tegra: allow PLL m,n,p init from SoC files
  clk: tegra: PLL m,n,p init for Tegra114

 drivers/clk/tegra/clk-pll.c      |   60 ++++++++++++++++-------------
 drivers/clk/tegra/clk-tegra114.c |   77 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk.h          |   32 ++++++++++------
 3 files changed, 130 insertions(+), 39 deletions(-)

-- 
1.7.7.rc0.72.g4b5ea.dirty

From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/4] Tegra DMA clocks addition / correction
Date: Wed,  4 Oct 2017 02:02:37 +0300
Message-ID: <cover.1507070638.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patchset is factored out from the AHB DMA driver 'introduction' series
as per drivers/dma/ subsystem maintainer request.

Change log:

v2:
	- Added patch that corrects parent of the APB DMA clock gate in the
	  'common' clock gate definition.

	- Added patch that makes Tegra20 to utilize the 'common' APB DMA
	  clock gate definition.

Dmitry Osipenko (4):
  clk: tegra: Add AHB DMA clock entry
  clk: tegra: Correct parent of the APBDMA clock
  clk: tegra20: Use common definition of APBDMA clock gate
  clk: tegra20: Bump SCLK clock rate to 216MHz

 drivers/clk/tegra/clk-id.h           | 1 +
 drivers/clk/tegra/clk-tegra-periph.c | 3 ++-
 drivers/clk/tegra/clk-tegra20.c      | 9 +++------
 drivers/clk/tegra/clk-tegra30.c      | 1 +
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.14.1

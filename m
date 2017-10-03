From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] Correct Tegra20 FUSE driver DMA usage
Date: Wed,  4 Oct 2017 01:35:07 +0300
Message-ID: <cover.1507068874.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Change log:

v2:
	- Dropped DT patch as turned out it was incorrect and made things
	  work by luck.

	- Now FUSE driver requests DMA channel from the APB DMA driver
	  utilizing DMA channel filter.

	- This patchset now depends on the APB DMA driver patch that allows
	  DMA client to issue a non-flow controlled transfers. I haven't
	  included that patch to this patchset since DMA usage is broken
	  anyway right now. It will work once this patchset and APBDMA
	  patch get applied.

Dmitry Osipenko (2):
  soc/tegra: fuse: Fix reading registers using DMA on Tegra20
  soc/tegra: fuse: Explicitly request DMA channel from APB DMA driver

 drivers/soc/tegra/fuse/fuse-tegra.c   |  1 +
 drivers/soc/tegra/fuse/fuse-tegra20.c | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.14.1

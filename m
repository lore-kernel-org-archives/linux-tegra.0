From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] dma: tegra: add channel wise pause control support and Tegra114 SoCs.
Date: Sun, 6 Jan 2013 21:52:01 +0530
Message-ID: <1357489323-21359-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: djbw-b10kYP2dOMg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series add the channel wise pause control on dma driver and then
add support for Tegra114 SoCs.

The orginal change was in single patch and based on review comment, trying to split
the change to have more meaningful changelog matches with actual code change.


Laxman Dewangan (2):
  dma: tegra: add support for channel wise pause
  dma: tegra: add support for Tegra114 SoC

 drivers/dma/tegra20-apb-dma.c |   54 +++++++++++++++++++++++++++++++++++++----
 1 files changed, 49 insertions(+), 5 deletions(-)

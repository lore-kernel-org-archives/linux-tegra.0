From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.2-rc1
Date: Fri, 12 Jun 2015 16:39:20 +0200
Message-ID: <1434119960-14044-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.2-rc1

for you to fetch changes up to 8a8005e3e19915559b542bf85cc1b17024ee1d31:

  drm/tegra: dpaux: Registers are 32-bit (2015-06-12 16:26:04 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.2-rc1

This contains a couple of mostly fixes for issues that have crept up in
recent versions of linux-next. One issue is that DP AUX transactions of
more than 4 bytes will access the wrong FIFO registers and hence become
corrupt. Another fix is required to restore functionality of Tegra20 if
using the GART. The current code expects the IOMMU aperture to be the
complete 4 GiB address space, whereas the GART on Tegra20 only provides
a 128 MiB aperture. One more issue with IOMMU support is that on 64-bit
ARM, swiotlb is the default IOMMU implementation backing the DMA API. A
side-effect of that is that when dma_map_sg() is called to flush caches
(yes, this is a bit of a hack, but ARM does not provide a better API),
swiotlb will immediately run out of memory because its bounce buffer is
too small to make a framebuffer.

Finally I've included a mostly cosmetic fix that stores register values
in u32 rather than unsigned long to avoid sign-extension issues on 64-
bit ARM. This is only a precaution since it hasn't caused any issues
(yet).

----------------------------------------------------------------
Thierry Reding (4):
      drm/tegra: dpaux: Fix transfers larger than 4 bytes
      drm/tegra: gem: Take into account IOMMU aperture
      drm/tegra: gem: Flush pages after allocation
      drm/tegra: dpaux: Registers are 32-bit

 drivers/gpu/drm/tegra/dpaux.c | 39 ++++++++++++++++++---------------------
 drivers/gpu/drm/tegra/drm.c   | 12 ++++++++++--
 drivers/gpu/drm/tegra/gem.c   | 25 ++++++++-----------------
 3 files changed, 36 insertions(+), 40 deletions(-)

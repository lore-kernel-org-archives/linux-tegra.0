From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/6] nouveau/gk20a: RAM device removal & IOMMU support
Date: Wed, 11 Feb 2015 16:21:35 +0900
Message-ID: <1423639301-27304-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Changes since v1:
- Add missing else condition in ltc
- Remove extra flags that slipped into nouveau_display.c and nv84_fence.c.

Original cover letter:

Patches 1-3 make the presence of a RAM device optional, and remove GK20A's dummy
RAM driver we were using so far. On chips using shared memory, such a device
can confuse the driver into moving objects where there is no need to, and can
trick user-space into believing it can allocate "video" memory that does not
exist. By making it possible to run Nouveau without a RAM device and
systematically returning errors when VRAM allocations are attempted, we force
user-space to do the right thing and always employ the optimal path.

Contiguous memory allocation for GK20A is now handled directly by a custom
instmem driver.

The remaining patches are not related to the RAM device removal, but since
they touch code that has been moved by patch 2 I took the freedom to include
them in this series.

Patch 4 is a little improvement for GK20A's instmem implementation, which
suppresses the permanent and unneeded CPU mapping created by the DMA API, and
frees up some CPU virtual address space.

Patches 5 and 6 implement initial IOMMU support for GK20A. On top of the GPU
MMU, GK20A also has an independent IOMMU that stands between the GPU and the
system RAM. Whether RAM accesses are performed directly or using the IOMMU is
determined by bit 34 of each address.

If a IOMMU is present, GK20A's instmem takes advantage of it to make unrelated
pages of memory appear contiguous to the GPU instead of using the DMA API.
Another benefit of the IOMMU is that it can be used by custom VM implementation
to make GPU objects allocated via TTM appear contiguous in the IOMMU space,
allowing us to maximize the use of large pages and improve performance, but that
part will come once the basic support is agreed on and merged.

All in all this series should be largely unintrusive for non-Tegra GPUs, with
only patch 1 changing common code parts, in a way that looks safe.

Alexandre Courbot (6):
  make RAM device optional
  instmem/gk20a: move memory allocation to instmem
  gk20a: remove RAM device
  instmem/gk20a: use DMA attributes
  platform: probe IOMMU if present
  instmem/gk20a: add IOMMU support

 drm/nouveau/include/nvkm/subdev/instmem.h |   1 +
 drm/nouveau/nouveau_display.c             |   8 +-
 drm/nouveau/nouveau_platform.c            |  75 ++++-
 drm/nouveau/nouveau_platform.h            |  18 ++
 drm/nouveau/nouveau_ttm.c                 |   3 +
 drm/nouveau/nv84_fence.c                  |  14 +-
 drm/nouveau/nvkm/engine/device/base.c     |   9 +-
 drm/nouveau/nvkm/engine/device/gk104.c    |   2 +-
 drm/nouveau/nvkm/subdev/clk/base.c        |   2 +-
 drm/nouveau/nvkm/subdev/fb/Kbuild         |   1 -
 drm/nouveau/nvkm/subdev/fb/base.c         |  26 +-
 drm/nouveau/nvkm/subdev/fb/gk20a.c        |   1 -
 drm/nouveau/nvkm/subdev/fb/priv.h         |   1 -
 drm/nouveau/nvkm/subdev/fb/ramgk20a.c     | 149 ----------
 drm/nouveau/nvkm/subdev/instmem/Kbuild    |   1 +
 drm/nouveau/nvkm/subdev/instmem/gk20a.c   | 438 ++++++++++++++++++++++++++++++
 drm/nouveau/nvkm/subdev/ltc/gf100.c       |  15 +-
 lib/include/nvif/os.h                     |  63 +++++
 18 files changed, 653 insertions(+), 174 deletions(-)
 delete mode 100644 drm/nouveau/nvkm/subdev/fb/ramgk20a.c
 create mode 100644 drm/nouveau/nvkm/subdev/instmem/gk20a.c

-- 
2.3.0

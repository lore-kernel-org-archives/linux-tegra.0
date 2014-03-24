From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/12] drm/nouveau: support for GK20A, cont'd
Date: Mon, 24 Mar 2014 17:42:22 +0900
Message-ID: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi everyone,

Here is the second batch of patches to add GK20A support to Nouveau. This time
we are adding the actual chip support, and this series brings the driver to a
point where a slightly-tweaked Mesa successfully runs shaders and renders
triangles on GBM! Many thanks to Thierry Reding and the people on the
#nouveau IRC channel for their help without which we would not have reached
this milestone.

A few lines of hacks (not included here) are still needed to deal with cached
mappings triggering external aborts and CPU/GPU memory coherency issues, but I
hope to understand and address these issues next.

Most of the changes below have already been seen (and sometimes reviewed) in an
earlier patchset. What has been added is proper PGRAPH support (still needing
an external firmware and mostly reusing NVE4's code) as well as a better RAM
implementation.

How to represent and manage VRAM has been the hardest part to deal with, since
GK20A shares the system memory with the CPU without any kind of partition. I
have tried various approaches (included some in which no RAM object ever gets
instanciated) and finally decided to go for one using DMA-contiguous memory
allocations and relying on BAR mappings for kernel access and exposure to
user-space, as it fits better with existing code and keeps us safe from most of
the CPU/GPU memory coherency issues (at the cost of some performance).

Looking forward to your review of these few patches! :)

Cheers,
Alex.

Alexandre Courbot (12):
  drm/nouveau: fix missing newline
  drm/nouveau/timer: skip calibration on GK20A
  drm/nouveau/bar: only ioremap BAR3 if it exists
  drm/nouveau/bar/nvc0: support chips without BAR3
  drm/nouveau/fifo: add GK20A support
  drm/nouveau/ibus: add GK20A support
  drm/nouveau/fb: add GK20A support
  drm/nouveau/graph: enable when using external firmware
  drm/nouveau/graph: pad firmware code at load time
  drm/nouveau/graph: add GK20A support
  drm/nouveau: support GK20A in nouveau_accel_init()
  drm/nouveau: support for probing GK20A

 drivers/gpu/drm/nouveau/Makefile                   |   5 +
 drivers/gpu/drm/nouveau/core/engine/device/nve0.c  |  20 +++
 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h    |   1 +
 drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c    |  35 +++++
 .../gpu/drm/nouveau/core/engine/graph/ctxnve4.c    |   4 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c   |  12 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h   |   9 ++
 drivers/gpu/drm/nouveau/core/engine/graph/nve4.c   |   2 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nvea.c   |  75 +++++++++
 drivers/gpu/drm/nouveau/core/include/engine/fifo.h |   1 +
 .../gpu/drm/nouveau/core/include/engine/graph.h    |   1 +
 drivers/gpu/drm/nouveau/core/include/subdev/fb.h   |   1 +
 drivers/gpu/drm/nouveau/core/include/subdev/ibus.h |   1 +
 drivers/gpu/drm/nouveau/core/subdev/bar/base.c     |   7 +-
 drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c     | 101 +++++++------
 drivers/gpu/drm/nouveau/core/subdev/fb/nvea.c      |  56 +++++++
 drivers/gpu/drm/nouveau/core/subdev/fb/priv.h      |   1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnvea.c   | 168 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c    | 110 ++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c   |  19 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  12 +-
 21 files changed, 578 insertions(+), 63 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/graph/nvea.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/nvea.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/ramnvea.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c

-- 
1.9.1

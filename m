From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] drm/nouveau: Add support for fence FDs
Date: Thu, 11 Jan 2018 23:15:43 +0100
Message-ID: <20180111221546.28547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This small series of patches implements support for waiting on and
emitting fence FDs on kickoff. This enables explicit fencing and can be
used for example to synchronize buffer accesses between the display
engine and the GPU on Tegra.

The first patch lays the groundwork by splitting up nouveau_fence_sync()
to allow reuse. Patch 2 is where the interesting stuff happens. It adds
a new IOCTL (PUSHBUF2) that is a superset of the existing PUSHBUF IOCTL
and reuses most of the code while adding support for pre- and post-
fences.

Finally, the third patch teaches Nouveau how to deal with fence arrays,
which are usually a result of chaining together multiple dependent jobs.

I have corresponding userspace support for these in libdrm and Mesa:

	https://cgit.freedesktop.org/~tagr/drm/log/?h=nouveau-sync-fd
	https://cgit.freedesktop.org/~tagr/mesa/log/?h=nouveau-sync-fd

I'll send those patches out shortly. There's some more work depending on
these patches that I plan to send out in the coming days or weeks. The
final result allows Nouveau and Tegra DRM to negotiate for a framebuffer
modifier and then go into a render/scanout loop using fences for
synchronization. All of this was tested using a slightly modified
version of kmscube.

Thierry

Thierry Reding (3):
  drm/nouveau: Split nouveau_fence_sync()
  drm/nouveau: Support fence FDs at kickoff
  drm/nouveau: Support DMA fence arrays

 drivers/gpu/drm/nouveau/nouveau_bo.c      | 38 ++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.h      |  2 +
 drivers/gpu/drm/nouveau/nouveau_display.c |  4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  1 +
 drivers/gpu/drm/nouveau/nouveau_fence.c   | 81 +++++++++++++------------------
 drivers/gpu/drm/nouveau/nouveau_fence.h   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c     | 80 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_gem.h     |  2 +
 include/uapi/drm/nouveau_drm.h            | 14 ++++++
 9 files changed, 167 insertions(+), 57 deletions(-)

-- 
2.15.1

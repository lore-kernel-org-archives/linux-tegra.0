From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 00/11] nouveau: add secure boot support for dGPU and Tegra
Date: Wed, 24 Feb 2016 14:42:13 +0900
Message-ID: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

New version of the secure boot code that works with the blobs just merged into
linux-firmware. Since the required Mesa patches are also merged, this set is
the last piece of the puzzle to get out-of-the-box accelerated Maxwell 2.

The basic code remains the same, with a few improvements with respect to how
secure falcons are started. Hopefully the patchset is better split too.

I have a work-in-progress to further split the secboot subdev and handle other
format differences that future chips are likely to introduce, but this current
code should be good for Maxwell 2 chips.

I hope to get this merged in time for 4.6, so please let me know quickly of
any required changes!

Changes since v2:
- Works with final firmware in linux-firmware
- Use func structure in secboot to abstract differences between dGPU and Tegra
- Better management of firmware loading in GR
- Abstract the way secure falcons are started
- Add MODULE_FIRMWARE statements
- ... plenty of small fixes

Alexandre Courbot (11):
  core: add gpuobj memcpy helper functions
  gr/gk20a: move firmware bundle release to gf100
  gr/gf100: load firmware in outer function
  gr/gk20a: simplify external bundle loading functions
  gr/gk20a: share external bundles loading functions
  gr/gm200: load external firmware and bundles
  core: add support for secure boot
  gr/gf100: add support for securely-managed falcons
  gr/gm200: do not load firmware for secure falcons
  secboot/gm200: add secure-boot support
  secboot/gm20b: add secure boot support

 drm/nouveau/include/nvkm/core/device.h    |    3 +
 drm/nouveau/include/nvkm/core/gpuobj.h    |    4 +
 drm/nouveau/include/nvkm/subdev/secboot.h |   59 ++
 drm/nouveau/nvkm/core/gpuobj.c            |   20 +
 drm/nouveau/nvkm/core/subdev.c            |    1 +
 drm/nouveau/nvkm/engine/device/base.c     |    5 +
 drm/nouveau/nvkm/engine/device/priv.h     |    1 +
 drm/nouveau/nvkm/engine/gr/gf100.c        |   65 +-
 drm/nouveau/nvkm/engine/gr/gf100.h        |   16 +-
 drm/nouveau/nvkm/engine/gr/gk20a.c        |  181 ++--
 drm/nouveau/nvkm/engine/gr/gm200.c        |   49 +-
 drm/nouveau/nvkm/engine/gr/gm206.c        |    2 +-
 drm/nouveau/nvkm/engine/gr/gm20b.c        |   12 +-
 drm/nouveau/nvkm/subdev/Kbuild            |    1 +
 drm/nouveau/nvkm/subdev/secboot/Kbuild    |    3 +
 drm/nouveau/nvkm/subdev/secboot/base.c    |  296 ++++++
 drm/nouveau/nvkm/subdev/secboot/gm200.c   | 1485 +++++++++++++++++++++++++++++
 drm/nouveau/nvkm/subdev/secboot/gm20b.c   |  233 +++++
 drm/nouveau/nvkm/subdev/secboot/priv.h    |  226 +++++
 19 files changed, 2544 insertions(+), 118 deletions(-)
 create mode 100644 drm/nouveau/include/nvkm/subdev/secboot.h
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/Kbuild
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/base.c
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/gm200.c
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/gm20b.c
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/priv.h

-- 
2.7.1

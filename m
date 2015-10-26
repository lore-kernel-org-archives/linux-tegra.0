From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] nouveau: core: gm20b: basic support for secure boot
Date: Mon, 26 Oct 2015 14:43:19 +0900
Message-ID: <1445838202-26270-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

At long last, I wrapped my head around the yard thread that is our downstream
secure boot code and here is a version that is hopefully easier to review.

Patch 1 includes the core secure boot support, which is the ability to load
NVIDIA-signed firmware into secure falcons. With this series, only FECS is
handled but the framework is here to add support for other falcons. I am still
struggling to try and release all firmwares in the same format so they can be
loaded the same way, but am not sure yet whether this will be possible - in the
worst case we will have different loading functions.

Patch 2 adds the ability for GR to start secure boot in order to load the FECS
falcon, and patch 3 turns the right flags in GM20B support to make it happen
for that chip. This series is tested and confirmed to work on GM20B.

Future work that will be based on this series:
- dGPU support: processes for dGPU and Tegra are mostly identical, but with
  a few differences (notably in the way the WPR region is managed). I will
  finish dGPU support once we have solved the issue of reliably producing
  publicly-releasable firmware files for dGPU Maxwell chips.

- Support for other falcons: PMU in particular also needs to be securely booted,
  so does GPCCS for dGPU. These are on hold for now because...

- ... secure boot is currently initiated by GR: secure boot loads all the
  firmwares on all managed falcons, so the current process of having it started
  by GR init will not scale as we manage more falcons. We are discussing this
  issue internally but it would be nice to have thoughts from Nouveau as well.

I hope this base is sane for merging - otherwise please let me know of issues
so we can move this forward!

Thanks,
Alex.

Alexandre Courbot (3):
  core: add support for secure boot
  gr: support for securely-booted FECS firmware
  gm20b: secure-boot FECS falcon

 drm/nouveau/include/nvkm/core/device.h      |   10 +
 drm/nouveau/include/nvkm/core/secure_boot.h |   52 +
 drm/nouveau/nvkm/core/Kbuild                |    1 +
 drm/nouveau/nvkm/core/secure_boot.c         | 1737 +++++++++++++++++++++++++++
 drm/nouveau/nvkm/engine/device/base.c       |   13 +
 drm/nouveau/nvkm/engine/gr/gf100.c          |   56 +-
 drm/nouveau/nvkm/engine/gr/gm20b.c          |    6 +-
 7 files changed, 1861 insertions(+), 14 deletions(-)
 create mode 100644 drm/nouveau/include/nvkm/core/secure_boot.h
 create mode 100644 drm/nouveau/nvkm/core/secure_boot.c

-- 
2.6.1

From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] nouveau: support for custom VRAM domains
Date: Mon, 27 Oct 2014 19:34:56 +0900
Message-ID: <1414406099-21129-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series is to allow NVIDIA chips with shared memory to operate more
efficiently (and to operate at all once we disable VRAM from the kernel
driver) by allowing nouveau_screen to specify a domain to use for objects
originally allocated into VRAM. If the domain is not overridden, the default
NOUVEAU_BO_VRAM is used. A NV_VRAM_DOMAIN() macro is then introduced to be
used in place of NOUVEAU_BO_VRAM when allocating objects, so the right
domain for the chip is used.

Doing so greatly simplifies the equation of memory management on shared-
memory devices, since we don't have to simulate non-existent VRAM memory.
In that respect it seems to be the right thing to do, and all things taken
is not very intrusive.

Tested on GK20A with Wayland and several EGL clients running, and working
fine.

Alexandre Courbot (3):
  nouveau: support for custom VRAM domains
  nvc0: use NV_VRAM_DOMAIN() macro
  gk20a: use NOUVEAU_BO_GART as VRAM domain

 src/gallium/drivers/nouveau/nouveau_buffer.c       |  6 ++----
 src/gallium/drivers/nouveau/nouveau_screen.c       |  6 ++++++
 src/gallium/drivers/nouveau/nouveau_screen.h       |  4 ++++
 src/gallium/drivers/nouveau/nv50/nv50_miptree.c    |  4 ++--
 src/gallium/drivers/nouveau/nvc0/nvc0_compute.c    |  2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_context.c    |  4 ++--
 src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c    |  2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_program.c    |  8 ++++----
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c     | 22 ++++++++++++++++------
 .../drivers/nouveau/nvc0/nvc0_shader_state.c       |  2 +-
 .../drivers/nouveau/nvc0/nvc0_state_validate.c     |  2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_tex.c        |  2 +-
 src/gallium/drivers/nouveau/nvc0/nve4_compute.c    |  2 +-
 13 files changed, 42 insertions(+), 24 deletions(-)

-- 
2.1.2

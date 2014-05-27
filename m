From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/2] nvc0: support for GK20A (Tegra K1)
Date: Tue, 27 May 2014 16:03:00 +0900
Message-ID: <1401174182-2182-1-git-send-email-acourbot@nvidia.com>
References: <1401166783-24086-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401166783-24086-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following 2 patches make it possible to run Mesa programs on GK20A
(Tegra K1).

GK20A is very similar to GK104, but uses a new (backward-compatible) 3D class
as well as the same ISA as GK110 (SM35). Taking these differences into account
is sufficient to successfully render simple off-screen buffers.

Changes since v1:
- Update TargetNVC0::getFileSize() to return the right number of GPR
- Remove definition for unneeded NVISA_GK110_CHIPSET
- Use consistent comparison scheme in nv50_ir_emit_nvc0.cpp

Alexandre Courbot (2):
  nvc0: add GK20A 3D class
  nvc0: use SM35 ISA with GK20A

 src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h      |  2 +-
 src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp |  2 +-
 .../drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp       | 15 ++++++++++-----
 src/gallium/drivers/nouveau/nv_object.xml.h               |  1 +
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c            |  9 ++++++++-
 5 files changed, 21 insertions(+), 8 deletions(-)

-- 
1.9.3

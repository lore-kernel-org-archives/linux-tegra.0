From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] drm/nouveau: option for staging ioctls and new SET_TILING ioctl
Date: Wed, 20 May 2015 14:56:17 +0900
Message-ID: <1432101379-9515-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset proposes to introduce a "staging" module option to dynamically
enable features (mostly ioctls) that are merged but may be refined before
they are declared "stable". The second patch illustrates the use of this
staging option with the SET_TILING ioctl, which can be used to specify the
tiling options of a PRIME-imported buffer.

The staging parameter will allow us (especially, us at NVIDIA) to experiment
more freely with new features and avoid carrying patches across version. To
prevent abuse, the number of staging IOCTLs is limited to 8 (range 0x98 to
0xa0) that are to be recycled as staging IOCTLs become stable and are assigned
a final number.

Alexandre Courbot (1):
  drm: add staging module option

Ari Hirvonen (1):
  drm/nouveau: Set tile mode

 drm/nouveau/nouveau_drm.c          | 19 +++++++++++++
 drm/nouveau/nouveau_gem.c          | 55 ++++++++++++++++++++++++++++++++++++++
 drm/nouveau/nouveau_gem.h          |  2 ++
 drm/nouveau/uapi/drm/nouveau_drm.h | 11 ++++++++
 4 files changed, 87 insertions(+)

-- 
2.4.0

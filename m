From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/6] Miscellaneous fixes to host1x
Date: Fri, 17 May 2013 14:49:42 +0300
Message-ID: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series fixes two issues in the host1x driver: First, the
command buffer validation routine had vulnerabilities that were not
detected in earlier testing. Second, the return codes of some
functions were misleading or completely missing. This caused the
driver to give wrong return codes also to the userspace.

The series is based on top of 3.10rc1. I have tested the patch series
on cardhu by running host1x and gr2d test cases (available at [0]).
I would appreciate any help in testing/reviewing these patches.

[0] https://gitorious.org/linux-host1x/libdrm-host1x

Arto Merilainen (5):
  gpu: host1x: Fix syncpoint wait return value
  gpu: host1x: Fix memory access in syncpt request
  gpu: host1x: Fix client_managed type
  gpu: host1x: Rework CPU syncpoint increment
  drm/tegra: Fix syncpoint increment return code

Terje Bergstrom (1):
  gpu: host1x: Fixes to host1x firewall

 drivers/gpu/host1x/dev.h          |    8 +--
 drivers/gpu/host1x/drm/drm.c      |    3 +-
 drivers/gpu/host1x/drm/gr2d.c     |    2 +-
 drivers/gpu/host1x/hw/cdma_hw.c   |    2 +-
 drivers/gpu/host1x/hw/syncpt_hw.c |   12 ++--
 drivers/gpu/host1x/job.c          |  120 ++++++++++++++++---------------------
 drivers/gpu/host1x/syncpt.c       |   29 +++------
 drivers/gpu/host1x/syncpt.h       |   13 ++--
 8 files changed, 79 insertions(+), 110 deletions(-)

-- 
1.7.9.5

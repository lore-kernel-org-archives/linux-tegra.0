From: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/4] gpu: host1x: add runtime pm support
Date: Thu, 13 Jun 2013 15:23:34 +0530
Message-ID: <1371117218-2326-1-git-send-email-mkulkarni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch-set series adds runtime pm support for host1x,
gr2d & dc. It retains the current behaviour if CONFIG_PM_RUNTIME
is not enabled.

For host1x & gr2d, the clocks are now enabled in .probe
and disabled on its exit. This is needed for correct
init of hardware.

Additionally for gr2d, the clocks are also enabled when
a new work is submitted and disabled when the work is done.
Due to parent->child relations between host1x->gr2d,
this scheme also ends up in enabling & disabling host1x clock

For dc, the clocks are enabled in .probe and disabled in
.remove but via runtime pm instead of direct clock APIs.

Mayuresh Kulkarni (4):
  gpu: host1x: shuffle job APIs
  gpu: host1x: add runtime pm support for gr2d
  gpu: host1x: add runtime pm support for dc
  gpu: host1x: add runtime pm support for host1x

 drivers/gpu/host1x/cdma.c     |  2 ++
 drivers/gpu/host1x/channel.c  |  8 ------
 drivers/gpu/host1x/channel.h  |  1 -
 drivers/gpu/host1x/dev.c      | 57 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/drm/dc.c   | 60 +++++++++++++++++++++++++++++++++++++++----
 drivers/gpu/host1x/drm/gr2d.c | 56 +++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/host1x/job.c      | 21 +++++++++++++++
 drivers/gpu/host1x/job.h      |  3 +++
 8 files changed, 193 insertions(+), 15 deletions(-)

-- 
1.8.1.5

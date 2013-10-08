From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv4 0/5] gpu: host1x: Add runtime pm support
Date: Tue, 8 Oct 2013 09:27:23 +0300
Message-ID: <1381213648-5931-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series adds runtime pm support for host1x, gr2d and dc. It retains the
current behaviour if CONFIG_PM_RUNTIME is not enabled.

The gr2d clock is enabled when a new job is submitted and disabled when
the work is done. Due to parent->child relations between host1x->gr2d, this
scheme enables and disables host1x clock.

For dc, the clocks are enabled in .probe and disabled in .remove via runtime
pm instead of direct clock APIs.

Mayuresh is unfortunately not available to continue with the series and hence
I will continue working on the patches.

Changes in v4:
- Fixed initialisation clean up in host1x and gr2d drivers
- Runtime pm support removal follows now the same convention as other Tegra
drivers
- Code shuffling to prevent unnecessary function prototypes
- Removed unnecessary NULL pointer checks.
- Rebased on top of 3.12-rc4

Changes in v3:
- Rebased patches on top of 3.12-rc2
- Removed unnecessary #ifdefs
- Added descriptions to commit messages
- If runtime pm is disabled, the code calls suspend/resume functions
for enabling/disabling the clocks instead of repeating the functions

Arto Merilainen (1):
  drm/tegra: Fix gr2d initialisation clean up

Mayuresh Kulkarni (4):
  gpu: host1x: shuffle job APIs
  drm/tegra: Add runtime pm support for gr2d
  drm/tegra: Add runtime pm support for dc
  gpu: host1x: Add runtime pm support for host1x

 drivers/gpu/host1x/cdma.c     |  2 ++
 drivers/gpu/host1x/channel.c  |  8 -----
 drivers/gpu/host1x/channel.h  |  1 -
 drivers/gpu/host1x/dev.c      | 56 +++++++++++++++++++++++++++++-----
 drivers/gpu/host1x/drm/dc.c   | 59 ++++++++++++++++++++++++++++++-----
 drivers/gpu/host1x/drm/gr2d.c | 71 ++++++++++++++++++++++++++++++++++++-------
 drivers/gpu/host1x/job.c      | 13 ++++++++
 drivers/gpu/host1x/job.h      |  3 ++
 8 files changed, 177 insertions(+), 36 deletions(-)

-- 
1.8.1.5

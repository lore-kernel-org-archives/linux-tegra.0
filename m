From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] Miscellaneous improvements to Host1x and TegraDRM
Date: Fri, 18 Aug 2017 19:15:49 +0300
Message-ID: <20170818161553.27597-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

here are some new features and improvements.

Patch 1 enables syncpoint protection which prevents channels from
touching syncpoints not belonging to them on Tegra186.

Patch 2 enables the gather filter which prevents userspace command
buffers from using CDMA commands usually reserved for the kernel.
A test is available at git://github.com/cyndis/host1x_test, branch
gather-filter.

Patch 3 greatly improves formatting of debug dumps spewed by host1x
in case of job timeouts. They are now actually readable by humans
without use of additional scripts.

Patch 4 is a simple aesthetical fix to the TegraDRM submit path.

Everything was tested on TX1 and TX2 and should be applied on the
previously posted Tegra186 support series.

Cheers,
Mikko

*** BLURB HERE ***

Mikko Perttunen (4):
  gpu: host1x: Enable Tegra186 syncpoint protection
  gpu: host1x: Enable gather filter
  gpu: host1x: Improve debug disassembly formatting
  drm/tegra: Use u64_to_user_ptr helper

 drivers/gpu/drm/tegra/drm.c                 |  9 +++---
 drivers/gpu/host1x/debug.c                  | 14 ++++++++-
 drivers/gpu/host1x/debug.h                  | 14 ++++++---
 drivers/gpu/host1x/dev.h                    | 16 ++++++++++
 drivers/gpu/host1x/hw/channel_hw.c          | 25 ++++++++++++++++
 drivers/gpu/host1x/hw/debug_hw.c            | 46 ++++++++++++++++++-----------
 drivers/gpu/host1x/hw/debug_hw_1x01.c       |  8 ++---
 drivers/gpu/host1x/hw/debug_hw_1x06.c       |  9 +++---
 drivers/gpu/host1x/hw/hw_host1x04_channel.h | 12 ++++++++
 drivers/gpu/host1x/hw/hw_host1x05_channel.h | 12 ++++++++
 drivers/gpu/host1x/hw/syncpt_hw.c           | 26 ++++++++++++++++
 drivers/gpu/host1x/syncpt.c                 |  3 ++
 12 files changed, 159 insertions(+), 35 deletions(-)

-- 
2.14.1

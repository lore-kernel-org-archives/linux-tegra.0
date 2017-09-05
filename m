From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 0/6] Miscellaneous improvements to Host1x and TegraDRM
Date: Tue,  5 Sep 2017 11:10:23 +0300
Message-ID: <20170905081029.19769-1-mperttunen@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

New in v2:
- Changes in syncpoint protection and u64_to_user_ptr patches.
  See the patches for notes.
- Added patch to support more opcodes in the debug dump 
  disassembly.
- Added patch to fix an incorrect comment.

Thanks,
Mikko

Patch v1 notes:

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

Mikko Perttunen (6):
  gpu: host1x: Enable Tegra186 syncpoint protection
  gpu: host1x: Enable gather filter
  gpu: host1x: Improve debug disassembly formatting
  gpu: host1x: Disassemble more instructions
  gpu: host1x: Fix incorrect comment for channel_request
  drm/tegra: Use u64_to_user_ptr helper

 drivers/gpu/drm/tegra/drm.c                 |  18 ++---
 drivers/gpu/host1x/channel.c                |   3 +-
 drivers/gpu/host1x/debug.c                  |  14 +++-
 drivers/gpu/host1x/debug.h                  |  14 ++--
 drivers/gpu/host1x/dev.h                    |  15 +++++
 drivers/gpu/host1x/hw/channel_hw.c          |  25 +++++++
 drivers/gpu/host1x/hw/debug_hw.c            | 101 ++++++++++++++++++++++------
 drivers/gpu/host1x/hw/debug_hw_1x01.c       |  11 +--
 drivers/gpu/host1x/hw/debug_hw_1x06.c       |  12 ++--
 drivers/gpu/host1x/hw/hw_host1x04_channel.h |  12 ++++
 drivers/gpu/host1x/hw/hw_host1x05_channel.h |  12 ++++
 drivers/gpu/host1x/hw/syncpt_hw.c           |  46 +++++++++++++
 drivers/gpu/host1x/syncpt.c                 |   8 +++
 13 files changed, 246 insertions(+), 45 deletions(-)

-- 
2.14.1

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 0/4] gpu: host1x: Add syncpoint base support
Date: Mon, 14 Oct 2013 15:21:51 +0300
Message-ID: <1381753315-21778-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The host1x driver uses currently syncpoints statically from host1x point of
view. If we do a wait inside a job, it always has a constant value to wait.
host1x supports also doing relative syncpoint waits with respect to syncpoint
bases. This allows doing multiple operations inside a single submit and
waiting an operation to complete before moving to next one.

This set of patches adds support for syncpoint bases to host1x driver and
enables the support for gr2d client.

I have tested the series using the host1x test application (available at [0],
function test_wait_base() in tests/tegra/host1x/tegra_host1x_test.c) on cardhu.
I would appreciate help in reviewing the series and testing the patches
on other boards.

Changes in v2:
- Reordered various code blocks to improve code consistency
- Functions host1x_syncpt_alloc() and host1x_syncpt_request() take now a single
bitfield argument instead of separate boolean arguments
- Added a separate ioctl call for querying the base associated with some
syncpoint

[0] https://gitorious.org/linux-host1x/libdrm-host1x

Arto Merilainen (4):
  gpu: host1x: Add 'flags' field to syncpt request
  gpu: host1x: Add syncpoint base support
  drm/tegra: Deliver syncpoint base to user space
  drm/tegra: Reserve base for gr2d

 drivers/gpu/host1x/dev.h                   |  2 ++
 drivers/gpu/host1x/drm/drm.c               | 25 +++++++++++++
 drivers/gpu/host1x/drm/gr2d.c              |  2 +-
 drivers/gpu/host1x/hw/channel_hw.c         | 19 ++++++++++
 drivers/gpu/host1x/hw/hw_host1x01_uclass.h |  6 ++++
 drivers/gpu/host1x/syncpt.c                | 58 +++++++++++++++++++++++++-----
 drivers/gpu/host1x/syncpt.h                | 10 +++++-
 include/uapi/drm/tegra_drm.h               | 26 +++++++++-----
 8 files changed, 128 insertions(+), 20 deletions(-)

-- 
1.8.1.5

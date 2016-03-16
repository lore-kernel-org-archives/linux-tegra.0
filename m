From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.6-rc1
Date: Wed, 16 Mar 2016 13:50:40 +0100
Message-ID: <1458132640-10635-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.6-rc1

for you to fetch changes up to 341917fe2b62876599315a537b8e248e31bd1366:

  gpu: host1x: Use a signed return type for do_relocs() (2016-03-16 13:45:44 +0100)

Sorry, I had this marked as done on my TODO list, but now realized I
hadn't sent it out after all. It's fairly tiny, so hopefully okay.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.6-rc1

Only two cleanups this time around. One fixes reference counting of
device tree nodes, the other changes the return value of a function
from an unsigned int to an int to reflect that it will return error
codes.

----------------------------------------------------------------
Amitoj Kaur Chawla (1):
      gpu: host1x: bus: Add missing of_node_put()

Markus Elfring (1):
      gpu: host1x: Use a signed return type for do_relocs()

 drivers/gpu/host1x/bus.c | 4 +++-
 drivers/gpu/host1x/job.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] drm/tegra: A couple of fixes for v5.6-rc1
Date: Tue,  4 Feb 2020 14:59:23 +0100
Message-ID: <20200204135926.1156340-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

this contains a couple of fixes for a DMA API performance regression
that was introduced in v5.5 for older Tegra devices. Patches 1 and 2
will likely have to be backported to v5.5.

Thierry

Thierry Reding (3):
  drm/tegra: Relax IOMMU usage criteria on old Tegra
  drm/tegra: Reuse IOVA mapping where possible
  gpu: host1x: Set DMA direction only for DMA-mapped buffer objects

 drivers/gpu/drm/tegra/drm.c   | 49 +++++++++++++++++++++++------------
 drivers/gpu/drm/tegra/gem.c   | 10 ++++++-
 drivers/gpu/drm/tegra/plane.c | 44 +++++++++++++++++--------------
 drivers/gpu/host1x/job.c      | 34 +++++++++++++++++++++---
 4 files changed, 96 insertions(+), 41 deletions(-)

-- 
2.24.1

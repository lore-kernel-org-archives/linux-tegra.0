From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] drm/ttm: nouveau: memory coherency fixes for
	ARM
Date: Mon, 19 May 2014 16:10:54 +0900
Message-ID: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This small series introduces TTM helper functions as well as Nouveau hooks that
are needed to ensure buffer coherency on ARM. Most of this series is a
forward-port of some patches Lucas Stach sent last year and that are also
needed for Nouveau GK20A support:

http://lists.freedesktop.org/archives/nouveau/2013-August/014026.html

Another patch takes care of flushing the CPU write-buffer when writing BOs
through a non-BAR path.

Alexandre Courbot (1):
  drm/nouveau: introduce CPU cache flushing macro

Lucas Stach (3):
  drm/ttm: recognize ARM arch in ioprot handler
  drm/ttm: introduce dma cache sync helpers
  drm/nouveau: hook up cache sync functions

 drivers/gpu/drm/nouveau/core/os.h     | 17 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.c  | 40 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.h  | 20 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c |  8 ++++++-
 drivers/gpu/drm/ttm/ttm_bo_util.c     |  2 +-
 drivers/gpu/drm/ttm/ttm_tt.c          | 25 ++++++++++++++++++++++
 include/drm/ttm/ttm_bo_driver.h       | 28 ++++++++++++++++++++++++
 7 files changed, 136 insertions(+), 4 deletions(-)

-- 
1.9.2

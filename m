From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/9] drm/nouveau: support for GK20A, cont'd
Date: Fri, 2 May 2014 18:32:33 +0900
Message-ID: <1399023162-13159-1-git-send-email-acourbot@nvidia.com>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Latest patches for GK20A, taking comments received for v3 into account.

Changes since v3:
- use only pfn_to_page() and page_to_pfn() in GK20A's FB. These functions
  are present on every arch and the physical address to page frame number
  conversion is also consistently a shift of PAGE_SHIFT. This part will
  probably be replaced by something nicer in the future anyway.
- fixed a warning on 64-bit architectures when printing a dma_addr_t
- tested compilation on x86_64 and ensured there was no error! ;)
- in graph, always use external firmware if no microcode is linked for the
  graph class (instead of only relying on the NvGrUseFW parameter).

Alexandre Courbot (9):
  drm/nouveau/bar: only ioremap BAR3 if it exists
  drm/nouveau/bar/nvc0: support chips without BAR3
  drm/nouveau/ibus: add GK20A support
  drm/nouveau/fb: add GK20A support
  drm/nouveau/fifo: add GK20A support
  drm/nouveau/graph: enable when using external fw
  drm/nouveau/graph: pad firmware code at load time
  drm/nouveau/graph: add GK20A support
  drm/nouveau: support for probing GK20A

 drivers/gpu/drm/nouveau/Makefile                   |   6 +
 drivers/gpu/drm/nouveau/core/engine/device/nve0.c  |  17 +++
 drivers/gpu/drm/nouveau/core/engine/fifo/gk20a.c   |  35 +++++
 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h    |   1 +
 .../gpu/drm/nouveau/core/engine/graph/ctxgk20a.c   |  53 +++++++
 .../gpu/drm/nouveau/core/engine/graph/ctxnvc0.h    |   9 ++
 .../gpu/drm/nouveau/core/engine/graph/ctxnve4.c    |  14 +-
 drivers/gpu/drm/nouveau/core/engine/graph/gk20a.c  |  47 ++++++
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c   |  14 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h   |   2 +
 drivers/gpu/drm/nouveau/core/engine/graph/nve4.c   |   4 +-
 drivers/gpu/drm/nouveau/core/include/engine/fifo.h |   1 +
 .../gpu/drm/nouveau/core/include/engine/graph.h    |   1 +
 drivers/gpu/drm/nouveau/core/include/subdev/fb.h   |   1 +
 drivers/gpu/drm/nouveau/core/include/subdev/ibus.h |   1 +
 drivers/gpu/drm/nouveau/core/subdev/bar/base.c     |   6 +-
 drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c     | 114 +++++++-------
 drivers/gpu/drm/nouveau/core/subdev/fb/gk20a.c     |  56 +++++++
 drivers/gpu/drm/nouveau/core/subdev/fb/priv.h      |   1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c  | 167 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/ibus/gk20a.c   | 103 +++++++++++++
 21 files changed, 584 insertions(+), 69 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/fifo/gk20a.c
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/graph/ctxgk20a.c
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/graph/gk20a.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/gk20a.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/ibus/gk20a.c

-- 
1.9.2

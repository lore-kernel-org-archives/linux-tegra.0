From: Bhumika Goyal <bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/15] drivers: make device_type const
Date: Sat, 19 Aug 2017 13:52:11 +0530
Message-ID: <1503130946-2854-1-git-send-email-bhumirks__18233.2685486928$1503130991$gmane$org@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: julia.lawall-L2FTfq7BK8M@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, g.liakhovetski-Mmb7MZpHnFY@public.gmane.org, tomas.winkler-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, freude-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, jth-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jejb-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, martin.petersen-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, lduncan-IBi9RG/b67k@public.gmane.org, cleech-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, elder-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.orgheik
Cc: Bhumika Goyal <bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Make device_type const. Done using Coccinelle.

Bhumika Goyal (15):
  EDAC: make device_type const
  drm: make device_type const
  [media] i2c: make device_type const
  [media] rc: make device_type const
  mei: make device_type const
  mtd:  make device_type const
  mux: make device_type const
  PCI: make device_type const
  phy: tegra: make device_type const
  platform/x86: wmi: make device_type const
  remoteproc: make device_type const
  s390/zcrypt: make device_type const
  scsi: make device_type const
  staging: greybus: make device_type const
  usb: make device_type const

 drivers/edac/edac_mc_sysfs.c           | 8 ++++----
 drivers/edac/i7core_edac.c             | 4 ++--
 drivers/gpu/drm/drm_sysfs.c            | 2 +-
 drivers/gpu/drm/ttm/ttm_module.c       | 2 +-
 drivers/media/i2c/soc_camera/mt9t031.c | 2 +-
 drivers/media/rc/rc-main.c             | 2 +-
 drivers/misc/mei/bus.c                 | 2 +-
 drivers/mtd/mtdcore.c                  | 2 +-
 drivers/mux/mux-core.c                 | 2 +-
 drivers/pci/endpoint/pci-epf-core.c    | 4 ++--
 drivers/phy/tegra/xusb.c               | 4 ++--
 drivers/platform/x86/wmi.c             | 6 +++---
 drivers/remoteproc/remoteproc_core.c   | 2 +-
 drivers/s390/crypto/ap_card.c          | 2 +-
 drivers/s390/crypto/ap_queue.c         | 2 +-
 drivers/scsi/fcoe/fcoe_sysfs.c         | 4 ++--
 drivers/scsi/scsi_transport_iscsi.c    | 4 ++--
 drivers/staging/greybus/gbphy.c        | 2 +-
 drivers/usb/common/ulpi.c              | 2 +-
 19 files changed, 29 insertions(+), 29 deletions(-)

-- 
1.9.1

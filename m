From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=200/6=5D=20tegradrm=20fixes=20and=20cleanups?=
Date: Wed, 19 Dec 2012 22:38:51 +0100
Message-ID: <1355953137-31563-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some small fixes and cleanups for the tegradrm driver.
This is potentially 3.8-fixes material.

Lucas Stach (6):
  drm: tegra: fix front_porch <-> back_porch mixup
  drm: tegra: don't leave clients host1x member uninitialized
  drm: tegra: protect DC register access with mutex
  drm: tegra: remove redundant tegra2_tmds_config entry
  drm: tegra: clean out old gem prototypes
  drm: tegra: program only one window during modeset

 drivers/gpu/drm/tegra/dc.c     | 24 ++++++++++++++++++------
 drivers/gpu/drm/tegra/drm.h    | 19 +------------------
 drivers/gpu/drm/tegra/hdmi.c   | 25 ++++++-------------------
 drivers/gpu/drm/tegra/host1x.c |  2 ++
 4 Dateien ge=C3=A4ndert, 27 Zeilen hinzugef=C3=BCgt(+), 43 Zeilen entf=
ernt(-)

--=20
1.7.11.7

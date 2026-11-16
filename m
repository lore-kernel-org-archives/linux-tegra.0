Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820302;
	b=v/tGQ4vxKYsDfOD3MKMZDst7hsgWLjfZN4hIm4KRxhrVfYscSKq/Q14Gi8nBnSivITOX
	 URlENd9pd/xni1otuYLl9sABzMKzfjlzkb64ADUio0+tq02q2ApDyZYi0OTITo6jahw9a
	 tok6QdpoF+j0tOMRP/r2XjqDsB1lzdWvagGT3WzIKyYb3PF72VPaOW2REYleWbAHz8prj
	 qJcjgcS9c4gjp8ZBnAtI58Hfi0ckHy0Qft+du1FipyIzvSM68/ND1y7vde3hwX1i92Wz6
	 8sclFHikOfrwb1WJQn7xLyBxsVfbmlB4jSbOD+/LDJRpMGYsqBeJxBu4Mh6/IEyKSIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820302;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:Organization:
	 Content-Transfer-Encoding;
	bh=LPHb1V9vKbxe+F/1gdos/NIGm5OwnSAkFwKpkBR/LCE=;
	b=kmhhrvGSJ33JO+gqzbF0KdSa3QRctqaPHVqa1K8222iWN1gSPgr7s3C/gzbNnnqHSFae
	 RrJTYU5iagyMcZUPwKAfYzAzFds4rParAAgWZIqU33TlilrFCuVNWdHic/b24DG/41eQ4
	 RE09B1LJobDcKYbkeLGRuDasw9mUUu7+BAQuYXhNnYPymLHsLFWMw+0Yz5vFJ77kIgXoe
	 N6ClNLELSzIAtXa5qpYcNJhfyVKCIUtV7XVzwGWKU70mzgMixPTxX0XAZt4zCWpiDVdzu
	 DL3OH8ireQ+wrDH0TcwDtuWx6SVgZHa0VYEPsKCY2yFkr0MuY9+qw2Ui99+anr0LtNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JiiRgnob;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC0606A31C;
	Mon, 16 Nov 2026 09:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABC0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JiiRgnob
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820302; x=1826356302;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l353EF9EPl54Khh5AMtA/qBDbCWKicb1AKbM4kMTiUU=;
  b=JiiRgnobXQY/vsywjXjWEHZe2DOZDejuwek9/2OJLOdp5kBDuOW1BEEh
   ws32kyiQ2SHFy9JMN6wtztGsDBrsFwvr7EbbP1Jn2q79gN4Ll2468zKM7
   JL4GvEpvJhiknGtRl0JbzaJA22I8oHLl41w0ya/6mj8yQoEuWcaT0tdJM
   VWHRTc+BBoLI9lIGBYG2merIFRN56A1Vdb+7Km2+RZFK9CnZdS70CtdPI
   fW82dchUAgf8R+OoKmklLtLg0EJg29sJE8nUYyY6GWDmsPeZ2JhnngCs0
   bi+tOSdUO0jfYtXAA4s1do6QAM48EWQAXQWkcANXS7nUP3aOTzttrha+O
   A==;
X-CSE-ConnectionGUID: YbQwp+0tTUCAsDhXgpmawg==
X-CSE-MsgGUID: 8rEvwnyBQmq3NEGwvmJpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3441629"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3441629"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:11:41 -0800
X-CSE-ConnectionGUID: oDjVyYydS6al3Wos2dGXfg==
X-CSE-MsgGUID: 8mptrhgqRVSxBju7Y/d8gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9636207"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:11:33 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Erwin Springer <aot.lerwin@gmail.com>,
	amd-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Christopher Snowhill <chris@kode54.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	freedreno@lists.freedesktop.org,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>,
	nouveau@lists.freedesktop.org,
	Qianhai Wu <wuqianhai@loongson.cn>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Simon Ser <contact@emersion.fr>,
	wayland-devel@lists.freedesktop.org,
	Xaver Hugl <xaver.hugl@kde.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH 00/12] drm/atomic: Try to make atomic+async usable, and clear up the "async update" helper confusion
Date: Mon, 16 Nov 2026 11:11:18 +0200
Message-ID: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The weird uapi semantics of the atomic async flip support make it
really hard for drivers to implement. Try to fix that by filtering
out the no-op junk from the commit that userspace likes to put there.

Also a lot of people are apparently confusing the
.atomic_async_{update,check}() hack with async flips. The two
are completely orthogonal, so try to clear up that mess by
renaming the hack to .atomic_bypass_{update,check}().

TODO: atomic+async is in serious need to proper tests, somehow
      all that seems to have gotten skipped when the feature
      was added :(

Cc: amd-gfx@lists.freedesktop.org
Cc: André Almeida <andrealmeid@igalia.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christopher Snowhill <chris@kode54.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: Jianmin Lv <lvjianmin@loongson.cn>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Mingcong Bai <jeffbai@aosc.io>
Cc: nouveau@lists.freedesktop.org
Cc: Qianhai Wu <wuqianhai@loongson.cn>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: wayland-devel@lists.freedesktop.org
Cc: Xaver Hugl <xaver.hugl@kde.org>
Cc: Xi Ruoyao <xry111@xry111.site>

Ville Syrjälä (12):
  drm/atomic: Remove tall tales about tearing vs. "async updates"
  drm/atomic: s/async/bypass/
  drm/atomic: Add FIXMEs around the incorrect use of the
    .atomic_bypass_check() for async flips
  drm/atomic: Highlight that bypass commits need care
  drm/atomic/uapi: Eliminate the confusing
    drm_atomic_check_prop_changes()
  drm/atomic/uapi: Improve the async flip property rejection debugs
  drm/atomic/uapi: Document the non-obvious fence/fb_id prop behaviour
  drm/atomic/uapi: Add a FIXME about colorop vs. async flips
  drm/atomic-helper: Mark drm_atomic_crtc_state_for_each_plane_state()
    unsafe
  drm/i915: Complete no-op "async flips" by hand
  drm/atomic/uapi: Make async flips a bit more palatable through atomic
  drm/atomic/uapi: Extract {connector,crtc,plane}_async_flip_check()

 .clang-format                                 |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  20 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |   6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   |  16 +-
 .../amdgpu_dm/tests/amdgpu_dm_plane_test.c    |  32 +--
 drivers/gpu/drm/arm/malidp_crtc.c             |   6 +-
 drivers/gpu/drm/drm_atomic.c                  |  97 ++++++++
 drivers/gpu/drm/drm_atomic_helper.c           |  49 ++---
 drivers/gpu/drm/drm_atomic_uapi.c             | 208 ++++++++++++++----
 drivers/gpu/drm/drm_crtc_internal.h           |   9 +
 drivers/gpu/drm/drm_self_refresh_helper.c     |   4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  38 ++++
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +-
 drivers/gpu/drm/loongson/lsdc_plane.c         |  18 +-
 drivers/gpu/drm/mediatek/mtk_plane.c          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  12 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  12 +-
 drivers/gpu/drm/tegra/dc.c                    |  18 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               |  16 +-
 include/drm/drm_atomic.h                      |  10 +-
 include/drm/drm_atomic_helper.h               |  20 +-
 include/drm/drm_modeset_helper_vtables.h      |  50 +++--
 29 files changed, 482 insertions(+), 201 deletions(-)

-- 
2.56.0


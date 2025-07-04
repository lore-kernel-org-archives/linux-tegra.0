Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E93093B1;
	Fri,  4 Jul 2025 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616701; cv=none; b=TtZJdkDeY4bPr4JxHl3p37iRfJCid4xBTniX4DRzFpxH0158uloVrYYF3U2KqweilW2w/wyP30JtNDUTrRrKJNTMZui4R6HVHPmXburffeJAUU9qIVKNXzgzMyzPzgkk4/UV7nrP5mTpH09D+lnYxpb4CUeiIOM4ckmVeo3FFZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616701; c=relaxed/simple;
	bh=hXYmRLx6CndyqgBfjOW2CrFdlMs+3zq1ANJEEZCHtM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GrV2MP9IM55LHTQSvtoNtX0Y9A84sBcwJeBevyC9p48E1p7X2u/0y8ufgkD1wnEEDDZTni9Z8FXmL2TnR5KF2fYps5n90O9pDWvazBD5DmnwIARpbdcuYWSMXUJKTNFMVRJlv890vDA+VaDp8Jd2FGxFj0/c706hNFl0KStvhws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJU9IZtm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJU9IZtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751616700; x=1783152700;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=hXYmRLx6CndyqgBfjOW2CrFdlMs+3zq1ANJEEZCHtM0=;
  b=jJU9IZtmlRldQTt7rQjjraB8yVDuT+QdPBJeVew6FnxmimTEXG7h+j+9
   WA/kT57cgAk9pcy5pbqTN+IjV7hNo3FnaYNh7XD9S5vPtpMB0l3WVKeRK
   DJS4QLJ8F+hqx/mwVrrdMlIH4Xyz3T+M8DFp/Xmr2VjyrybMEXhj9482R
   +UJ/D05qtPMZm8HN3rZukX6G4XOUhzFOnzXUTFq6BLXmGz+NnOEj9UHaM
   RJwK4rC0Nzys+BuNZQWqR1QJCfjh09Egz/oe3IWo7pnRdI8gQhGamDRsD
   I6CB+UpkGp4pZaUHHpjBUDgBtQso4qmdhJKu5a0vR4IKa7vXaFtLU5MZw
   w==;
X-CSE-ConnectionGUID: iYdhP+UnT0qiH1//ALXpNA==
X-CSE-MsgGUID: rxQdeJ+dR2ep4Xb1iodiQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65004417"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="65004417"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:11:38 -0700
X-CSE-ConnectionGUID: IaKHq96qSDKcGEjh98uuoA==
X-CSE-MsgGUID: /7bgrxnWTmeUHlLJS9o4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154955604"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.102])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:11:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Laurentiu Palcu
 <laurentiu.palcu@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Qiang Yu
 <yuq825@gmail.com>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Damon Ding
 <damon.ding@rock-chips.com>, Ayushi Makhija <quic_amakhija@quicinc.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6ni?=
 =?utf-8?Q?g?=
 <u.kleine-koenig@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 imx@lists.linux.dev, lima@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
In-Reply-To: <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
Date: Fri, 04 Jul 2025 11:11:17 +0300
Message-ID: <a48b77bc632824c6f64bbdb3775f97387e9eedb9@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 04 Jul 2025, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
>
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1

I would think it's better to wait for linux-pm to get merged to Linus'
tree and then backmerged to drm after -rc1 instead of cross-merging that
directly to drm.

Regardless, for merging the i915 changes via whichever tree,

Acked-by: Jani Nikula <jani.nikula@intel.com>

-- 
Jani Nikula, Intel

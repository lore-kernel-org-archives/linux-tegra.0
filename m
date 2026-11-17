Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926556;
	b=YEi6BUUc9yf0EIsUE2nSEYtdL7PzVxl+E+4D0uB+P4o04sRAXzC5kC0HGgIRLUpzjRLl
	 bxZQT2fcr5qEqFMZvpVAkXsKDtF21ymTobNUSWO8JD5Qsd3/U9SPWClmfDxxCEBceIFse
	 csd5FbqBi1w+1ZWte56sXHjSok0Lfgu6ATfJBQwhuYYy/Nd0+75b3TSJ2fxjZ+YXo+l6q
	 6vKMWpNpz5Yf0VXN9aKfyJaF6Ak9q7RV+amwj2+E9fQRYMcO+uQeYn4MHOhEK8M9nS+Y2
	 8WoK9pni2etDKvLlxhHhCi0ljPb9R4nW6sk0pIfhhX1iwAkcjvNLfJ3SoKsJmDbxE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926556;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=SRBX595u4PLbEZc9F7XExdDcjw+uc2OQezv3cOuRJUw=;
	b=op191ZEbsPAgY8EJofSsvCIOlCpwZA4U2i4fi0oCIxVu4AMVpvVeXPqrsV0RjMibgTow
	 lBdZTtwVNS61eNGV+GqJILi0QobboNRvfXeiy6xt09mtk1L5OpNr6FmXE8FhTWNnZLInC
	 DQGtXLE5NLWkRXosBOKsvkObG/C5/E/hG4m1fSR88/37R5uxIw8EmXOd8ON3xUbbAYER7
	 GxZV93Cbup/M7cqe3U1ynhIJuBb9Pi+v9AjALrHb1Ja9KkLNav56ZiT3w52ydYGFLqJcT
	 5ghBI/jVrpDs/lwMG7p0505eaY+XP+35VrZHKEKkWIoCvpKCZEPoF6lZ0PXN/K5S/bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CDA+btKW;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A59606A31C;
	Tue, 17 Nov 2026 14:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CDA+btKW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794926556; x=1826462556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q4W2BYtbGrF9b+Sza6/X9rpK+8tQ7WvHYOd7Ql0pQuI=;
  b=CDA+btKWxaQTRb/tQxMrPzVlH75jUF5eA8x+tddSWn9OU8Z6SlR2NM0n
   aaqYCQAirc8SyZ0StwKgMndhEy80mAbByIE6YyCCqG4944L6UQzY2M/T4
   +EqjQ6kzQz17G6h7pGp4SJ3MFR8jpqwzmQWmOozOQUAUiPOy5eFT6VwJl
   u9udteOA0xN5KpOJmUwtBP4MAmyuhAQXmIh0y73L7iloaAmLMbg3EnUY8
   d6SUiqP5Fed73ZY/o6Hh+YAQeJ5M3PEt2vlbGjUybNL4LRs4miDebSyGF
   r4KP3zc2W/t2r9XfO/G5+Q5oDmZepDBY2O8A9x7Jv7G4Jl33XRHdVbYk6
   Q==;
X-CSE-ConnectionGUID: wrKPfydDRs2HSdkNoXdzAg==
X-CSE-MsgGUID: nZDpssPjRf667hI38dJ2RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3600728"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3600728"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:42:35 -0800
X-CSE-ConnectionGUID: BX821WPNTgqlq2KMILKrdg==
X-CSE-MsgGUID: atJO8mfxQl62FlzFQ0EonQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9714237"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.236])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:42:27 -0800
Date: Tue, 17 Nov 2026 16:42:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Erwin Springer <aot.lerwin@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Christopher Snowhill <chris@kode54.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	freedreno@lists.freedesktop.org,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
	nouveau@lists.freedesktop.org, Qianhai Wu <wuqianhai@loongson.cn>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Simon Ser <contact@emersion.fr>,
	wayland-devel@lists.freedesktop.org,
	Xaver Hugl <xaver.hugl@kde.org>, Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH 00/12] drm/atomic: Try to make atomic+async usable, and
 clear up the "async update" helper confusion
Message-ID: <avxnz4Nt1IufM6oM@intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
 <1b7a7d94-e349-4f3c-b973-c365041c15f2@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b7a7d94-e349-4f3c-b973-c365041c15f2@gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Nov 16, 2026 at 06:29:38PM +0100, Erwin Springer wrote:
> 
> Am 16.11.2026 um 10:11 schrieb Ville Syrjala:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > The weird uapi semantics of the atomic async flip support make it
> > really hard for drivers to implement. Try to fix that by filtering
> > out the no-op junk from the commit that userspace likes to put there.
> >
> > Also a lot of people are apparently confusing the
> > .atomic_async_{update,check}() hack with async flips. The two
> > are completely orthogonal, so try to clear up that mess by
> > renaming the hack to .atomic_bypass_{update,check}().
> >
> > TODO: atomic+async is in serious need to proper tests, somehow
> >        all that seems to have gotten skipped when the feature
> >        was added :(
> 
> thanks, this fixes the KWin case for me, so my patch is no longer
> needed..
> 
> tested on Raptor Lake-U (Iris Xe) with unmodified KWin 6.8.2 and a
> fullscreen client that requests tearing through wp_tearing_control_v1,
> without my patch. I applied the series to the CachyOS 7.3.4 kernel,
> the only conflicts were the renames in amdgpu and msm.
> 
> Before, none of about 350 frames per run was presented without vsync.
> With the series 3330 of 3336 frames tear over four runs (with and
> without CCS modifiers), and the "async flip not supported" message is
> gone. What is still rejected is the first flip after the modifier or
> format changed, once per run, as intended, and in three of the runs
> one commit that touches the cursor plane, which can't do async flips:
> 
>    [PLANE:146:cursor A] does not support async flips
> No warnings and no flip_done timeouts in the log.
> 
> If you think it fits, feel free to add:
> 
> Reported-by: Erwin Springer <aot.lerwin@gmail.com>
> Tested-by: Erwin Springer <aot.lerwin@gmail.com>

Thanks. There are quite a few unresolved issues left here
though, so we might want you patch as a short term fix.
I'll have to go read it with some actual thought...

-- 
Ville Syrjälä
Intel

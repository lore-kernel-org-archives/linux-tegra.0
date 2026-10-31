Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793473694;
	b=tIc1z/ZTLsI4dv9nLF49DsrdGkniqS/MiEuiQWN8Xw4ABWf4j/1nxqJnqrRB3eAevumY
	 x42cy8UCf5ttBEsYx/SkKTxUtWrLYxIfzIuHTpG8wWWaJQ7/8mvzbpTM0uhjFnVjbNtOw
	 DjW87DgBjqH2PeTvCwUQYMTeK2fDI59KCAyqSd+21cER2/9u+ZBaPyWyMxCwwv+MRqP0b
	 OnaoySCr6CHh8Bslcw3rjdEvRMX5iy5x/Enjq0EtKm9dIMFhZ/nfcuGztnVVtWi4oUbfi
	 4SR2KNhrM0AgHS1synLysjd0X/x5g0HUcaCfhfGlcsOcV4juVp6drHm57WetZcQxelQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793473694;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/LscOLn41OKpLbVnPd4xE9dms+FzlvehR8MBG5Utoss=;
	b=qVB4PW4uD9bvNHd3f9hmbbMwpUlqm18Qsb8N1y32YZojKxjpiRJrAI513essc0XFVtc7
	 89h09w/Br56ovHxOPbteBGsA3C5qvgT5MsipDzUMcOmhsjo9wNxSvwZ1NEE3nPo2fg3pC
	 UGWREoXLebqwWvpw3GdHM6bIy0jNFN0M4ahHDF7+FDtTURGl3JSBPRAmvmuLMLUe/Dvwy
	 vJuxPlA4jFxY6bvM6xuS4RMEi84fjoP94DxJFEze5clFMC2zclkszp5+L4hOtlY7i4qM5
	 vRjxBOhgXlDYICcIKdWebQi+Tm7Kiu1QFEKpa2DLht9G5huar04MN1b84FV4VvqE/4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PpAcvhxg;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45F8606A31A;
	Sat, 31 Oct 2026 19:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PpAcvhxg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793473692; x=1825009692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c29btWuVr0fvimsA9IMS8mmau5ofOCQF01O8gAxcQhg=;
  b=PpAcvhxgvwn+hvLmIud3tNdaJdTe2NoMYhCCd7vKzns1/Kh1X2ZCsfmN
   lZF5Kg6lINbfxM2MlRn0wY19TVj7gyoNh6lNYmK9QMqNw0T0Jb3CmNLhO
   9qOVBgXmc9rDsr9GJGJAwBy4JVPlqEOYQOnQCR9nkqyKiq0lWRBrlvg/L
   xQ7Xrnwrvt5+E4EBqfs1Zofjk8HOxXLpUzc+j3SzNvda48WqHaYP3LVG7
   6iOJUb+rbU83PpJS++PKg7DuXEZ5IiLzkUvjlAvhMEOkES/9gFIoEzi7w
   amK7r/h4pjKtSXg24OovfEV3TORN+L4kV8GRgAoO/6Ncr3qZ5ubafQgMD
   A==;
X-CSE-ConnectionGUID: MX326MZ5RsOxmYBwvCy8PQ==
X-CSE-MsgGUID: 8jBG2I/pSYSycJgHuyXcZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2214133"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2214133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 12:08:11 -0700
X-CSE-ConnectionGUID: z0oV6JnFSHymNAR8O0W/Fw==
X-CSE-MsgGUID: xDOKj0fAQDSeoLb0Nh5wsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="6096436"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2026 12:08:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNEQt-00000000d5Q-2MJy;
	Sat, 31 Oct 2026 19:08:03 +0000
Date: Sun, 1 Nov 2026 03:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 11/11] drm/tegra: Add support for 8-bit CPU interface
Message-ID: <202611010236.HbsmlTpw-lkp@intel.com>
References: <20261029152909.234584-12-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029152909.234584-12-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next linus/master v7.3 next-20261030]
[cannot apply to tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/drm-Add-MIPI-DBI-bus-support/20261029-172859
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261029152909.234584-12-clamor95%40gmail.com
patch subject: [PATCH v5 11/11] drm/tegra: Add support for 8-bit CPU interface
config: arm-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261101/202611010236.HbsmlTpw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010236.HbsmlTpw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010236.HbsmlTpw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/tegra/dbi.o: in function `tegra_dbi_probe':
>> dbi.c:(.text+0x874): undefined reference to `devm_mipi_dbi_device_register'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

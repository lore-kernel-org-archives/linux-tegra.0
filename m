Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01A490BE8;
	Mon,  5 Oct 2026 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210598; cv=none; b=Iz+ieRBGXtj6mhEH3kfig1Zzwa7aJtNDJgL36ag+/wDvWuAt8kY5tHjUcgagw5EOlJ9dunNtkf8B+ACUoTZ4PoZjr5gSL7xsKPiwrIH/VXulxuE5Bzwg7eYnI3/R9MmgCp5Ddr/MCYxUJKGB18/xvl39fMKioIIU8pthuGM77xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210598; c=relaxed/simple;
	bh=xvUYXIVNIwDLbL5PVID1qi99hvRGc404R+w4JyrWeX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkkaeeTUSvStkAP8PYYOXb0c03/aeKiQOwSOtJxOyebv2F2VkWh/37asdUcXOQfuf2lPfnD1X5WuU61I29BpntrTKMqdXrHMjj81i3TS5/ct8N76JPI1f44xu9cAHOemmzpZEey5jGxwxzZkO4lngYieJ/1X3f4vRLjNC2CN+sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSyG2iNj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSyG2iNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791210588; x=1822746588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xvUYXIVNIwDLbL5PVID1qi99hvRGc404R+w4JyrWeX8=;
  b=TSyG2iNjdf1rw6rcX7NVPW3NOlZpKzyPwtGGLBth8hHKJH2LRN++TjJ7
   s8uK5/uPs86+va9ad/4NH2+vvTPA1gPvuWzViMYFgEfuyJ8styBeUGT3R
   Z/0KClgpvecD8IlvoXA6YLLM35iNISzJvSC8P34HzUnTRUVy0IeenSRqJ
   KZT0bqyXR7xCTQUcJtwVUzirV2bCJCoNHwnuCIJyLuQXDMdZXQXiB4rMy
   o2pnXlcceJECi4YvunDGumLs4uYUZ6RCiFSuYuVpdDk1uhHDalR5jz93p
   oqzjbsRfTwMr4eCQl6MlyVGdu3p72QFOcjwwl7sUA8Yi5qix2FEFYXSDR
   w==;
X-CSE-ConnectionGUID: Mgl0x2rTSvuQxQMxy144WQ==
X-CSE-MsgGUID: 4Q1uLdrsQr6erjJkLCvREQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113661779"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="113661779"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:29:43 -0700
X-CSE-ConnectionGUID: WhFoEnCwR12fS6SQUfOERw==
X-CSE-MsgGUID: wx3FxX3YSD2nT+TN36WhNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276958614"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2026 07:29:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDjh9-000000000QR-2riz;
	Mon, 05 Oct 2026 14:29:35 +0000
Date: Mon, 5 Oct 2026 22:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/tegra: Add support for 8-bit CPU interface
Message-ID: <202610052204.NAPy4kxK-lkp@intel.com>
References: <20261004163114.181800-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004163114.181800-5-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next linus/master v7.3-rc6 next-20261002]
[cannot apply to tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/drm-tegra-dc-Expand-available-registers-layouts/20261004-193108
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261004163114.181800-5-clamor95%40gmail.com
patch subject: [PATCH v2 4/7] drm/tegra: Add support for 8-bit CPU interface
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261005/202610052204.NAPy4kxK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052204.NAPy4kxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052204.NAPy4kxK-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/gpu/drm/tegra/dbi.o: in function `tegra_dbi_driver_init':
>> dbi.c:(.init.text+0x0): multiple definition of `init_module'; drivers/gpu/drm/tegra/drm.o:drm.c:(.init.text+0x0): first defined here
   nios2-linux-ld: drivers/gpu/drm/tegra/dbi.o: in function `tegra_dbi_driver_exit':
>> dbi.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/gpu/drm/tegra/drm.o:drm.c:(.exit.text+0x0): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

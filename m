Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB52F0C5B;
	Fri, 23 Jan 2026 02:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769134371; cv=none; b=LbDhaIOBL+iUGkYv/+xU5YdG/7QjoQjycVstlQ3NGvVPCarDLfavcnVaIgpuokfQY1k7Fw938abmHRNFbE3BQHvycaE3PSNW04JCXN7nQvtSh4h2Kgtt55MJyh3RetYhzojYcEsaZ0KEBsRMsjO3CA4In64q++nmVH9RSKY0KzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769134371; c=relaxed/simple;
	bh=Urg92rPlSCxkcW9xwWZMP1kRZiw/qhuHYe6F6frl7B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWdnUt6e4cYY0KN4ipG8HVQgKp0Q5ITrj0yBSbBVJ0cRCJSyZZ/ip7233tzLjV6QhHjR0fHB2QzajWSid4bxp1bQ4IsqXTDdO3xIe4vED1ktgkwSTv8L7f5oSA1y+YXZyUQXbX4pV5g2DbwRYWgw5tg2ByLnxoakD0u3cq+O74o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cO6sy0I9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cO6sy0I9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769134359; x=1800670359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Urg92rPlSCxkcW9xwWZMP1kRZiw/qhuHYe6F6frl7B0=;
  b=cO6sy0I9g4lZamfW5By+STprigb+00z3cxYH0hN9WhWkNOeCSWJSE+dt
   PNTTJZ9ROX9Wnk+vpxhn06UORHmkCEJ7JftW2MYUr8tejGrRky2+FOi0d
   A4QmWZchf2J5jacF6r4pateSNFezXs4jpne3N7vLNcizDK7q+5TiXx+og
   8LPuQ6ThVmlwFcIMS52hTBfpS4Ra3mBKYv2llzNyfGtppdbir8qwKWddV
   0qB2iKMt6GySKqQxoOoV2WxgJ149CnRuiFLtEWstlNE6DxGkUgPowiaUc
   QzVUMeAq8CEU6gv4ggoehiCxn8iVEjec3QL0Q9Usvr1gAQsxtDBG8RiQG
   A==;
X-CSE-ConnectionGUID: PI8G5MuSQAG/lwv+yf40Xw==
X-CSE-MsgGUID: fi1hqcDySMKHshRJw9qYKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81827747"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81827747"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:12:34 -0800
X-CSE-ConnectionGUID: ZXJ8HK+9RoiuAX4b/V1nhg==
X-CSE-MsgGUID: kenf7FazSm+yHFpZFug07w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2026 18:12:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj6ew-00000000TQo-2Ia2;
	Fri, 23 Jan 2026 02:12:26 +0000
Date: Fri, 23 Jan 2026 10:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
Message-ID: <202601231052.RfGOFd3g-lkp@intel.com>
References: <20260122161009.3865888-5-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-5-thierry.reding@kernel.org>

Hi Thierry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20260122]
[cannot apply to drm-misc/drm-misc-next robh/for-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-reserved-memory-Document-Tegra-VPR/20260123-001244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260122161009.3865888-5-thierry.reding%40kernel.org
patch subject: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
config: openrisc-randconfig-r072-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231052.RfGOFd3g-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231052.RfGOFd3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231052.RfGOFd3g-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/cma_sysfs.c: In function 'cma_sysfs_init':
>> mm/cma_sysfs.c:119:25: error: 'cma_area_count' undeclared (first use in this function); did you mean 'cma_early_area_count'?
     119 |         for (i = 0; i < cma_area_count; i++) {
         |                         ^~~~~~~~~~~~~~
         |                         cma_early_area_count
   mm/cma_sysfs.c:119:25: note: each undeclared identifier is reported only once for each function it appears in
>> mm/cma_sysfs.c:126:24: error: 'cma_areas' undeclared (first use in this function); did you mean 'cma_attrs'?
     126 |                 cma = &cma_areas[i];
         |                        ^~~~~~~~~
         |                        cma_attrs


vim +119 mm/cma_sysfs.c

43ca106fa8ec7d Minchan Kim 2021-05-04  107  
43ca106fa8ec7d Minchan Kim 2021-05-04  108  static int __init cma_sysfs_init(void)
43ca106fa8ec7d Minchan Kim 2021-05-04  109  {
43ca106fa8ec7d Minchan Kim 2021-05-04  110  	struct kobject *cma_kobj_root;
43ca106fa8ec7d Minchan Kim 2021-05-04  111  	struct cma_kobject *cma_kobj;
43ca106fa8ec7d Minchan Kim 2021-05-04  112  	struct cma *cma;
43ca106fa8ec7d Minchan Kim 2021-05-04  113  	int i, err;
43ca106fa8ec7d Minchan Kim 2021-05-04  114  
43ca106fa8ec7d Minchan Kim 2021-05-04  115  	cma_kobj_root = kobject_create_and_add("cma", mm_kobj);
43ca106fa8ec7d Minchan Kim 2021-05-04  116  	if (!cma_kobj_root)
43ca106fa8ec7d Minchan Kim 2021-05-04  117  		return -ENOMEM;
43ca106fa8ec7d Minchan Kim 2021-05-04  118  
43ca106fa8ec7d Minchan Kim 2021-05-04 @119  	for (i = 0; i < cma_area_count; i++) {
43ca106fa8ec7d Minchan Kim 2021-05-04  120  		cma_kobj = kzalloc(sizeof(*cma_kobj), GFP_KERNEL);
43ca106fa8ec7d Minchan Kim 2021-05-04  121  		if (!cma_kobj) {
43ca106fa8ec7d Minchan Kim 2021-05-04  122  			err = -ENOMEM;
43ca106fa8ec7d Minchan Kim 2021-05-04  123  			goto out;
43ca106fa8ec7d Minchan Kim 2021-05-04  124  		}
43ca106fa8ec7d Minchan Kim 2021-05-04  125  
43ca106fa8ec7d Minchan Kim 2021-05-04 @126  		cma = &cma_areas[i];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

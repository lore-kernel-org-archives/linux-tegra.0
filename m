Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9486229B02;
	Fri,  5 Sep 2025 05:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757050174; cv=none; b=CKi53va6OZn9jl5m3Zh7e2odfdXA1Z8yLSKGmf5x6xLWy+RRr5BkSkU9yywHsE6TqrQ2zWjXWzM6Akd2rIAKLYu9PzDIi4Ar0AipoSa6BE9mOy5ZFNq+sxfH/hFQOYqg+jKYRvzzYTRbGyNnUwRchxXmkdjiQIt2RTHt6gfIBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757050174; c=relaxed/simple;
	bh=+GGeWtzOnhlywY1SautnLIfVlb/W/eBi0k6tGAU9xmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9cZYUZnc0LiIveoagefEe8GHWhZl/o3Y0l6u3xTSARJ5F62wbGHfL7KdI332xNn+Mw65ll4R/TV3MkLlh6/zXr7oAxhfcRvrB9Lq2hDXt1ZCr3v6EQoXjSz7pwb614FUURWmz+p+k9l5p8gSC2l80wQy/r2ZVV6wCHuKTuBOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W00GLw71; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W00GLw71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757050173; x=1788586173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+GGeWtzOnhlywY1SautnLIfVlb/W/eBi0k6tGAU9xmE=;
  b=W00GLw71hzfX2HfeNO36bLjsMZ4fccn1kxnzjObAlbgvl35oVfhCdSlj
   UtKkg8vxNwxVFnNIgPNxdhkbxTy6zKd27Ld90tulmFMC7G70IlF+ZzQA5
   /SpkC1URu8d3YB4b7r6IqG1NqKIk3rpSJNZurAOH6mQufWpKxHjNw1n5U
   YhjMc2bCBXUJ1TB9cJk4Q6JHJG2aRrAd0oh9W/HJtkYGcGcPwPArrMmcQ
   BeYxqImAMX1gisVliwj3SmgQgrxqo+w+a95Gs3MrND5yKaJrOnb4JsNA9
   rUURNtFq9OV2hAYQ6ds+toINuATdYHOXX26C5EzXkGGRZEJisJwKfgazY
   Q==;
X-CSE-ConnectionGUID: ld9yZ2DIShiaPKaNmWbzmg==
X-CSE-MsgGUID: SK/yG/8wSNe42I0a847DPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59509162"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="59509162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 22:29:32 -0700
X-CSE-ConnectionGUID: Zu57G14KQ228dbPwUZN39g==
X-CSE-MsgGUID: QRofuRMxRbCSJ9Zg5SFtLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="176412850"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Sep 2025 22:29:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuP0m-00003X-31;
	Fri, 05 Sep 2025 05:29:24 +0000
Date: Fri, 5 Sep 2025 13:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 5/9] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <202509051316.Hlzf9HAw-lkp@intel.com>
References: <20250902154630.4032984-6-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154630.4032984-6-thierry.reding@gmail.com>

Hi Thierry,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250902]
[also build test ERROR on v6.17-rc4]
[cannot apply to robh/for-next akpm-mm/mm-everything tegra/for-next linus/master v6.17-rc4 v6.17-rc3 v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-reserved-memory-Document-Tegra-VPR/20250902-235038
base:   next-20250902
patch link:    https://lore.kernel.org/r/20250902154630.4032984-6-thierry.reding%40gmail.com
patch subject: [PATCH 5/9] dma-buf: heaps: Add support for Tegra VPR
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250905/202509051316.Hlzf9HAw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509051316.Hlzf9HAw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509051316.Hlzf9HAw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/heaps/tegra-vpr.c:158:26: error: called object type 'void *' is not a function or function pointer
     158 |                 err = pm_generic_freeze(node->dev);
         |                       ~~~~~~~~~~~~~~~~~^
   drivers/dma-buf/heaps/tegra-vpr.c:175:24: error: called object type 'void *' is not a function or function pointer
     175 |                 err = pm_generic_thaw(node->dev);
         |                       ~~~~~~~~~~~~~~~^
   drivers/dma-buf/heaps/tegra-vpr.c:192:14: error: call to undeclared function '__ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     192 |         pte_t pte = __ptep_get(ptep);
         |                     ^
   drivers/dma-buf/heaps/tegra-vpr.c:192:14: note: did you mean 'ptep_get'?
   include/linux/pgtable.h:338:21: note: 'ptep_get' declared here
     338 | static inline pte_t ptep_get(pte_t *ptep)
         |                     ^
   drivers/dma-buf/heaps/tegra-vpr.c:192:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
     192 |         pte_t pte = __ptep_get(ptep);
         |               ^     ~~~~~~~~~~~~~~~~
   drivers/dma-buf/heaps/tegra-vpr.c:194:36: error: use of undeclared identifier 'PROT_NORMAL'; did you mean 'ZONE_NORMAL'?
     194 |         pte = clear_pte_bit(pte, __pgprot(PROT_NORMAL));
         |                                           ^~~~~~~~~~~
         |                                           ZONE_NORMAL
   arch/s390/include/asm/page.h:122:36: note: expanded from macro '__pgprot'
     122 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                                        ^
   include/linux/mmzone.h:806:2: note: 'ZONE_NORMAL' declared here
     806 |         ZONE_NORMAL,
         |         ^
   drivers/dma-buf/heaps/tegra-vpr.c:195:34: error: use of undeclared identifier 'PROT_DEVICE_nGnRnE'
     195 |         pte = set_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
         |                                         ^
   drivers/dma-buf/heaps/tegra-vpr.c:197:2: error: call to undeclared function '__set_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     197 |         __set_pte(ptep, pte);
         |         ^
   drivers/dma-buf/heaps/tegra-vpr.c:197:2: note: did you mean 'set_pte'?
   arch/s390/include/asm/pgtable.h:1041:20: note: 'set_pte' declared here
    1041 | static inline void set_pte(pte_t *ptep, pte_t pte)
         |                    ^
   drivers/dma-buf/heaps/tegra-vpr.c:205:14: error: call to undeclared function '__ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     205 |         pte_t pte = __ptep_get(ptep);
         |                     ^
   drivers/dma-buf/heaps/tegra-vpr.c:205:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
     205 |         pte_t pte = __ptep_get(ptep);
         |               ^     ~~~~~~~~~~~~~~~~
   drivers/dma-buf/heaps/tegra-vpr.c:207:36: error: use of undeclared identifier 'PROT_DEVICE_nGnRnE'
     207 |         pte = clear_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
         |                                           ^
   drivers/dma-buf/heaps/tegra-vpr.c:208:34: error: use of undeclared identifier 'PROT_NORMAL'; did you mean 'ZONE_NORMAL'?
     208 |         pte = set_pte_bit(pte, __pgprot(PROT_NORMAL));
         |                                         ^~~~~~~~~~~
         |                                         ZONE_NORMAL
   arch/s390/include/asm/page.h:122:36: note: expanded from macro '__pgprot'
     122 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                                        ^
   include/linux/mmzone.h:806:2: note: 'ZONE_NORMAL' declared here
     806 |         ZONE_NORMAL,
         |         ^
   drivers/dma-buf/heaps/tegra-vpr.c:210:2: error: call to undeclared function '__set_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |         __set_pte(ptep, pte);
         |         ^
   12 errors generated.


vim +158 drivers/dma-buf/heaps/tegra-vpr.c

   135	
   136	static int tegra_vpr_resize(struct tegra_vpr *vpr)
   137	{
   138		struct tegra_vpr_device *node;
   139		phys_addr_t base, size;
   140		int err;
   141	
   142		err = tegra_vpr_get_extents(vpr, &base, &size);
   143		if (err < 0) {
   144			pr_err("%s(): failed to get VPR extents: %d\n", __func__, err);
   145			return err;
   146		}
   147	
   148		if (vpr->use_freezer) {
   149			err = freeze_processes();
   150			if (err < 0) {
   151				pr_err("%s(): failed to freeze processes: %d\n",
   152				       __func__, err);
   153				return err;
   154			}
   155		}
   156	
   157		list_for_each_entry(node, &vpr->devices, node) {
 > 158			err = pm_generic_freeze(node->dev);
   159			if (err < 0) {
   160				pr_err("failed to runtime suspend %s\n",
   161				       dev_name(node->dev));
   162				continue;
   163			}
   164		}
   165	
   166		trace_tegra_vpr_set(base, size);
   167	
   168		err = tegra_vpr_set(base, size);
   169		if (err < 0) {
   170			pr_err("failed to secure VPR: %d\n", err);
   171			return err;
   172		}
   173	
   174		list_for_each_entry(node, &vpr->devices, node) {
   175			err = pm_generic_thaw(node->dev);
   176			if (err < 0) {
   177				pr_err("failed to runtime resume %s\n",
   178				       dev_name(node->dev));
   179				continue;
   180			}
   181		}
   182	
   183		if (vpr->use_freezer)
   184			thaw_processes();
   185	
   186		return 0;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

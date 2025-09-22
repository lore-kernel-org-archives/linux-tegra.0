Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1205464D;
	Mon, 22 Sep 2025 01:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758505241; cv=none; b=QFvUN+SvNkO2SyO94tvu8r/KSMyF9jjXaKZDR94Il4Zj71oi+Z7VZg823e0GtUX6GM1CmiAQ8Nyf8OUeecZNVbB32KoDbIY0Tr/YFHL3Y6q/QM1njCzjIUo5K6+/0KXwwp02ClCyOiEL49MAQbrHR587hJLENa8yN8/yEJSmNKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758505241; c=relaxed/simple;
	bh=+kM5PiKkTTdIyO1uqU3fxNhuoucUcc7yyFO+KVyEYZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhCIkzyXYkhyOTkPlF41FidsUhsR1CXigCJ+L6FOogNWOvGmlHVbgocQ9f6O1gQCjD44T1gpNPriw2OqAzUZAWsWAxyjFLyTb26W5Vv3cT6FHl+eBnNoKf0LnZ0GEEgktQ7ewzdTdlrtco6bWOb41KqdOMwe+wtCVfoWvVxhHEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrTbNhA3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrTbNhA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758505240; x=1790041240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+kM5PiKkTTdIyO1uqU3fxNhuoucUcc7yyFO+KVyEYZg=;
  b=WrTbNhA3Oem8YcDBnybGjQS7yWtsGpZD/Ltc5K5vVF3hVK8N1i7Bf1F2
   mZ28x/kVEdaFLT0GhB8lCKMZlI3i+m7Cgbv0iP5t0pjwNwm3crkPiLYK+
   V2rMZpKpXjHDSipk1vqg45b3NHCwfWTKZOzVE+wNPW1IOeBGxLosswMCm
   cDOwcD3ecHW7xlQyyEKAmN5aBIFTd2HOEmIqkodRJlzTScpNuHtIbdk4V
   qgvLMZhevvGDeAuxc67o5LWyGwwWge/Rp04m+qF93VFq1wC/QuM75yLI/
   7xM/WtRWU6uVuIvi6l/S2+BQ7eiKUoM5EQUrFwulLqRIhAFu4z+i5DzwV
   Q==;
X-CSE-ConnectionGUID: UJiug7B1QB6luP8+OOVlSA==
X-CSE-MsgGUID: tuvxsRMQSR+TRidYzyuGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="59802165"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="59802165"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 18:40:39 -0700
X-CSE-ConnectionGUID: gxtktPD3R8aAMdur/5bYRw==
X-CSE-MsgGUID: 58Gus90ESQWcx/rdCI9dUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176172100"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Sep 2025 18:40:36 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0VXZ-0001Cq-1k;
	Mon, 22 Sep 2025 01:40:30 +0000
Date: Mon, 22 Sep 2025 09:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, Ketan Patil <ketanp@nvidia.com>
Subject: Re: [PATCH 3/4] memory: tegra: Add support for multiple irqs
Message-ID: <202509220945.sf6Ru7V3-lkp@intel.com>
References: <20250916051754.39250-4-ketanp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916051754.39250-4-ketanp@nvidia.com>

Hi Ketan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on krzk-mem-ctrl/for-next linus/master v6.17-rc7 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ketan-Patil/memory-tegra-Group-mc-err-related-registers/20250916-132118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250916051754.39250-4-ketanp%40nvidia.com
patch subject: [PATCH 3/4] memory: tegra: Add support for multiple irqs
config: arm-randconfig-r121-20250922 (https://download.01.org/0day-ci/archive/20250922/202509220945.sf6Ru7V3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project efd96afedf2c0f6f2cc34cf5a9a7e3e78f592255)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220945.sf6Ru7V3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509220945.sf6Ru7V3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/memory/tegra/tegra20.c:764:21: sparse: sparse: symbol 'tegra20_mc_irq_handlers' was not declared. Should it be static?

vim +/tegra20_mc_irq_handlers +764 drivers/memory/tegra/tegra20.c

   763	
 > 764	const irq_handler_t tegra20_mc_irq_handlers[] = {
   765		tegra20_mc_handle_irq
   766	};
   767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

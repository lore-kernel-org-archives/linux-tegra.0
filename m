Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AEB2FC004
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126382; cv=none; b=QvSGBaLYTy6lf+3Zu2aKX8qyI1Fb9Y56und0wia7afZRqrGtIwNEh5tGbWadYWrspgkLh1sdwknwc8VBm4Maa1Lxb/0a5yNWJYAnqVmVsZnCtJHWqNv6vMgfCNMWGmNb84QUGf4cOGZgrWx/Cnc/ou/18/4Mezs8FPpHWV96LJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126382; c=relaxed/simple;
	bh=NDhm4O/FVsAXjZfG47kTBj12SFHmytZ3Y/An7pHu30k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ml1maqDOZxU1upJgjtLIv1NZax1QS7+xwGD9XFC1NzAB4zCm414oEPMT8qz+/66wfj1LruhUnlDoXU6zYfvbc56SuaNANv27pIcre0f1XQcGgMXqSR9JcoiJzSFd5CVjLJBRqGeF/cYzyYOOOUSs3dUeCMeLXhW+o9v1kZyu6Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FE1EZZWQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FE1EZZWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763126380; x=1794662380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDhm4O/FVsAXjZfG47kTBj12SFHmytZ3Y/An7pHu30k=;
  b=FE1EZZWQosp8BJu0iEFljtf0EFHacPMNYZ1rmqRXbKcpPMa3VMEqhmY1
   lXB+kLf6Vvgrd8HDUglUGZML7FZSkCKZoLZ9C3E19pGtzn+V3A7qMTjf9
   bJGfvHtZ7lJzkxlsv6hOhsRWAvzn/RU6Oyq87rpdnceIjRkdjrR5hqoCk
   KHd7LPMALyPrxENgxzAvL5ozRc8TkM8b/wCGdGF2u2kiLCovNufjzXmE9
   spty4czlNqeU0yLK0SRcXdkQf9PME2snPZheQl83Avd5gUmS84slyGR0Q
   Jlsg/L3rpixXquIGpNQEJgosRpF7dobnmQpHA4QmGzoGtNq72S6NA1GWv
   Q==;
X-CSE-ConnectionGUID: HlDZEMKsTlygnwLlAUp1zg==
X-CSE-MsgGUID: bBLH4vaQT3+rKPHw1WIiHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="87866169"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="87866169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 05:19:40 -0800
X-CSE-ConnectionGUID: oGIVJsMBR9u/dGc028k5zw==
X-CSE-MsgGUID: WOQIM5mbTsis2Rb8rW1ZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189975817"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2025 05:19:39 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJtiC-0006br-1F;
	Fri, 14 Nov 2025 13:19:36 +0000
Date: Fri, 14 Nov 2025 21:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [arm-tegra:for-6.19/syscore 1/1] drivers/iommu/amd/init.c:3505:20:
 error: too few arguments to function call, single argument 'data' was not
 specified
Message-ID: <202511142150.vh7dqU5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-6.19/syscore
head:   19debadfa11b4a51888b07727426a20359879558
commit: 19debadfa11b4a51888b07727426a20359879558 [1/1] syscore: Pass context data to callbacks
config: x86_64-randconfig-004-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142150.vh7dqU5T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511142150.vh7dqU5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511142150.vh7dqU5T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/amd/init.c:3505:20: error: too few arguments to function call, single argument 'data' was not specified
    3505 |         amd_iommu_suspend();
         |         ~~~~~~~~~~~~~~~~~ ^
   drivers/iommu/amd/init.c:3041:12: note: 'amd_iommu_suspend' declared here
    3041 | static int amd_iommu_suspend(void *data)
         |            ^                 ~~~~~~~~~~
   drivers/iommu/amd/init.c:3510:19: error: too few arguments to function call, single argument 'data' was not specified
    3510 |         amd_iommu_resume();
         |         ~~~~~~~~~~~~~~~~ ^
   drivers/iommu/amd/init.c:3027:13: note: 'amd_iommu_resume' declared here
    3027 | static void amd_iommu_resume(void *data)
         |             ^                ~~~~~~~~~~
   2 errors generated.


vim +/data +3505 drivers/iommu/amd/init.c

6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26  3502  
6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26  3503  void amd_iommu_disable(void)
6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26  3504  {
6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26 @3505  	amd_iommu_suspend();
6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26  3506  }
d7f07769753340 arch/x86/kernel/amd_iommu_init.c Joerg Roedel 2010-05-31  3507  

:::::: The code at line 3505 was first introduced by commit
:::::: 6b474b8224cdb473f19e8c925171e608499cc45d iommu/amd: Add initialization routines for AMD interrupt remapping

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

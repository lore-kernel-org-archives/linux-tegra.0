Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3372B79CF
	for <linux-tegra@vger.kernel.org>; Sun, 31 Mar 2024 06:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711868123; cv=none; b=DOG2w4lyzNH+DPopbxH/Ly2LKQI05UTIzaWhBrOup1U65nlsIhindqqh9d06LW24bFoZP1pKLv1zOgf+WEKWTyBIxpWw7ReMbF5Wk5ivHibXxX5TDQjBJNToh6FWHoCRomCDMxhSHQh9oVqPvCjkyudpGRHNGDviUNr3GT0rRdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711868123; c=relaxed/simple;
	bh=iNO8LsVCX2Hkz4wyDhMNUKDJD4dmmgFvrhv6Q3ZQ2Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P0cMzRuqJtUUS7sY9be2CD3lI1u5h9vknfJWya8FfZcpE4jhNiTPUK5AF0n98WOl7dEZCNNwjkUevLQNELUk5kupDR12ZN0N7Qj3BxnG++PN4c8/kBN9Y9jwumw7rBWTSZkVXf4saSIQB1YMjGcbqhGfhfJ1oPkU7b/dqi+EGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHRjVf6/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHRjVf6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711868121; x=1743404121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iNO8LsVCX2Hkz4wyDhMNUKDJD4dmmgFvrhv6Q3ZQ2Fk=;
  b=UHRjVf6/aif+hvMoriNAEDX2lPuPs7h+SpVi+0yE4H9pqURmFE3lmGcD
   Jxv8pIh4iKCU11rq+ewc8SpeUyTsvK7yvTtxwIYRryDVouJJe3R7gnodl
   Tv7KygGUmenQODlDCmTcB4pZcYnErDEniXxjPzhwpSVfcDFBUBPutkVgh
   43lUuRXPZaocMcvGI5cVN45fyT5hjluAbr1EeNdgbvHlr/AhRSqgn9Ae2
   g4qM5pfh+J3CQr5ax7ooo+7soUry9LFpXwr4Ob2A/dUvCRtB4/RzPVznZ
   EzF/+vU/yp1IZtlFNSPI3EjAq4jsTXp1DpaAUUXJwCmORWfzCoIMJUfYW
   Q==;
X-CSE-ConnectionGUID: /vczPjx9SrCpyKauqU8DFg==
X-CSE-MsgGUID: udDGsYqhQvqlNuxZMlehrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="7196368"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="7196368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 23:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="48342218"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2024 23:55:18 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqp64-0000sg-0H;
	Sun, 31 Mar 2024 06:55:16 +0000
Date: Sun, 31 Mar 2024 14:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kartik <kkartik@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-tegra@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: [arm-tegra:for-6.8/soc 9/10]
 drivers/soc/tegra/fuse/fuse-tegra30.c:684:17: error: 'tegra30_fuse_read'
 undeclared here (not in a function); did you mean 'tegra_fuse_readl'?
Message-ID: <202403311414.xn2GkelU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-6.8/soc
head:   f655182f9e9edda559b41a1f8b3b9c944443694a
commit: dee509eb9cd593b7bcb1c1f1f5f2d7e75e389290 [9/10] soc/tegra: fuse: Add support for Tegra241
config: arm64-randconfig-002-20240331 (https://download.01.org/0day-ci/archive/20240331/202403311414.xn2GkelU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311414.xn2GkelU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311414.xn2GkelU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/tegra/fuse/fuse-tegra30.c:684:17: error: 'tegra30_fuse_read' undeclared here (not in a function); did you mean 'tegra_fuse_readl'?
     684 |         .read = tegra30_fuse_read,
         |                 ^~~~~~~~~~~~~~~~~
         |                 tegra_fuse_readl
>> drivers/soc/tegra/fuse/fuse-tegra30.c:694:17: error: 'tegra30_fuse_init' undeclared here (not in a function); did you mean 'tegra_fuse_info'?
     694 |         .init = tegra30_fuse_init,
         |                 ^~~~~~~~~~~~~~~~~
         |                 tegra_fuse_info
   drivers/soc/tegra/fuse/fuse-tegra30.c:698:28: error: 'tegra194_soc_attr_group' undeclared here (not in a function); did you mean 'tegra_soc_attr_group'?
     698 |         .soc_attr_group = &tegra194_soc_attr_group,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                            tegra_soc_attr_group


vim +684 drivers/soc/tegra/fuse/fuse-tegra30.c

   681	
   682	#if defined(CONFIG_ARCH_TEGRA_241_SOC)
   683	static const struct tegra_fuse_info tegra241_fuse_info = {
 > 684		.read = tegra30_fuse_read,
   685		.size = 0x16008,
   686		.spare = 0xcf0,
   687	};
   688	
   689	static const struct nvmem_keepout tegra241_fuse_keepouts[] = {
   690		{ .start = 0xc, .end = 0x1600c }
   691	};
   692	
   693	const struct tegra_fuse_soc tegra241_fuse_soc = {
 > 694		.init = tegra30_fuse_init,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

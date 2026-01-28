Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9612874FE;
	Wed, 28 Jan 2026 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615858; cv=none; b=AycuLSTglpoqAopQXl2rgamqRZE37uctDmazwKfeG5L1dVSTcWxtoKy8gDLkuuNlMe/tlIgh+f5f4TqDzx9rT8FEpKVJXp8ONFDzxt6ptb3aingqP7lfRiYjJC7LlCbdzYS5Gl4FGFGVSpjQy1LVy+MasA4u+y9CTrYhmpBox34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615858; c=relaxed/simple;
	bh=I9Di7H3MuUn01E+66sdDwN0NLusiqDryL3CP5MafZfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAUFDDhJ5/GI6RsO6nwa/QoAmTfkL9cQTuFQj60y2Q6vGcQ/RPhcZfNke8mHDAu9KWBkFFEY37mUgrVGHeh1KBtsPIacMILsv5n5IA+oU8PaCRrTvSu9eI62GNY+o03lresm+vcWEeR9AALHYj6MtOq+HnuEy+VAVUGJTDm62hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fC6pU8ZR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fC6pU8ZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769615857; x=1801151857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I9Di7H3MuUn01E+66sdDwN0NLusiqDryL3CP5MafZfw=;
  b=fC6pU8ZRtS/OpHuiO0h/8tONFyXtu72/STXs99BE1jRc0FeHQxloxqG5
   nDwNGARZB8kPru4L1vrccR47WyTgERLy3wysCraXKQT/LO7rUexYkS0yG
   haw3Vugsi+s7THKmvAuCLMk6X4O76rPPgVC2KWYcNNcrx1gLkJlUqj/p9
   zGgLiyJQS6xf5zLlx9Q/0N9rMx5JSr3uIdByWY6SpZl9wFejdFWMetCXB
   lvS6I1VIW2EHCcesf+7XcbLNMX507G8zx52gC6I/7j4K4XHav8eVp0ydK
   99O1P/2hPIch4ip/JB++aym+G34rrqPdA1I4XPu5yLcrnO+8DTf+7CRI7
   g==;
X-CSE-ConnectionGUID: /LwMFwrLSmeAlpscaiyB1A==
X-CSE-MsgGUID: I8Ow/aE/RRi46lVMeqtNDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81464555"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81464555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:57:37 -0800
X-CSE-ConnectionGUID: mmONyVQtSiqMDeVB079yPw==
X-CSE-MsgGUID: DO7rhtghTFOyjp+X1uisYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207913499"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2026 07:57:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl7v8-00000000a9I-2oGg;
	Wed, 28 Jan 2026 15:57:30 +0000
Date: Wed, 28 Jan 2026 23:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
	suzuki.poulose@arm.com, robin.murphy@arm.com,
	ilkka@os.amperecomputing.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
	vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com,
	skelley@nvidia.com, ywan@nvidia.com, mochs@nvidia.com,
	nirmoyd@nvidia.com, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: [PATCH 4/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
Message-ID: <202601282328.gksG6ks9-lkp@intel.com>
References: <20260126181155.2776097-5-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126181155.2776097-5-bwicaksono@nvidia.com>

Hi Besar,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Besar-Wicaksono/perf-arm_cspmu-nvidia-Rename-doc-to-Tegra241/20260127-021604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260126181155.2776097-5-bwicaksono%40nvidia.com
patch subject: [PATCH 4/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
config: loongarch-randconfig-r051-20260127 (https://download.01.org/0day-ci/archive/20260128/202601282328.gksG6ks9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282328.gksG6ks9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601282328.gksG6ks9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "arm_cspmu_acpi_dev_get" [drivers/perf/arm_cspmu/nvidia_cspmu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

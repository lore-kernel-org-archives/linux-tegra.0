Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8303E36A03A;
	Mon, 23 Mar 2026 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305922; cv=none; b=mstSnVFg4nI2jfudsWwBKKbkLItP+7aARJTQYoZJ0UQt/pwpVu9/H7OxfPrKQanoEOfx89hYwxoyl7tSBkWHCf1x+ZJq/qsaIEIHkHhKIIosn0ynYpni8XyrXLP/H2PyHgwuiYN0LNNpU8OwahhyOTLN+6TLtsCjzB7DaLHeQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305922; c=relaxed/simple;
	bh=HB855h5KUQIUJ49ih92q+X2WC/COaUd5j7Ixy3OTvJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOhGTCSplEr1LQJdyiAFu1+OyDpN2ClPY3VA9bblyJIDvtcOzDd7571H4YW/vW5G2eYI+vphKaS89SjdHlTVny4azY1B6rSxvRzh35zlwaWdE0iYJO3DgpcSFxzz2aUFGzbFDInZwTtlqyQXDeqZyquo6+Ej3g9g7Thad/F3FHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM0Y4z8/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM0Y4z8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774305920; x=1805841920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HB855h5KUQIUJ49ih92q+X2WC/COaUd5j7Ixy3OTvJs=;
  b=aM0Y4z8/bRURhDGPOgT5xQW0pv5u82TzXwX7vfAXF1u5bI6qbO1DASbv
   gD1kjzl2rvNZ4MqF33GrJ/Rj555S8+up61KipvKXyGMhjLs8Fjn0aziDI
   wa3n+wInuRWOf+RQ/+qsqqttN213uIZP3q4AQAULaLR456lvKUghweJmU
   /DUYyBwss+7zDq6DydjUXHtz4X0oS4QF1jW4yq5U6NKTVWqx9FyHMKZiP
   Em0otFBVwwQ6Au34hQSV4OfRY/A6KAXxElPWNd598BUEshVSA9CZzClfZ
   CBrTvgy+QrYcKtYZCal9HqyzSBzDkXZHrvAfR3+EmVAxgXbzIueA/qbzL
   Q==;
X-CSE-ConnectionGUID: InCjfmCVQe6UPl0F360Hmg==
X-CSE-MsgGUID: BbJX6hlWRKGdOwD4v8K/aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86389494"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86389494"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 15:45:20 -0700
X-CSE-ConnectionGUID: NCCFSdcBTmWDAy0PZsSmyg==
X-CSE-MsgGUID: L6Yuv4Y7QTW7rFnfmMzlLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="220860610"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Mar 2026 15:45:18 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4o1L-000000003LR-3L2G;
	Mon, 23 Mar 2026 22:45:15 +0000
Date: Tue, 24 Mar 2026 06:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-tegra@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware/tegra: add COMPILE_TEST
Message-ID: <202603240615.RVT9LSpj-lkp@intel.com>
References: <20260320064503.57620-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320064503.57620-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/firmware-tegra-add-COMPILE_TEST/20260321-064927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20260320064503.57620-1-rosenp%40gmail.com
patch subject: [PATCH] firmware/tegra: add COMPILE_TEST
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260324/202603240615.RVT9LSpj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240615.RVT9LSpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240615.RVT9LSpj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tegra_bpmp_init_clocks
   >>> referenced by bpmp.c
   >>>               drivers/firmware/tegra/bpmp.o:(tegra_bpmp_probe) in archive vmlinux.a
   >>> referenced by bpmp.c
   >>>               drivers/firmware/tegra/bpmp.o:(tegra_bpmp_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

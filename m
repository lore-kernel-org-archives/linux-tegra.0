Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3991628FD;
	Fri,  3 Oct 2025 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759472979; cv=none; b=RZ5yXiCk8Nz6P9WCMLuKFWrH6Gt/IDFdq8VorBP2O3b/keExegw4osPKG5dTn5qwX3Iy+761Ja1C/j51Hdo2AQZLTTmLYSFjNM+tRNfQkPqPGR+sHVBgTGYyrsWqi14nSoQaFsztYfy+IOR4ab6Ii+RJK7uL19FBzyv+ahlQdys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759472979; c=relaxed/simple;
	bh=38C6bj4uQk4Gyei3uzTSRu3fqNu3pxRhzppzFyacgU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LROwgfIRPfZFgjJ3Uk8vcte67MvgbeJk0M7jwsejvqtvOzEqyzzmt7cdniUyjWOJgn0zvmXLTV2adr+nCjeSqJhaC0eJP6XD5I8nMXGaCdMBnMdCBvPGKaVUIXBr7CQqd0oOkwNc4xvJv7WGr4woa2FAH8EfVUXHuvSo9eadHzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4M5dpAF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4M5dpAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759472977; x=1791008977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=38C6bj4uQk4Gyei3uzTSRu3fqNu3pxRhzppzFyacgU8=;
  b=N4M5dpAFLYJJH5cq+MKYuJJzva5RQWSUt2Or28zWTLec+0hzBRn9s2Yu
   tBHeLwOFf65HE/Fmy3EwIJkATkFNdW+6HPgxriweD6IKrxKLjTXLT8kj9
   23SH1yTMSD61SCFRK8VRA7flImB3BZH4tcT2HPXbbasnFwAMKm7/B3Xsn
   MRi4ORWxw2UcgjP+b6L/goLhqI7oH3LnnmwfiayY+ZH1kMc4muZE5AKoM
   mRBw2lp6p96VEyqpzCiZMShn+P/gZQEOFeYT72g7Ra0c/1aVscfQl7gTI
   TsPO2tZXLV2PkCN1DZAeB+Fn35Qvttg8E1oCZSxOP6WfvJrNkDaJABh0h
   Q==;
X-CSE-ConnectionGUID: H89W8fCOTTmrHIk4e4f16A==
X-CSE-MsgGUID: 8MIz9kZeS3C+z+Q8I1DrGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61802320"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="61802320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 23:29:36 -0700
X-CSE-ConnectionGUID: wGF9LlBBTIia2PyQAtwDGw==
X-CSE-MsgGUID: hyrvbglwRJW7LwB0/3oZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="179165404"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2025 23:29:35 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4ZIK-0004NH-29;
	Fri, 03 Oct 2025 06:29:32 +0000
Date: Fri, 3 Oct 2025 14:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, Ketan Patil <ketanp@nvidia.com>
Subject: Re: [PATCH v2 3/4] memory: tegra: Add support for multiple irqs
Message-ID: <202510031456.NUbQMKPs-lkp@intel.com>
References: <20251002090054.1837481-4-ketanp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002090054.1837481-4-ketanp@nvidia.com>

Hi Ketan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on linus/master v6.17 next-20251002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ketan-Patil/memory-tegra-Group-mc-err-related-registers/20251002-171042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20251002090054.1837481-4-ketanp%40nvidia.com
patch subject: [PATCH v2 3/4] memory: tegra: Add support for multiple irqs
config: arm64-randconfig-003-20251003 (https://download.01.org/0day-ci/archive/20251003/202510031456.NUbQMKPs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510031456.NUbQMKPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510031456.NUbQMKPs-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/signal.o: in function `restore_sigframe':
   signal.c:(.text+0x1a28): undefined reference to `restore_gcs_context'
   aarch64-linux-ld: arch/arm64/kernel/signal.o: in function `setup_sigframe':
   signal.c:(.text+0x2574): undefined reference to `preserve_gcs_context'
>> aarch64-linux-ld: drivers/memory/tegra/tegra186.o:(.rodata+0xc8): undefined reference to `tegra30_mc_irq_handlers'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C61F2BAD;
	Mon, 16 Feb 2026 02:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771210280; cv=none; b=m2KXmRIacmVF/B1WYf+lDLuUtIUZazZtg656t4D0azj947xxKNdT2BcRqAwYpV3XTvmfwBbwd3OsXH9cBgfp5aHzUastr5MOKuPU4frTkLJDYQ1yEyFGkeheDlqd49bsIOHJ0THwZNN6mELJymfa110Q8D4PNYTDXWNQ+HxnZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771210280; c=relaxed/simple;
	bh=zECy0mqaOgeJXWyIw7FNUt2iDqlCCCgkdZjUix16Sco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsPHgCtEZ8B6RtC9HLdVlT7Gxb1bGF37ooW9r6LvQjcW+HYvbyqcuWTARlp6DvfEOZlKnHfKRR4DBKUN7tFXWDNkoV6RnD9x+g3W2tIMqem1O+tXt31Ycj17+EsIFflBvLarqJoZhvYcLtuEC5nGZOMlZp8jcHKridyrtT+Tak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0RXg2g5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0RXg2g5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771210278; x=1802746278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zECy0mqaOgeJXWyIw7FNUt2iDqlCCCgkdZjUix16Sco=;
  b=m0RXg2g5/PT3r/5INPAahd97NG/8gLWPNrGi+8vw8jD1f8M9eB8yFc/K
   0XciyfTNmZvTlPVG+rpVTpqq5p7nIaWnyYkRyIzjFVNP9CDQl/tJiugKP
   NVTYg85XzUyu0CHRfOaZsRMUtpH8TBN7n30IFG+4cA2ytDckrHb2h2uBn
   CmSkgY9/s3lHKXpWd1+SAIeWzo9JQJRzvNuCb415zDLsn/n5Txxs7cNA1
   Q+vHKqIUXt/34sKpOeTZLkhN73gaDj1Ga5nwWkD/HLDQt7iyybiaeKQUh
   KqvfGbQFL5E9BZGvUkVt3Ux3D1SqXvwh6srLRNKWSIpXpiRN7UBXR4E7m
   w==;
X-CSE-ConnectionGUID: N9jqwihBSKWSa6vFzb43vQ==
X-CSE-MsgGUID: F6hqXylBRLi8LiqK7czJ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71492823"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="71492823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 18:51:18 -0800
X-CSE-ConnectionGUID: WWng7x6KTdiqC+6q3mL+QA==
X-CSE-MsgGUID: hon0aVVWTh6gERwcALI6KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218015367"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Feb 2026 18:51:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrohd-00000000zL2-3MTH;
	Mon, 16 Feb 2026 02:51:13 +0000
Date: Mon, 16 Feb 2026 10:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Samyak <samyak.bambole07@gmail.com>, marvin24@gmx.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Samyak Bambole <samyak.bambole07@gmail.com>
Subject: Re: [PATCH] staging: nvec: Use kzalloc_obj instead of kzalloc
Message-ID: <202602161056.Elbb21hV-lkp@intel.com>
References: <20260215122913.104064-1-samyak.bambole07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215122913.104064-1-samyak.bambole07@gmail.com>

Hi Samyak,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Samyak/staging-nvec-Use-kzalloc_obj-instead-of-kzalloc/20260215-203130
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260215122913.104064-1-samyak.bambole07%40gmail.com
patch subject: [PATCH] staging: nvec: Use kzalloc_obj instead of kzalloc
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260216/202602161056.Elbb21hV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project afd4df07ab0262482829d4410a6bae9f2809d37b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161056.Elbb21hV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161056.Elbb21hV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/nvec/nvec_ps2.c:105:12: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     105 |         ser_dev = kzalloc_obj(*ser_dev, GFP_KERNEL);
         |                   ^
>> drivers/staging/nvec/nvec_ps2.c:105:10: error: incompatible integer to pointer conversion assigning to 'struct serio *' from 'int' [-Wint-conversion]
     105 |         ser_dev = kzalloc_obj(*ser_dev, GFP_KERNEL);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/kzalloc_obj +105 drivers/staging/nvec/nvec_ps2.c

    99	
   100	static int nvec_mouse_probe(struct platform_device *pdev)
   101	{
   102		struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
   103		struct serio *ser_dev;
   104	
 > 105		ser_dev = kzalloc_obj(*ser_dev, GFP_KERNEL);
   106		if (!ser_dev)
   107			return -ENOMEM;
   108	
   109		ser_dev->id.type = SERIO_8042;
   110		ser_dev->write = ps2_sendcommand;
   111		ser_dev->start = ps2_startstreaming;
   112		ser_dev->stop = ps2_stopstreaming;
   113	
   114		strscpy(ser_dev->name, "nvec mouse", sizeof(ser_dev->name));
   115		strscpy(ser_dev->phys, "nvec", sizeof(ser_dev->phys));
   116	
   117		ps2_dev.ser_dev = ser_dev;
   118		ps2_dev.notifier.notifier_call = nvec_ps2_notifier;
   119		ps2_dev.nvec = nvec;
   120		nvec_register_notifier(nvec, &ps2_dev.notifier, 0);
   121	
   122		serio_register_port(ser_dev);
   123	
   124		return 0;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C33D2FDC5E;
	Mon, 16 Feb 2026 08:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229732; cv=none; b=uSJZbGpZBlok2RIS8/TcDeBUUnv3BsUpQZ2ugHACF1Q4Pj8FLHuvygY4UmQe0SgYlTcac6/2velRY1lyP8cNC10G9eHq4elh/I13BmcJ1tWGYFWDo7+0O00HdizEUv4cw4K4QJEZWHx28SZQuJhF1cIGkh0io3hMhdh5kF9untQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229732; c=relaxed/simple;
	bh=eSazOfn+jYYzuDJ5TSTUuQk3Pi9wLI+fGUmXgUnzD3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTLDtFRB1+GGTwFiGX4QI7PvPIuX91hBs+fZVqnOAwmJMqwHFcbw5AzTv2CKQh4sgni/LomqjmHepp9Ud7I+NexDel9wGRbE1zOX+gfCLXvKmUE9nE3vknn8Reymlf9DRBmR6Wd2JoM0uA0Kl8OMZAk5nqFZwlVFkTXP2XzH5RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZwzheFr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZwzheFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771229730; x=1802765730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eSazOfn+jYYzuDJ5TSTUuQk3Pi9wLI+fGUmXgUnzD3k=;
  b=AZwzheFr1gfz1gdy08vF41qqrcV1VOuCIhv4T0tGQ7GaO+jWOeDw5EvH
   PvEPleSgDdxm2adMOsb60E41D/RabZlpidybuCmEnvzg5Xdv8d08h1goA
   H+V9PH00olcMSd4WY0H+HvHCHCof77GKtDuxYoHdUp+Q8TgT/dilxtwhJ
   MRB+lYsdLFjmjhcO5rjV69QwagNXeykCzdbIpdWhVQAruUBMuanHthq6d
   R6RJKWXzDk4tdGGs2sVFRkoQckdIqueMomnR5LEDEMymF0jpjPES2LprR
   i882YfG+T2dUXtUnAHEcadmSTbOOtnfjPInFFksSKjGTNGFhOJL7VZs1m
   A==;
X-CSE-ConnectionGUID: Dl01AP45QaCRZ1PmUKynqQ==
X-CSE-MsgGUID: VH57sJOOR4aZvggY19NQWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72401944"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72401944"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 00:15:29 -0800
X-CSE-ConnectionGUID: 3XUX+uXOTTGLxHG/6TqWFQ==
X-CSE-MsgGUID: aFYS1FmLQvmnzC2HFpdf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218090968"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Feb 2026 00:15:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrtlN-00000000zU8-0k7b;
	Mon, 16 Feb 2026 08:15:25 +0000
Date: Mon, 16 Feb 2026 16:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Samyak <samyak.bambole07@gmail.com>, marvin24@gmx.de
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Samyak Bambole <samyak.bambole07@gmail.com>
Subject: Re: [PATCH] staging: nvec: Use kzalloc_obj instead of kzalloc
Message-ID: <202602161613.Rka1Yb9E-lkp@intel.com>
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
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260216/202602161613.Rka1Yb9E-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161613.Rka1Yb9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161613.Rka1Yb9E-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/nvec/nvec_ps2.c: In function 'nvec_mouse_probe':
>> drivers/staging/nvec/nvec_ps2.c:105:19: error: implicit declaration of function 'kzalloc_obj'; did you mean 'kzalloc_node'? [-Wimplicit-function-declaration]
     105 |         ser_dev = kzalloc_obj(*ser_dev, GFP_KERNEL);
         |                   ^~~~~~~~~~~
         |                   kzalloc_node
>> drivers/staging/nvec/nvec_ps2.c:105:17: error: assignment to 'struct serio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     105 |         ser_dev = kzalloc_obj(*ser_dev, GFP_KERNEL);
         |                 ^


vim +105 drivers/staging/nvec/nvec_ps2.c

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

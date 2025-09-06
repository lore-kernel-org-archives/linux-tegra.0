Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C7F1A255C;
	Sat,  6 Sep 2025 05:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757137323; cv=none; b=ZBIvoaUres88n68Sfs+LZFonS5r/iEW2Kw/Z1cSt/eRixxQT7CAEJLpMkUOIM9rEk4zLkb5+SmjfLKtbANC0ylRcBwrB+jjHgL8LXPAx0HXiNVtY3fcEkthbxjfxy5P+++rIbpLtsW0n8xrAbeR/pjbpniTVg9ZDYy2ZYa60Z8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757137323; c=relaxed/simple;
	bh=rK0a45cyPDU1+P/ijKgLaA8dHdauWPWjRPDDmwW1Tw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRfCADxei2HuK7WqQ7uvzsSs7z0mHBHFLTq/vik7qcgX0T2JY3Kivv07lR91RXrjVm8q2EYQKzhCurU+CprlyVQQ5MvwIEICLqxOHF3Oen3klKZBLdLVSdkdi5wNxCEAhR+Jhk451Tt3cd4ivL4+sc5hpH+PpYUdQ+3oI0k7qjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCJGlK+J; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCJGlK+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757137322; x=1788673322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rK0a45cyPDU1+P/ijKgLaA8dHdauWPWjRPDDmwW1Tw0=;
  b=PCJGlK+JHrMeG3G9HUNC8XrpOHmlai+haZuZSiZhx0qNd7452keq/1eS
   ERYXo0N39GdJioU40AWdlHcxiudHLcobNdcyMBCVBK0mgTYHmPO5hevMT
   Wqty3q/owcwrCWcXrTgTGyDwTokoMGbMxHyreLG8zTkz0dTxW9FC4OTKl
   YoCp2UvkX+2e6Dsn6AQauHrdLOcmNTAoVOH60iUl8msfdLKtbD9TPc8DN
   lcWtHPvr5zkjFd0PKgPpLJywH+feaEkiZofH7Acl73kOcKb6wUV7CdOuh
   tSDtIZ0K1hoiNFFF3Njw+09aSAUahjmVOu08A90MbKDrQTI2xb7YxLH13
   Q==;
X-CSE-ConnectionGUID: El0dpIWdRMageYdPx5OKNA==
X-CSE-MsgGUID: APIKvlMfQ6uKl/vxBRQAvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70910694"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="70910694"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 22:42:02 -0700
X-CSE-ConnectionGUID: zgFDTCoTRVuvZAD8qs+F1Q==
X-CSE-MsgGUID: UMvaLGJdTWitpbBwnk2U9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="176411187"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2025 22:41:59 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uulgS-0001Ed-2P;
	Sat, 06 Sep 2025 05:41:56 +0000
Date: Sat, 6 Sep 2025 13:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] usb: phy: tegra: use phy type directly
Message-ID: <202509061310.SU5Tf105-lkp@intel.com>
References: <20250904163238.238105-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904163238.238105-2-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[cannot apply to usb/usb-testing usb/usb-next usb/usb-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/usb-phy-tegra-use-phy-type-directly/20250905-003521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250904163238.238105-2-clamor95%40gmail.com
patch subject: [PATCH v1 1/2] usb: phy: tegra: use phy type directly
config: i386-buildonly-randconfig-006-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061310.SU5Tf105-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061310.SU5Tf105-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061310.SU5Tf105-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/phy/phy-tegra-usb.c:874:2: warning: variable 'err' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     874 |         default:
         |         ^~~~~~~
   drivers/usb/phy/phy-tegra-usb.c:878:6: note: uninitialized use occurs here
     878 |         if (err)
         |             ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/usb/phy/phy-tegra-usb.c:860:9: note: initialize the variable 'err' to silence this warning
     860 |         int err;
         |                ^
         |                 = 0
   drivers/usb/phy/phy-tegra-usb.c:905:2: warning: variable 'err' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     905 |         default:
         |         ^~~~~~~
   drivers/usb/phy/phy-tegra-usb.c:909:6: note: uninitialized use occurs here
     909 |         if (err)
         |             ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/usb/phy/phy-tegra-usb.c:891:9: note: initialize the variable 'err' to silence this warning
     891 |         int err;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/err +874 drivers/usb/phy/phy-tegra-usb.c

   857	
   858	static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
   859	{
   860		int err;
   861	
   862		if (phy->powered_on)
   863			return 0;
   864	
   865		switch (phy->phy_type) {
   866		case USBPHY_INTERFACE_MODE_UTMI:
   867			err = utmi_phy_power_on(phy);
   868			break;
   869	
   870		case USBPHY_INTERFACE_MODE_ULPI:
   871			err = ulpi_phy_power_on(phy);
   872			break;
   873	
 > 874		default:
   875			break;
   876		}
   877	
   878		if (err)
   879			return err;
   880	
   881		phy->powered_on = true;
   882	
   883		/* Let PHY settle down */
   884		usleep_range(2000, 2500);
   885	
   886		return 0;
   887	}
   888	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

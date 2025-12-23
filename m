Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B2938DEC;
	Tue, 23 Dec 2025 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766531755; cv=none; b=oWTCLKxa/s5LX58iEwyPYq8EM4uokjv9XOqTouR4kkKRFsd4XTb3R8ApM4doPEQ6tZeS0Dh11AVMz0jJWS4KmVqlpquN2RiuSdq/DO1UUnuiDhuAVrVDa1bEQa/bsvFpFtjgxNNbjQMgnjwp6S3qnzpcDY8U40MKMyWbxEacdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766531755; c=relaxed/simple;
	bh=0mSJkPl/ka32Vr2UFQsN9pJHnFvlWfIgKc/b90M8gAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmzFMCO9lMY5NyEqkO/QjYF1HxXjPixUHFg1+D8QmaKAttrvyXyEHQA1v0OvWInRTeKWaPERGireuLAL6xsMzZFm3R7X8F3ZDUBWNMIE5Kw/G3uWn17hCKt0LcC81Nm5WzNnUxGQOXebT18b+4R9cwaESjoeoI/8rvnQ4TiCAMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhhS6ucb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhhS6ucb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766531754; x=1798067754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0mSJkPl/ka32Vr2UFQsN9pJHnFvlWfIgKc/b90M8gAY=;
  b=WhhS6ucbpcN6NMsVCV62Rlvvj480qWTWQlpqS0DGfEd4gHnt9J3z1mvA
   v4dqP3KYBHeqot2lWZKXg74jDtyqWYBXFNxC2KAwPRJ+c52hduf7pXzI3
   ace+hQG1ZLwU7GLwDhYuJUzj7EECce++dhx2LgCSjvABqq8ChErRVVPz4
   dPFj+WSukBy4t3zznhNQsfhx2FbwxjRNo+ceqZW6RMv/Bgp3IDrcXuZL5
   BWLrTzgi4c85VksEoUD12gPJVOoggOtQP+Vks2Pj88qPG0eQzDb5XV6Lm
   EFj3z5uIOyPNxxH2ycQoVeqKwqqdZPABw1sjlXQ/x9H5Q8aKR3HD5iDPO
   w==;
X-CSE-ConnectionGUID: ITI3oJSvQgCDSet1fed87w==
X-CSE-MsgGUID: 5vnVg1+cQwSt8EVFdOdKpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="55948117"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="55948117"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:15:54 -0800
X-CSE-ConnectionGUID: qdVn1HOuSVSKhRN4YyqiSw==
X-CSE-MsgGUID: nG+foIbFQMeiZMynm5QOvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="230923062"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Dec 2025 15:15:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYBbZ-000000002TJ-08J0;
	Tue, 23 Dec 2025 23:15:49 +0000
Date: Wed, 24 Dec 2025 07:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
Message-ID: <202512240627.LvJwMSta-lkp@intel.com>
References: <20251223094529.7202-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223094529.7202-2-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus staging/staging-testing staging/staging-next staging/staging-linus drm-tegra/drm/tegra/for-next linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/usb-phy-tegra-use-phy-type-directly/20251223-175449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20251223094529.7202-2-clamor95%40gmail.com
patch subject: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251224/202512240627.LvJwMSta-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240627.LvJwMSta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240627.LvJwMSta-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/phy/phy-tegra-usb.c:853:2: warning: variable 'err' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     853 |         default:
         |         ^~~~~~~
   drivers/usb/phy/phy-tegra-usb.c:857:6: note: uninitialized use occurs here
     857 |         if (err)
         |             ^~~
   drivers/usb/phy/phy-tegra-usb.c:839:9: note: initialize the variable 'err' to silence this warning
     839 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +/err +853 drivers/usb/phy/phy-tegra-usb.c

   836	
   837	static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
   838	{
   839		int err;
   840	
   841		if (!phy->powered_on)
   842			return 0;
   843	
   844		switch (phy->phy_type) {
   845		case USBPHY_INTERFACE_MODE_UTMI:
   846			err = utmi_phy_power_off(phy);
   847			break;
   848	
   849		case USBPHY_INTERFACE_MODE_ULPI:
   850			err = ulpi_phy_power_off(phy);
   851			break;
   852	
 > 853		default:
   854			break;
   855		}
   856	
   857		if (err)
   858			return err;
   859	
   860		phy->powered_on = false;
   861	
   862		return 0;
   863	}
   864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

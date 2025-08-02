Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2C7367;
	Sat,  2 Aug 2025 05:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754112699; cv=none; b=C7oWightZfJ9keLSRvLz0l0ynGc89atgujaCFb1LExrZKCONhcRyK+O6ps9xjOcOlr8Xn0pdfX4Gfh4GBSDDt879NsDEWX0eqsigzVJFwQa+48w4Hev69tvFkXxBtTUSIN0kBWDiePWJDLSLPG64nHVcgYSvlbY97RMO2uN4+hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754112699; c=relaxed/simple;
	bh=ZRLdGwSqLnclEoXX/4J/rmkHU+mE/M/nSHHqiMZELEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFTeWi0z2WBuc77kOGNXlGMoW+l8Tdr99xlC0Kss4Am0JV8c4xT5IWTRHJ6nXX1JIdDp4F/TqRiHQ1QoTD2AoxGU/dMoF1VhH1nW9td/YA5Cy59ExW0xRH2lD4RLmMMj5AiHFS4n66X3/KHOaTqM6Gaxpd5b3gDId1un8IY7/r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl2DMW9D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl2DMW9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754112697; x=1785648697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZRLdGwSqLnclEoXX/4J/rmkHU+mE/M/nSHHqiMZELEk=;
  b=Zl2DMW9DjQ5JJehFSx3fv7ypqkKVirCjz3caxU2fuif5HUOJnvPmfBnx
   kcT9NP91mXn1KSGh/wtGgIW1yldbCfACt2+gHw/FUIb9cIfR+Lz/ZDCLp
   +hICCFlYzSkN5S6TvmvkoibuSKAh7ZDI9tEkjSp9yvsxqZNbQUzP5VWH0
   SoQOWeFrxkOm3bmF6rbqkOJNJcY7Y8yk6/IW6DENRVzzun03JP85tseA1
   oaz6sKDq0er2aaS0HSXZ8LT48+jGVbY/4Un0LiRcp8X17gTOWIPQMhnL8
   sTyU64yNHJ0YM1hV75awY2cTjN9I7QHxgy6oz3chbRtgUYH3ggaTM/z32
   g==;
X-CSE-ConnectionGUID: /lh2stC1QlKYhsC47FwXxg==
X-CSE-MsgGUID: VuokqIvySgmDl85PXRZsOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59077185"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59077185"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 22:31:36 -0700
X-CSE-ConnectionGUID: 9lV5Yxb2S8+W5MRccSjssQ==
X-CSE-MsgGUID: j4cU7ZYqSbShgDAsFQAmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169106513"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 22:31:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui4q9-0005C8-0k;
	Sat, 02 Aug 2025 05:31:29 +0000
Date: Sat, 2 Aug 2025 13:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Haotien Hsu <haotienh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Brad Griffis <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	Vedant Deshpande <vedantd@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>,
	Jui Chang Kuo <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>,
	WK Tsai <wtsai@nvidia.com>
Subject: Re: [PATCH 4/4] usb: xhci: tegra: Support USB wakeup function for
 Tegra234
Message-ID: <202508021305.3ENY5oQC-lkp@intel.com>
References: <20250801095748.385437-5-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801095748.385437-5-haotienh@nvidia.com>

Hi Haotien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus tegra/for-next linus/master v6.16 next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotien-Hsu/dt-bindings-usb-Add-wake-up-support-for-Tegra234-XUSB-host-controller/20250801-180040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250801095748.385437-5-haotienh%40nvidia.com
patch subject: [PATCH 4/4] usb: xhci: tegra: Support USB wakeup function for Tegra234
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250802/202508021305.3ENY5oQC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021305.3ENY5oQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021305.3ENY5oQC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-tegra.c:1997:15: warning: unused variable 'i' [-Wunused-variable]
    1997 |         unsigned int i;
         |                      ^
   1 warning generated.


vim +/i +1997 drivers/usb/host/xhci-tegra.c

  1992	
  1993	static void tegra_xusb_remove(struct platform_device *pdev)
  1994	{
  1995		struct tegra_xusb *tegra = platform_get_drvdata(pdev);
  1996		struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> 1997		unsigned int i;
  1998	
  1999		tegra_xusb_deinit_usb_phy(tegra);
  2000	
  2001		pm_runtime_get_sync(&pdev->dev);
  2002		usb_remove_hcd(xhci->shared_hcd);
  2003		usb_put_hcd(xhci->shared_hcd);
  2004		xhci->shared_hcd = NULL;
  2005		usb_remove_hcd(tegra->hcd);
  2006		usb_put_hcd(tegra->hcd);
  2007	
  2008		dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
  2009				  tegra->fw.phys);
  2010	
  2011		if (tegra->padctl_irq)
  2012			pm_runtime_disable(&pdev->dev);
  2013	
  2014		tegra_xusb_dispose_wake(tegra);
  2015	
  2016		pm_runtime_put(&pdev->dev);
  2017	
  2018		tegra_xusb_disable(tegra);
  2019		tegra_xusb_padctl_put(tegra->padctl);
  2020	}
  2021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773A227FB1C;
	Wed, 25 Mar 2026 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406269; cv=none; b=t5pKIz/Or1NHiYhTxY/YFwzz8+5aYDPuUdXCeEeYewgrHJ/wvANMDLrJEpspw/tEzdaucu/Mbh+WyEPPS1ypvpbFgkJDdlj8xIuH7OJ3fZUoJEilbv+KWY9KGGE4lwZuixvKGSOm5ciVW133ESFROhmGbJxuKmkX7iWVIPzk1B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406269; c=relaxed/simple;
	bh=y7oR0qlRGqTwWhoBBY+minKc+cqz/3MynZaKcvk8uPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AedIu2vjyvzGzr4nmxyMmeW79Fl7jMQZamYohrLbgjx+36hTXNv9F2oFKEK+I0ZfXFRRRFedX4Yrv2WNh/JGfZJrnB3IljJFABL2fRB3w8T+SpKE89CzEcw2B+BGveTOCXZAm8K0roJk709wwHZCL/pa1QK6fuN25bsY+r3a9kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJUNF0Q0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJUNF0Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774406267; x=1805942267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y7oR0qlRGqTwWhoBBY+minKc+cqz/3MynZaKcvk8uPY=;
  b=aJUNF0Q0B474qpv4BdTCLTgVMfyOwxHGZqVqZlPcF8q7hSeZl7TrBG3n
   QIbj6fWV9KpIC5C7kvdFYeRunmdg9uGLdg8QcV2JGheaf2B9fHXAzZdEj
   fIW1CZb1uz6mdeGtNNwnSJBR28/pLsU1tIvgcdEYYjgRRMSfxeCSseoXz
   VpKbmqkMmBvEQBzrrNGdRmqECEBK7eXdOmKt8vDzz1KQOCNEr5g5XuAso
   9nnt6xW5bFTT6yZFriGXf33NSxVKgtA5cC7GqhR3oi0UBxHYGtRe8kg0j
   1L9JP328cttGvHoUBR5oaMYzjPPnm1avmGH/mx4p6VvpUKnT4U0INRq1I
   A==;
X-CSE-ConnectionGUID: 5uLnLCfUTFSqMFldkWEMBA==
X-CSE-MsgGUID: ++1ZjNOLRsuHiJCucnVt2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93012421"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="93012421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:37:46 -0700
X-CSE-ConnectionGUID: A0Zb+U/nRtCsULoVvUJ0GA==
X-CSE-MsgGUID: 8yZ7YyEHRH6LPK/HGlB2lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="223742248"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2026 19:37:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5E7o-000000005n7-0EGZ;
	Wed, 25 Mar 2026 02:37:40 +0000
Date: Wed, 25 Mar 2026 10:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kartik Rajput <kkartik@nvidia.com>, thierry.reding@gmail.com,
	jonathanh@nvidia.com, kees@kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] soc/tegra: fuse: Register nvmem lookups at probe
Message-ID: <202603251045.wm2KjZbP-lkp@intel.com>
References: <20260324114242.551939-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324114242.551939-1-kkartik@nvidia.com>

Hi Kartik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on linus/master v7.0-rc5 next-20260324]
[cannot apply to drm-tegra/drm/tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kartik-Rajput/soc-tegra-fuse-Register-nvmem-lookups-at-probe/20260325-020016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20260324114242.551939-1-kkartik%40nvidia.com
patch subject: [PATCH] soc/tegra: fuse: Register nvmem lookups at probe
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260325/202603251045.wm2KjZbP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251045.wm2KjZbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251045.wm2KjZbP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/tegra/fuse/fuse-tegra.c:569:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
     569 |         return err;
         |                ^~~
   drivers/soc/tegra/fuse/fuse-tegra.c:476:9: note: initialize the variable 'err' to silence this warning
     476 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +/err +569 drivers/soc/tegra/fuse/fuse-tegra.c

7e939de1b2bb26 Thierry Reding     2015-04-29  521  
7e939de1b2bb26 Thierry Reding     2015-04-29  522  			default:
7e939de1b2bb26 Thierry Reding     2015-04-29  523  				pr_warn("Unsupported SoC: %02x\n", chip);
7e939de1b2bb26 Thierry Reding     2015-04-29  524  				break;
7e939de1b2bb26 Thierry Reding     2015-04-29  525  			}
7e939de1b2bb26 Thierry Reding     2015-04-29  526  		} else {
7e939de1b2bb26 Thierry Reding     2015-04-29  527  			/*
7e939de1b2bb26 Thierry Reding     2015-04-29  528  			 * At this point we're not running on Tegra, so play
7e939de1b2bb26 Thierry Reding     2015-04-29  529  			 * nice with multi-platform kernels.
7e939de1b2bb26 Thierry Reding     2015-04-29  530  			 */
24fa5af81059af Thierry Reding     2014-07-11  531  			return 0;
7e939de1b2bb26 Thierry Reding     2015-04-29  532  		}
7e939de1b2bb26 Thierry Reding     2015-04-29  533  	} else {
7e939de1b2bb26 Thierry Reding     2015-04-29  534  		/*
7e939de1b2bb26 Thierry Reding     2015-04-29  535  		 * Extract information from the device tree if we've found a
7e939de1b2bb26 Thierry Reding     2015-04-29  536  		 * matching node.
7e939de1b2bb26 Thierry Reding     2015-04-29  537  		 */
7e939de1b2bb26 Thierry Reding     2015-04-29  538  		if (of_address_to_resource(np, 0, &regs) < 0) {
7e939de1b2bb26 Thierry Reding     2015-04-29  539  			pr_err("failed to get FUSE register\n");
7e939de1b2bb26 Thierry Reding     2015-04-29  540  			return -ENXIO;
7e939de1b2bb26 Thierry Reding     2015-04-29  541  		}
24fa5af81059af Thierry Reding     2014-07-11  542  
7e939de1b2bb26 Thierry Reding     2015-04-29  543  		fuse->soc = match->data;
7e939de1b2bb26 Thierry Reding     2015-04-29  544  	}
783c8f4c84451b Peter De Schrijver 2014-06-12  545  
783c8f4c84451b Peter De Schrijver 2014-06-12  546  	np = of_find_matching_node(NULL, car_match);
7e939de1b2bb26 Thierry Reding     2015-04-29  547  	if (np) {
7e939de1b2bb26 Thierry Reding     2015-04-29  548  		void __iomem *base = of_iomap(np, 0);
e941712cccab8a Liang He           2022-06-16  549  		of_node_put(np);
7e939de1b2bb26 Thierry Reding     2015-04-29  550  		if (base) {
7e939de1b2bb26 Thierry Reding     2015-04-29  551  			tegra_enable_fuse_clk(base);
7e939de1b2bb26 Thierry Reding     2015-04-29  552  			iounmap(base);
783c8f4c84451b Peter De Schrijver 2014-06-12  553  		} else {
7e939de1b2bb26 Thierry Reding     2015-04-29  554  			pr_err("failed to map clock registers\n");
7e939de1b2bb26 Thierry Reding     2015-04-29  555  			return -ENXIO;
7e939de1b2bb26 Thierry Reding     2015-04-29  556  		}
7e939de1b2bb26 Thierry Reding     2015-04-29  557  	}
7e939de1b2bb26 Thierry Reding     2015-04-29  558  
4bdc0d676a6431 Christoph Hellwig  2020-01-06  559  	fuse->base = ioremap(regs.start, resource_size(&regs));
7e939de1b2bb26 Thierry Reding     2015-04-29  560  	if (!fuse->base) {
7e939de1b2bb26 Thierry Reding     2015-04-29  561  		pr_err("failed to map FUSE registers\n");
24fa5af81059af Thierry Reding     2014-07-11  562  		return -ENXIO;
783c8f4c84451b Peter De Schrijver 2014-06-12  563  	}
783c8f4c84451b Peter De Schrijver 2014-06-12  564  
7e939de1b2bb26 Thierry Reding     2015-04-29  565  	fuse->soc->init(fuse);
783c8f4c84451b Peter De Schrijver 2014-06-12  566  
13a69354147e0a Kartik             2023-10-17  567  	tegra_fuse_print_sku_info(&tegra_sku_info);
24fa5af81059af Thierry Reding     2014-07-11  568  
71661c1c8c34d1 Kartik             2023-10-17 @569  	return err;
783c8f4c84451b Peter De Schrijver 2014-06-12  570  }
24fa5af81059af Thierry Reding     2014-07-11  571  early_initcall(tegra_init_fuse);
27a0342ac162bf Thierry Reding     2017-08-17  572  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

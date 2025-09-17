Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43EE1B0420;
	Wed, 17 Sep 2025 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758072747; cv=none; b=nzQ942r9qF/8R2w1ul3dYDJ648LTEkoex0hoJXbde0Y2lIwRQ4FZmdFvjz+vXH+nziD8B1cTxI1gPH0jXhjTQRj2sBDwH/P9MRk33DEgqk44NpRhSG14iNj9X8jF/6qHNHTrTOm/zNSQxSS8D1hDQvloXSSf1kCQ/Jfs6M+DWrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758072747; c=relaxed/simple;
	bh=MHYXX+maQt+yNNoV4sySF8Ud1Yazp2UesOEqM/XEqF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKgyk1C742PVrIvaSuSmqaamSn2NswM5AHS+95wX/GOBuykHeIm6W9ael8dS3PW4O/dPferaocLUgP/nD/3JBUSK3TSAUuENoBubERM4m7/BOOqf9d66acdNDLQPC4hm6ebrORs32bOQ3icjsb2Hjt1t8pjFhDUJOzz27OOJzaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZDx9sit; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZDx9sit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758072746; x=1789608746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MHYXX+maQt+yNNoV4sySF8Ud1Yazp2UesOEqM/XEqF0=;
  b=AZDx9sitCjXiJFSauADRbJhGsldsI2wkGgStkoO/2kg09pVj42FuuBwL
   pu2nz83quUfJkYqtAHhHYvawUTAc7ngJ7mFXGNQYgxWpQwZtsePHES5dF
   bWSfB1lv7IkpzwOGLG9VS5cRgm5zbuOfphr3k2gzhuPQiIUHjqLOO1yJd
   tUyCzNyxR5cOw07i3mtoRKVKXloFzvHZ1q8drqe0kEDwBf80uhVmZRHMP
   ZumW8du7v2MU4vxrguA1GLQPpajt+m26gFcvW6MuI/3ZhS9Yki9CXg0Hv
   y2vwlTym7XOSPnq2dH2HLcyAfYLQuhUAaXG7UwhuvaN2HX6o3GNKD65+J
   w==;
X-CSE-ConnectionGUID: vaYAqPZfRQy5Us5ghIhPbQ==
X-CSE-MsgGUID: uoOLg1cyTtehzhpITHm6BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60285237"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60285237"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:32:25 -0700
X-CSE-ConnectionGUID: 4dTkLNgKQ5KKnjFMkNa9cQ==
X-CSE-MsgGUID: CqnzzZMPSoiNjt9v7wy2uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="175534829"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2025 18:32:22 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyh1w-0000wh-2U;
	Wed, 17 Sep 2025 01:32:20 +0000
Date: Wed, 17 Sep 2025 09:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Ketan Patil <ketanp@nvidia.com>
Subject: Re: [PATCH 4/4] memory: tegra: Add MC error logging support for
 Tegra264
Message-ID: <202509170901.kyczSOdx-lkp@intel.com>
References: <20250916051754.39250-5-ketanp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916051754.39250-5-ketanp@nvidia.com>

Hi Ketan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on krzk-mem-ctrl/for-next linus/master v6.17-rc6 next-20250916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ketan-Patil/memory-tegra-Group-mc-err-related-registers/20250916-132118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250916051754.39250-5-ketanp%40nvidia.com
patch subject: [PATCH 4/4] memory: tegra: Add MC error logging support for Tegra264
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250917/202509170901.kyczSOdx-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170901.kyczSOdx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170901.kyczSOdx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/tegra/tegra264.c:406:3: warning: variable 'addr_reg' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     406 |                 default:
         |                 ^~~~~~~
   drivers/memory/tegra/tegra264.c:424:39: note: uninitialized use occurs here
     424 |                 addr_val = mc_ch_readl(mc, channel, addr_reg);
         |                                                     ^~~~~~~~
   drivers/memory/tegra/tegra264.c:332:44: note: initialize the variable 'addr_reg' to silence this warning
     332 |                 u32 status_reg, status1_reg = 0, addr_reg, addr_hi_reg = 0;
         |                                                          ^
         |                                                           = 0
>> drivers/memory/tegra/tegra264.c:406:3: warning: variable 'status_reg' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     406 |                 default:
         |                 ^~~~~~~
   drivers/memory/tegra/tegra264.c:411:36: note: uninitialized use occurs here
     411 |                 value = mc_ch_readl(mc, channel, status_reg);
         |                                                  ^~~~~~~~~~
   drivers/memory/tegra/tegra264.c:332:17: note: initialize the variable 'status_reg' to silence this warning
     332 |                 u32 status_reg, status1_reg = 0, addr_reg, addr_hi_reg = 0;
         |                               ^
         |                                = 0
   2 warnings generated.


vim +/addr_reg +406 drivers/memory/tegra/tegra264.c

   324	
   325	static void mcf_log_fault(struct tegra_mc *mc, u32 channel, unsigned long mcf_ch_intstatus)
   326	{
   327		unsigned int bit;
   328	
   329		for_each_set_bit(bit, &mcf_ch_intstatus, 32) {
   330			const char *error = tegra264_mc_status_names[bit] ?: "unknown";
   331			u32 intmask = BIT(bit);
   332			u32 status_reg, status1_reg = 0, addr_reg, addr_hi_reg = 0;
   333			u32 addr_val, value, client_id, i, addr_hi_shift = 0, addr_hi_mask = 0, status1;
   334			const char *direction, *secure;
   335			const char *client = "unknown", *desc = "NA";
   336			phys_addr_t addr = 0;
   337			bool is_gsc = false, err_type_valid = false, err_rt_type_valid = false;
   338			u8 type;
   339			u32 mc_rw_bit = MC_ERR_STATUS_RW, mc_sec_bit = MC_ERR_STATUS_SECURITY;
   340	
   341			switch (intmask) {
   342			case MC_INT_DECERR_EMEM:
   343				status_reg = mc->soc->mc_regs->mc_err_status;
   344				addr_reg = mc->soc->mc_regs->mc_err_add;
   345				addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
   346				err_type_valid = true;
   347				break;
   348	
   349			case MC_INT_SECURITY_VIOLATION:
   350				status_reg = mc->soc->mc_regs->mc_err_status;
   351				addr_reg = mc->soc->mc_regs->mc_err_add;
   352				addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
   353				err_type_valid = true;
   354				break;
   355	
   356			case MC_INT_DECERR_VPR:
   357				status_reg = mc->soc->mc_regs->mc_err_vpr_status;
   358				addr_reg = mc->soc->mc_regs->mc_err_vpr_add;
   359				addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
   360				addr_hi_mask = mc->soc->mc_addr_hi_mask;
   361				break;
   362	
   363			case MC_INT_SECERR_SEC:
   364				status_reg = mc->soc->mc_regs->mc_err_sec_status;
   365				addr_reg = mc->soc->mc_regs->mc_err_sec_add;
   366				addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
   367				addr_hi_mask = mc->soc->mc_addr_hi_mask;
   368				break;
   369	
   370			case MC_INT_DECERR_MTS:
   371				status_reg = mc->soc->mc_regs->mc_err_mts_status;
   372				addr_reg = mc->soc->mc_regs->mc_err_mts_add;
   373				addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
   374				addr_hi_mask = mc->soc->mc_addr_hi_mask;
   375				break;
   376	
   377			case MC_INT_DECERR_GENERALIZED_CARVEOUT:
   378				status_reg = mc->soc->mc_regs->mc_err_gen_co_status;
   379				status1_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0;
   380				addr_reg = mc->soc->mc_regs->mc_err_gen_co_add;
   381				addr_hi_shift = MC_ERR_STATUS_GSC_ADR_HI_SHIFT;
   382				addr_hi_mask = MC_ERR_STATUS_GSC_ADR_HI_MASK;
   383				is_gsc = true;
   384				break;
   385	
   386			case MC_INT_DECERR_ROUTE_SANITY:
   387				status_reg = mc->soc->mc_regs->mc_err_route_status;
   388				addr_reg = mc->soc->mc_regs->mc_err_route_add;
   389				addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
   390				addr_hi_mask = mc->soc->mc_addr_hi_mask;
   391				mc_sec_bit = MC_ERR_ROUTE_SANITY_SEC;
   392				mc_rw_bit = MC_ERR_ROUTE_SANITY_RW;
   393				err_rt_type_valid = true;
   394				break;
   395	
   396			case MC_INT_DECERR_ROUTE_SANITY_GIC_MSI:
   397				status_reg = mc->soc->mc_regs->mc_err_route_status;
   398				addr_reg = mc->soc->mc_regs->mc_err_route_add;
   399				addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
   400				addr_hi_mask = mc->soc->mc_addr_hi_mask;
   401				mc_sec_bit = MC_ERR_ROUTE_SANITY_SEC;
   402				mc_rw_bit = MC_ERR_ROUTE_SANITY_RW;
   403				err_rt_type_valid = true;
   404				break;
   405	
 > 406			default:
   407				dev_err_ratelimited(mc->dev, "Incorrect MC interrupt mask\n");
   408				break;
   409			}
   410	
   411			value = mc_ch_readl(mc, channel, status_reg);
   412			if (addr_hi_reg) {
   413				addr = mc_ch_readl(mc, channel, addr_hi_reg);
   414			} else {
   415				if (!is_gsc) {
   416					addr = ((value >> addr_hi_shift) & addr_hi_mask);
   417				} else {
   418					status1 = mc_ch_readl(mc, channel, status1_reg);
   419					addr = ((status1 >> addr_hi_shift) & addr_hi_mask);
   420				}
   421			}
   422	
   423			addr <<= 32;
   424			addr_val = mc_ch_readl(mc, channel, addr_reg);
   425			addr |= addr_val;
   426	
   427			if (value & mc_rw_bit)
   428				direction = "write";
   429			else
   430				direction = "read";
   431	
   432			if (value & mc_sec_bit)
   433				secure = "secure";
   434			else
   435				secure = "non-secure";
   436	
   437			client_id = value & mc->soc->client_id_mask;
   438			for (i = 0; i < mc->soc->num_clients; i++) {
   439				if (mc->soc->clients[i].id == client_id) {
   440					client = mc->soc->clients[i].name;
   441					break;
   442				}
   443			}
   444	
   445			if (err_type_valid) {
   446				type = (value & mc->soc->mc_err_status_type_mask) >>
   447						MC_ERR_STATUS_TYPE_SHIFT;
   448				desc = tegra264_mc_error_names[type];
   449			} else if (err_rt_type_valid) {
   450				type = (value & MC_ERR_STATUS_RT_TYPE_MASK) >>
   451					MC_ERR_STATUS_RT_TYPE_SHIFT;
   452				desc = tegra_rt_error_names[type];
   453			}
   454	
   455			dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n",
   456					    client, secure, direction, &addr, error, desc);
   457			if (is_gsc) {
   458				dev_err_ratelimited(mc->dev, "gsc_apr_id=%u gsc_co_apr_id=%u\n",
   459						    ((status1 >> ERR_GENERALIZED_APERTURE_ID_SHIFT)
   460						    & ERR_GENERALIZED_APERTURE_ID_MASK),
   461						    ((status1 >> ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT)
   462						    & ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK));
   463			}
   464		}
   465	
   466		/* clear interrupts */
   467		mc_ch_writel(mc, channel, mcf_ch_intstatus, MCF_INTSTATUS_0);
   468	}
   469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

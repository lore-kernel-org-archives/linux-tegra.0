Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A71C3F36;
	Wed, 28 Jan 2026 00:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560869; cv=none; b=Vjppcq+cC9pw/VnY6LPuRwybn2lgLbRxzYOSx3p9ZR8nucqEdAM7pYqPDKkfH9ZuZ86hxjMNOg6Lr++kVGSxeXShV0KJAHxpqoGLW7XPDhfYwLfD3MKin83CZifP7NFladlmP0ToPO7yNS+2AxlMuBB1L9NxQNe359s68Yied84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560869; c=relaxed/simple;
	bh=F1hjRhBOra8vHz9mxEh6/+idCt9uw5kEgQhPi64Um4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQYBJMJtSYocsqsTi1VOWzDnJt0OG9hVglQ2MGYQFt3BwZQK2iA6nO+cX6SOi4RhuizP2wR6zaHYBRnl/Q9xeSekFWteRGlx328WE1JdHHG5/M2Yk7H9PtjStIIcqRbVhGnxOohDFVV8nHCCoSvQo0Gbl/7tXaznIe2ov4NwvWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bk3WyMCf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bk3WyMCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769560867; x=1801096867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F1hjRhBOra8vHz9mxEh6/+idCt9uw5kEgQhPi64Um4U=;
  b=Bk3WyMCfT99T0WMbPtW5Wd3KYCeMoee1Pb55o6/W1lwtRp8PzLDkP/zq
   RNgo0KH+gdXwOCr5pHBVqtQU28+X+GlBevV41E3+2Pnv9pWGYlrUnMKVX
   0AP0g29VXHTG2VnRUrpGD6We+Gxv6uQbGvki1CKY4svisNeVDbYRq5mri
   +p3ljiajT/Y2MtRBcFvIIWYjgG7hiHQwFNQJJydv+Sm4oVmxTVeYPgJQa
   slCAA8PX0mOopenKK1icJm4jnhhCfjSdEBHc+/XtD8dEFDn7RUTj8Co6T
   JcULqZpwRBRiA+NNvmft/iKEcDgpfgV4gV8K/VicO/d6RNz00RnArggaK
   A==;
X-CSE-ConnectionGUID: YE7AG3/CRQyzUo8CetnruQ==
X-CSE-MsgGUID: 0Bz7qgFzRzS/yW/t1jov7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88346466"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="88346466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 16:41:06 -0800
X-CSE-ConnectionGUID: lweno+ItRjKplL0UF2+bfw==
X-CSE-MsgGUID: u+He1W/rTNWSketWGfP4kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208576043"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jan 2026 16:41:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vktcB-00000000Z4K-3dje;
	Wed, 28 Jan 2026 00:40:59 +0000
Date: Wed, 28 Jan 2026 08:40:26 +0800
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
Subject: Re: [PATCH 6/8] perf: add NVIDIA Tegra410 CPU Memory Latency PMU
Message-ID: <202601280830.2IJaaITg-lkp@intel.com>
References: <20260126181155.2776097-7-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126181155.2776097-7-bwicaksono@nvidia.com>

Hi Besar,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Besar-Wicaksono/perf-arm_cspmu-nvidia-Rename-doc-to-Tegra241/20260127-021604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260126181155.2776097-7-bwicaksono%40nvidia.com
patch subject: [PATCH 6/8] perf: add NVIDIA Tegra410 CPU Memory Latency PMU
config: arm64-randconfig-r113-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280830.2IJaaITg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280830.2IJaaITg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280830.2IJaaITg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/nvidia_t410_cmem_latency_pmu.c:604:12: error: call to undeclared function 'acpi_device_uid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     604 |         uid_str = acpi_device_uid(acpi_dev);
         |                   ^
   drivers/perf/nvidia_t410_cmem_latency_pmu.c:604:12: note: did you mean 'cpu_device_up'?
   include/linux/cpu.h:119:5: note: 'cpu_device_up' declared here
     119 | int cpu_device_up(struct device *dev);
         |     ^
>> drivers/perf/nvidia_t410_cmem_latency_pmu.c:604:10: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
     604 |         uid_str = acpi_device_uid(acpi_dev);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/nvidia_t410_cmem_latency_pmu.c:619:29: error: call to undeclared function 'acpi_device_hid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     619 |         cmem_lat_pmu->identifier = acpi_device_hid(acpi_dev);
         |                                    ^
>> drivers/perf/nvidia_t410_cmem_latency_pmu.c:619:27: error: incompatible integer to pointer conversion assigning to 'const char *' from 'int' [-Wint-conversion]
     619 |         cmem_lat_pmu->identifier = acpi_device_hid(acpi_dev);
         |                                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/acpi_device_uid +604 drivers/perf/nvidia_t410_cmem_latency_pmu.c

   590	
   591	static int cmem_lat_pmu_probe(struct platform_device *pdev)
   592	{
   593		struct device *dev = &pdev->dev;
   594		struct acpi_device *acpi_dev;
   595		struct cmem_lat_pmu *cmem_lat_pmu;
   596		char *name, *uid_str;
   597		int ret, i;
   598		u32 socket;
   599	
   600		acpi_dev = ACPI_COMPANION(dev);
   601		if (!acpi_dev)
   602			return -ENODEV;
   603	
 > 604		uid_str = acpi_device_uid(acpi_dev);
   605		if (!uid_str)
   606			return -ENODEV;
   607	
   608		ret = kstrtou32(uid_str, 0, &socket);
   609		if (ret)
   610			return ret;
   611	
   612		cmem_lat_pmu = devm_kzalloc(dev, sizeof(*cmem_lat_pmu), GFP_KERNEL);
   613		name = devm_kasprintf(dev, GFP_KERNEL, "nvidia_cmem_latency_pmu_%u", socket);
   614		if (!cmem_lat_pmu || !name)
   615			return -ENOMEM;
   616	
   617		cmem_lat_pmu->dev = dev;
   618		cmem_lat_pmu->name = name;
 > 619		cmem_lat_pmu->identifier = acpi_device_hid(acpi_dev);
   620		platform_set_drvdata(pdev, cmem_lat_pmu);
   621	
   622		cmem_lat_pmu->pmu = (struct pmu) {
   623			.parent		= &pdev->dev,
   624			.task_ctx_nr	= perf_invalid_context,
   625			.pmu_enable	= cmem_lat_pmu_enable,
   626			.pmu_disable	= cmem_lat_pmu_disable,
   627			.event_init	= cmem_lat_pmu_event_init,
   628			.add		= cmem_lat_pmu_add,
   629			.del		= cmem_lat_pmu_del,
   630			.start		= cmem_lat_pmu_start,
   631			.stop		= cmem_lat_pmu_stop,
   632			.read		= cmem_lat_pmu_read,
   633			.attr_groups	= cmem_lat_pmu_attr_groups,
   634			.capabilities	= PERF_PMU_CAP_NO_EXCLUDE |
   635						PERF_PMU_CAP_NO_INTERRUPT,
   636		};
   637	
   638		/* Map the address of all the instances plus one for the broadcast. */
   639		for (i = 0; i < NUM_INSTANCES + 1; i++) {
   640			cmem_lat_pmu->base[i] = devm_platform_ioremap_resource(pdev, i);
   641			if (IS_ERR(cmem_lat_pmu->base[i])) {
   642				dev_err(dev, "Failed map address for instance %d\n", i);
   643				return PTR_ERR(cmem_lat_pmu->base[i]);
   644			}
   645		}
   646	
   647		ret = cmem_lat_pmu_get_cpus(cmem_lat_pmu, socket);
   648		if (ret)
   649			return ret;
   650	
   651		ret = cpuhp_state_add_instance(cmem_lat_pmu_cpuhp_state,
   652					       &cmem_lat_pmu->node);
   653		if (ret) {
   654			dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
   655			return ret;
   656		}
   657	
   658		cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_ENABLE);
   659		cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_CLR);
   660		cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_DISABLE);
   661	
   662		ret = perf_pmu_register(&cmem_lat_pmu->pmu, name, -1);
   663		if (ret) {
   664			dev_err(&pdev->dev, "Failed to register PMU: %d\n", ret);
   665			cpuhp_state_remove_instance(cmem_lat_pmu_cpuhp_state,
   666						    &cmem_lat_pmu->node);
   667			return ret;
   668		}
   669	
   670		dev_dbg(&pdev->dev, "Registered %s PMU\n", name);
   671	
   672		return 0;
   673	}
   674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C271C5F13
	for <linux-tegra@vger.kernel.org>; Sat, 12 Sep 2026 02:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789181417; cv=none; b=byv9wmwMNW4+lPXo2RnfP4/h02wKzUUki0NN0K3MV70F98XvDKo7ij4lgh3p1B5GfEOWEJ/DozrKpWQP6DFLCF2SXq8++MhyZknrXuiMCkCWkYEmPVFxZfRjCSaBA/z7YDeIDiRy4XCBcwZRjlypDL0ezmMwojCGtrQt8LHjHaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789181417; c=relaxed/simple;
	bh=TJ7n8YXadaOT6sFWZesUg7fEEQm/g7AiRrUqWz6FGJo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YncAcxUH6Rm0ut0ALdHmX1HVJEcyIXDXhNXEdWj1H0x2g6LGp3rhVWTlQzs0nD7tTmjOrll+krqBd2o/Ypj+mLdqbF1X0INEo4lPG84DaDF5U5XrBgbGsBkndtPcw0i8s/rRnQ9a9EC7NlfimZ++65rPlLTrjBtR8gsIXUgj8ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRnFS47K; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRnFS47K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789181416; x=1820717416;
  h=date:from:to:cc:subject:message-id;
  bh=TJ7n8YXadaOT6sFWZesUg7fEEQm/g7AiRrUqWz6FGJo=;
  b=dRnFS47Klm0In+r3vdS+HtvXFWjztwIJ7vwU3urF0hwrEX+fqlgApRKI
   JspByi7+RdeIE6OGDgvFo58NNSpMX0jkDEkhEpGHa1kSFZGR1dOj6f0GB
   D9qCZFMbsDH4lsqLd3sOvd/CPV6XmKcGMsLhz0YBTLazoACneLnhpCrms
   gpkEUM23rVa4eiF29RFJnlfcgMnDkbfqjeWHJn0E8/9iZLA9wNTkaV3aE
   gnlmtWHcpRLDRKLUrSJ0QcXiRwMqZ+QEkNPNZXEVnrzExGOsLPO+TDvOH
   tANSmAiRRQ9VaQTqdGFIKokYzaEvqGllCFZYK9kdHB7dXvhNMvUNU02Hm
   g==;
X-CSE-ConnectionGUID: o8qfhNPzTD2bLERn7MsBCQ==
X-CSE-MsgGUID: 1mwPCBhZSY60+8BF6fsGRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="153600"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="153600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 19:50:16 -0700
X-CSE-ConnectionGUID: 8bkjdQKcT+aCDnSSUILTxw==
X-CSE-MsgGUID: awgUOx4bRrCNO0nnKtO4lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="301983465"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Sep 2026 19:50:13 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Doh-000000002YR-2UAr;
	Sat, 12 Sep 2026 02:50:11 +0000
Date: Sat, 12 Sep 2026 10:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: [arm-tegra:for-7.4/arm64/dt 11/19] FATAL ERROR: Syntax error
 parsing input tree
Message-ID: <202609121029.dp1VVdPq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-7.4/arm64/dt
head:   1a4541cb8471164e3992dc4b08814409d6cdc582
commit: f111ca03fcb3e5d397cc3ea095bebb93a589b742 [11/19] arm64: tegra: Clean up AHUB on Tegra264
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260912/202609121029.dp1VVdPq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121029.dp1VVdPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121029.dp1VVdPq-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/arm64/boot/dts/nvidia/tegra264.dtsi:1587.23-25 Unexpected 'x0'
>> FATAL ERROR: Syntax error parsing input tree

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

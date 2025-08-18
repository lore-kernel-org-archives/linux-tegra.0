Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAFC258EF3;
	Mon, 18 Aug 2025 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524623; cv=none; b=B10NHK2wysFL9nGMMBdsY5q+ub/3OJ0pG5DODiR13zomyjin/6o9A9teA+v9d3+VZNNjtHWn0WlYxsdF5SH2BwTRVAvEiV0JeM65U3PlBiwTBCe/dz2XA1EJy8+BnC1MP5NQ5JUs30cG1NFep4XQR8Z0vclv1QJnM+1Z+zf5ZME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524623; c=relaxed/simple;
	bh=YlUI847c1ljwtyOmYzO2xGlFoqndiw/0Vuz7F4sMuF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbplrE3qFTfnelFmSSDdzgfeCNIIhKDXqBoAYNaLWhvKrAP1R5x6kugW3V/S85Z0zMtewcffAIV+gFjWvnxyUzCXskixRxualhwF5jqcZLE6oIHh1GgjIO7+jv7cRfH9tkCUtHXpHI/kA+xp+STU1qP5Jk/DDYHfpLqyg0Gqlr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiRnEJ7G; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiRnEJ7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755524620; x=1787060620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YlUI847c1ljwtyOmYzO2xGlFoqndiw/0Vuz7F4sMuF0=;
  b=kiRnEJ7GyD7kWtc1yk4MKe2vO/J96pcyOd0ff/FuE6QyDrPTZqEK5Ssf
   r/fq3HqQ+QPT8Ap+puEs1jD8zizuVKIk1ieMmURm7Ht2forbW6fAS+XY6
   7XInuvBUQWiocAciSmgFPqxGV8NgqQVhQRNy+8lyCsWdv6BHbs3N7U04f
   M8qCQldziUm7ybYLAGycRl8pUWgXGiF4zj4zunMdMLWX1laYbQvQCFepR
   p6HXHPFvtg7tq/1G/8eMAktNNQTcLe19mf0ldK9MJBpekBIOZSbhxe8PC
   RrttoYlv7vWOW3oxlTJudR+KGN+JwQqgcsh/qtHnINchkqeOrWCR6zgXF
   Q==;
X-CSE-ConnectionGUID: cfHJmN64ScC0SwISNa4urw==
X-CSE-MsgGUID: 6fjeJL2TQY6uGx6XBrSKZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57894527"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57894527"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 06:43:40 -0700
X-CSE-ConnectionGUID: ZjwLrrQUQ7ahWNTixEZUeA==
X-CSE-MsgGUID: 42Pg1+28S1+iQUxNyHZgCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171814469"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 06:43:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo098-000F55-3A;
	Mon, 18 Aug 2025 13:43:34 +0000
Date: Mon, 18 Aug 2025 21:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>, marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mohammed Guermoud <mohammed.guermoud@gmail.com>
Subject: Re: [PATCH] staging: nvec: Silence unused argument warning in
 NVEC_PHD macro
Message-ID: <202508182005.4PiKxXcN-lkp@intel.com>
References: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817192425.12983-1-mohammed.guermoud@gmail.com>

Hi Mohammed,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammed-Guermoud/staging-nvec-Silence-unused-argument-warning-in-NVEC_PHD-macro/20250818-032647
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250817192425.12983-1-mohammed.guermoud%40gmail.com
patch subject: [PATCH] staging: nvec: Silence unused argument warning in NVEC_PHD macro
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250818/202508182005.4PiKxXcN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508182005.4PiKxXcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508182005.4PiKxXcN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/nvec/nvec_ps2.c:80:51: error: invalid operands to binary expression ('void' and 'int')
      80 |                         NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/staging/nvec/nvec_ps2.c:31:66: note: expanded from macro 'NVEC_PHD'
      31 | #define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)
         |                                                            ~~~~~~^~~
   drivers/staging/nvec/nvec_ps2.c:84:52: error: invalid operands to binary expression ('void' and 'int')
      84 |                         NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/staging/nvec/nvec_ps2.c:31:66: note: expanded from macro 'NVEC_PHD'
      31 | #define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)
         |                                                            ~~~~~~^~~
   2 errors generated.


vim +80 drivers/staging/nvec/nvec_ps2.c

32890b98308613 Marc Dietrich       2011-05-19  62  
32890b98308613 Marc Dietrich       2011-05-19  63  static int nvec_ps2_notifier(struct notifier_block *nb,
32890b98308613 Marc Dietrich       2011-05-19  64  			     unsigned long event_type, void *data)
32890b98308613 Marc Dietrich       2011-05-19  65  {
32890b98308613 Marc Dietrich       2011-05-19  66  	int i;
0df8f51eed5067 Ben Marsh           2016-03-10  67  	unsigned char *msg = data;
32890b98308613 Marc Dietrich       2011-05-19  68  
32890b98308613 Marc Dietrich       2011-05-19  69  	switch (event_type) {
32890b98308613 Marc Dietrich       2011-05-19  70  	case NVEC_PS2_EVT:
1e46e6273bc62d Julian Andres Klode 2011-09-27  71  		for (i = 0; i < msg[1]; i++)
1e46e6273bc62d Julian Andres Klode 2011-09-27  72  			serio_interrupt(ps2_dev.ser_dev, msg[2 + i], 0);
0eedab704ed93d Marc Dietrich       2011-12-26  73  		NVEC_PHD("ps/2 mouse event: ", &msg[2], msg[1]);
32890b98308613 Marc Dietrich       2011-05-19  74  		return NOTIFY_STOP;
32890b98308613 Marc Dietrich       2011-05-19  75  
32890b98308613 Marc Dietrich       2011-05-19  76  	case NVEC_PS2:
0eedab704ed93d Marc Dietrich       2011-12-26  77  		if (msg[2] == 1) {
32890b98308613 Marc Dietrich       2011-05-19  78  			for (i = 0; i < (msg[1] - 2); i++)
32890b98308613 Marc Dietrich       2011-05-19  79  				serio_interrupt(ps2_dev.ser_dev, msg[i + 4], 0);
0eedab704ed93d Marc Dietrich       2011-12-26 @80  			NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
32890b98308613 Marc Dietrich       2011-05-19  81  		}
32890b98308613 Marc Dietrich       2011-05-19  82  
0eedab704ed93d Marc Dietrich       2011-12-26  83  		else if (msg[1] != 2) /* !ack */
0eedab704ed93d Marc Dietrich       2011-12-26  84  			NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);
32890b98308613 Marc Dietrich       2011-05-19  85  		return NOTIFY_STOP;
32890b98308613 Marc Dietrich       2011-05-19  86  	}
32890b98308613 Marc Dietrich       2011-05-19  87  
32890b98308613 Marc Dietrich       2011-05-19  88  	return NOTIFY_DONE;
32890b98308613 Marc Dietrich       2011-05-19  89  }
32890b98308613 Marc Dietrich       2011-05-19  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

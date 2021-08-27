Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4E7C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 03:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F24736023B
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 03:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243968AbhH0DBx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 26 Aug 2021 23:01:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:57709 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232197AbhH0DBx (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Aug 2021 23:01:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="214758336"
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; 
   d="gz'50?scan'50,208,50";a="214758336"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 20:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; 
   d="gz'50?scan'50,208,50";a="495500947"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Aug 2021 20:01:00 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mJS71-0001tV-82; Fri, 27 Aug 2021 03:00:59 +0000
Date:   Fri, 27 Aug 2021 11:00:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 1/8] opp: Add dev_pm_opp_from_clk_rate()
Message-ID: <202108271017.x8lwmthh-lkp@intel.com>
References: <20210827013415.24027-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <20210827013415.24027-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on pm/linux-next]
[also build test ERROR on tegra-drm/drm/tegra/for-next linus/master v5.14-rc7 next-20210826]
[cannot apply to tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/NVIDIA-Tegra-power-management-patches-for-5-16/20210827-093936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/11cffc90b58c476a1beca3ab35ff397d7363498d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/NVIDIA-Tegra-power-management-patches-for-5-16/20210827-093936
        git checkout 11cffc90b58c476a1beca3ab35ff397d7363498d
        # save the attached .config to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
>> include/linux/compiler_types.h:149:16: error: expected '{' before 'inline'
     149 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^~~~~~
   include/linux/pm_opp.h:438:15: note: in expansion of macro 'inline'
     438 | static struct inline dev_pm_opp *dev_pm_opp_from_clk_rate(struct device *dev)
         |               ^~~~~~
>> include/linux/compiler_types.h:149:16: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     149 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^~~~~~
   include/linux/pm_opp.h:438:15: note: in expansion of macro 'inline'
     438 | static struct inline dev_pm_opp *dev_pm_opp_from_clk_rate(struct device *dev)
         |               ^~~~~~


vim +149 include/linux/compiler_types.h

71391bdd2e9aab Xiaozhou Liu    2018-12-14  141  
71391bdd2e9aab Xiaozhou Liu    2018-12-14  142  /*
71391bdd2e9aab Xiaozhou Liu    2018-12-14  143   * Prefer gnu_inline, so that extern inline functions do not emit an
71391bdd2e9aab Xiaozhou Liu    2018-12-14  144   * externally visible function. This makes extern inline behave as per gnu89
71391bdd2e9aab Xiaozhou Liu    2018-12-14  145   * semantics rather than c99. This prevents multiple symbol definition errors
71391bdd2e9aab Xiaozhou Liu    2018-12-14  146   * of extern inline functions at link time.
71391bdd2e9aab Xiaozhou Liu    2018-12-14  147   * A lot of inline functions can cause havoc with function tracing.
71391bdd2e9aab Xiaozhou Liu    2018-12-14  148   */
889b3c1245de48 Masahiro Yamada 2020-04-06 @149  #define inline inline __gnu_inline __inline_maybe_unused notrace
71391bdd2e9aab Xiaozhou Liu    2018-12-14  150  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--AqsLC8rIMeq19msA
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
oIseGGDow6Zzh2j56EmT9P8ABpcHosyUAAA=

--AqsLC8rIMeq19msA--

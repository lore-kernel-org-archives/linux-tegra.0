Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69BEC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 00:52:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D0DF61941
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 00:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhC2AwW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Mar 2021 20:52:22 -0400
Received: from mga01.intel.com ([192.55.52.88]:48595 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231645AbhC2AwH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Mar 2021 20:52:07 -0400
IronPort-SDR: Rx+yUzfrx7qOsKqZ6zv7h2bthwTRsXVBrEYmZlFQ8s1fzrI8vccmKQpkZVWHCWtynTlduqqTGo
 rCVTTulQSleg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="211641743"
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; 
   d="scan'208";a="211641743"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2021 17:52:07 -0700
IronPort-SDR: KxDppcObuHSDQnYyhreOc1KpDkPT6Dn1N/5Cz3w3tjJ7WbEjEWf2n02e5ut/IB+QWERQjFvEoX
 v39Wi82q2MCQ==
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; 
   d="scan'208";a="454334939"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2021 17:52:05 -0700
Date:   Mon, 29 Mar 2021 08:51:15 +0800
From:   kernel test robot <rong.a.chen@intel.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Subject: [tegra:for-5.13/arm/dt 15/15] dtbs_check:
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: touchscreen@4c:
 'atmel,wakeup-method' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <20210329005115.GJ4176174@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-5.13/arm/dt
head:   3a6c267dd7b8822eb722835b503c5a438cbd3700
commit: 3a6c267dd7b8822eb722835b503c5a438cbd3700 [15/15] ARM: tegra: acer-a500: Add atmel,wakeup-method property
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=arm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/root-node.yaml
   arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: /: regulator@4: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/root-node.yaml
   arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: /: regulator@5: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/root-node.yaml
>> arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: touchscreen@4c: 'atmel,wakeup-method' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: accelerometer@f: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml
   arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: usb@c5004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra20-ehci', 'usb-ehci'] is too long
   	Additional items are not allowed ('usb-ehci' was unexpected)
   	'nvidia,tegra20-ehci' is not one of ['allwinner,sun4i-a10-ehci', 'allwinner,sun50i-a64-ehci', 'allwinner,sun50i-h6-ehci', 'allwinner,sun5i-a13-ehci', 'allwinner,sun6i-a31-ehci', 'allwinner,sun7i-a20-ehci', 'allwinner,sun8i-a23-ehci', 'allwinner,sun8i-h3-ehci', 'allwinner,sun8i-r40-ehci', 'allwinner,sun9i-a80-ehci', 'aspeed,ast2400-ehci', 'aspeed,ast2500-ehci', 'aspeed,ast2600-ehci', 'brcm,bcm3384-ehci', 'brcm,bcm63268-ehci', 'brcm,bcm6328-ehci', 'brcm,bcm6358-ehci', 'brcm,bcm6362-ehci', 'brcm,bcm6368-ehci', 'brcm,bcm7125-ehci', 'brcm,bcm7346-ehci', 'brcm,bcm7358-ehci', 'brcm,bcm7360-ehci', 'brcm,bcm7362-ehci', 'brcm,bcm7420-ehci', 'brcm,bcm7425-ehci', 'brcm,bcm7435-ehci', 'ibm,476gtr-ehci', 'nxp,lpc1850-ehci', 'qca,ar7100-ehci', 'snps,hsdk-v1.0-ehci', 'socionext,uniphier-ehci']
   	'nvidia,tegra20-ehci' is not one of ['cavium,octeon-6335-ehci', 'ibm,usb-ehci-440epx', 'ibm,usb-ehci-460ex', 'nintendo,hollywood-usb-ehci', 'st,spear600-ehci']
   	'nvidia,tegra20-ehci' is not one of ['generic-ehci', 'usb-ehci']
   	'generic-ehci' was expected

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

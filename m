Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC69EC873E
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237296AbjIGQFE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjIGQEr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:04:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C477172A5;
        Thu,  7 Sep 2023 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694102046; x=1725638046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fwMh7jGaSk7TxhZscMBGj1gykagFIBBeWuQIBEDbtjk=;
  b=W4J7mW+GbYXPlCRHCTJKn7frTmZEdS0K80dG9kjpocbVpzofWtDe33im
   Atn1s7S6EM6E4vDyRM6SOu6E+Tu5wTiRqyW5YCrFjDWxAwrx1xybC9tXU
   Xralmr7qIr29v+/cWnoPaVaKDHjlHxzX1s798IdgJbdwgWg5RFPzY95Pq
   vN+dx0agTSzz4i1fnNSrHc6WMeIIlZYtFEAPg+zRSK3yirsYUGoe2J3h1
   h1lgkQvGM7XZDGhT15/hPJQwClZdIa5gP7ua9pjLSSGpo+1GqyWsgoEzG
   J+Jtmcw+ntV4+HEErByG95CrIGEifSmTMeMAdbzneM0Tqk9+JPfQOTqZC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="356841205"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="356841205"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="718711806"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="718711806"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:25:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qeFx5-007Kdm-0y;
        Thu, 07 Sep 2023 17:25:47 +0300
Date:   Thu, 7 Sep 2023 17:25:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kartik <kkartik@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, sumitg@nvidia.com,
        arnd@arndb.de, pshete@nvidia.com, digetx@gmail.com,
        petlozup@nvidia.com, windhl@126.com, frank.li@vivo.com,
        robh@kernel.org, stefank@nvidia.com, pdeschrijver@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] soc/tegra: fuse: Refactor resource mapping
Message-ID: <ZPnda7q0Af8ud74v@smile.fi.intel.com>
References: <20230907071052.3906-1-kkartik@nvidia.com>
 <20230907071052.3906-2-kkartik@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230907071052.3906-2-kkartik@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 07, 2023 at 12:40:47PM +0530, Kartik wrote:
> To prepare for adding ACPI support to the tegra-apbmisc driver,
> relocate the code responsible for mapping memory resources from
> the function ‘tegra_init_apbmisc’ to the function
> ‘tegra_init_apbmisc_resources.’ This adjustment will allow the
> code to be shared between ‘tegra_init_apbmisc’ and the upcoming
> ‘tegra_acpi_init_apbmisc’ function.

...

> -void __init tegra_init_apbmisc(void)
> +static void tegra_init_apbmisc_resources(struct resource *apbmisc,
> +					 struct resource *straps)
>  {

> +}
> +
> +void __init tegra_init_apbmisc(void)

Looks like the patches can be improved by using --patience when you format
patches before sending.

-- 
With Best Regards,
Andy Shevchenko



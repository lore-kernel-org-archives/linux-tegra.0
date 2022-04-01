Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AD6C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Apr 2022 13:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345016AbiDANqt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Apr 2022 09:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbiDANqt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Apr 2022 09:46:49 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BA519C59E;
        Fri,  1 Apr 2022 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648820698; x=1680356698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JlYdFx2enj00VmPSl9W4WEDFs5d1WTq+ViO4q/DcnM0=;
  b=JdVC733b71w5eovdEhieN3J+2cJ9obBprhj4xzWeoc4iUQDul4ENYYuF
   C/qzCmGHVtiP0aFxKFwnohvaKQ57Mh8XZZcXuaq+/ua8JwFOCafnGhYKh
   0qS7IEUq88sianc6HFGZwKhok6Iajp8RyQS+MQ88JFG7rBfYyatBoozM9
   lEe+KIEPiKm0xjJxeTGtLLM1qvO5DYwxhdWK0ZwBDpUQHsr/z1lPElbcj
   qMIlKTpDHZk7UiSBmx6S6tBWmEgVA7FFfJq/DFqnXYxA0P8kZ8uwlzENe
   pAhWKrPSHVKTuEN1+qY2dqOY02i0iS+DLR/qjQtwo70hoVNNWXSOzPD6K
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="260317504"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; 
   d="scan'208";a="260317504"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 06:44:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; 
   d="scan'208";a="521405783"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 06:44:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1naHZf-00AiLH-H6;
        Fri, 01 Apr 2022 16:44:23 +0300
Date:   Fri, 1 Apr 2022 16:44:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sandipan Patra <spatra@nvidia.com>
Cc:     treding@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        ulf.hansson@linaro.org, cai.huoqing@linux.dev, bbasu@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch V2] soc/tegra: pmc: update Tegra234 reset sources
Message-ID: <YkcBt74odxdoBlQ3@smile.fi.intel.com>
References: <20220401104935.9149-1-spatra@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401104935.9149-1-spatra@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Apr 01, 2022 at 04:19:35PM +0530, Sandipan Patra wrote:
> Reset_sources list is updated to add all reset sources
> and removing ones that do not actually exist.

...

> +	NULL,		/* 0x10 */

I would suggest to add the comments more often, like every 8 entries.

...

> +	"FSI_VMON"	/* 0x25 */

It would be good to have comma here as if this ever getting expanded
the additional churn may be avoided.

>  };

-- 
With Best Regards,
Andy Shevchenko



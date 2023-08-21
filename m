Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55D6EE4996
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Aug 2023 12:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbjHUMqH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Aug 2023 08:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjHUMqH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Aug 2023 08:46:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44778C2;
        Mon, 21 Aug 2023 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692621966; x=1724157966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m2iUvrSuXk1OGYknqVGDsjc/j5TcAHjBpnVYPD+gwYg=;
  b=Y5Q5m7BGZP+Ta2pqf+V6NhnTN4aflMEY9xLmj/K5bLDTmwkIfum6pgRO
   Snad6L8xz39XB/CS/YBg3jKrLu+es/uEALHKEQtV7kbLFDXezXaNQjCWh
   9+57eBGYye79sfEqswImAn5hEn01JzZ9+lGsAgcZ4E81FqofWQwT7Ve25
   gFt/nNm3a3D3yA4UDvI2ndVa/HEVJzy4sofYGmOTSJWqU4sAcvhiuBtDp
   unttI0wPt6l15PP8TUyE0Ybol/YPR7FSkEj04kFVCmW9HuWvJGPhSMoR1
   675SGof7HCvZn1NH55omYxxWsMS27MlzpEZfT1XyiLkfsiJ0HFYESodMH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353894859"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="353894859"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 05:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="825912500"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="825912500"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 05:46:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY4IB-00EPNw-2L;
        Mon, 21 Aug 2023 15:45:59 +0300
Date:   Mon, 21 Aug 2023 15:45:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kartik <kkartik@nvidia.com>
Cc:     arnd@arndb.de, digetx@gmail.com, frank.li@vivo.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, pdeschrijver@nvidia.com,
        petlozup@nvidia.com, pshete@nvidia.com, robh@kernel.org,
        stefank@nvidia.com, sumitg@nvidia.com, thierry.reding@gmail.com,
        windhl@126.com
Subject: Re: [PATCH 5/6] soc/tegra: fuse: Add ACPI support for Tegra194 and
 Tegra234
Message-ID: <ZONch05mvI1ykdJP@smile.fi.intel.com>
References: <ZN+JSrT1nH/XMnGu@smile.fi.intel.com>
 <20230821113819.4400-1-kkartik@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821113819.4400-1-kkartik@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Aug 21, 2023 at 05:08:19PM +0530, Kartik wrote:
> On Fri, 2023-08-18 at 18:07 +0300, Andy Shevchenko wrote:
> >On Fri, Aug 18, 2023 at 03:00:27PM +0530, Kartik wrote:

...

> >> +	/* fuse->clk is not required when ACPI is used. */
> >> +	if (!fuse->read || (!fuse->clk && !has_acpi_companion(fuse->dev)))
> >
> >No, just make CLK optional and that's it.
> >
> >>  		return -EPROBE_DEFER;
> >
> If the Fuse driver is probed using device-tree. Then we need to make
> sure that fuse->clk has been initilaized.

So, I recommend to think about it more, maybe you can find better solution
than above.

And actually don't use has_acpi_companion() in this case. What you need is
is_acpi_node() or is_of_node() depending on the case you want to check for.

-- 
With Best Regards,
Andy Shevchenko



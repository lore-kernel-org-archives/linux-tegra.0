Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BB3EE14A1
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Sep 2023 14:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241409AbjIFO46 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Sep 2023 10:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240050AbjIFO45 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Sep 2023 10:56:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031831997;
        Wed,  6 Sep 2023 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694012204; x=1725548204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6p79sxBTSQW8gACuQTGbIFjx2l3tJJvcobYbaBsCOw=;
  b=UgQWZsULYAHgw+d6lnrkPCbUCAFBmkgISZXfhdyReCnJyjEkMri9cLF6
   ox3DHvE6NbZtdBH5pRyIgs0zTv7L2Eo6qyOBV64XkLUJnvQFxYGAEUkVt
   mhl3ozTrsN39GQmhKrRcAmlMcoFiyZ8Hbghmt7MKjf+XVXXhe0cWtpN7a
   roTRx9ZcnUnREGewTOUs2FBRnpGH35L/L3GQPxcHLbe1x3Aas4sHOeVoB
   cfqYu2ei2a5EzPy0qUD5qak3lZw4gCRHh3vHl608LwH2mwgVZicmCPB50
   CYWNnHAOvKeZEOp4kTkx1THYun0y/Ajvkk64RydSg37sXctoDGPdvHuhT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362117767"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="362117767"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741580761"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="741580761"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:56:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qdtx7-006y8U-35;
        Wed, 06 Sep 2023 17:56:21 +0300
Date:   Wed, 6 Sep 2023 17:56:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kartik <kkartik@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, sumitg@nvidia.com,
        arnd@arndb.de, pshete@nvidia.com, digetx@gmail.com,
        petlozup@nvidia.com, windhl@126.com, frank.li@vivo.com,
        robh@kernel.org, stefank@nvidia.com, pdeschrijver@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] soc/tegra: fuse: Add ACPI support
Message-ID: <ZPiTFXa0/D2UN1SE@smile.fi.intel.com>
References: <20230905125824.2947-1-kkartik@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905125824.2947-1-kkartik@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 05, 2023 at 06:28:18PM +0530, Kartik wrote:
> This series of patches add ACPI support for Tegra194 and Tegra234 in
> Tegra fuse and apbmisc drivers. It also adds support for Tegra241
> which uses ACPI boot.

Neither here, nor in the individual patches I do _not_ see the changelog.
What's going on?

-- 
With Best Regards,
Andy Shevchenko



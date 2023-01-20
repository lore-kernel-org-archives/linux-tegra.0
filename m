Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E69DC25B4E
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 09:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjATJTG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 04:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjATJTG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 04:19:06 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FEFDE;
        Fri, 20 Jan 2023 01:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674206335; x=1705742335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pmzBJ5ymiRL8p5H8Es5wRR2UT7IGWgFePiidxrdzTJg=;
  b=LC9qpZ5WxD4rmj3bIev2QTZ9Ei3TmfqVCw8rIz+qTymLcpJHxBjAL1ZN
   gJGFm2PSLTZtB26qaDZDkve+SxRWgrgyFbRR5g6uupnMviTJaaTsbg2n9
   goTMRqFHM0bVvkx8zKL3gpmVNQA8Nc4MYUt2g5jd7KBb5QgGC+hsYn6CP
   VF9Jn8g8aCrpBSugyQvlRWNf6oSYmF1j7epQk37hpKu/4sPFSWq1JpAA0
   KxXueKmDsKjht8Hl1iX5BHilNZq1DlbA+AumzWdIa4HCekFD/6sRkQlpl
   SdPBbr4U40S3fLT6B/mLN9XXm5E6zLY0kEMM15yU+3+vIno7T12SyOMtJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305215476"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="305215476"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 01:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="803015038"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="803015038"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Jan 2023 01:18:49 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 20 Jan 2023 11:18:48 +0200
Date:   Fri, 20 Jan 2023 11:18:48 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V6 2/6] i2c: nvidia-gpu: Add ACPI property to align with
 device-tree
Message-ID: <Y8pceFh88BdhAkMu@kuha.fi.intel.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-3-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119121639.226729-3-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 19, 2023 at 12:16:35PM +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Device-tree uses the 'firmware-name' string property to pass a name of
> the firmware build to the Cypress CCGx driver. Add a new ACPI string
> property to the NVIDIA GPU I2C driver to align with device-tree so that
> we can migrate to using a common property name for both ACPI and
> device-tree.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> V6: no changes
> V5: Added this patch from V3
> 
>  drivers/i2c/busses/i2c-nvidia-gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 12e330cd7635..6d81ea530a83 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -261,6 +261,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>  static const struct property_entry ccgx_props[] = {
>  	/* Use FW built for NVIDIA (nv) only */
>  	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
> +	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
>  	{ }
>  };
>  
> -- 
> 2.25.1

-- 
heikki

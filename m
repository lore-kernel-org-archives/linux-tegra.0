Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77F0C05027
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 09:37:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjATJh6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 04:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjATJh4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 04:37:56 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B7946D7E;
        Fri, 20 Jan 2023 01:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674207475; x=1705743475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XVVkBMYnQRqLirM24LyyrxLMNLI4qCGB0Gu2kS3dLM4=;
  b=M52d6Gc+IVRvBzNdygT9zvtCT2kvVBruTCvQq/Y7t3MK6F3HhQPurZMf
   qabG+PqoukkCVgj3ehQlEg4V6FNZydEu8WgrWG+/SWmrn7j12hhqtdDY5
   kV7QcB6LcmV265AAp1iYBOAJqMYGkzlO16GqdYjUNE4+OmMmupnctjKiu
   h+zF/LEDlMMgWfUhLOgUN1up5AsB/Vz7VIdB1S/i8ZqC9rk9keXF22w7g
   BwJKVSWcZcPzZpPvyaE280L4u99ZEhhMyesIhKd8OUyTLu9VI9W3q1g0V
   rKUCA7fLqFrta+MMQxOBRpKmPALT2gyUVwnaksvvR6Njs45gjCnIJ1c+3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411775923"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="411775923"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 01:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="803019701"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="803019701"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Jan 2023 01:37:50 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 20 Jan 2023 11:37:49 +0200
Date:   Fri, 20 Jan 2023 11:37:49 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V6 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build
 property
Message-ID: <Y8pg7ZN1sbOBJbaf@kuha.fi.intel.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-5-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119121639.226729-5-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 19, 2023 at 12:16:37PM +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Now the Cypress CCG driver has been updated to support the
> 'firmware-name' property to align with device-tree, remove the
> 'ccgx,firmware-build' property as this is no longer needed.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V6: no changes
> V5: Added this patch from V3
> 
>  drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 6d81ea530a83..a8b99e7f6262 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -259,8 +259,7 @@ static const struct pci_device_id gpu_i2c_ids[] = {
>  MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>  
>  static const struct property_entry ccgx_props[] = {
> -	/* Use FW built for NVIDIA (nv) only */
> -	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
> +	/* Use FW built for NVIDIA GPU only */
>  	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
>  	{ }
>  };

This patch is fine, and it's in the right place, but you need to
squash 5/6 into 3/6.

thanks,

-- 
heikki

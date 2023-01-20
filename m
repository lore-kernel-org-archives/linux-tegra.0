Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083B8C05027
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 09:35:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjATJfA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 04:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjATJew (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 04:34:52 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1111D5BBE;
        Fri, 20 Jan 2023 01:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674207272; x=1705743272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6lIDR4z4RQuA46b04i56IywoXYvWWasF4FtmGMaqhIo=;
  b=KNFo7L755zgDLmb9N0qmwygulQgUirR+Z/B6U3JTHDFFQ/zDHjFNJY+p
   q1lKE+1ZSeSPgI0Yfzr4XnKW9xM0FpWimEAzLcaAVDI1k4lAPV7n2ZR5z
   TqSL7AFKtUsQUZkI9NMhqwEoH+rp7Y0TXlgJuc/YbsEHencGMUdFZPgyS
   GU7ECJp/KXQx8Qx0ecQa2ye3vAwTm9rkRPxv9swzXon0gWWJGNFtvVUBt
   AH0VmVRIivCOLwTmVnAX/sLFQx6N6C3YSjCS1TZ5fywRhtJ1SnRI3Y34C
   r/gNaKhKPAoTVT65TcUekf86hEc0y15Zf3CWrpnMgfNwjsGK3bj5oHUlR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411775449"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="411775449"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 01:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="803018746"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="803018746"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Jan 2023 01:34:18 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 20 Jan 2023 11:34:17 +0200
Date:   Fri, 20 Jan 2023 11:34:17 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V6 5/6] usb: typec: ucsi_ccg: Remove ccgx,firmware-build
 property
Message-ID: <Y8pgGTNwSRZ8VaGW@kuha.fi.intel.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-6-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119121639.226729-6-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 19, 2023 at 12:16:38PM +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Remove the property 'ccgx,firmware-build' now we have migrated devices
> to using the 'firmware-name' property.

Ah, so just do this in the patch 3/6.

> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V6: fixed compilation
> V5: Added this patch from V3
> 
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 661a3988b39d..8f5ad2094f26 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1358,17 +1358,13 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>  	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>  
>  	/* Only fail FW flashing when FW build information is not provided */
> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
> -					  &uc->fw_build);
> -	if (status) {
> -		status = device_property_read_string(dev, "firmware-name",
> -						     &fw_name);
> -		if (!status) {
> -			if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
> -				uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
> -			else if (!strcmp(fw_name, "nvidia,gpu"))
> -				uc->fw_build = CCG_FW_BUILD_NVIDIA;
> -		}
> +	status = device_property_read_string(dev, "firmware-name",
> +					     &fw_name);

One line.

> +	if (!status) {
> +		if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
> +			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
> +		else if (!strcmp(fw_name, "nvidia,gpu"))
> +			uc->fw_build = CCG_FW_BUILD_NVIDIA;
>  	}
>  
>  	if (!uc->fw_build)
> -- 
> 2.25.1

thanks,

-- 
heikki

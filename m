Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38E7C677F1
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 12:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236903AbjAQMDS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 07:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236872AbjAQMDJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 07:03:09 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEAA38663;
        Tue, 17 Jan 2023 04:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673956973; x=1705492973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OuQzpNaSFrQ7C7fN+vQ5fDXpH/q5UyXVPz+fXyzB23g=;
  b=RjoTfzC1GKWV5yjyy4IbNxUD0oyza46f1BqPqDfobKmz3LSg0sCWSjpk
   QlGSrUz6WO5S5Z6HaHJBQUnuAbtojH32rnXGjEbwNGNAn/EV1CkbBQPJX
   c0jMpf8KIheMiznPcb229om+HEDllXShEOMJq3fchxEJaiuY8gBzxAwt+
   J5B/jeexMFhV1HhSL1L9xjv+sVsl5zno6YWvuF8jeUWFE9jFjB471dKbS
   CmqDj4Yo9xuIdV9mZvtOlTE4oypHeh8bJdSOSkXRcqPkN4qwfAGDhmxzW
   IrndlKoqGa1uU0LC1AyH2K5ipMmXW5dDth0oPWNDkyZTBquWUZ7kpXXzT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387028107"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="387028107"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 04:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="801722381"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="801722381"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 17 Jan 2023 04:02:48 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 17 Jan 2023 14:02:48 +0200
Date:   Tue, 17 Jan 2023 14:02:48 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V4 3/5] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Message-ID: <Y8aOaH+ALBvjm/rH@kuha.fi.intel.com>
References: <20230116155045.100780-1-jonathanh@nvidia.com>
 <20230116155045.100780-4-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116155045.100780-4-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jan 16, 2023 at 03:50:43PM +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> ccgx is refer to the cypress cypd4226 typec controller.
> Replace ccgx to well-known regex "cypress".
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V2 -> V4: nothing has changed
> V1 -> V2: new change added for adding cypress,firmware-build
> 
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 4bc31ed8e5bc..d6114fb8d5a9 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1357,7 +1357,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>  	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>  
>  	/* Only fail FW flashing when FW build information is not provided */
> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
> +	status = device_property_read_u16(dev, "cypress,firmware-build",
>  					  &uc->fw_build);

You need to first add that property to
drivers/i2c/busses/i2c-nvidia-gpu.c.

>  	if (status)
>  		dev_err(uc->dev, "failed to get FW build information\n");
> -- 
> 2.25.1

-- 
heikki

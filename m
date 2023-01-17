Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF26C63797
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 12:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236751AbjAQMHG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 07:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234106AbjAQMHF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 07:07:05 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E9F32E6A;
        Tue, 17 Jan 2023 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673957224; x=1705493224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X9y6JJ7LWZRFX1y7+eMk68PaK0HXTuZgsWPEV17oNaU=;
  b=NYPAi0VxO/JVGGFOKIsegAXl9naeYuQEbP2FmhI2dhxy3WoB8+YxgXib
   X3/ilphHByBAvdp0B17mr+O1JNWXlcS7EqB5TRLx6KJKsqN2yXxWGbVFL
   5JnJxWBiUD40U1hJPRUd0Y/6MIc4cuNEUbDPgWGB2tDLyrVgaX5wT9ZyB
   y/RqnxSVdK9v432rN+lFuomnGCC9ER4y68HMpCvWnF2uNPQWxfVCu090V
   +3nVg2HrsBcM4ky1Ynuif+bp3sAAVNhBOcCZgsEJe2nSOPo3mC7oF2wqK
   NUkYB9sRDEJbOyHCap2SMvuIBtd1S2Q0qQlHa950snbORK1zd0C1dd29Y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387028985"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="387028985"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 04:07:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="801722803"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="801722803"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 17 Jan 2023 04:06:59 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 17 Jan 2023 14:06:59 +0200
Date:   Tue, 17 Jan 2023 14:06:58 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V4 4/5] i2c: nvidia-gpu: Replace ccgx to well-known regex
Message-ID: <Y8aPYkFJ+TqQtatx@kuha.fi.intel.com>
References: <20230116155045.100780-1-jonathanh@nvidia.com>
 <20230116155045.100780-5-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116155045.100780-5-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jan 16, 2023 at 03:50:44PM +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> ccgx is refer to the cypress cypd4226 typec controller.
> Replace ccgx to well-known regex "cypress".
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V2 -> V4: nothing has changed
> V1 -> V2: New change for adding cypress,firmware-build
> 
>  drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 12e330cd7635..0934f8ad7f49 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -260,7 +260,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>  
>  static const struct property_entry ccgx_props[] = {
>  	/* Use FW built for NVIDIA (nv) only */
> -	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
> +	PROPERTY_ENTRY_U16("cypress,firmware-build", ('n' << 8) | 'v'),
>  	{ }
>  };

So you need a new patch where you first introduce that
"cypress,firmware-build" property. That patch comes before patch 3/5.

Then in this patch you only remove the old property
"ccgx,firmware-build" property.

thanks,

-- 
heikki

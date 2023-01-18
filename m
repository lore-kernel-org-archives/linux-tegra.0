Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8923EC32793
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Jan 2023 10:08:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjARKIc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 Jan 2023 05:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjARKHx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Jan 2023 05:07:53 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4DB656D6;
        Wed, 18 Jan 2023 01:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674033202; x=1705569202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HX0zyAQncS5vJj7zoni+iRi+Vpv7/c6EyhwOr9hb9OE=;
  b=MPZHkIZlGcw0OOrVn+FQkQRobP1KWdDYpsM9L9qdwfl32KvNq8PMvJmA
   mdlHIPjN5lteovrxhoEKtYtihe+f/vWo0w0KddIuGgJ8l8mJ3ddv5gr39
   JVnpVphulAqSzK1XwGHZxqDQS+WIxgY/0YO/ljCsrENuI9Kkdn2MHEWXb
   vwmonFDJsd0ZxETizRVIpczO8dPG93T1F/2vDiIxElWMfDyfK1f9+NO5l
   yT2qDev08KIjmTKed7m/vb2rEv09T2NhXFktAn6aEppEk68n+mOsHsfsP
   2sR0LgRWMj/XVOL36NVbuvWtey0JnixotngqGJRDR/tOCD73aqPj8kVi3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="304619727"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="304619727"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 01:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="802108498"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="802108498"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 18 Jan 2023 01:13:14 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 18 Jan 2023 11:13:13 +0200
Date:   Wed, 18 Jan 2023 11:13:13 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V4 3/5] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Message-ID: <Y8e4KXMh+bi6Gj7r@kuha.fi.intel.com>
References: <20230116155045.100780-1-jonathanh@nvidia.com>
 <20230116155045.100780-4-jonathanh@nvidia.com>
 <Y8aOaH+ALBvjm/rH@kuha.fi.intel.com>
 <11349701-f82f-3a7f-61ef-11f1585958c3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11349701-f82f-3a7f-61ef-11f1585958c3@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 17, 2023 at 11:29:25PM +0000, Jon Hunter wrote:
> 
> On 17/01/2023 12:02, Heikki Krogerus wrote:
> > On Mon, Jan 16, 2023 at 03:50:43PM +0000, Jon Hunter wrote:
> > > From: Wayne Chang <waynec@nvidia.com>
> > > 
> > > ccgx is refer to the cypress cypd4226 typec controller.
> > > Replace ccgx to well-known regex "cypress".
> > > 
> > > Signed-off-by: Wayne Chang <waynec@nvidia.com>
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > ---
> > > V2 -> V4: nothing has changed
> > > V1 -> V2: new change added for adding cypress,firmware-build
> > > 
> > >   drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > index 4bc31ed8e5bc..d6114fb8d5a9 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > @@ -1357,7 +1357,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
> > >   	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
> > >   	/* Only fail FW flashing when FW build information is not provided */
> > > -	status = device_property_read_u16(dev, "ccgx,firmware-build",
> > > +	status = device_property_read_u16(dev, "cypress,firmware-build",
> > >   					  &uc->fw_build);
> > 
> > You need to first add that property to
> > drivers/i2c/busses/i2c-nvidia-gpu.c.
> 
> 
> Looking at this some more, I wonder if we need to keep 'ccgx,firmware-build'
> as a fallback for AMD? It is not clear to me if they implement this property
> or not. Let me know what you think. I will still update the i2c-nvidia-gpu
> driver. 	

AMD needs to answer to that one. Sanket, do you have that device
property ("ccgx,firmware-build") in your ACPI tables (as _DSD device
property) for this device?

thanks,

-- 
heikki

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA83BC54EAA
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbjAXLus (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbjAXLur (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:50:47 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E3643479;
        Tue, 24 Jan 2023 03:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674561033; x=1706097033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ilmP+R6ClcklSYaYqBc8VR1oeLZrt7IRxXeqBBWyQzA=;
  b=m1DR/YVdPeqsb+vJYkasAv+I+DeJAT71fWGhNh2BG8JD6Uv3CuhIVuOK
   n5+rxAWElMIfvS0VDPmUpxu6e9qkZfOqBHc6J+SDcWRnOsAU2E0zY6bUq
   dCk44g0OoaiyxPBqYl5Nu9R+utNTWke8wczc1t3WyslusOYgHqXOgv3IV
   I4MBI6AqJLMEicr7RXqrAPaGsm6+Mc8U6fOA+AdwCgJYIF887++vIVWgl
   XPlzxyJLwADoVmESR5etEy7sjyb0ULByy4icWog2HSfKIJK+5hjpzKP2T
   OL3YT7D1vWi1qwBHcpRw+cRnBYTtelj9Ly/q1u61/Dgwkd1ATWuhsEvw/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412508356"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="412508356"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 03:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804568233"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="804568233"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Jan 2023 03:50:29 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jan 2023 13:50:28 +0200
Date:   Tue, 24 Jan 2023 13:50:28 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V7 3/6] usb: typec: ucsi_ccg: Add OF support
Message-ID: <Y8/GBHsaEYKfMLdg@kuha.fi.intel.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
 <20230124114318.18345-4-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124114318.18345-4-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Tue, Jan 24, 2023 at 11:43:15AM +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add device-tree support for the Cypress CCG UCSI driver. The device-tree
> binding for the Cypress CCG device uses the standard device-tree
> 'firmware-name' string property to indicate the firmware build that is
> used.
> 
> The NVIDIA GPU I2C driver has been updated to use an ACPI string
> property that is also named 'firmware-build' and given that this was the
> only users of the 'ccgx,firmware-build' property, we can now remove
> support for this legacy property.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

You missed one nitpick in v6 - check below. But that's minor, so if
there's nothing else:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> V6 -> V7: removed 'ccgx,firmware-build' property
> V5 -> V6: fixed compilation
> V4 -> V5: add support for 'firmware-name'
> V1 -> V4: nothing has changed
> 
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 46441f1477f2..8f5ad2094f26 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
>  {
>  	unsigned long flags = IRQF_ONESHOT;
>  
> -	if (!has_acpi_companion(uc->dev))
> +	if (!dev_fwnode(uc->dev))
>  		flags |= IRQF_TRIGGER_HIGH;
>  
>  	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
> @@ -1342,6 +1342,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ucsi_ccg *uc;
> +	const char *fw_name;
>  	int status;
>  
>  	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
> @@ -1357,9 +1358,16 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>  	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>  
>  	/* Only fail FW flashing when FW build information is not provided */
> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
> -					  &uc->fw_build);
> -	if (status)
> +	status = device_property_read_string(dev, "firmware-name",
> +					     &fw_name);

One line is enough:

	status = device_property_read_string(dev, "firmware-name", &fw_name);

> +	if (!status) {
> +		if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
> +			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
> +		else if (!strcmp(fw_name, "nvidia,gpu"))
> +			uc->fw_build = CCG_FW_BUILD_NVIDIA;
> +	}
> +
> +	if (!uc->fw_build)
>  		dev_err(uc->dev, "failed to get FW build information\n");
>  
>  	/* reset ccg device and initialize ucsi */
> @@ -1426,6 +1434,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>  	free_irq(uc->irq, uc);
>  }
>  
> +static const struct of_device_id ucsi_ccg_of_match_table[] = {
> +		{ .compatible = "cypress,cypd4226", },
> +		{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
> +
>  static const struct i2c_device_id ucsi_ccg_device_id[] = {
>  	{"ccgx-ucsi", 0},
>  	{}
> @@ -1480,6 +1494,7 @@ static struct i2c_driver ucsi_ccg_driver = {
>  		.pm = &ucsi_ccg_pm,
>  		.dev_groups = ucsi_ccg_groups,
>  		.acpi_match_table = amd_i2c_ucsi_match,
> +		.of_match_table = ucsi_ccg_of_match_table,
>  	},
>  	.probe_new = ucsi_ccg_probe,
>  	.remove = ucsi_ccg_remove,
> -- 
> 2.25.1

thanks,

-- 
heikki

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C714AC05027
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 09:34:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjATJeL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 04:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjATJeI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 04:34:08 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2806A6C56;
        Fri, 20 Jan 2023 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674207222; x=1705743222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Bjm+trFUTtS/i82Eu7JZl1wzHSlKzvi9wvH7CXa8P0=;
  b=Xb4/wAwcpSThNPbiBF1/fvoZmGGYSQ7lV4430e46+P4RNsZSd+bqOA6o
   kJXCKCq9ojdVi9Q43DGj3VGL3jA8YBkUnDsWybK1sg/2nACRVIk1O1atn
   Iz1rTpFFyFDuZg5FU1tcI6K5NHmEph+92oL8Py7BCMnhpPu8YNVD+TPKG
   WNzn+IE2y56ILu5ojFN7c28fp2vQnavd4n+UcP16reaGf5j9FY7LgMj9W
   M3LRWtMzSi9ol3t/BMj2iwc3aOg8/qPurfCjmkHBehqa08urebOPLuT/F
   cleOUpn+vRfVjQ9skYqsEzY9G+Y4p7y/jRfkxSlBOi9l1StTo3NWsbv8Z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411775262"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="411775262"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 01:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="803018500"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="803018500"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Jan 2023 01:33:06 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 20 Jan 2023 11:33:05 +0200
Date:   Fri, 20 Jan 2023 11:33:05 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V6 3/6] usb: typec: ucsi_ccg: Add OF support
Message-ID: <Y8pf0Vo+HzTZ7+H7@kuha.fi.intel.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-4-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119121639.226729-4-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 19, 2023 at 12:16:36PM +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add device-tree support for the Cypress CCG UCSI driver. The device-tree
> binding for the Cypress CCG device uses the standard device-tree
> 'firmware-name' string property to indicate the firmware build that is
> used. For ACPI a 16-bit property named 'ccgx,firmware-build' is used and
> if this is not found fall back to the 'firmware-name' property.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V5 -> V6: fixed compilation
> V4 -> V5: add support for 'firmware-name'
> V1 -> V4: nothing has changed
> 
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 46441f1477f2..661a3988b39d 100644
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
> @@ -1359,7 +1360,18 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>  	/* Only fail FW flashing when FW build information is not provided */
>  	status = device_property_read_u16(dev, "ccgx,firmware-build",
>  					  &uc->fw_build);

You don't need this anymore. You already added the new property
"firmware-name" to drivers/i2c/busses/i2c-nvidia-gpu.c.

> -	if (status)
> +	if (status) {
> +		status = device_property_read_string(dev, "firmware-name",
> +						     &fw_name);
> +		if (!status) {
> +			if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
> +				uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
> +			else if (!strcmp(fw_name, "nvidia,gpu"))
> +				uc->fw_build = CCG_FW_BUILD_NVIDIA;
> +		}

So this will already work also with the build-in properties from
i2c-nvidia-gpu.c.

> +	}
> +
> +	if (!uc->fw_build)
>  		dev_err(uc->dev, "failed to get FW build information\n");
>  
>  	/* reset ccg device and initialize ucsi */
> @@ -1426,6 +1438,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
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
> @@ -1480,6 +1498,7 @@ static struct i2c_driver ucsi_ccg_driver = {
>  		.pm = &ucsi_ccg_pm,
>  		.dev_groups = ucsi_ccg_groups,
>  		.acpi_match_table = amd_i2c_ucsi_match,
> +		.of_match_table = ucsi_ccg_of_match_table,
>  	},
>  	.probe_new = ucsi_ccg_probe,
>  	.remove = ucsi_ccg_remove,
> -- 
> 2.25.1

-- 
heikki

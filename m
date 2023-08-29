Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3719BC83F19
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Aug 2023 13:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236006AbjH2N2R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Aug 2023 09:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236136AbjH2N17 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Aug 2023 09:27:59 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EEE1BB;
        Tue, 29 Aug 2023 06:27:56 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf6ea270b2so26878315ad.0;
        Tue, 29 Aug 2023 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693315676; x=1693920476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZdC0qkZ5z6tjDALZF8Uye7Xemxb62imgRWO87UTMUk=;
        b=ssZZUzKZL9fdA5DErd5YFknCsswcvJz6I5/0w5BD3TnAc06bmreosNaj92J+aHMWW3
         BFO0uz4pmu2NSjHW7TKYaF8QLD7hf/mefNKDMtgJqRU/w33552jqAWxeSlC8/HGaUUCX
         B1eaHogYioTPsaW3IkDUl/mpP0RXv69ySuToPE6Kgw4tTh4Z2ciaEfJGyseEJyPS1ybl
         DAZMt7wi6nQTmKsDlOpq+X3Z4qmQtB6a9gbixxH35O+/2Q1McHPorKtJqRUgZ/G5OqG+
         iHD3/TjX5GjElxoU6GgzDsS05nx1UgXNTVldl5cWhPhIet/x1LYeQ4lOEg5xPTqskXNP
         GUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693315676; x=1693920476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZdC0qkZ5z6tjDALZF8Uye7Xemxb62imgRWO87UTMUk=;
        b=g/Mdr36UcL32+TSHgy5FpK1iVE5P1RO2FsgQYq/3v9Vb48H0y2X+BpQVEF546MOev3
         oC9UtGfSY/AGJJr3wnVVxJyJEMZyz7f/LadsdzgHvhEJwenrJDfy/eiAAyCc4H+4bBMO
         h449TtKBVNrBrsY9fV/evgD3LvnHDZBfumoxucHpOvLahOkIRX3e0VjlC3i2DKw2GQdG
         VeSI4gun4fzOvdtJM/XgPB3NsKPWAvpOaCprv0W3bhQX+RmNTTuSW0MiFV+YH4RZ+CZ5
         pA6AhaFFFnneFDwb2lYjW4V/mat4vZGFdtKp91qnCpgwmALHFAc+FATgTVd9fZl4lSZk
         4JPA==
X-Gm-Message-State: AOJu0YyIhf8iN/fsk5n6cMyj9akQ3A9AtampqjGB4R5Nt40f1Bph4Ko8
        DGyKWZM3vuIwoJV2EttgX58=
X-Google-Smtp-Source: AGHT+IGSw9CjWFGZ/PIdZRDXukv7MXzSaqzYnrVZbhrW3L010Op/nnF9OhcpBvdyuVos3xn8N0ZoJQ==
X-Received: by 2002:a17:903:11cc:b0:1bf:3c10:1d72 with SMTP id q12-20020a17090311cc00b001bf3c101d72mr28313286plh.66.1693315675608;
        Tue, 29 Aug 2023 06:27:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ix5-20020a170902f80500b001bde65894d5sm9301145plb.109.2023.08.29.06.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 06:27:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 29 Aug 2023 06:27:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ninad Malwade <nmalwade@nvidia.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Rajkumar Kasirajan <rkasirajan@nvidia.com>
Subject: Re: [PATCH V2 3/4] hwmon: ina3221: add support for summation channel
 control
Message-ID: <035044de-be6f-45c9-911f-44799ddf2fff@roeck-us.net>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-4-nmalwade@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825164249.22860-4-nmalwade@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Aug 26, 2023 at 12:42:48AM +0800, Ninad Malwade wrote:
> The INA3221 allows the Critical alert pin to be controlled
> by the summation control function. This function adds the
> single shunt-voltage conversions for the desired channels
> in order to compare the combined sum to the programmed limit.
> The Shunt-Voltage Sum Limit register contains the programmed
> value that is compared to the value in the Shunt-Voltage Sum
> register in order to determine if the total summed limit is
> exceeded. If the shunt-voltage sum limit value is exceeded,
> the Critical alert pin pulls low.
> 
> For the summation limit to have a meaningful value,
> we have to use the same shunt-resistor value on all included
> channels. Unless equal shunt-resistor values are used for
> each channel, we can't use summation control function to add
> the individual conversion values directly together in the
> Shunt-Voltage Sum register to report the total current.
> 
> To address this we add support to BYPASS channels
> via kernel device tree property "summation-bypass".
> 
> The channel which has this property would be excluded from
> the calculation of summation control function, so we can easily
> exclude the one which uses different shunt-resistor value or
> bus voltage.
> 
> For example, summation control function calculates
> Shunt-Voltage Sum like
> - input_shunt_voltage_summaion = input_shunt_voltage_channel1

summation

>                                + input_shunt_voltage_channel2
>                                + input_shunt_voltage_channel3
> 
> But if we want the summation to consider only channel1
> and channel3, we can add 'summation-bypass' property
> in device tree node of channel2.
> 
> Then the calculation will skip channel2.
> - input_shunt_voltage_summaion = input_shunt_voltage_channel1
>                                + input_shunt_voltage_channel3
> 
summation

> Please note that we only want the channel to be skipped
> for summation control function rather than completely disabled.
> Therefore, even if we add the device tree node, the functionality
> of the single channel would still be retained.
> 
> The below sysfs nodes are added to check if the channel is included
> or excluded from the summation control function.
> 
> in*_sum_bypass = 0 --> channel voltage is included for sum of
>                        shunt voltages.
> 
> in*_sum_bypass = 1 --> channel voltage is excluded for sum
>                        of shunt voltages.
> 
This is not an acceptable sysfs attribute. Use debugfs.

> Signed-off-by: Rajkumar Kasirajan <rkasirajan@nvidia.com>
> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> ---
>  drivers/hwmon/ina3221.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 5ab944056ec0..093ebf9f1f8d 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -104,6 +104,7 @@ struct ina3221_input {
>  	const char *label;
>  	int shunt_resistor;
>  	bool disconnected;
> +	bool summation_bypass;
>  };
>  
>  /**
> @@ -125,6 +126,7 @@ struct ina3221_data {
>  	struct mutex lock;
>  	u32 reg_config;
>  	int summation_shunt_resistor;
> +	u32 summation_channel_control;
>  
>  	bool single_shot;
>  };
> @@ -154,7 +156,8 @@ static inline int ina3221_summation_shunt_resistor(struct ina3221_data *ina)
>  	int i, shunt_resistor = 0;
>  
>  	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
> -		if (input[i].disconnected || !input[i].shunt_resistor)
> +		if (input[i].disconnected || !input[i].shunt_resistor ||
> +		    input[i].summation_bypass)
>  			continue;
>  		if (!shunt_resistor) {
>  			/* Found the reference shunt resistor value */
> @@ -731,10 +734,29 @@ static SENSOR_DEVICE_ATTR_RW(shunt1_resistor, ina3221_shunt, INA3221_CHANNEL1);
>  static SENSOR_DEVICE_ATTR_RW(shunt2_resistor, ina3221_shunt, INA3221_CHANNEL2);
>  static SENSOR_DEVICE_ATTR_RW(shunt3_resistor, ina3221_shunt, INA3221_CHANNEL3);
>  
> +static ssize_t ina3221_summation_bypass_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	unsigned int channel = sd_attr->index;
> +	struct ina3221_input *input = &ina->inputs[channel];
> +
> +	return sysfs_emit(buf, "%d\n", input->summation_bypass);
> +}
> +
> +/* summation bypass */
> +static SENSOR_DEVICE_ATTR_RO(in1_sum_bypass, ina3221_summation_bypass, INA3221_CHANNEL1);
> +static SENSOR_DEVICE_ATTR_RO(in2_sum_bypass, ina3221_summation_bypass, INA3221_CHANNEL2);
> +static SENSOR_DEVICE_ATTR_RO(in3_sum_bypass, ina3221_summation_bypass, INA3221_CHANNEL3);
> +

As mentioned, use debugfs to display this information.

>  static struct attribute *ina3221_attrs[] = {
>  	&sensor_dev_attr_shunt1_resistor.dev_attr.attr,
>  	&sensor_dev_attr_shunt2_resistor.dev_attr.attr,
>  	&sensor_dev_attr_shunt3_resistor.dev_attr.attr,
> +	&sensor_dev_attr_in1_sum_bypass.dev_attr.attr,
> +	&sensor_dev_attr_in2_sum_bypass.dev_attr.attr,
> +	&sensor_dev_attr_in3_sum_bypass.dev_attr.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(ina3221);
> @@ -786,6 +808,9 @@ static int ina3221_probe_child_from_dt(struct device *dev,
>  	/* Save the connected input label if available */
>  	of_property_read_string(child, "label", &input->label);
>  
> +	/* summation channel control */
> +	input->summation_bypass = of_property_read_bool(child, "summation-bypass");
> +
>  	/* Overwrite default shunt resistor value optionally */
>  	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
>  		if (val < 1 || val > INT_MAX) {
> @@ -873,6 +898,10 @@ static int ina3221_probe(struct i2c_client *client)
>  
>  	/* Initialize summation_shunt_resistor for summation channel control */
>  	ina->summation_shunt_resistor = ina3221_summation_shunt_resistor(ina);
> +	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
> +		if (!ina->inputs[i].summation_bypass)
> +			ina->summation_channel_control |= (BIT(14 - i));

Unnecessary ( ) around BIT().

> +	}
>  
>  	ina->pm_dev = dev;
>  	mutex_init(&ina->lock);
> @@ -978,13 +1007,13 @@ static int ina3221_resume(struct device *dev)
>  	/* Initialize summation channel control */
>  	if (ina->summation_shunt_resistor) {
>  		/*
> -		 * Take all three channels into summation by default
> -		 * Shunt measurements of disconnected channels should
> -		 * be 0, so it does not matter for summation.
> +		 * Sum only channels that are not 'bypassed' for summation
> +		 * by default. Shunt measurements of disconnected channels

Drop "by default".

> +		 * should be 0, so it does not matter for summation.
>  		 */
>  		ret = regmap_update_bits(ina->regmap, INA3221_MASK_ENABLE,
>  					 INA3221_MASK_ENABLE_SCC_MASK,
> -					 INA3221_MASK_ENABLE_SCC_MASK);
> +					 ina->summation_channel_control);
>  		if (ret) {
>  			dev_err(dev, "Unable to control summation channel\n");
>  			return ret;
> -- 
> 2.17.1
> 

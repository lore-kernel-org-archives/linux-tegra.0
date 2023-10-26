Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CD0C25B47
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Oct 2023 00:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJZA7y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Oct 2023 20:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjJZA7x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Oct 2023 20:59:53 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77F7AC;
        Wed, 25 Oct 2023 17:59:51 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-41cb9419975so2341151cf.2;
        Wed, 25 Oct 2023 17:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698281991; x=1698886791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L91FCdOLv7HzCEyiSduMvdZ7o8Qfr4r81H8+5xAX/80=;
        b=Py1UiMYs8a5Gv3sMTGTmS+cj3l3dkcrhwyqIFCF1srPQs5QO+5DdQ+zfLPWT4ed1Ec
         9tldyLisFBbAYIZMWM9s9wr47p9wHwjqbCeDGUpKm8oYEpMJKIo5SJJnePAH4Ii4FTQP
         s3mqRvraW9UYYWkePWxroUJi22Pur9cZ82O1CN2YR+xu3cUTbRZ/GALQBvGqAn8hJZgb
         tkrYbQ+5Sg+DeGNNEkABSXTug82Wnadp7QXXvatnIJQMhiGlsg4TVLS/e/6PuJnywsM5
         BLFd6aB1Sgj+gP5Vl6ezZZBBjSSBgPJS1h16ywyYhD5Jr3OBfESnzmPC2EjpOibUeghr
         e23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698281991; x=1698886791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L91FCdOLv7HzCEyiSduMvdZ7o8Qfr4r81H8+5xAX/80=;
        b=Dt6ZMI0RJpBZJVy3EWW8APGhfGugFCDa3FLhpmzV3VlI0eO0uGXI7/tgamtQy59wNj
         qBl4Z/80WRirgoVQm0oPlM+kUe1iJKEFjE77ZJpoNu8/jFCr+4tSUj/8FOUSnOPbBNgQ
         Ot90BGIdOfEhFNLspIAAz3eERjgAHd3BccHz2orC1x4v3armcgJeW4B8trn1UdqRI+Cf
         AglKWeVROMxdCXOTjLF0qZz/hlKGwZfO0Xk4rovBJWUQc6sY53POuNCs5LjVDVe1eCQp
         lWEJprooJLyHyOW1qKJ76WAfMcW4lfYXUzKqv5/e5cSCUUa4AP+jW27IjFS6p+IKFSPd
         bIIw==
X-Gm-Message-State: AOJu0Yx1+rxV0ldO4hP4yNDnnA2j/jzJUBeZu6k7CzfKbcY6Ko15Mvnd
        BOIqZrQqCqed+sb2mRglH4w=
X-Google-Smtp-Source: AGHT+IF5F7TAUEDUwPzOkkiFdmU/3guXYi/wawowb1UgSyaIwbru+Zhs1gggNZeP0jwjPqNORye2gA==
X-Received: by 2002:ac8:7f96:0:b0:419:a2c6:820e with SMTP id z22-20020ac87f96000000b00419a2c6820emr21795601qtj.12.1698281990906;
        Wed, 25 Oct 2023 17:59:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x17-20020a25acd1000000b00da05d771097sm1407705ybd.22.2023.10.25.17.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 17:59:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 25 Oct 2023 17:59:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Ninad Malwade <nmalwade@nvidia.com>,
        Rajkumar Kasirajan <rkasirajan@nvidia.com>
Subject: Re: [PATCH V5 3/4] hwmon: ina3221: Add support for channel summation
 disable
Message-ID: <e1c2f42a-5297-41f3-882c-094a207f8b00@roeck-us.net>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
 <20230929103650.86074-4-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929103650.86074-4-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 29, 2023 at 11:36:49AM +0100, Jon Hunter wrote:
> From: Ninad Malwade <nmalwade@nvidia.com>
> 
> The INA3221 allows the Critical alert pin to be controlled by the
> summation control function. This function adds the single
> shunt-voltage conversions for the desired channels in order to compare
> the combined sum to the programmed limit. The Shunt-Voltage Sum Limit
> register contains the programmed value that is compared to the value in
> the Shunt-Voltage Sum register in order to determine if the total summed
> limit is exceeded. If the shunt-voltage sum limit value is exceeded, the
> Critical alert pin pulls low.
> 
> For the summation limit to have a meaningful value, we have to use the
> same shunt-resistor value on all included channels. Unless equal
> shunt-resistor values are used for each channel, the summation control
> function cannot be used and it is not enabled by the driver.
> 
> To address this, add support to disable the summation of specific
> channels via device tree property "ti,summation-disable". The channel
> which has this property would be excluded from the calculation of
> summation control function.
> 
> For example, summation control function calculates Shunt-Voltage Sum as:
> 
> - input_shunt_voltage_summation = input_shunt_voltage_channel1
>                                 + input_shunt_voltage_channel2
>                                 + input_shunt_voltage_channel3
> 
> If we want the summation to only use channel1 and channel3, we can add
> 'ti,summation-disable' property in device tree node for channel2. Then
> the calculation will skip channel2.
> 
> - input_shunt_voltage_summation = input_shunt_voltage_channel1
>                                 + input_shunt_voltage_channel3
> 
> Note that we only want the channel to be skipped for summation control
> function rather than completely disabled. Therefore, even if we add the
> property 'ti,summation-disable', the channel is still enabled and
> functional.
> 
> Finally, create debugfs entries that display if summation is disabled
> for each of the channels.
> 
> Signed-off-by: Rajkumar Kasirajan <rkasirajan@nvidia.com>
> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Applied.

Thanks,
Guenter

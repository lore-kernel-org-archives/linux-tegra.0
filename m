Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAA8C64EC7
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Feb 2023 04:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjBVEDZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Feb 2023 23:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBVEDY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Feb 2023 23:03:24 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27F5BDDA
        for <linux-tegra@vger.kernel.org>; Tue, 21 Feb 2023 20:03:20 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id h31so3582957pgl.6
        for <linux-tegra@vger.kernel.org>; Tue, 21 Feb 2023 20:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QuI/VvwDNYNNazJWSsosiKrPGXGOzC0MjV/AUA+0Y18=;
        b=nCQyd6hFnx68A0tFIWYPEgBjsOibWoTXo/smz+3gYmBRuFPBPE4pSywkfCdKUgkvpA
         2hEWf1fS6sHfJJXEu8DWcYvgIJnpq7iCy2lvMkzx+HoVbnLXGhDO3iOZBooeJGtaR0Pd
         PIZdAXgjwX/QLrf6b4kb2lhJNJ1j/mPGS3Ik1K0eu/3Wy4urzl1+NUghMtTwh0O3P7VO
         XwlRUrcPNrxw9hmttzjw+mE8ECx7oXM2WAMltKMJ6Ph5wzLKVBrlFjqFfJs7uN86eaQv
         wJJXhF1XzUfKegtHqxyQWMa88wL+GMAeFpaouHVUjOmGIQMWTqRQH3o2TN5f/VRX0YMW
         7WDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuI/VvwDNYNNazJWSsosiKrPGXGOzC0MjV/AUA+0Y18=;
        b=D9FuKIo3JLzzfAt0Fzui2cjDV/c9gzTAzSJAksl5rI4gsD+cLi+dKyFo5qGeMHZONf
         Q8JDM96Qjgy/3/JOjiJhI9KAm5Nnv5EyNjOBmN6TODkvyzF4pUbyHuYaDA8up9/4pEJx
         BG6EzM5/rK9xmOTIBd3qD66saIq9kBy/YC4ngwHEhlIkP4GCKofl5bnLMPirctCgZMUX
         uzfDxpsG/KPTmyO6KL1KThOPGDFykalaP2gH52V0XjndLw+IOdvsiHHHJktZfl8Xhk8N
         t7VyCrDHpXx2BL1jy6JDpYg9ZzKvKXl+lSEvkwGAgG2D+jfbAHbuImWQOrh8uKvU5CS3
         8r8A==
X-Gm-Message-State: AO0yUKW6sgbAFZZ03sa8JhU0yA5jC79TvPj3J6SNHBdeqqMLckJyB8ZB
        2TIJBauGHWIKIVxOHDILuq1nNg==
X-Google-Smtp-Source: AK7set+j5AzguT+wPMqJTKHp23ybKVMqcUGOXK1UT3NyydZuoWzKn02WTplOAHKPGXm8wetjgNETZA==
X-Received: by 2002:aa7:96d0:0:b0:5a8:515a:eba4 with SMTP id h16-20020aa796d0000000b005a8515aeba4mr6768719pfq.10.1677038600006;
        Tue, 21 Feb 2023 20:03:20 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6764079pfn.107.2023.02.21.20.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 20:03:19 -0800 (PST)
Date:   Wed, 22 Feb 2023 09:33:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     treding@nvidia.com, krzysztof.kozlowski@linaro.org,
        dmitry.osipenko@collabora.com, rafael@kernel.org,
        jonathanh@nvidia.com, robh+dt@kernel.org, lpieralisi@kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, mmaddireddy@nvidia.com, kw@linux.com,
        bhelgaas@google.com, vidyas@nvidia.com, sanjayc@nvidia.com,
        ksitaraman@nvidia.com, ishah@nvidia.com, bbasu@nvidia.com
Subject: Re: [Patch v2 7/9] cpufreq: tegra194: add OPP support and set
 bandwidth
Message-ID: <20230222040317.r2p6zlbumazymluc@vireshk-i7>
References: <20230220140559.28289-1-sumitg@nvidia.com>
 <20230220140559.28289-8-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220140559.28289-8-sumitg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20-02-23, 19:35, Sumit Gupta wrote:
> +static int tegra_cpufreq_set_bw(struct cpufreq_policy *policy, unsigned long freq_khz)
> +{
> +	struct dev_pm_opp *opp;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = get_cpu_device(policy->cpu);
> +	if (!dev)
> +		return -ENODEV;
> +
> +	opp = dev_pm_opp_find_freq_exact(dev, freq_khz * KHZ, true);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	ret = dev_pm_opp_set_opp(dev, opp);
> +	dev_pm_opp_put(opp);

What about dev_pm_opp_set_rate() instead ?

> +	return ret;
> +}

-- 
viresh

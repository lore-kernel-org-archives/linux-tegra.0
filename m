Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F16C6FD1D
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Mar 2023 21:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjC3VPA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Mar 2023 17:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjC3VOu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 17:14:50 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55614EF9C
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 14:14:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d17so20407293wrb.11
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680210882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svitRmAwfjSzCiTV3iUGu1W95ui5xUmfJsnHH3NKzfI=;
        b=Rss+c7+JE5WyxT+VVG/iOwxZVc8YNHKmivBSMRMVaBeJ9bdsZX88XJniTyN8h23gsX
         ypDL2EQadCUGFEJqsAPaRGz2BiGTQxSx/dn0UI3QB0tJJbNZJLzumZPkKbipUOWVlQIc
         B5P/iN4aTa397B02f5L8k4L2E7Ta8NeckYfzZ1dmqZls10f5FO6swRQcVPBQ+1Vw33nP
         S6/nUbYIuYag2O/V1N0g9hf5b6B+U47nDXZfAu4GMBf3r5DGoBwgG0D4N8jmnV8dVdGQ
         M6A2BO94NIUMb78mrE7oI0zc1V3mirIgu5L1oFIEq5VtDwPp+7U2LJOeWth8n95TWXQx
         zuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svitRmAwfjSzCiTV3iUGu1W95ui5xUmfJsnHH3NKzfI=;
        b=ou5/AU0gbfBCyFxRA1BDPYDmfoCL/Ne3f8YD/ZiHvuLo86VaTbXWTANTydszP1t6jF
         k7UHMIOKsKXCZs6Z1L+xCwEC6ndKzkTNmbdaQgDEMUnZqWTMDPxaCr7n06aLTD+j0UhG
         zv/7Y2Csxnz4ByMrCuIH8mnSnoR01V6sll20HjfAPmhTYlhYdW4/vcg3cKAvybfsN52s
         XgqlNaVXLokUe1C+JJNpvKQy6oxWTeIEQuk9sQ+4ANIV45fvJOBOMYOepEIQSjNjMtaT
         NHxHKjSeCh71zIMj96GsnJ811KpiVqWrbQCImnAOkb5kjQd0vDu3/nteXvBWhaLdm7mY
         Dl7w==
X-Gm-Message-State: AAQBX9dXZEIUy0njLt1vq7JEhGXDqETiyuAT8zD6dOIydsbTlE5hwKp5
        qxH9sK5RB1eAsUSyeSDiguq70Q==
X-Google-Smtp-Source: AKy350YaiKIoamW1LIp23ecuuhJKv2CmTkC9MN9Posn6KiVuywUpfE2+nyKS9604rK8MW3YV5PxixA==
X-Received: by 2002:a05:6000:8a:b0:2d1:e517:4992 with SMTP id m10-20020a056000008a00b002d1e5174992mr17772196wrx.69.1680210881643;
        Thu, 30 Mar 2023 14:14:41 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:17ff:909e:1b73:8366? ([2a05:6e02:1041:c10:17ff:909e:1b73:8366])
        by smtp.googlemail.com with ESMTPSA id t17-20020adff611000000b002c5a790e959sm376235wrp.19.2023.03.30.14.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 14:14:41 -0700 (PDT)
Message-ID: <f0d51904-d363-cb76-cd6f-f1ebefd0aa5a@linaro.org>
Date:   Thu, 30 Mar 2023 23:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] thermal: tegra-bpmp: Handle offline zones
Content-Language: en-US
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230330094904.2589428-1-cyndis@kapsi.fi>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230330094904.2589428-1-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30/03/2023 11:49, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Thermal zones located in power domains may not be accessible when
> the domain is powergated. In this situation, reading the temperature
> will return -BPMP_EFAULT. When evaluating trips, BPMP will internally
> use -256C as the temperature for offline zones.
> 
> For smooth operation, for offline zones, return -EAGAIN when reading
> the temperature and allow registration of zones even if they are
> offline during probe.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


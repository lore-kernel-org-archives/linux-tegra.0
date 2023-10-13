Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C398BCDB47E
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 08:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjJMIEi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 04:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjJMIEh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 04:04:37 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E18DA
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 01:04:35 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4066692ad35so19022515e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697184274; x=1697789074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oVhznh5ySaCITk6uUsd0gVfsZrYmqi620mDBOnSkgE=;
        b=K31duJoe56u0w54NAeMc6te01AIC3N17mKrTKGY6mvukNSDU5evPg4dl1Ufa4Yytr+
         H0S6dU9GLdecBRcxKteJX826vo01wtOVzTZi98VWePbsbIK92gLObdZVp0TH9lt10oV7
         EsB0GNtCOmWbhZq2gQ+9o3F3TVHEE1+I5UUYgZ2Retntp9E3ShK4EOnpqHM/7B9VgqXJ
         JfRM4WYU27IWniVehHegrw7KmOgWJe/ji1AmUpTketZMLDQZmtVXhpStMQHcdBGVooiR
         +TPa4G3L67mdHBXo+B3ZHGjjhearB0aDTC/+jNIQ6bSLcXMuzkWm5x4XxZMWRwHEEiQG
         7B5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697184274; x=1697789074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oVhznh5ySaCITk6uUsd0gVfsZrYmqi620mDBOnSkgE=;
        b=Qycr5c4iADEq5yXgZglRRR6oATveul9ycA2ZJtw9gIJR8FbmZEBB8MLN5KGwLn/Y8T
         KCoW+QdRbQdInxVjRT5W/flKN+hHTX2NZpg1jNbSlSLoxGeivee4Nku3DvwNdmteuNT8
         ycBaNhffU6lFe3Qfd0muzN6jgMFc1Y+bV1ReACyPcMaQEigbHgdH8mYS8apSFXdZYcVH
         S343U4/SSTcaXqdxUL3qiNAhC4k2gZ6mo9Pn8OReyVzQCRdOCoGSYVUJ33ElkL1xVbEX
         UqduZNKFYNjJxdrLx7ZUmz+rChtF5umoava+IZq1SSsnvpswdVwLp82U8dqaKl6w9R2T
         2M9Q==
X-Gm-Message-State: AOJu0YzrIwpleLuGaqemlhbppDF5nc3VfpAB1o7wCha/vN9Na0UxHkaE
        aou17yhgQqJKXFecnW6q0wsYqA==
X-Google-Smtp-Source: AGHT+IEY+YdginKOKbt7XjrFQw/JmsnmIDsYLonWOqHU1C0wPurRswbnevHMG+OjuJH3csgNEH7xww==
X-Received: by 2002:a7b:c7d7:0:b0:3fd:2e89:31bd with SMTP id z23-20020a7bc7d7000000b003fd2e8931bdmr22943447wmk.14.1697184274113;
        Fri, 13 Oct 2023 01:04:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id t14-20020a1c770e000000b0040303a9965asm1850318wmi.40.2023.10.13.01.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 01:04:33 -0700 (PDT)
Message-ID: <24073646-373e-452d-94b6-3d91101ac5e2@linaro.org>
Date:   Fri, 13 Oct 2023 10:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] thermal: tegra: Use driver-private data
 consistently
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20231012175836.3408077-1-thierry.reding@gmail.com>
 <20231012175836.3408077-5-thierry.reding@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231012175836.3408077-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/10/2023 19:58, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Instead of passing around platform and plain devices and figuring out
> the driver-private data within each helper, directly pass around the
> driver-private data when it's available.
> 
> Also store a pointer to the parent device in the main driver-private
> data structure for easier access.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

[ ... ]

> -static void soctherm_debug_init(struct platform_device *pdev)
> +static void soctherm_debug_init(struct tegra_soctherm *tegra)
>   {
> -	struct tegra_soctherm *tegra = platform_get_drvdata(pdev);
>   	struct dentry *root;
>   
>   	root = debugfs_create_dir("soctherm", NULL);
>   
>   	tegra->debugfs_dir = root;
>   
> -	debugfs_create_file("reg_contents", 0644, root, pdev, &regs_fops);
> +	debugfs_create_file("reg_contents", 0644, root, tegra, &regs_fops);

(Orthogonal to this series) : in case you are not aware of it there is 
the debugfs_create_regset32() function. That may make go away a bunch of 
code related to the debugfs code here.

cf. 
https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/tree/drivers/thermal/mediatek/lvts_thermal.c?h=thermal/bleeding-edge#n159

[ ... ]

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


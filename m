Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5870C07E96
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 15:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99282613FD
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 15:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhGHPW2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jul 2021 11:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhGHPW1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jul 2021 11:22:27 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829C2C061574
        for <linux-tegra@vger.kernel.org>; Thu,  8 Jul 2021 08:19:44 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t17so16860408lfq.0
        for <linux-tegra@vger.kernel.org>; Thu, 08 Jul 2021 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ltGRF8gNSkUFBj1/BeQuxMmiUaBau3JYn07hxVNPo4E=;
        b=gRmL6zTtsTJU/jwp+Em4jJEvTOlYVpvNz1TjW1Ns916W8uFhJWA+VIDCYa8tVQoCYD
         pV0/q0hkA0V4JQIXkHJlnzUYgQ3DIrnYjnOfiN+BSd1yCZ5E8N7dzNS7A2X65m+qV6vs
         R/4G01k4rO7VnXAbK7BPtlC/gbC3Zar8RQ5IQYyFJnAEcUUYVjRMhJB82B+ViNUPSWSu
         pbXCvvs10lG53GcWlJPpgACXTSsaWNWsfau3aOq8dJyxqzBqiit7/7F/xS9HIw2A1JyY
         TTaH0inakotwvnJCAPqpZCgWeZmc9BcvpYh8Rv63YORG3w6+9U8+eqE4rIQZYlt4aED9
         3Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ltGRF8gNSkUFBj1/BeQuxMmiUaBau3JYn07hxVNPo4E=;
        b=cPqrirQJOwm1zx0lIjVIrqx9XX03eJl2Zvc1jIixUgQSOA4wITRCUt/5xpqeqDh0zQ
         TY1QQN3ePRNAdDzfGzv4p5Iiy+HaU6pPu7mUR9Y09l2C0XbxksZ0Q04M+hPkkistc70V
         0oO3XRHHEhw0jZCY9/zuZk+LJMvJNMSHay8TUulGcUgNDBw5G4vfAf8W8c6edm+ljXAE
         TgRfIx6zNnXcxYFRL0/qnLerq0n1Caghmstn3Qu3DL73k/qhelB6krZ1YFyHfNdIxTMK
         TQOqFTyhhU+7hsE6UgiWTSCVvH8oQf+7zAmautT/67X5D1vUoEgPRdui52r3ybLKb4Yo
         yHlQ==
X-Gm-Message-State: AOAM530EiVtPDoG3YYTjqvJfV72cpxmliLkzM5TmeqtqumBkgOt8YoHg
        XKshTYaqUmahUoHxzIjFBN6pxKHRyrw=
X-Google-Smtp-Source: ABdhPJw74h65mEH5RprFDkIZ6UrhrlbCH1T9jGMuLWMGsvCHjW7l9sKtw2aZmSEsRUIFHxJvIodL+Q==
X-Received: by 2002:a2e:b893:: with SMTP id r19mr24590443ljp.322.1625757582800;
        Thu, 08 Jul 2021 08:19:42 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id b9sm223150lfc.42.2021.07.08.08.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 08:19:42 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: gr2d: Explicitly control module reset
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210708143736.2018135-1-thierry.reding@gmail.com>
 <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Message-ID: <620f948d-4871-e038-8d35-40308bad01b1@gmail.com>
Date:   Thu, 8 Jul 2021 18:19:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.07.2021 18:13, Dmitry Osipenko пишет:
>>  #include "drm.h"
>>  #include "gem.h"
>> @@ -19,6 +21,7 @@ struct gr2d_soc {
>>  struct gr2d {
>>  	struct tegra_drm_client client;
>>  	struct host1x_channel *channel;
>> +	struct reset_control *rst;
> Unused variable?

Ah, I haven't noticed that it's struct. Looks okay.

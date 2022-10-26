Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604A2FA373E
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Oct 2022 14:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234500AbiJZO5i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Oct 2022 10:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234414AbiJZO5P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Oct 2022 10:57:15 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3DD120ECF
        for <linux-tegra@vger.kernel.org>; Wed, 26 Oct 2022 07:57:05 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id z17so8038838qkj.8
        for <linux-tegra@vger.kernel.org>; Wed, 26 Oct 2022 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H6Eev9tNY1EscvH33xpILTCRgvvIkcCo5fp9pBkfKp8=;
        b=m5C802ytAi1yN6R+djCEaxTwKcotMupBTDIO274nqvY1eZdUdsqBOGHxfWnI8xbmHn
         fGx+40jhXY2iZIhtqvCBILEfdu1/AIeEJZ9g+DOjzRFxUwOZCQXFzGJbDWN6yb2lQjZC
         ATW9ABu1qGT8J6nB591VFxbFsPeQiWsYt+5WD8dK/aplCErYvYtoVNwEbIxzXxVhATGg
         lZ58Z1Wo22DHv08xmeCe1VJYMZ+T/p5IpjASEBeih4myp5O4mtgwZZAvyt1+mV+lfN4f
         7r2MP6uSLlpK8j9IpiiHr+2udJrY5F52fAvvd4JYMqTJE/CoW3XbOtKheMZfL0E/sslv
         dQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H6Eev9tNY1EscvH33xpILTCRgvvIkcCo5fp9pBkfKp8=;
        b=NOVG5rCrWycovmJNvdWznQjSjkI5zxIwd1GW4i9dub4YWsg/0dz5ujoo9eD30jNGNt
         kaKJvcxGbm2kt6G8Fae2eL4DMhgRAQC5xPlCckb77sZZr2RwD/jT3eT8zKUaUC6HJyQ+
         +zWKxE3OYdVCYBLOcwq/QxNVnZRiD1zZNH7yBpP5Rtt9B5khCtM22BYSC4oqqEQ/yeQr
         Lu4E2mPi09LvHIorzZg8z6NVyHNpg6YOLfhIIiER3hEx1L0oCxYSrjQyZPoGc1cAp6Vs
         9aH5StNItHmWM3UgNZP2KGOr5rK2BQxRNwionBYO8x/7FB7qV/9covNUQWtPkb2aN132
         3fnQ==
X-Gm-Message-State: ACrzQf2T26SuKW1inXLlSnGVVDqJecdpXDxlL0Mlp9+sB5Dbvuq9i2PU
        yxnsnOW+bOT1vz2pstyozhUFgQ==
X-Google-Smtp-Source: AMsMyM6x/mkMzmJyWpbQqAZPzcgsywdXT8wCsrEckQU9qfFg2x7F6MjMaHwNDxr0UoDFRGeW1Tk1dw==
X-Received: by 2002:a05:620a:c12:b0:6ee:d3d0:fe20 with SMTP id l18-20020a05620a0c1200b006eed3d0fe20mr30450314qki.470.1666796224582;
        Wed, 26 Oct 2022 07:57:04 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id r11-20020a05620a298b00b006bba46e5eeasm4233394qkp.37.2022.10.26.07.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:57:03 -0700 (PDT)
Message-ID: <ecd2a50a-5017-23bc-7da0-73a5f240e97a@linaro.org>
Date:   Wed, 26 Oct 2022 10:57:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/4] dt-bindings: display: Add bindings for JDI
 LPM102A188A
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
 <20221025153746.101278-2-diogo.ivo@tecnico.ulisboa.pt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025153746.101278-2-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/10/2022 11:37, Diogo Ivo wrote:
> The LPM102A188A is a 10.2" 2560x1800 IPS panel found in
> the Google Pixel C.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


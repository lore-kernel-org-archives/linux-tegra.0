Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD53C25B6B
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Oct 2023 00:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjJZA6T (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Oct 2023 20:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJZA6S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Oct 2023 20:58:18 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F13E5;
        Wed, 25 Oct 2023 17:58:16 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4a403fdebedso169586e0c.1;
        Wed, 25 Oct 2023 17:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698281896; x=1698886696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdYFjAzOOYN5oRUxBefG+Kgpog1nqz5V+k6zzEGqHT4=;
        b=LcPYZJJujfRlf7JIGiQWVEq2+ZziJAjvCgQctvP5uE/oJ2oBY9G9HWgupUM4HTrJMX
         hWn28OL2LgVq55wsZskFqpRRWzuerKdm9jWw898TcE1Piak5o9yxU03fIADexOlMIltK
         FoUkPuMa8M1he56e2Put1DVi/N/tozY+SMA8gVgqErqzxytARaUW4oX33fEvinbiyf2E
         4grHQOm8vIGLibYxtmqv3IcZfjvHQpzxYSEHlJm48f6SJ6uQxJmeO7aF2L5rBkoC8A8a
         K1tAEDVPYd3aPOU+Uh8R54h+awZJZJMMehpjLXqydeuT1d74C7ojhkssHjADk7Ma0sXH
         QhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698281896; x=1698886696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdYFjAzOOYN5oRUxBefG+Kgpog1nqz5V+k6zzEGqHT4=;
        b=QepTi/RcXOz9wFBG4Z4J7GzVw23ZgZ8toZatAzeW9pL643AY8JMUehpkbyyEmplLf9
         mzBFe20719UUP8y44l4jBQcrFBPL3OQ9777GqER1RpdpLsWtcmzJ8wO/LTjIL8Zfyvwx
         S6yV+836JM7A16lvz1U8SNqYN4S6CjzkRzs09ynoPHXQlamhUErNbxkoEivuK8mMf5AT
         7exKoe9WxdFQdEQWuynK8bhGpxQLunudDTlR8hMAQ3L5EvtVxpG/BPlLNUEvu5sHgphb
         5oX6CnFYMnmip55KluWvNZa6d85EeOAEhynuhLLuehvUW3uBz6sSTOcV5tz6Wv9u7ikD
         sADQ==
X-Gm-Message-State: AOJu0YxaM7PGIY4f8h3CgU7HlVFDrWz/ZvNK0m0dgFvmMTMRHaFi0u9T
        VBpiP2xSerQbn7Douwv+b8M=
X-Google-Smtp-Source: AGHT+IFx10g6y/YQxI1ofYFocjdct+E/Fn/oERCg/4WMF0iz0iwR+hkRnxNa0HZxMFDBZKCYwlaURA==
X-Received: by 2002:a1f:1cd4:0:b0:49d:8fc1:3fce with SMTP id c203-20020a1f1cd4000000b0049d8fc13fcemr14047411vkc.0.1698281895794;
        Wed, 25 Oct 2023 17:58:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o188-20020a8173c5000000b005a7dd6b7eefsm5508796ywc.66.2023.10.25.17.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 17:58:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 25 Oct 2023 17:58:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Ninad Malwade <nmalwade@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH V5 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Message-ID: <c17f1c01-27ff-4c66-aa1a-321bc05e0570@roeck-us.net>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
 <20230929103650.86074-2-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929103650.86074-2-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 29, 2023 at 11:36:47AM +0100, Jon Hunter wrote:
> From: Ninad Malwade <nmalwade@nvidia.com>
> 
> Convert the TI INA3221 bindings from the free-form text format to
> json-schema.
> 
> Note that the INA3221 input channels default to enabled in the chip.
> Unless channels are explicitly disabled in device-tree, input
> channels will be enabled.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Note that checkpatch complains

WARNING: DT binding docs and includes should be a separate patch.
See: Documentation/devicetree/bindings/submitting-patches.rst

but I take that as a false positive.

Guenter

Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3B7CCA47E
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jun 2022 16:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiFXQCK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jun 2022 12:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiFXQCF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jun 2022 12:02:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED7552E49
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:02:02 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id o8so3736903wro.3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=46fj+UJF99kTFPBT32r985RsfVjZGl2LSfFiw6tGANo=;
        b=ebcQYv0emdVVWOAr+fH88T/wu55UxnCnFHW4hEJgrm2A3IR4wtQ6tMVCkVyneR2ew1
         DjMliG2u+nREX14KGIryxKBFdKJn9RqAJ1SO8uQZ11ZMB0cQ3Iq3ThQKSHnNUDjpiqv1
         1/61o7jT6CaUnwX/fSqbqTzvs/jzDJNx/kUrUAV8fdwbeDv3gha5Lp1I5lEWQKHgAqK0
         zwdRYyASfWuMl2Zlv9f5l2k97tYC2Xh6e/RMuoN7UDnG88JSKDpKQjn60WmhM7A5UpiT
         yEsFrw2BmifwUDY6O3Ki/UJboG6xwjEUmDT+Ct5Sez2Oqx0Rc8aHfROswKlBkgGtI9M/
         TexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=46fj+UJF99kTFPBT32r985RsfVjZGl2LSfFiw6tGANo=;
        b=AIeykZrB3Gz0Rr7tys2zaSUqRqT46D9+laOPGOnHgTLhyY6aYF7BYKAmZ/eATRS45q
         fJ9LJUG2RSzma0tzjaTE+hjlPBulZRJys3xPRQ9ZF7sVhN6/U9EPqGTi5IJZFmrRI4kU
         2tz/AeLfeDr+mjrSNYKoCbI+5rANjn8MGzueYR0fjv6jDWCCsYJAL31Wcfus5OQcTCcA
         xIrVsbf0rD332fPifrEw6zIHo8IO1948osKN8B9qC7MFyJb1ZwVFh0UA96Pj3lRB2Kqa
         enX2ce8Xv4PEWwPWHMHkOBm0nvMNTr8hGrzlQwIZ/s5HJkxo1HfL6bcIVisMzgYpA6nU
         3bBQ==
X-Gm-Message-State: AJIora/y9DnTMLs2K4RUFOWy3dSjWX1vmt6BHiOXY2prkfpqmSyAucaj
        ApNoI7QS1NsKrbkmQKoFHGGinU/kAb58Dg==
X-Google-Smtp-Source: AGRyM1vBnYbMBo+bqFkjGK96XrB4066YHdRQQQzg/C79EYzSRJwJS7+8MI20wKyonIEWmjhJbuj33A==
X-Received: by 2002:adf:dc91:0:b0:21b:89bc:9d5c with SMTP id r17-20020adfdc91000000b0021b89bc9d5cmr13956357wrj.159.1656086521327;
        Fri, 24 Jun 2022 09:02:01 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d4ecb000000b0020fe61acd09sm2647767wrv.12.2022.06.24.09.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 09:02:00 -0700 (PDT)
Message-ID: <e0dd7045-dd39-0a47-30ef-839f287dd445@linaro.org>
Date:   Fri, 24 Jun 2022 18:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH net-next v1 1/9] dt-bindings: power: Add Tegra234 MGBE
 power domains
Content-Language: en-US
To:     Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kuba@kernel.org,
        catalin.marinas@arm.com, will@kernel.org,
        Thierry Reding <treding@nvidia.com>
References: <20220623074615.56418-1-vbhadram@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623074615.56418-1-vbhadram@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/06/2022 09:46, Bhadram Varka wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add power domain IDs for the four MGBE power partitions found on
> Tegra234.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

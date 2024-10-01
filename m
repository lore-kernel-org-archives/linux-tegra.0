Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96AF1BDAAA
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 20:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727814870; cv=none; b=fas1bh2E/XqVvFXELPY6neJ0ywEbK0f1BC2Djhxalhwif5oAbWulIrWkjeBzukbRbxqlBzD1a312cgjq5w+J+sIkOF+fj4lleHuWS4gB4lmMQACpr6ypXlk1ZdIkWTpumKMkFg1hWpwgQEBwJ0lWocU/vmrP3mMQ/BdoTrxXrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727814870; c=relaxed/simple;
	bh=twyWuEH7ZNZ0FxF8hSQLE0IYI6L5y5QkWu1i6eGuckA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VmDxrOjJy6m465jdkzsYZidY07XoJ/sS/3tEwpAkSHwa3QYwEvgZNAi+ujZx/YhBb9GI3dF0kS++kt1ny5a474Mn8SpMVFSevNgaxuZEe8JX5PJ9wuXzTsy7JctK3KmDRMo4zzuA7Sifk/Awat4GaRoUaYaDGwfLxA8RUQ6FDr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cKid3GhR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKid3GhR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cddc969daso8684975e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727814867; x=1728419667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUhsUIUdDrwwZHsNvPFB6O8FHHi07d0Hdx096Y1IBPk=;
        b=cKid3GhRDPMPuQ5KfUc4Geqx4REWp8hPO1+ifp0/lcAon7z1/w4S0Qw6kfaFiwXdyb
         ycjkJKzSRr7jG2KIv6F1cNJ1kwtmrAmcmHooB4jtFqVWM8kEBA62kr7DlDcrIc8jKrGH
         rcH5WraWtny60h474kX5L04zqAEy2W286bmCMT27asmjxYnXMpp4N9HOHoiQChoyLOjk
         mBLtk+xjrquuC8Yi4W0GFRXh7cCfFvkbWrB3Gzc84TJcV8/b8w3Rx0TM6NubxGSQUlSR
         PaxlpLgScuOOg7ZWEz/cX1vwJ9puEpgb2FcIovJ7/wP2w6y06CSDBT6zgT75aQMk+Xy/
         qrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727814867; x=1728419667;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUhsUIUdDrwwZHsNvPFB6O8FHHi07d0Hdx096Y1IBPk=;
        b=C2V0TK8PTqCirRu5GumIIekyPyPg8z166RDMFgaW/ldD/JUJd8eW+GEpzZyQSrpla9
         8S62woBpYZKFSO53F2bBEvkT9Z3V/iizk+Wsa+i6n7YJ7AGkkwuIrysjRN4QdBalh8fp
         4/QIOfTGXGKrL6aESwSwaXOSKxqF9Hj9w7zt37vrQM9J93GmlkvjUGI3c5OgtwZD0J2F
         QbBYffR2s7Mf+OX9lrKx44CgcWU4fwi0U5t38MptYVbK7N4RHylwRelcuPDYFxlO/OTe
         b4B8ocWb1kvgOKEmfvQa0PNYZqbJABFzfpL+IK1VfkkCiDGCVuLQjLtPg4bvQIqvrRWd
         8g2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXjfB6cyskfpdHVoTbUoX6dh8O6JyL7b6BihMqail3I4k0syoYDFBliu6VbIjsFkqQ69Zcpuj1Wjt71w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTn9ZZXq+u7BuIrF+GdK5Xdt+hu79Vtml7QZY48ocL55aTTIVd
	WAeyzEDCJaxVy5lkmJVxouhwsBtoFyj4VOaRW2alZ1TKnBVk0xmXw8AuE0ThhKo=
X-Google-Smtp-Source: AGHT+IHjnrkFTsfnoO1YYJ4m7JpOk2P9PAv+wj6ATG6VN/ZpgMn+48M1GtODuGoKAnonLaUv69c1nQ==
X-Received: by 2002:a5d:63c2:0:b0:374:cd01:8b72 with SMTP id ffacd0b85a97d-37cfba0a5d0mr221218f8f.9.1727814867007;
        Tue, 01 Oct 2024 13:34:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd566a41fsm12614134f8f.45.2024.10.01.13.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 13:34:26 -0700 (PDT)
Message-ID: <c15b73f1-6045-499e-8b4d-6cf8140e7de0@linaro.org>
Date: Tue, 1 Oct 2024 22:34:23 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: tegra: bpmp: use scoped device node
 handling to simplify error paths
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240816135722.105945-1-krzysztof.kozlowski@linaro.org>
 <20240816135722.105945-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240816135722.105945-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/08/2024 15:57, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/firmware/tegra/bpmp.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index c3a1dc344961..2edc3838538e 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk/tegra.h>
>  #include <linux/genalloc.h>
>  #include <linux/mailbox_client.h>
> @@ -36,27 +37,22 @@ struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
>  {
>  	struct platform_device *pdev;
>  	struct tegra_bpmp *bpmp;
> -	struct device_node *np;
>  
> -	np = of_parse_phandle(dev->of_node, "nvidia,bpmp", 0);
> +	struct device_node *np __free(device_node) = of_parse_phandle(dev->of_node,
> +								      "nvidia,bpmp", 0);

Uhhh, this is very strange.

Above is correct code which I sent.

But look what was applied:

 struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
 {
+       struct device_node *np __free(device_node);

That's very different.

See commit 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped device node
handling to simplify error paths").

Commit msg does not explain at all why my code was changed. It is not
only a courtesy but also requirement to mark changes done to commits
when applying.

Shall I assume more of my patches were silently changed when applied,
including adding questionable code there?


Best regards,
Krzysztof


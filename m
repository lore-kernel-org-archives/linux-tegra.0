Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762C32C90
	for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708347470; cv=none; b=GkpevtKapix7igH+CBrkB37VslSbq8WIsjkF9QUeTSlADDD4sYwvMUFSQKal8yVJrNM+yl7VRpFEULn4C1XdXLMMZkulS3hNlGQeIMwL8XBDIwm6xgrZ1yknexgO2BGtIKuHjbmG0I+UwOA3J7cqOemd00JZ7rNxQctABUhTZY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708347470; c=relaxed/simple;
	bh=VWE+070cLPL42VsnZkFORLRIeMm7/8iMBEhUv+muevM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cldJXTloW9mn4rCNHuC3h4BxrzhTiOcI62hbO69wwlGPG4cgOhZImfdxKlkqPpv+bjgsIhfrcl48xnJpZXy2Kht4vc3Mm+9FPub6XJ/qWeOTVTu2vAn9cGaq7N2FZWUMXJVtukN9mQfmivhW+cKLW1dxMBHwNu6KCm79e5uVIqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9YPB78Q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9YPB78Q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4126144d931so11325025e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708347467; x=1708952267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/0liLg/mUigcPGQFv98u4Vc6LRsnaOWo7Lz9ZMkizs=;
        b=d9YPB78QrkP8rpRWOY951e3pWlMEc6wTcFA46dawzzvTQRkhlN0AHpX/aY1Q2Zkx4v
         2EPjvJIjPmpkeRGKtA7YqEdAf4LvLE/L3UUNyIE3QR3TD/Al+OiAg4j9whQgeNnlNA8e
         m+4+QQDer23BfIkxu5KyrIB5DHBZSPv5jJDdW4YZf5xUSE1GAhH81Pjbwtqvj7B+TdNJ
         bIj4pO792B8QbB96WDomD/WfHHlgzp9574Wi0iQ3O3SdSK+oxBUv46Cq2cLsxgNL46EI
         f4YELDcpda46MsP44jJkn38UbNVv6u1lt5m3EY+A6I+UaSi4RcMFZVfxPPkKYHz6Q71u
         Sr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347467; x=1708952267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/0liLg/mUigcPGQFv98u4Vc6LRsnaOWo7Lz9ZMkizs=;
        b=LxUtPkc8Y1CSEsJoszefpTMg0NVc8D/2tUP2tZiIeMDZYwI34tR+NjXeeHYnFu1OBs
         YLpRc8/cj8QV19Kk4ypF2MdR72hqgR3J5aHxWzKvLDfb+8PxnYRH6Ev14cC2RDIUy9yf
         0ON9v9Uoho3lPogsFsb+y+b8TaKqPhHbuWO9ivI4VcmCS+GdE9PP9P+FQ5W/Ipsst2NC
         j/e+KdHQwM7Gb27rFvoySIXC/MZmB9VtVAP+dTTkIUdyH8dMLZIBoM6sxndUFs1vd5hK
         peJO+K3KoOMS7sAyeWAndKOL6UCAYFkuM/MBPqJRs5+8NcnFlMmggIwcdFrGSqjZvKJg
         CCfQ==
X-Gm-Message-State: AOJu0YwD8egzAFRR5k6cpAWZCgl9xTPwdqh4n973TTEvcBYhWRrsUgeC
	krj16nzpoySJrMeqBIqXoPuv29SVbwlzHoSx98olDWp+VfpJKDB4XUAU6mrU6VLk8ItNcz83oAc
	M
X-Google-Smtp-Source: AGHT+IHDiJQA035Y8oLqXdFQx5f9XUeWJvSKI1vKIwIsHrZUZrsY0nXDckpkIH0dak4l9hPK7guNqA==
X-Received: by 2002:a05:600c:4f10:b0:410:cf4f:68c6 with SMTP id l16-20020a05600c4f1000b00410cf4f68c6mr8385944wmq.26.1708347466949;
        Mon, 19 Feb 2024 04:57:46 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c445500b0041266f5b041sm2798415wmn.34.2024.02.19.04.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:57:46 -0800 (PST)
Message-ID: <28179099-ea5c-4d57-9048-515832f946af@linaro.org>
Date: Mon, 19 Feb 2024 13:57:45 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] memory: tegra: Correct DLA client names
Content-Language: en-US
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
References: <20240216123057.33018-1-jonathanh@nvidia.com>
 <20240216123057.33018-2-jonathanh@nvidia.com>
 <fa429d30-088b-4fba-9b84-cfc6b44f65bd@linaro.org>
 <090e71fa-a20c-419a-ad08-a2c692c2d76a@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <090e71fa-a20c-419a-ad08-a2c692c2d76a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2024 13:29, Jon Hunter wrote:
> 
> On 17/02/2024 10:06, Krzysztof Kozlowski wrote:
>> On 16/02/2024 13:30, Jon Hunter wrote:
>>> Correct the DLA memory client names for Tegra234 to align with the
>>> memory client IDs.
>>
>> That's a fix, so what's a effect of the bug?
> 
> Right now, it fixes some print messages in the driver, but we really 
> need to correct this before adding interconnect support for the DLA 
> clients in patch 3/3 where the name is also used.

Would be nice to mention in the commit msg the impact of the issue being
fixed.

> 
>> Also, all fixes cannot be after cleanups. Put it first in the patchset.
> 
> Yes indeed. I will re-order and update the commit message for this change.


Best regards,
Krzysztof


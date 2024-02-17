Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D51D547
	for <linux-tegra@vger.kernel.org>; Sat, 17 Feb 2024 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708164411; cv=none; b=VtNGBoE3wvRr6hpUoWLGICMUBfpRNQuiVyZwytL7JRu3X7KIweM96SMYdd8JmyykwyNJiPHjhtk8pweZtUU3crGP7NOZNro0Gg5xFsalurzIwEyi/i0/zmJMU9qjchVOPPFkLa2TPlqDYJGjKGBBVDObyM1WoyuVmk0xTf/krB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708164411; c=relaxed/simple;
	bh=o+GCqYB3yP4GxyqIHnI0Gy4XBNhbO+eYKEH30r6bHZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eY8G0ZyUtWcJx8iPO/5W9316dJ++WMymBl+19p9Wlu2RxKeCZKQFRXkfAUuE83ASJfNIuwKxrDDuk7sMFIh0tVr84eDZ9rB3LU6uHHhSb62pYYUDjV0aSUlnMB6ovi9ABX9ZxELqtWj236sBkmSSEsayN/83JDwLaHd7HiXMgl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ISVoOr7F; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISVoOr7F"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3e46cb8ba0so1026466b.3
        for <linux-tegra@vger.kernel.org>; Sat, 17 Feb 2024 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708164404; x=1708769204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+GCqYB3yP4GxyqIHnI0Gy4XBNhbO+eYKEH30r6bHZk=;
        b=ISVoOr7FbHC6dysLvNFqLSjlAT196Kd6iWHdsDPwYj1oaEXu2yjA6U8xG9100weaVN
         I/wcQGJF/yiAWdhoWmK9SB+kmyJpWRDgJB2H1kZfkUVzI5DQLm5DTNjabZ+gdUMpvWXL
         ly4CScPdS1aCPmKmdBAj19lZHoBrPteTFSeUvgVBi+zVHnosXuNZHNJGirHvRYewH8TS
         GB8CR9mlZ+zhmy+wNHQb+Uz/uFNq8ytBEj21h7Ypg0qg5u4gjBHs6WrdHQ9X6wA8ghZi
         BN+5xw0IEgN7fAZ9NbmJ6HC92CpcDBGneAzAfNspbB0XEGx7Uln+5W5hQoTqIDmNftGH
         dNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708164404; x=1708769204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+GCqYB3yP4GxyqIHnI0Gy4XBNhbO+eYKEH30r6bHZk=;
        b=iffbFGLwuiBJcYkwQAIy+hVP6EYVJmwiy4X7Smi7W+qiy8+qfPZyeaUu0u7mCwk7/8
         9cQ8CvKU8OH7MIxr5l6HkslRwEfhAv/o6k1PoUOO62QkwGaLJ3bT4XWgxgQAZIdlEcOY
         MOrYnPjX2+XSi916MC3QEKyZeal5rJ6QUkr2nwlXK0H6PBazKKHi4nyt4O+kpjPO2bOv
         UO9D24H8OccCSgQIotUA9bnuVB7UrVgy1wAS1PhvFWEmi6Fc0crFpQeEmt/EbkuZe9yr
         kV7yUhues9eaSUN7acvIVMO4vSKNSD9n/TaTFCb8wZoBG+rYArlwarA1FEFjDViufQ3z
         rkPA==
X-Gm-Message-State: AOJu0YwZZQQxsteMVE0hB+ZEnM285jm7rIczOoKIQWfS4vnFUs0/Pce3
	lmsehhhEaFNAo3n6hISLrLFVQg4O28B5gvlCkp+6TjtJbpg3a+FACo1tkAx3Cew=
X-Google-Smtp-Source: AGHT+IFga8AdDkmWA6VIt0nsDqlxVE1MoRUcwdNvyzoSlgKBq9+ZvHvq7yj7gmAdqYhp1q1PaKOqvw==
X-Received: by 2002:a17:906:bc89:b0:a3d:94c4:f6cb with SMTP id lv9-20020a170906bc8900b00a3d94c4f6cbmr4362343ejb.24.1708164404442;
        Sat, 17 Feb 2024 02:06:44 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id vx6-20020a170907a78600b00a3df24aebdbsm837757ejc.126.2024.02.17.02.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 02:06:44 -0800 (PST)
Message-ID: <fa429d30-088b-4fba-9b84-cfc6b44f65bd@linaro.org>
Date: Sat, 17 Feb 2024 11:06:43 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240216123057.33018-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2024 13:30, Jon Hunter wrote:
> Correct the DLA memory client names for Tegra234 to align with the
> memory client IDs.

That's a fix, so what's a effect of the bug?

Also, all fixes cannot be after cleanups. Put it first in the patchset.


Best regards,
Krzysztof


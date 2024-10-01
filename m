Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E25E1CDFA9
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727812711; cv=none; b=ioonLBLbQD7tqHv9ikkdEMvXeA/UnYyW8VhavnoGaXocXkrjya4Gs4/9MB30zk9sW7NeeULQ99G5v8HzNlPMBDzc4evAsvgNk6k6vkLVY5wIztBcrSmb03emC22WjexoQhlCbsBWuSNreHH6zIo34oUwT3I/MGBH8pZRJj/Q2wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727812711; c=relaxed/simple;
	bh=zCv+nVHPIKnPXRe0/NQz+/wOaa6NGlSUyBL1ZtPRrnk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j1nODGvngi2eJ8bYQz28mrfW9jaYIRog3TdUEUj0t4X+3Eu840zE8Nyd5H/teMYp4BnpTwz35F+4AdTj2slTv1lUfsjqoRJNsZaWpMK2ZeINOz4hKaz6D2mF8Zssu+2twXo1VOA1vRLRG1fI0+tUogEXxfPfPEbfpP+QXtyf/jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pfqgS27R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pfqgS27R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb1866c00so7736515e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727812708; x=1728417508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P/2kUEmi3q7RQNneIBQtLe7b1/HLFQJdZb63hgTbQT4=;
        b=pfqgS27RWzH/RvyGAQMHwX7KOjjKd4iTXlZ4ynAynCJyVdsUW1WrBuxZcQ1r9ZDb7d
         WaiqYzmmB7bcKV/EGuJnVUxaroSwjsuoi+FiDykslBpxdtuyXyXqshF8JWWO5EDpOny5
         W2jkgyqq7ue0oLynhGD9p1z+XzxmGm1LUlxWOl+jKX7V02jIn1MhoHTdQqakiKgjFpO2
         wtV0LRZAF4NHOiePR8d/WFivaVMLXp1/2jLsJkjgAC2C4zOwkIsRMVvIbTFq3Skmsjr6
         /OUZTGDRTaEI4TtxqYDZnPp6PpCoXXLoZGGxz+CQwCoBEoF+HMbpwcaoIX7ICAcCLTPB
         RTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727812708; x=1728417508;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/2kUEmi3q7RQNneIBQtLe7b1/HLFQJdZb63hgTbQT4=;
        b=WfQbyAhqwqKF9YindPVEeU2W0Zi4nspPL1bfguuA7kTIT485cDaPPoy6uhIWpoDeLR
         9jzFS2Ai8NmYPPCR+NuZlnXfDR6hYloXG7q68Qvm/ihvxGAt/uIlkp1eMaDIaWtDDAC5
         eFAnk+Ig8lf8d9ZU+2yI3RWVX0lana/V2cvanMmW6FKdXxc/ETiljTcvE6IYfbFnpRTR
         01/3ILsgDoqg3yZkMtPN/8r5zwWfmeKAnugCkleDzrczpSwCO9/O9U287iYSe28qvFTB
         gqKuUqfxmsuZkU29mFN/YlCamVsjIekqMcmT6L0Txrg6xdazA2DFeMiR59FckRQNJ8l+
         VHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/3Tp8aphMM3D9XNpIwqMG0vctTuzA3Fs5Iga8XXBvd/ohQDaJAt6XZbtFE/6v8MyociEocE39N8JSzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqAedkKipKTW0HeDiiq9B9c8R69ndzhKCKiytoJ5OKBmbQf98n
	LfBk3N9xg2MizPoAtSbB0KNe2bQfOudpywf1FqZkRw52CR5t5QzyI5g+anHuYw4=
X-Google-Smtp-Source: AGHT+IF2vzvSoyMsB+X2kkzL1eIxYdRes4rhYpXqz0DghmRaXAdtaToJwuDT3IACBsUPP8YU8wxemA==
X-Received: by 2002:a05:6000:1562:b0:37c:fa12:8cf5 with SMTP id ffacd0b85a97d-37cfb815750mr308039f8f.0.1727812708307;
        Tue, 01 Oct 2024 12:58:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564cf63sm12717837f8f.16.2024.10.01.12.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 12:58:26 -0700 (PDT)
Message-ID: <b82f6079-b349-487c-9e9e-a836933dea34@linaro.org>
Date: Tue, 1 Oct 2024 21:58:24 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: tegra: bpmp: Fix freeing uninitialized pointers
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Zichen Xie <zichenxie0106@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, sumitg@nvidia.com,
 linux-tegra@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>,
 Chenyuan Yang <chenyuan0y@gmail.com>
References: <20241001190953.31152-1-zichenxie0106@gmail.com>
 <e8810b65-8ae7-4d47-a89b-a1471b70409a@linaro.org>
 <CANdh5G5EUhT5N17QofverJyR2QxRDt+BAn7pvThkxgC0S=OB8Q@mail.gmail.com>
 <171a2cad-35ab-4a81-a9a3-ee73a762f321@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <171a2cad-35ab-4a81-a9a3-ee73a762f321@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 21:42, Krzysztof Kozlowski wrote:
> On 01/10/2024 21:35, Zichen Xie wrote:
>> Thank you for your feedback!
>>
>> You can see from commit 90ca6956d383 ("ice: Fix freeing uninitialized
>> pointers") or any other usages of __free.
>> Initialization is a necessary and standard way to protect your memory.
> 
> You did not understand that commit.
> 
>>
>> Additionally, the proper freeing function should be of_node_put()
>> rather than device_node().
> 
> What?
> 
>> In commit 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped device node
>> handling to simplify error paths"),
>> of_node_put() was originally set to free the memory.
> 
> What?!?!
> 
> You don't understand this code, do you?

To be clear:
1. Neither your code nor explanation make any sense.
2. Patch is wrong - buggy.
3. Patch was never even compiled.

That's a NAK, before anyone tries to pick it up.

Best regards,
Krzysztof


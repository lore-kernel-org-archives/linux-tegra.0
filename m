Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682291CDFD8
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813607; cv=none; b=f+F/VKuu+rzHjXxtdSKzGTxjNZJjyQqzb4ZTNvj3RRKCY2n4zo6oXVzqaT9W5zIXIchvGBnM+EOOjXvCkuQLPb2yHJvdqQ0gn2WgIHtgacUG0sl1Uf+a7JgXVSKHs2aYk3+aMT+tmbswQe8gu4ar+T/NtnyPl8zOlyySXzhTWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813607; c=relaxed/simple;
	bh=V/3rGkijda1iknOWYGGI2cA7MgSnr8JlKdZhJdy0l+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adl26h6gWRuVh5goTVupDVLEyhlVuogwkUkTbvaMC76dBxt9GzKPT6/eGejPonC/qUOb7UxIhH4PxS8pB54v8+rnY4BeTHzDdP/RLzSgicxgiMK2a4Fkvd2JuhBH1jiLj6FrHqeZ51WyaNGZEpIaoHWBq76QT+EUkBMIDIiwiaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsIbH0yt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsIbH0yt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42caeb4d671so7879115e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 13:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727813604; x=1728418404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C9jFqGpX4fp9+HrJlTag8EVnk6lA6VLrBVAzFPeRcXg=;
        b=KsIbH0yt1ybvICt4zTf6oC9NpdJA4gDZLSRlkfeURgpdzzrEYecmFgt58b3hvUAR6z
         faWIopbD+O9EwFsWIDqAxmNHnscBH1BE9PQ+0In2f/sirGuCAfiawsyZOyzSaiFn/jeN
         TLD0BWe+3+yI+ug5MNACIBsSNYXb+wZVcXPD4GEB9DIP/nJybLnfoL/DI4MqtJ4insIP
         qDp1KNwbsujsqCets6vWVvBRnd27vGHI1vuNPHdQhCvIRwtAB7Q9KhU/Ox30Aal+Z6nH
         rbc2IuJAI44x9W7cxyytrwqPi0XNYNlViJwRl4GOtywKlPbjYUD9Wo1vUTk53gNZ+lYm
         WKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727813604; x=1728418404;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9jFqGpX4fp9+HrJlTag8EVnk6lA6VLrBVAzFPeRcXg=;
        b=XGqh/Iluin2aNpRtdUBDSjC8eYz+lQfJLTyAYqCbuo+ocVpIGPWbAcQK1eyD6B/e3v
         IDe4eCDkFFxiMHltQ77TAygGVna3o/2vNjC036Ui/+FPm6KrlC165drPbIUwybSjJTSX
         7L1Ub4MCVMUijFie5r//sSvxdXDxpIFPOVHwNgI4IhqsTvOuZJXiMiCLGDYWkcVWliXp
         Ehr0GLIoebSpeho+NON/ST2I4xa3xSPKnX5XSTO9y3Jt+ud8ZG2I4hag/u9C61wCbZIK
         Uidjy8CMMiFrTuP1Oc3q/nDS3evkRly9LxFXsHQzrnf6Wb+Q3B4Kik3VEeJcAEg85zGT
         ZycA==
X-Forwarded-Encrypted: i=1; AJvYcCWUGR0UFHxFahS45YPHh4YJDv+4F2svMS+9ULcAr/4/xriTJeIIXcWS67nBB+5qkONjnLCKfWHaWtSc1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJk49c02pAGl8jZFyQ4ZGzujICPVUlBMTs+nV3FovejvsuLPLx
	svq9fCCDWAqRYFGAcwC/gIdGazRtX8+VgH4wxK+XVZOex/wHg0c+7j/ANTfSk14=
X-Google-Smtp-Source: AGHT+IFq9TjM7Rzod52Tz3Xv1rvT5uzGDcSK5lMWx801z5RNhCqCQzaQ+HMLwOwgFcKJ/TEnb8AluQ==
X-Received: by 2002:a05:600c:3509:b0:42c:ba6c:d9b1 with SMTP id 5b1f17b1804b1-42f777ed465mr2263025e9.4.1727813603746;
        Tue, 01 Oct 2024 13:13:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969f2083sm187099115e9.15.2024.10.01.13.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 13:13:22 -0700 (PDT)
Message-ID: <8bbcec57-b542-4513-b59e-eca9d22f07ba@linaro.org>
Date: Tue, 1 Oct 2024 22:13:19 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: tegra: bpmp: Fix freeing uninitialized pointers
To: Zichen Xie <zichenxie0106@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, sumitg@nvidia.com,
 linux-tegra@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>,
 Chenyuan Yang <chenyuan0y@gmail.com>
References: <20241001190953.31152-1-zichenxie0106@gmail.com>
 <e8810b65-8ae7-4d47-a89b-a1471b70409a@linaro.org>
 <CANdh5G5EUhT5N17QofverJyR2QxRDt+BAn7pvThkxgC0S=OB8Q@mail.gmail.com>
 <171a2cad-35ab-4a81-a9a3-ee73a762f321@linaro.org>
 <b82f6079-b349-487c-9e9e-a836933dea34@linaro.org>
 <CANdh5G5T43sS7wKxgkUGUgKcqSdeZoVTHWiC5qU9SKvk2Mq4iw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CANdh5G5T43sS7wKxgkUGUgKcqSdeZoVTHWiC5qU9SKvk2Mq4iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 22:09, Zichen Xie wrote:
> I don't think device_node() is a correct freeing function here:
> 'struct device_node *np __free(device_node);'
> even if I'm not an expert in Kernel.
> 
> And I think it could be more convincing to explain 'why', rather than
> simply highlighting the errors repeatedly.

If you ever bothered to compile your code, you would see why.

None of your arguments make any sense. Your code tries to perform
initialization, just before assignment so it is completely unnecessary.
I don't understand why you could not spot that obvious part of the code,
because this is just C. For obvious reasons I won't be spending my time
to explain why this:

some_ptr *ptr = NULL;
ptr = foo;
if () ...
   return ...;

is wrong. You just did not read the code, not built it.

Best regards,
Krzysztof


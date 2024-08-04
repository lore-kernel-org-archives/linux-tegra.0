Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80581CF9A
	for <linux-tegra@vger.kernel.org>; Sun,  4 Aug 2024 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722761340; cv=none; b=J2nIxzuSO6DMfniaXUxC9UE9C3VrF3zh4gJSQYJNZXu+QTtcimFHJnP4VIq7osaqB6A37eUKItJ96atPHHHdCWC7ZJwLKW++Em/ITQT59uIUsIsjKmxyDDALRSPH0nAyobB5vYEkOZXebCnikjKLhc0/t6XnYO1Mcyu+g3x0Lck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722761340; c=relaxed/simple;
	bh=YS405ZYJ6SwssKhhpjtc3Vz4uQF7tmDwsSwv3NysJLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAzn1p7x8kFjBOBk1bj1Iwf8PSPuQyW7895Hd1rDQqgT4h+AD2p2PHLot1WrRAkYFgSUIeJxzYbwHUtCBAoLIJF9H/aRT2eCGpa1fBbie+MM5/nSXAuFYkfO7lHs6AVQaslQoP1hN/Jx8AWYMEUNatF3d20fVlZTAyRmXMYkaso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H3oqi6ri; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H3oqi6ri"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso60973775e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Aug 2024 01:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722761337; x=1723366137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YS405ZYJ6SwssKhhpjtc3Vz4uQF7tmDwsSwv3NysJLc=;
        b=H3oqi6rihpzuLnrjxsDjHeyl4PjIfNCVkoFZ0qjwmG6/4VXlNftjuezUj2XA3AvFOu
         T3uM+eikO19a6fWvbkTNcxyj0rJtTvZQPSjMWZ4Jmg57NrKYtJpYakARWRFfbRIdMV0u
         2G9bsEXNj3z+mJY5dlWgmktSc63oFpkOtMJ48kTxEjwbbDx6x1kmyQ1oiQarfEaBA8kC
         jxr/94wTUfdLn68lOP2PUnJONOirK431F5YHhMI0c+Xrg41NEt3d/LGHf437rPR8MYLL
         MsdNymZ+7aAY8bom18CsQGa13aMW/5RKCSri+pzvFhW7kQz272CDIWNMx+dGtwAYflzY
         lmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722761337; x=1723366137;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YS405ZYJ6SwssKhhpjtc3Vz4uQF7tmDwsSwv3NysJLc=;
        b=tGo8Slt+xvBY1adND+AMzEgIxq+7gtr5cU147ucoMkxskuOiaAEl6f+WjredgPbmWL
         YhHctRDWScs7s1xk2ObJumvvwb+4csoA0fqZyxNtKAy7kEsjZxmiQqRUNGq5QZGQVQwQ
         E4LcyyXe1RTKrGu15ARVoxpKxHU0/I7YGSxTI0lzb2FhBJ9mKZyQG0SO1OQB+mKK7IkN
         PVEy+ewDnslM4BWi3ND2vaKRK/35JHgZZ8w+U2fM9LG7lJ3OcyuA1o78Sl9hSXdoBjmG
         Su/+QhRw/Clpxa5xsqW9tXoDxUiM6p4G7Vdnx/DsSpqVm6l1z9mFat5eoQJEW/U/Juuz
         W90A==
X-Forwarded-Encrypted: i=1; AJvYcCWBW+M/fmyg7hrsg1e0ZBKWrVwHHIrJFeqQkT8e+xFG7vVJAE4JxUjFI1cJAgSpj5007kK33ccbNSWMpTxfq3M2nEX8sFtBECYZpYA=
X-Gm-Message-State: AOJu0Yy3gWj0gBhysH2oU9DcWHtL1RtDaTeLCB7gas+zz856yfZ9i5DZ
	RFUHvt/LtopoiYKHTWvKM4RzNAcn0KiOBhgLetvuKdg7qYBHJnLVp5rNVPfE5dY=
X-Google-Smtp-Source: AGHT+IG5mjtEHfqaskWcFFAOgdvXGhx4qFwrNNtLHgHS3Pe8+8tXFYHW9Ek9zHy2vbmnccaWbsDHcg==
X-Received: by 2002:a05:600c:4690:b0:426:5fbc:f319 with SMTP id 5b1f17b1804b1-428e6b8f5f7mr55725985e9.33.1722761337052;
        Sun, 04 Aug 2024 01:48:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64a68sm155362985e9.38.2024.08.04.01.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 01:48:56 -0700 (PDT)
Message-ID: <43b6f7f8-2e07-43d1-9402-ec4be044cc8c@linaro.org>
Date: Sun, 4 Aug 2024 10:48:54 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: tegra: Document Nyan, all revisions in
 kernel tree
To: David Heidelberg <david@ixit.cz>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20240705235254.126567-1-david@ixit.cz>
 <172047253375.3899888.12655488091485132661.robh@kernel.org>
 <d5c91a8e-0b31-4402-a22d-1b64a4b2542f@ixit.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d5c91a8e-0b31-4402-a22d-1b64a4b2542f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/08/2024 10:47, David Heidelberg wrote:
> Hello Rob, could this one go in? Thank you

That's a patch for nvidia soc maintainers. These are their boards.

Best regards,
Krzysztof


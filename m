Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B042052
	for <linux-tegra@vger.kernel.org>; Mon,  6 May 2024 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714982840; cv=none; b=fRfDLaqoPE7V9Qrs1mtMFFeN55PDPuKQR1YpPgZoey37etNkDII+PfjO99zKFvjN3iUcto4F+VX5m+Sbqn0j9MwavNEDjk+JnqYQ/FlF+SiREX6sMYPlpGhM6m7zMJJbn/d3Ca5dCBtA1pJPOBLpy+i2FsVty3Okvz9mLpDputY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714982840; c=relaxed/simple;
	bh=aIobgFbxVFbtEzb1NSGEHIbQMcGm8JoHJlYEfs/N4/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cZdWHsFbCr74sHJd4yMmTMU8F5ASc1AB0gq6Ngrw7q8BzdR4JQA0JZeN4j7U/HzHsnP88klYGSKaWQP0VsM6mMfKWiSy0DegdAWY+OKS2DB35EETxW+3a01nf2RITRKtaMGmX0X3sBPqsC+ZVksNReDc0LYO/l6IKAoFRXScPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=myQO4Gvn; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="myQO4Gvn"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e3b1b6e9ddso1210911fa.2
        for <linux-tegra@vger.kernel.org>; Mon, 06 May 2024 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714982836; x=1715587636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DPgAAVaSo86WCfQxLQN5gQ177Cd5lp7o7nBkXE07j1A=;
        b=myQO4GvnJm/y0McnspCOzyXHYJA5gd68sk/M1/e45TThyohEjSS0QfzsS9nQaNAFhE
         XNusma4Q94JrggHdweOaHsqxc033m9hj3sgMbAU2Sops9wpQ+OjhG2dU3WHEGISyBUjY
         r07BUcrzQ2vrnZ3Ok+Djv0M5EWsAAh8hq7lEifgNszdXLCycFnRrohCFnsAjrNlDPGR9
         XoghVvmsOPqpx7wUXdYJrqAbNNQaqY62gfvkpSZIfqIG8qSf+P+BQAztuWWeZoK/O0EV
         oZZ7eDRWC4Xd3swJVFb6UMPrqIbdK5Ejtwb8Sk0M9tMKKlQ67IJeb96y5jvtPlgJY/Hr
         bViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714982836; x=1715587636;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPgAAVaSo86WCfQxLQN5gQ177Cd5lp7o7nBkXE07j1A=;
        b=Th7rOkBAs90Sq9cJxrFHG/gJV2UfwxPZsj10d/nZqzZ2N4xfVPnPaocMmBy1XeLkQV
         5NIKrm0vSJDZhc0387pqXvED2Vg3whYNslm4Cl90IcKnm5T/vqzNHlv5aX5/IQe64iGn
         qwUigfcxKsxdmhqkpcymaM+Ilr1uc4SOXKEoAaClffp6N5snSdMhHsya7FLLVHtTM/j9
         C3OGN55GF7V99SqtqGymlLr88IR4duAOOFsZtjizX+3CGnEx/zGwBuoxw6WBW6gw+U+V
         EVxBAtJ956lNIReXrwstoaSl2nXmTE9PC2y6CZM1Ea4GQPdMhkgtZf7i2CV6zvTQiGyU
         KSUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuYHv6Lx21X+9QY2VxQcRlluAx3kiHKpjzuA5t4MgUIMMLKLHZ5SmSphuiDIJwRCc+KPwi5DyeOucDuqsLLPIT7hTBRmkABtxlvgQ=
X-Gm-Message-State: AOJu0YzcEeJClCFeYEn3oSIzKJFtG/h0bVSCdryLPovtWIN4fV38PXap
	retEWzANpCR9Uoqg9iM0mjf1NG2Z/LQKO1wulpEn0GxSZjjOd5jLkFY+V8F7r0ecXb2MzksU36q
	V
X-Google-Smtp-Source: AGHT+IF0rBeJn+atahGYtwO+P0kB28YDUEnOmyCPhRkdiJymG0HiIyoGOWrGcrHeMtYKwtlSOkt9xQ==
X-Received: by 2002:a2e:96c3:0:b0:2d6:c749:17bc with SMTP id d3-20020a2e96c3000000b002d6c74917bcmr8462268ljj.31.1714982836230;
        Mon, 06 May 2024 01:07:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id x26-20020a170906b09a00b00a588729de82sm4978740ejy.142.2024.05.06.01.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 01:07:15 -0700 (PDT)
Message-ID: <33a90ca9-86f6-4d17-8775-54b2ce83a2f3@linaro.org>
Date: Mon, 6 May 2024 10:07:13 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Cleanup Tegra210 EMC frequency scaling
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org
References: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2024 12:19, Diogo Ivo wrote:
> Hello,
> 
> This patch series consists of a general cleanup of the Tegra210 EMC
> frequency scaling code for revision 7.
> 
> Currently the code is relying heavily on a function, update_clock_tree_delay(),
> that is responsible for too many things, making it long and confusing.
> The general idea with these patches is to simplify this function and its
> surrounding code, making it more modular.

One more thing:
Your v2 was not build tested by you, was missed by LKP and you did not
Cc kernel mailing list. Maybe LKP missed it because you reduced the
recipients list, which is surprising. I do not see any reason why
removing output of get_maintainers for this patch.

Therefore anyway please resend including ALL mailing lists and ALL
maintainers, so I can have some confidence that LKP picked this up.

Best regards,
Krzysztof


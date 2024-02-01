Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8F215B973
	for <linux-tegra@vger.kernel.org>; Thu,  1 Feb 2024 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706779319; cv=none; b=TpO1Two2DAWP9uRnt+6v1Sbw2l8cfwnHM6njV5VDwhZ0AumlJpuyoLwrSPJQcGswAfY8+0ER6gWbtovo+BbhVmCBxzLkkAwapqjenD0AngFHIYXtypsiq+hMDvtzTwFR1J5VeJvaOznlOJ29LpZs8wVg64Iq2xYC2u/wufIneHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706779319; c=relaxed/simple;
	bh=R/c92+WLglEmsgVO8oRenZrifpseukVgjaEn6hQ9pUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mu7qi/wclQX7Tg76UxB5y47YkytrFcIrk+0rPFl75GNJe7pJCDdTmDNIaB0IHhxnBVhUPEqElM3ZuNGSCKqHEhEfPfdxRgnAEE/SSKxCwWwYJBlIIgATBAk2ZqieE+p+61/k+iyJMadvRGVWRDa+1sAT7pdH8hPjkMBJxFRhLIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PPY0c9ca; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PPY0c9ca"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55eedf5a284so816681a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 01 Feb 2024 01:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706779315; x=1707384115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lf8NjO+vigDtAC3s3AcNxMBmMs+wcUVpUDduhMdiS2o=;
        b=PPY0c9cayh5Qpxc6VFgVZGnskChqewNncoCqw54FLkekEwbLaFKrOeWUwJoRdonHOU
         4WStBJjE4VG7AUXlby+HJ6iAI2GcYj6F/d+Y+quKDOS6pesaqWldTEWf2v5wX+j3VTy5
         uhq/sYpVVplFfJ3ZYW+UCGrmhePHww15rLKo7yrJXFL0DjbTpeP/aV5p/K0e6yqSfLVo
         OKBADPlPrNkrjC1guGKa5vLzaLG1cSsnLo8p84FKPnoUWwIDchMBPVcLTLXyIRk6jUTn
         qN+DGNUUXtHALW7JDKZ7pCKyoQNjQ6eOStrBSRDPiNJNQ5zeS9D4h+jzFKmNkOSNsoyQ
         s0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706779315; x=1707384115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf8NjO+vigDtAC3s3AcNxMBmMs+wcUVpUDduhMdiS2o=;
        b=PKpEHVtT4YpcKfpW/NhFJkzp4fRPZiVvb2DyBhJkIdvcjhjXBfLImS8TpVPo3KcAkV
         8+6f8/TM4YJEVbj7bkHsNapWsEX022Yz14T8b1EsgZhhB9GnETT1AiC/xVjmISery1SG
         DE2ZhT5dMBfWposhj3e0kI+VagpOe1m5z9tuW00lionfOZUf44Snt2z+x1QPOMB+TqVt
         xachLnjY3utXYFExmOf32yPOO0/AJuhPyZYiq4rcfTuxZ22j4gWi2AHn6bpZlIZSKoea
         VgY9zH/YoZlUUz6RlI+lhuocn3I8nBUHTBexsoIK61tMwz8QXJlHKc8UXtNKbPiXwwLx
         nzkw==
X-Gm-Message-State: AOJu0YzORy06q0JltrydX/6/D35FVG9d/L45iKWL6OTPCt9BOpWxPfj/
	6+KhqctZ1Q+DI4AWgAmGIeMT45xsXumrt+rIinyRanlN67OujbtxfZN+m+nI7Ag=
X-Google-Smtp-Source: AGHT+IFKalaJsKjWxpW2L2gKDtvYcqD+PPSE6GwznU+adUGOWhfVLTF8I4u/Ptu8/BJPMahyI+X/yQ==
X-Received: by 2002:a17:906:f243:b0:a36:33ac:3086 with SMTP id gy3-20020a170906f24300b00a3633ac3086mr1146686ejb.72.1706779314746;
        Thu, 01 Feb 2024 01:21:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUuCgAY1eyT7c6EPWwy407gU8c7N1bYqCKpMpnZnvfc+2RdJrI53oGGr+wVCziStmPOo3HhXM0RYT8vZ7E7fPRkmf/T+0BC5bd6GEfEBwZk55nyhSTUQ+Nm1mxPEdvjwU4pp1WF6sQ0oWzcpKoHJl84AGQOIBxeMx92sm9Cuqu5wVMV2J4ASCETO32X2XtJDiwO2KVR0YHbEI5Hf8jCayEP3XHYrbS3TeEX2QU0z3rdRM+Gc7mAdgCZ4EUvurNfP34j2YmHJJbnjTh2zl+n7DpofOC/bTrnFjoK+lWNkZ3wtr75w86yFXiWmUUWPaZxg4GpFSVBJOlVunMu4Qq4otB7PMMcCIyWnKohHxwbHsnFsFLAzbDcWwCpU6KDKwAkQFNhrpV0Bta04piSc7vpSMyE7/9vPqJg
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ch25-20020a0564021bd900b0055ef4a779d9sm4276981edb.34.2024.02.01.01.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 01:21:54 -0800 (PST)
Message-ID: <49a60285-7786-4e83-95f8-6fa38e120533@linaro.org>
Date: Thu, 1 Feb 2024 10:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: tegra: Add LG Optimus Vu P895
 and Optimus 4X P880
Content-Language: en-US
To: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kees Cook <keescook@chromium.org>, Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240201092033.10690-1-clamor95@gmail.com>
 <20240201092033.10690-2-clamor95@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240201092033.10690-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/02/2024 10:20, Svyatoslav Ryhel wrote:
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
> 
> Add a compatible for the LG Optimus Vu P895 and Optimus 4X P880.
> 
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


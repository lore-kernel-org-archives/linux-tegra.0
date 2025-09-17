Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C583C29AB13
	for <linux-tegra@vger.kernel.org>; Wed, 17 Sep 2025 08:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758097469; cv=none; b=a7dAOZ5hn/DMi/HYRY+AsIXP4ienm/i647q9+AVmoJoLfaWSWSQgMauvtL9JBX5NKPB+HpSXuE6lPLI2nQ+rdmqDz5pEehDYzOdw4sLVQSuGFWgADm00vJi1/Tdq1hLNdvP+ohRAgg4yXxMhz6qBHC9DSp5FqBVN3Hh380ZGvQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758097469; c=relaxed/simple;
	bh=epw1I1hiABYxVKmrHWXBrgO+pAN3VLqtrs0eauOyI8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSwVrtAkaZNRuOGLVmTspSDWQD7oYlIxLLM7dM5ceWIRU3GbbkZjiQ73DVX8Cr1eFiZvM8USrxBRpf4QgJoXvnK8LcO+X1pRRpbzmtM/YwDzrx8mAQdgcF2gj8TwMmdyhS+ylMtjtfPS3Lt1NVIcdeP81GBkqp9vNt5C66L/iaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XcDhx3lr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XcDhx3lr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4619eb182c8so5127665e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 17 Sep 2025 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758097466; x=1758702266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fat9xSXuNIZQF+zN9gSw7UW2xhmHEfI+kCDSXFTHgwo=;
        b=XcDhx3lr7Toynzoq3Mc5l1Xiwu+daTOB6TzXpn1GAQR20lyeOkZGrC/g8uN5n1BmAy
         /rmtmW9ixoyDyzVeuxqR2535O8IOqGpFS3Uo36gZWrt4g6X3myTXvdfHo/N4bITAMgRQ
         X0QMQWnquGvlQtBtzXxC+DJn5SCV8SbhjfChwcpP3Wu4EDprjX78XmSQ/OKvmrqVxhIw
         r0SaG67htLGCLS5IjBrFm2Zkg8EIhKV95BtDzARJqOCtDxfompXQdWCRKDwwLyR/JoHH
         j2O95AltJ67p+mf2oKsFXD5i0PdFh1knsoXD7Vy8J0skRSd8fOo/cnOZjjEGclGGHAMW
         QfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758097466; x=1758702266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fat9xSXuNIZQF+zN9gSw7UW2xhmHEfI+kCDSXFTHgwo=;
        b=f01A9IOhTciIIOW2KJl2RXHIAzcJSZPCrJ5HJ8VKqRdNj3HGuc+/7X87niOxXANv+N
         /U0lJjIiRNRMGUok00oBQd80H4fbCQwoXUg5qLl+h+ICV0CHdx1XO5m8Uz77fCZrmbPJ
         KbkQGhgUuW2rGcdhWuF9/YuawL9XoKQnLMBtpEAxMv9bwqr+p0mkEa5uNiH+s8QwPiQA
         GugOENkugW+i5KZpQDgKQ3PvxVNtInFDNtCmbmL2VrfeDtzq/kGcpD7xl4PtoMoP+zt8
         lBE9+Q1z1wgoWMGumdlnj1HNg4C/7ywdybsi0w5+UtdiUXhCVdTTkHDWDl+lB1xzQCw7
         nVzg==
X-Forwarded-Encrypted: i=1; AJvYcCUGR08Eny3n7gj025aqXt+rsK4ItJUEmoAqKRP0tHSpnVqi/ahqDy7zJKfUZ4u6CkWf3Gll7Eyu6ypdZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrF7D4dbGT4yq1BNVDNY0nysfhFbApRgznKAUExNQdfStzDqIJ
	Qd1uTuNbfvJpOfw6y1yd+o4L7br6VoUwdSUtCPhd0XhIGkAUFYBZeT/m/iql89VS3mE=
X-Gm-Gg: ASbGncu2ve35Gc/+vAlG1xtV58jdIWGGqV+6cM0gy89CSGET4nHFeC+kMRCDDLiwLUi
	9oUNx7La7+FMUrcFm7Gy/iEDzYCa1KAL+7cYcDKo51l/LfneTcSOX8+BkabmWK7mQmfFDqxWB+g
	vcA/aauTZgnzeZVin+SSFzOIb2iAy4K88xE5FOFLA6ZNIlotqYVpxa8HNU3fhzl6WpKb3ov2p71
	weAgndkdcD72wXCwWtOYZWEE+5WX1sM3Rv3Pxdh5hGMfNOETnIri53rWx8f+C5wUXwZZAf+1D3x
	nflSalze9AXf/bIdjHJkTXkL6tigTvB12MLh9OJlIzW7/5xXwPsU0jsNNKepG/uZJViPfHbwu7h
	UYiHSY8I84lcUN52G3ZVv1OSxUil1zz6gZ4FeXrmob/tlFw0THzsYcZyTxfN8i+n1ObLV43Hnj3
	ZpwA==
X-Google-Smtp-Source: AGHT+IHDM1ajp5dnj4hE5WJdoDvDAOqBUpvkAj4SRucliE22RxwxuBe+9NIxcpC8TM95fIkuGUGV2w==
X-Received: by 2002:a05:600c:1c82:b0:45c:b5f7:c6e7 with SMTP id 5b1f17b1804b1-461fc6674c8mr11774495e9.0.1758097466105;
        Wed, 17 Sep 2025 01:24:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4613dccb4fesm26674005e9.16.2025.09.17.01.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 01:24:25 -0700 (PDT)
Message-ID: <b2098a76-6596-4361-8ac6-1e4a3c462e2a@linaro.org>
Date: Wed, 17 Sep 2025 10:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-tegra186: don't print
 superfluous errors
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20250813190657.3628-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250813190657.3628-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/08/2025 21:06, Wolfram Sang wrote:
> The watchdog core will handle error messages already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

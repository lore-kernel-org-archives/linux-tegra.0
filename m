Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAB91CCEF6
	for <linux-tegra@vger.kernel.org>; Fri, 13 Dec 2024 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088323; cv=none; b=Bxg8PaS1elpHOLQE7/p43aTWQWERUSAOpEl4OpZmTfGSiQc6t6BDHx2EO6OkUIJk12PzclBEgsq7kYplsUGptkwDALjpYvzRr7rGYdEvWmE07c5tMyqfeP3N2mruPKvFC9sv6oybwz+IfbPb2cGJ897T5qZWYl3XmLDRklGUccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088323; c=relaxed/simple;
	bh=Wacsco3fqfu97N1Whf73+Ru2F6RSKyiwPL79ih/D2MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kvU8krGZmytSux1sWqZ4Vxn7shfeUch9IsnIAlU07/fZhwZaJDqFVnjxmu4TW2soMd/5vhDQYpFwoV3o6uwSEN9HjvAgMdimu5+owacRjxZMNZKxDLc2ABHLo+MZvxuhcaTF67RrK6OPxNlbrgG0c3Uk5shjQI9bEfQxcNPJiY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbqqJe0N; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbqqJe0N"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-387897fae5dso107732f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Dec 2024 03:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734088320; x=1734693120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRRiYJSin3IUbgDsGKy4j4LG6vMIWeqN4uP6OXDF3o0=;
        b=kbqqJe0NAIUT2PLJ9nK/0UX4eYELaqhaz225tHnUZK8nTmpjSVm+njGxhOKnUk9M+G
         P/SnXqUwaGXHcuxjr5HyYRfZroszLy+BkAB1WcmYaY0uDgiiqcRPc804D3ZcBpgj1GUA
         vMZvQe6h0E9gezZ58g5EEf0/L8R8SZepoFB5Un89a6IJPq5rSGjNiqn6LxyUMbUQfvyd
         bpbVYiPLGuM5edgan8xtoNeCfaWCT9C9CAtpInC/uB0FzkeMlvMj7qQFE7W2MrguqUQh
         DgTJcmcNn61HRfNq/x7SsbUJ8MQkuctzW1+fdahSNSQRiGv+xNFsmdbeYc18b0PQQMNP
         fOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088320; x=1734693120;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRRiYJSin3IUbgDsGKy4j4LG6vMIWeqN4uP6OXDF3o0=;
        b=Ea4whZRv8rBZ+lXzEyFcH73HRQovzCszPyUilzvGJogbM3yqA1gI04UmrR70JBYeyn
         RfdxVLAwJtRxu9t1vi5E+CaGM2OTlDb1bLLnnYhmyTgo+oVwn2D3p5SPG78MjERB6lvQ
         8TNbPIrQZRyLUXNy41UltGUAOSb2Ufy48BntdkNDIgF4Btj5FPrC4PVpO57ypdfJNSVz
         2TDScdEeD1NegS+zWtAZ0SANgy5UOJ7YNcyKa/MSsAOkR0YCKIDqQjD2nZIi+tloKSaA
         4otDVULNJyGbXZNDk0UTZagUN+ww4Xq6XmrxzXQQAe28JR2AxzwBmq4M/9yWxjbKz48i
         TDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmWjU8HLOL4hf3cYZXMpZtY5M2HEFpTS6ea1638rrPjKaSTpZ1ezEQHOcjvsp9+aRSqugttfMnIEFeGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqEIEjb9gmX16sqKr95Dd1vVnzWVmi+ARmBfbfsP5I2+qrhI4X
	y0z0zUxfYbRV6YMp39SPX+hIYG6AHmJOJSg3nJstS8fBnuChF+QZr4WQ5ltzkN8=
X-Gm-Gg: ASbGncvND1wstoWZjxoyAZV9ifq3xlpXpf/woz3hfhT8WR6CwjoqpOvfNVWfLVlctJt
	uh3RE3kHX+VginDR5cpikTIO/cw3vcyjSowP0yxMYspdR/XdAjY6s+9/80I5O8801yWlBu//Lg1
	+IYK/2oGUVSwfKYRfruAdDZET+w1EaCR3wNdqhffAYUluZ0RktniaTYWwRMCFul/l7YSfnkjwJY
	RQK7IaTb5B1Cq2i7C7qDM9EFHr0M8U8/bdwjbt/NESNXfQ6APityXZ8y9bCqucMLX7B8RYa4b0+
X-Google-Smtp-Source: AGHT+IF5B/SKO3vu8qSogOhN4ODfB4CfGAaQrh7N6Q8DnmtAOnYhlOUEzWUV6rNTfMRzLs1oSjE1OA==
X-Received: by 2002:a05:600c:3c89:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-4362aaac597mr6296455e9.7.1734088319665;
        Fri, 13 Dec 2024 03:11:59 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436255531f2sm45607445e9.9.2024.12.13.03.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:11:59 -0800 (PST)
Message-ID: <942ae75e-51d1-4265-adec-e1446fe0ff48@linaro.org>
Date: Fri, 13 Dec 2024 12:11:57 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 PCIe interrupt-map
To: Brad Griffis <bgriffis@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20241212211114.330245-1-bgriffis@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241212211114.330245-1-bgriffis@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2024 22:11, Brad Griffis wrote:
> For interrupt-map entries, the DTS specification requires
> that #address-cells is defined for both the child node and the
> interrupt parent.  For the PCIe interrupt-map entries, the parent
> node ("gic") has not specified #address-cells. The existing layout
> of the PCIe interrupt-map entries indicates that it assumes
> that #address-cells is zero for this node.
> 
> Explicitly set #address-cells to zero for "gic" so that it complies
> with the device tree specification.
> 
> Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> ---

So entire nvidia works on old kernel and sends patches rebased on old
kernel? Please start working on mainline.

I give the same feedback multiple times and still nvidia repeats the
same mistakes.

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.


Best regards,
Krzysztof

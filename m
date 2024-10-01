Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28F19FA9D
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727811726; cv=none; b=R7V6s+Sa5bn2uzKEseAHCWyyjBHGElRny1BBMxSZbl6XmTiDW0UwLlBI0+aDkWhyRy2caIO1zOw67/5+xQyAfk5+r/hJiWxoOQ2JjjJhmHijfPbPugvYVYryoGY2BmbJ9+MHik+3D0ZIb0PfnE9bzkiV2kS5wclK4MWkz8sDbrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727811726; c=relaxed/simple;
	bh=+x2DbLc6mXviMb4+T2Gm6eysAc4x3ZubIHWk+QuB61w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2V9+tpzX4VQeve/Tk8KCD6D7oCs2zdEISQExz1ef9oteJpsDFxuDrJviXMVlvM9k7/NRzSgAZItjetzVIX34EYvBqIdqTHSmayauxS5osNYsYrY9RJe6LmfdW9RVc/HmR/go0JtYgMEFtFnzYg+ukGHcYxfdcmcdkaJUn/2aUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GwX4eu7Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GwX4eu7Z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb0d0311fso8089725e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 12:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727811723; x=1728416523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EaRmvDJlFP6ht8qbJ5rkfwUEVBlmulhl+djpxnZ5I94=;
        b=GwX4eu7ZcMBTxCbNRdhnvtUJrxmZSuwWEgwx1T4Oj/0slMhnHxWwb7HO4GpJK5wSXv
         St9AZDWWwqjK/CoKzTsR87YEICkn6poPW+n3JhqsGTaFM+SZoaeoyvFaCEmjRQr6zQ14
         LSHh8n+OTi+SlmjrHMd9o/XJ9aHWuyyDaCVsFSIH8pyedHpNWecjkVCz/YL8cLl9VzC3
         LgB/COw7ZbHtyeAUR+8LnLDKuOXJNJ8Mp3yOcCwi3Tgy05RfRN0EP9Ded7la3YNxm/9i
         Q0gBpLcwTng/vid8ooche8x0v+Sr3CHYEDC7XXt37zY+cWA2P0uvMO6xM9dBj76Ou9T0
         bq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727811723; x=1728416523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaRmvDJlFP6ht8qbJ5rkfwUEVBlmulhl+djpxnZ5I94=;
        b=mVvzoCqgffFM5c3cxV+Nud1r468cDBYPB5STektTxt9DcgHDGrnac8vCvH8rz7JA+v
         UNqJpaGKAyLJB6ZP5WKaCOMAnDrmZ+X+KqnRFEZaKMhcTARsFwcI7jB3PF6DL0/rUlTA
         GIgMy5xlGGNu0HbNUeCMQZ92pTtSsHTCsXzD5a+C6HlujUh9C7+DoV6eGUcCmZo3wVKT
         KEFqeNbct27iLjlCs5WOXs5gkWo2ZEyzCoDgIGtudhljyvULkA77juXXZ/zAN1/2oVtM
         sM3vq/nX45ADB1Mk7SXLAaQmWkFR75DoUZu4h1C8OFEnDeu6PA+FN0q55jnzkg7b6nDQ
         rQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9NkA78BmigrSZFhdO0QBkkrrlg+GrJSO13/9IbHmnODetPuOgf2FICevxkPhr8DHnjKHSjVvvGSuKiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjK83bPoENna1oOcS+9bpn712hpKEeE+oAuuN8qWKkN11yNgzq
	XMkbSM5iuj82Z5eH5hiVAqK+RqxHXyxqrh7k+2/PIGFa4H/CaF/6ZD69uhZdajA=
X-Google-Smtp-Source: AGHT+IHGCRGj7y93T1Qd/Iqx3EeZqMOldTBM1eQIP1N1kD7BdRtOm6hWwvTRrw3ScYtwhX1DXMkYXg==
X-Received: by 2002:a05:600c:1393:b0:42c:ba61:d20b with SMTP id 5b1f17b1804b1-42f790970b6mr494455e9.3.1727811722866;
        Tue, 01 Oct 2024 12:42:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d029sm12762671f8f.7.2024.10.01.12.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 12:42:02 -0700 (PDT)
Message-ID: <171a2cad-35ab-4a81-a9a3-ee73a762f321@linaro.org>
Date: Tue, 1 Oct 2024 21:42:00 +0200
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <CANdh5G5EUhT5N17QofverJyR2QxRDt+BAn7pvThkxgC0S=OB8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 21:35, Zichen Xie wrote:
> Thank you for your feedback!
> 
> You can see from commit 90ca6956d383 ("ice: Fix freeing uninitialized
> pointers") or any other usages of __free.
> Initialization is a necessary and standard way to protect your memory.

You did not understand that commit.

> 
> Additionally, the proper freeing function should be of_node_put()
> rather than device_node().

What?

> In commit 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped device node
> handling to simplify error paths"),
> of_node_put() was originally set to free the memory.

What?!?!

You don't understand this code, do you?

> 
> And as for the tag mistakes. We are sorry and will correct that later.
> 
> Best,


Best regards,
Krzysztof


Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83EB52F99
	for <linux-tegra@vger.kernel.org>; Mon, 22 Apr 2024 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713769964; cv=none; b=PaZfw/fkU0lw44j1u8VspBPvV7TjuJAHbtGBTJTJt0WFvsLyJFz+HbPK7kslasXjBiOXoaFo3rNrwMPuBj9Nk8i4jAl60Cmj7Q8n/8XhZbLogNsKO19MaIxCz7kYIZYoJPSyMOmalU9vMpdYPpXVdHZE1o7eODQCyTtlQiDdPgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713769964; c=relaxed/simple;
	bh=aRqEUrFEJmID2QuQWe/9GlShp/t6+nLnG14uB1W1OFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrETAv7fkxbZwhvApgcxijkFyo9oAyIoZNu1WphTdvSzU9MdmUmaTeHA/7FEiO43JYnA4vAxiV5xZTex44ue6XFp3joo+keSjq4CXTnJv5Wh89yxR75VDdvqYxyaIQuqMYktteX88LJh2p9ylxTsy6gIJ7qNvGteBT83efjLt28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbWN7Rf5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbWN7Rf5"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51b09c3a111so1281120e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 22 Apr 2024 00:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713769960; x=1714374760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rRGzg1mxBq+CFCWV96AB3N5t2SvS0X4IvMc+xGdy7O4=;
        b=rbWN7Rf5tDhA9KTx0Co0RrX0XgTL6HJfMiqULC/A0mjmBHXAG1FEhe8HWEWJEhDwZg
         IrQfQuzBUBb98HP/AuqxyGBm6wcusp/l5Eml8SyOKPlWx5iHvWNa0RzMUHF1pTB9H9Rh
         tbVk7XGpBfVtCGuxPqnKwjpl4XE6dn67QGAB+lCW8PIo6tNLeHoo5zkC8UDv6Y03rJga
         Z8q/NQfV+A5oz+lI+KbpaMnOBJqge0BYLCyE6zAjYpHKgwoeaYvKVEmFwGYhDjd6hhUX
         BZAZdWUYJeeXNIqAQTNYeqmvPtMQE6MADzn9iFdgMnCiZTNeqsuSa2rGBruEnQk7cR1s
         67dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713769960; x=1714374760;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRGzg1mxBq+CFCWV96AB3N5t2SvS0X4IvMc+xGdy7O4=;
        b=FR9wPnEq6iEXsAt+WNIFo4984sZ+ptOA0gT6SpEYVLVUa/8gCDnBpoiz6i6lOEngVd
         yhMnpfEbJSinsgFRIczM01JySspGQbvUWdeluMbHpVljDzauU6zvSIXcjnw0ZWh+rIV+
         DcLG1ikvPAv9NMLlLEbEBUvVxEHz5EbD1vxr23qx9E/B99ZnA1waJae7MAGUejVXucL6
         LGGVyOqya4VMOhdWUNYcbklYUUfoBB9figuE8VdJ/77vf/wfrq0CD4Fd2b3fruBGlcnv
         WeQRjky+FaK8lzDkSIdsRoW8OsojCKKM5a+aTdkCCM4E+wnEdE9TENnu1yk5iHnzfgE8
         KW6g==
X-Forwarded-Encrypted: i=1; AJvYcCVp0i8ER21WGDon/j9QEyxVpVqA7EKlt1K7ywDHd85wMjekR3mGWEbL/4Gtrio8JFDGWocYG/a7gQA5ROhX+5VkbnQg3hWB6YNGIxM=
X-Gm-Message-State: AOJu0YzUpgtzrMBzf8ZAh/j3lnOKz1rPRhOAU7nZrcVclmvB93b7SkdD
	h6WYQYb6B50eyhlLxAkG2DcK1K8670iEYIYGPeuvZXh+VOmMGF0ol2lNsMxKbwU=
X-Google-Smtp-Source: AGHT+IEvNCyMIj+qcecYZC5sou/NVzJVjlCrtXyFnnxP8pEweLxuWMc2+xr5zAiwCeQEe3d38cEqkw==
X-Received: by 2002:ac2:4c46:0:b0:51b:223f:ac49 with SMTP id o6-20020ac24c46000000b0051b223fac49mr2316959lfk.38.1713769959838;
        Mon, 22 Apr 2024 00:12:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id qs29-20020a170906459d00b00a5197fa2970sm5388361ejc.25.2024.04.22.00.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 00:12:39 -0700 (PDT)
Message-ID: <06849796-f896-4cff-842c-118d86e94a6b@linaro.org>
Date: Mon, 22 Apr 2024 09:12:37 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 2/2] memory: tegra: make sid and broadcast regions
 optional
To: Sumit Gupta <sumitg@nvidia.com>, robh@kernel.org, conor+dt@kernel.org,
 maz@kernel.org, mark.rutland@arm.com, treding@nvidia.com,
 jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, amhetre@nvidia.com, bbasu@nvidia.com
References: <20240412130540.28447-1-sumitg@nvidia.com>
 <20240412130540.28447-3-sumitg@nvidia.com>
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
In-Reply-To: <20240412130540.28447-3-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/04/2024 15:05, Sumit Gupta wrote:
> MC SID and Broadbast channel register access is restricted for Guest VM.

Same typo

> In Tegra MC driver, consider both the regions as optional and skip
> access to restricted registers from Guest if a region is not present
> in Guest DT.
> 

...

>  
>  static inline u32 mc_readl(const struct tegra_mc *mc, unsigned long offset)
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> index 1b3183951bfe..716582255eeb 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -26,20 +26,16 @@
>  static int tegra186_mc_probe(struct tegra_mc *mc)
>  {
>  	struct platform_device *pdev = to_platform_device(mc->dev);
> +	struct resource *res;
>  	unsigned int i;
> -	char name[8];
> +	char name[14];

How is it relevant? I don't see this being used in your diff.


Best regards,
Krzysztof


Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAF48C15
	for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712995335; cv=none; b=QjTOdKlIb3xwO6H7K1YdSUCIZA7oIpgHWR531KDCzk6+c8NVm/cvX3RJbmUteCxWSV10B12UtgX5jor6jSRVVDJ9hUQGgsg5o3USPMRTZ/fXii6nr4EgOxyN/IxPLLb1n6vmZoImfO8WkJUb6BR93y9TixL0Rr1W+DQggPTuByw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712995335; c=relaxed/simple;
	bh=/FMnDrFvn/ac2eyTEfDwVJY8dGEebOCkmn/hrxXKmtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uZdTzPkulRzRzUBIg1dY6VXwqA+xaU7jAMs42HfNXYMeEXfYlVCo449y0MCKjgcb7FzBMqP8uoOzGzMsBF9X8rfuqmdlRc2fD5scuvLF2RweLviNTBMW0/VGZYkI8xdeDkcE/2CyTeKwoyj+zFjjSQLBoya6ufcVF2Pj/mg4Z4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hTzGfmkA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTzGfmkA"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56fffb1d14bso2074557a12.1
        for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 01:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712995330; x=1713600130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MYxSvTZV0QhP2VxfrLbu9TxcgwYSjB8O5eiX7G7c2QM=;
        b=hTzGfmkAxF10t6ki19eIZwEy5zzcvSIlxp0bhFjhPicS16s/JWliXqFGaykLeVqo2V
         AQP155znpbdSKWdK86QvvPy5REOwT8pNanBvAUn5r4M+xcPhghjP+vKAK5V4UTDo3b4M
         VLFV+USa1uGF3xL8d7kcWrHZgFM9Z+/0bEzVEP3nvnTYjwNRyZ0HxBnRL7rJUnJhddrW
         XKldi/qeDm87K8dwKe27hhNK2zgLkajoBlGfzVk338kUJ39OLifNzlK2OU5hB/HZP1Mt
         q0pM3tCHoxjjs2uuS1fTw8Hn8xCpKiWJ1n+uJJ3w45SV/9EYAGBdsy23uTgYC4+omBvY
         f7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712995330; x=1713600130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYxSvTZV0QhP2VxfrLbu9TxcgwYSjB8O5eiX7G7c2QM=;
        b=BTuGxw13EF/W1Fgu2cAURAKxu+9ZmJgkbzWuQ3UvFhwKXsrz7uSiUjbY8nSThiALej
         x5PghN6Y6iiSSjtRUezTN3F+YdIHLHhL8fvdF+puloTbs+N+84wF018NchUQeqL93wQy
         LB+P4eDv1kY5LNl2CMEXS+vbrRwuJjyKIFdhQvjscTzLd7HgJWhZJ7f1O7N99z1Sxc6y
         K/VEe/7OVkXATB/MLxOBgbB6NJfO2deG8W9IMcN2VYq0WvMQseu2GQFi8psYOe9QvOVS
         FnQUTEXnE8GaOAaKhB+spGfpMlNbt3XkUrF7aqw3eVotkYWjIOZfi8Nva9vd0mnSOfOy
         QrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI4xcTyY84Owv0sZ8M/QdSiBxVCNSaVTANtKVWDiUQ+IGNwW9L6LCmsVKka3IijEigNqfBG2Kd+mSfG96j5PTS44iKmz4AzpVwDB8=
X-Gm-Message-State: AOJu0Yzi5GJ4s9Ze43KsL0oaRqvXPNQlhJkDroWNmJUuMPosPKnJzDjT
	RrbhOstQhgC6z4LG+8C63du49/+vZBdzfI4kzim6dKSmlY0i9UE8CDgFCtB4s4EJ6yKsJS4M6SD
	0
X-Google-Smtp-Source: AGHT+IEvTltNWU0YG0KOLJQ+VpwSXqbR1ybfLaEfGE2MNaSt2/d/6QK4vt+6sdKeFI6bv7udR4MnUA==
X-Received: by 2002:a05:6402:5295:b0:56b:f2d8:1552 with SMTP id en21-20020a056402529500b0056bf2d81552mr6516689edb.13.1712995329640;
        Sat, 13 Apr 2024 01:02:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id cb12-20020a0564020b6c00b0056e67aa7118sm2469168edb.52.2024.04.13.01.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Apr 2024 01:02:09 -0700 (PDT)
Message-ID: <b80aa6b2-2c55-4e6b-8882-e57634dfde15@linaro.org>
Date: Sat, 13 Apr 2024 10:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] memory: tegra: Change macros to interpret parameter
 as integer
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
 <20240409094632.62916-5-diogo.ivo@tecnico.ulisboa.pt>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240409094632.62916-5-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 11:46, Diogo Ivo wrote:
> Convert the macros that manipulate the delay values to interpret their
> index parameter as an integer to allow the introduction of loops.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 33 +++++++------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> index a80c3b575612..65157bd5dc24 100644
> --- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> @@ -75,29 +75,29 @@ enum {
>   * The division portion of the average operation.
>   */
>  #define __AVERAGE_PTFV(dev)						\
> -	({ next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] =	\
> -	   next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
> +	({ next->ptfv_list[dev] =					\
> +	   next->ptfv_list[dev] /					\

Aren't you missing now () over dev?

Are you sure this passes checkpatch --strict?

Best regards,
Krzysztof


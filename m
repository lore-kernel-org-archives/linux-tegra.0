Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3D2219FC
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 00:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771805528; cv=none; b=UPZfdT/fJPZterml96MyGpztIpTJskh0bCzkNInxKH6P7p8q7Pk0oHdpeWPa1G29QuZlvbmKM8pyDIq3QR14YCey1n+sZl4tQXyeQBjKScTJazFOl/wMKks7NY53BAd7IVC+b76N0r+v2amPwE9tgI0DjupQHJX6tmPe+4NZte8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771805528; c=relaxed/simple;
	bh=8Q5y8U7qqQeIu9CIhdT2hDo15btgbsbWGqFIvIoUBDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTTiTWuGWKPsKUMiBnWUhf7IwRsyB5y0up8tu35qMOKBroFW/YdTB6PYwgMUuTAzOuWLvRawJEl7RG7sPvJ+8cI6eL1utJwtL+qlEyUBE7TCwdXzW4GXPoogHRQkeCvZ1rj5e55a7jzkVz2M9s29jU1qiciXA6Y32qt/HpSx02c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X9xzzv/7; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X9xzzv/7"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-414ffb4c0a0so3236788fac.2
        for <linux-tegra@vger.kernel.org>; Sun, 22 Feb 2026 16:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771805524; x=1772410324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=X9xzzv/72fYyctuKzLyyvXQMtxVQw9h4CR8rvuGExyrFRH6L8oqor1dVrrzvcvMDgL
         DTHqqfIx60037AmiVUfBOt7jIr1nzWT5gjZxR3uSWgERASYFMLYOOJHr7Yd2dT1C+xDn
         Z5uTwmvG9v1dV/pPMYEHzoKralsQIVFb1FdZKlttB4XLRjvkR+T346dgqwOnIbHTArq8
         8zGsWVwTWdi9oce4+QpmXhjjxmrIP2LIwdOaX+JMJolOcTn8FjdpvEH6cRf9+4Duihbl
         mFNchiAz8VTyeCt96CLrqPFaRfuly2fJclRIOeIdwD8l3FbLk1OP6Cs1YiqNX4Vc1Zp/
         0Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771805524; x=1772410324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=lPkK95BQ0Brf/ZsiMafzuqQSHSj7E9F7CwzIVAv53fUrS7ai2KdgSpSFJQarM9t6ar
         TlBy1ccbgOzI1gtSbImHQ3/wEVNNy3TewWtUXEq9MhUqhS2558QT1o5NeeMX1RXvnupe
         A21zVSG44QoB0aNpKcUrgE18AMR0+/YNANf4cnDpEjbAf/gj+Qd81V6bAVfEszM+KljP
         p26GCirtOl9xF+KHeuXxyacyPaV1adWTGiFj2pWauzC4xIA7PeoVoWJPUVQGzJkM5+dw
         K1rsn1NxiaxU9CIXaitbF4QcpixXj3QENwhmyZUL3KEfp1XnOHgr2ZaSFRpF0u6j0Txz
         3DEA==
X-Forwarded-Encrypted: i=1; AJvYcCVm9dMrgnPhp2mGkc8eO+4KyxOsN936Y4/wdTEUJ72HyJA3IV4oPcRR2P/V9zjUcU5T5tjcgRlzmOlhcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdIOh7l1zuIJ3FGGVJ7wZREFby0UptNVQzer828UOFcVkoJgmV
	o1/hNMpjo5LT2sF6NWJXI0+RRDrod9+/YKnzY2iN1UAmGaxGPUPsIjpU3Mlv0KW5AJE=
X-Gm-Gg: AZuq6aL5KYnln6tUJGlmqYLGmITOJv+RoVk8Kn+xaYowiU9nSCpsd7B4aCgHkb7EWdo
	l6Ns/xM73kiC+TuchJpoDK3zL5HC2XsMlX0T3MikdSgQd+bPTJBq+aOnsczQ2k209cdj+1XhScO
	G+k+e8heAg1JEMH/33eenAk7A6gf6X2s1bniyD3gHpE5Ml9yPzT1T9gwlYMgksj+JKuKNDlG5Mq
	jXypY3mqbyl7pjhsjjSmbm53SQIyiCp0KbJQI3j2ku1Pk+mYHILKPBim5Fh3EDMHBQhgzshJcPV
	SLVhfdd3yUebxaXzoTZg4ZGyDp7A46dRoZV4Ghpz6bQwgPPS9XTMS4zmCICotHcGqB+ifTkTyTJ
	Qgl+KGZRLzdHHjh9sm3KxRG0uSEUDR4uOiVrtCDmuDBOJ7mRj5z0D274LgS401/Sg/tqeNdttR+
	HNo5n2p6aXAp8PzCQAI9W/uRWNPq2O3XMv3cfaXChMgbbsKq5o8ynL2+qWKFY+zaI+ihI+GvI=
X-Received: by 2002:a05:6870:f61b:b0:409:794e:fe9 with SMTP id 586e51a60fabf-4157b1b3fd3mr3557313fac.54.1771805524220;
        Sun, 22 Feb 2026 16:12:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e37:2309:3937:4469? ([2600:8803:e7e4:500:e37:2309:3937:4469])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157ca3df7fsm6409978fac.0.2026.02.22.16.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 16:12:02 -0800 (PST)
Message-ID: <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
Date: Sun, 22 Feb 2026 18:12:00 -0600
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
 <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/18/26 12:09 PM, Krzysztof Kozlowski wrote:
> Simplify error handling by removing two mutex_unlock() calls with
> scoped_guard().
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index e44ef262beec..bbe1cf712965 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,

Filling in some context from the existing code...

	for (i = 0; i < num_configs; i++) {
		param = pinconf_to_config_param(configs[i]);
		arg = pinconf_to_config_argument(configs[i]);

		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
			/*
			 * Check for gpio driver not being probed yet.

>  			 * The lock makes sure that either gpio-probe has completed
>  			 * or the gpio driver hasn't probed yet.
>  			 */
> -			mutex_lock(&bank->deferred_lock);
> -			if (!gpio || !gpio->direction_output) {
> -				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
> -								arg);
> -				mutex_unlock(&bank->deferred_lock);
> -				if (rc)
> -					return rc;
> -
> -				break;
> +			scoped_guard(mutex, &bank->deferred_lock) {
> +				if (!gpio || !gpio->direction_output) {
> +					rc = rockchip_pinconf_defer_pin(bank,
> +									pin - bank->pin_base,
> +									param, arg);
> +					if (rc)
> +						return rc;
> +					break;

I think there is an unintentional change here.

scoped_guard() is implemented by a for loop. So the break statement is now
breaking out of the scoped_guard() scope rather than breaking out of the
outer for loop.

> +				}
>  			}
> -			mutex_unlock(&bank->deferred_lock);
>  		}
>  
>  		switch (param) {
> 


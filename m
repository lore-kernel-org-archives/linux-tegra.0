Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AEF30FC07
	for <linux-tegra@vger.kernel.org>; Tue, 18 Nov 2025 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455281; cv=none; b=Edeqd1TWflUV4iF/Inb9XMlxapnWotHMz6k2yimMLOeCGYmhfwE0MJ4g0BMn2AoQdi8mTmbDHWcLHOB/dXoA8N6OEVo1xQRPGvIY5MQy+Kv23N0uf5G+dvNwdayCH2nhhKR8VadQZH35Kz49tO3JQUZIr0u3/INix9dccwcO+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455281; c=relaxed/simple;
	bh=eUqwI7XHPcEodSIXBZ6QSHqUHocIGFnTSaq/ItFlkNM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OqdHFvDVN87iif8+jRVz5G8UwD15Rpf3LSMXcr2Pwr1zeovsqrpCq5dqLC4SIArH+A7xM8N90NBpkdrB/UkAIOXWXA5qMMj1MBYrGOxlk5TN9hWA/jYFdyjotkbhUCcEYC4da9LXBngKrnVYfSQGm7WeXQ6AEq4OCx3Am2dvwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8lABYwG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8lABYwG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b32900c8bso2941056f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 18 Nov 2025 00:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763455277; x=1764060077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yq4vFOa6PyL7QNMnAmGQxCezFFACJ7a135Nb6zfyyV0=;
        b=d8lABYwGMZOvjYz4j0DLjTJbxiFW3jGC1mKzoZ+DfWPbt6veUBkca3lAR3PPdEX0Hn
         F3p0yHDq9r1IGeYRCBhnUVQbEwPP2fkKTsile98zjoAkS8zqe+Bf69ZAjWJotaEy5pyy
         POrXp4h++Zxd/r+PCyIuqZ+ZsO2UlW0WbUsSzx2TkdWXxtibNGcMApqnkjQqFKEUJ1S2
         /FH/jkFS8ZzVG5Y12GLEXnBsvVKu2K3vBxhLp3eAl0Macn0/AFm1/O1/wK5J9s4qP31i
         CXAM1F2vSOH0vsAEH0+HF/hcBiJ5os7ezt/NRII0tdAzUeCDc1KaEttcb/4rwTYNs3KX
         u5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455277; x=1764060077;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq4vFOa6PyL7QNMnAmGQxCezFFACJ7a135Nb6zfyyV0=;
        b=edbZezNHyMnFOhVT99sTaNYdhmEjjtQ4DPSdlXiw91q5914B1tCJsARDzhU5YpAgqH
         +7bYtiKhnWdDxd3m8+UY4ajmEIMJb4fcQsapvflCPWjW7V3gsgJ0w5mSWCLd2uOcRJSR
         OcZTJ8B9leqUm6QD4uxGiXlDTBIhKaYhz+b/giG+iTYZeBWUODObOk+SYLhdGIh+osjz
         7Mk6e9jrtR67tcQNgO6VHmZMEr9jzc06TuhuDOEDkvMpp02TARa1W/ytNBsJguHJuDjr
         bsgnGLTBnLIiQzUVqw5YuzmQ+gL3m30RISH22MHWvDMKq+qvsoWv8llMlZIFGGadVw61
         PFCA==
X-Forwarded-Encrypted: i=1; AJvYcCVcGBSMTrrETA0kmtg8U5IynUj4b9pxGDZbAIECmoDVMou4b5ROtHrkYzlbLpaimZBmdBjdeWS9zaUlww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSb8y18Off0TVrOBl9P/3anZVwmNdfNkaAqGx+dcTXD8LcaiVl
	pVKiRF6Z1QNj+lM+nSEdcc9n1JGG7gOkDl4+XSDvaRjFpr0SnmqGWzfE/XKgDUGRfZQ=
X-Gm-Gg: ASbGncs0G+fRMsBN/QPMAc3w9T2BYjNKz1GdCNBXGZXgrpWM/ZWmB2bKeFwlqrHCT7p
	vHEC1toJMhJgdTgIsSIufahWYFPVci4HKiUWzxUFkpePN8Ya8Xi4yPByQSegg1F0a25a7EemcjI
	U/C1YmBatMKF5WMY7VUptyiuHaSwKSYhrTn1aNJhrVThLNRTcZpa7UQBcDGhODv4sSMvzKoZfHr
	WnGOw/xRTUnZa6kJ8lGMnfqQoXHD9FGDT+GzPC08BQt4eeBFhh5OyFWfPQa5WP6D0iKfPsAcC86
	rSE/0dgymyvOFB6xFKxZfz4nc7BdKKcYhASBIvaRVSWHEsevEz0j4QuJI9ZiRmmKxeunU9rmi8j
	9/Guvfz23M/wr1tVGiW3/WDrjYvcgmtDcmo7iJ8Ya2zqwiZerljxQj5PHrd1fZ8Cu5ZBKVPAD2u
	Gr3o8JjfffpVZG755S9poS6J8cagQdxk8qqKhKxxVwF5FnxOMDYarkKQcJXXEwvqLy7QkAEKfj5
	g==
X-Google-Smtp-Source: AGHT+IH41RiGPHEXbxH0nSlq5WI8s9kpwlJS/lHBgfJ72O2j5qeoTLetkMeucm/wWN5c+EHRHiOcTw==
X-Received: by 2002:a05:6000:2087:b0:42b:3bee:a7ff with SMTP id ffacd0b85a97d-42b5933b831mr14592311f8f.24.1763455277412;
        Tue, 18 Nov 2025 00:41:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b5ce849ddsm24329515f8f.14.2025.11.18.00.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 00:41:15 -0800 (PST)
Message-ID: <8c2069c4-54ef-4cb2-8277-a807d08b472c@linaro.org>
Date: Tue, 18 Nov 2025 09:41:14 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/7 RESEND] gpu/drm: panel: simple-panel: add Samsung
 LTL106AL01 LVDS panel support
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251110091440.5251-1-clamor95@gmail.com>
 <20251110091440.5251-6-clamor95@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251110091440.5251-6-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/25 10:14, Svyatoslav Ryhel wrote:
> Samsung LTL106AL01 is a 10.6" FWXGA (1366x768) simple LVDS panel found in
> Microsoft Surface RT tablet.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 6369e5828189..bdb53824e3ed 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4223,6 +4223,37 @@ static const struct panel_desc samsung_ltl101al01 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing samsung_ltl106al01_timing = {
> +	.pixelclock = { 71980000, 71980000, 71980000 },
> +	.hactive = { 1366, 1366, 1366 },
> +	.hfront_porch = { 56, 56, 56 },
> +	.hback_porch = { 106, 106, 106 },
> +	.hsync_len = { 14, 14, 14 },
> +	.vactive = { 768, 768, 768 },
> +	.vfront_porch = { 3, 3, 3 },
> +	.vback_porch = { 6, 6, 6 },
> +	.vsync_len = { 1, 1, 1 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc samsung_ltl106al01 = {
> +	.timings = &samsung_ltl106al01_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 235,
> +		.height = 132,
> +	},
> +	.delay = {
> +		.prepare = 5,
> +		.enable = 10,
> +		.disable = 10,
> +		.unprepare = 5,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode samsung_ltn101nt05_mode = {
>   	.clock = 54030,
>   	.hdisplay = 1024,
> @@ -5390,6 +5421,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "samsung,ltl101al01",
>   		.data = &samsung_ltl101al01,
> +	}, {
> +		.compatible = "samsung,ltl106al01",
> +		.data = &samsung_ltl106al01,
>   	}, {
>   		.compatible = "samsung,ltn101nt05",
>   		.data = &samsung_ltn101nt05,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935118BC20
	for <linux-tegra@vger.kernel.org>; Fri, 13 Sep 2024 07:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726213528; cv=none; b=H7+Mz1HNjy0yvRvGBOWoCEE07OXSfEHGwWF/k+eIPwqITF29MdUHSWppSTWASFdXr1Zrzh4/ahROPJ7syFuN569o+XfIWS7wOF+8SaLFdV+FQTCvL4UENoxdJ7xM/vUUN55uQh6qkDb2DaVBiyl/XzZB5tjjcysrkztpGv57O9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726213528; c=relaxed/simple;
	bh=t99oJFUg81y/6rtqM5Bgv31jvt7J8t+4m60AvrUX1Fw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iVBPYVLjOXuE4Ay+mqdNVEPCrLwIpSpuqiSaYH6+IzPsq9150wB9CS3K3Igk17ix75KQcGEROG7lUGLAm6idk9Ia2OCHPzFm+NTGiTu7+KFZPjKiJLNLo7fNGssuoq8ifNHs9W++uUpVF6OaKHNBNRpZJ9mIHb85lMXpzcRL59o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9bgpxGc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9bgpxGc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3770320574aso1297810f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Sep 2024 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726213525; x=1726818325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9t/8ow0g8m81xWiMMS3KyxV3Dsn3Wvosgn0saUrr5g8=;
        b=K9bgpxGcepnEbKaPvHvJ3prUjM9GPO+aKRMofLfCn5SAecsRjn18e5wVHZvBdu6OS3
         JZ2p2gDPcorrTiddg5UaVx3D4DTY3lc2JXiqCo7o7uRiEQkZQciBRsgiKuQzsl+oJjzH
         QfOvb2gQZu7BPgJ1JdX9X62PFQ3OAgidFKw5HAvJUKHlTpFlsfZgPSUNUio0vuQwDqMP
         bXk7gzDbwjJ5hckDwQpC5zqhYD4CwRkkbCONp3loGrEhXGXEPNFu+BL/z3p+NDJdp8ZG
         BMIu5Gv6qfgqIih3xMI4DF7Tn0J3nEwnt0nGsDkMW6xvwCyNyxmU9gUKFGlVYAvhNx9M
         Ar6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726213525; x=1726818325;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9t/8ow0g8m81xWiMMS3KyxV3Dsn3Wvosgn0saUrr5g8=;
        b=lly0GQXGoiQtYa4aIZ6HS9A78dbTNPv5rLIN8aYWJPprcy7DpFMTSNyC+Mj0Dbeu5R
         b/XHx79fFbd+usGJdJv3FtIUaUH37/CBr6bGw2DJkZbQTMIK+yctqqseowOtdmREsw3t
         2z9Ni3IRbzIML6Q4EXcycuQ88J+q7VQG5F6m1OMOijewtD+6t8QLulsFqEnsrcj8fdOg
         VRNmQduaK6EShp4VyVYOdRabYBH35PdMBMJV5V/u4/Aqwh6B7TR6h61nn0//Ycujegke
         5dSQ0QjsmIWX4ZfDbW9tt/+mCn+AvYoSA0QIAuZZjKiKelKUmHGm/kZvO08dp/OHgnVY
         JKrA==
X-Forwarded-Encrypted: i=1; AJvYcCXURBoKYXg9n7f1X1vFT6I/wgpzerEpyWClSsM7rVQnU0MGP8MTCyzMUCS45OwiOzOMcj3CXFgjyQC2dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqTimtGhZJGuezMtEuI8VX8H0ziCfCq+sAgeL9wlO3lh+Pfbrv
	nrqRwv2Ynv3HQ1nMIGcq+Qq/7o/1pe6WT3lteIuVe1jV3A1yA1D7fsSy9OP7L10=
X-Google-Smtp-Source: AGHT+IGcNFw9WaPjBDW1ud7axBEAuoKvTRfN3zPb9CC76EX/+8jUPvInz4hrp4CUciU3pxclE1NduQ==
X-Received: by 2002:a05:6000:dce:b0:377:9867:9028 with SMTP id ffacd0b85a97d-378c2d5b110mr3024653f8f.44.1726213524816;
        Fri, 13 Sep 2024 00:45:24 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d3941sm16099243f8f.84.2024.09.13.00.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 00:45:23 -0700 (PDT)
Message-ID: <ff38f3e6-dc46-43a8-9aa5-62cd50050d2d@linaro.org>
Date: Fri, 13 Sep 2024 09:45:22 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH -next 1/3] drm/bridge: it6505: Enable module autoloading
To: Liao Chen <liaochen4@huawei.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: andrzej.hajda@intel.com, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linus.walleij@linaro.org, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com
References: <20240902113320.903147-1-liaochen4@huawei.com>
 <20240902113320.903147-2-liaochen4@huawei.com>
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
In-Reply-To: <20240902113320.903147-2-liaochen4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2024 13:33, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 1e1c06fdf206..eef5ad449c16 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3498,6 +3498,7 @@ static const struct of_device_id it6505_of_match[] = {
>   	{ .compatible = "ite,it6505" },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(of, it6505_of_match);
>   
>   static struct i2c_driver it6505_i2c_driver = {
>   	.driver = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

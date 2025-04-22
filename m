Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FE75FB95;
	Tue, 22 Apr 2025 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332300; cv=none; b=rXM6Qgj5Wx/zk7u+L/ay21hGfAkHQcHvcxpn15N4W5KbMkVQi1kSC30Dwt7Lr7Nj97zya2FwR9+0aKoIkU99vP6biCtTnQ4Qsc/gWQSvYa0acdZp8HLlNqoYoRguVkjLJU+W3Zcn0ua0pyynvakRe9GlEKgrhlY1LgFoeABtrAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332300; c=relaxed/simple;
	bh=aPTEjEJvTaqK7QfdNneuXA5RGpq3RiNIyz1EOWySdY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Clr7+dMShkCExTQR3KVTbN6Z6svbkjPb4US0A1J42iUeWMljELxecinNB5jXbUXcUWxwtaiX2A+jQI7/NWdtihaUa01bvLnpyoQpJzpsow6zO0c5tpImD4FAdLGbf6jtUeD++N20yAIUSO0w/Zq1k++BXekfHsQ1ABdJMvaYiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTHjseVn; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTHjseVn"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1138338566b.1;
        Tue, 22 Apr 2025 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745332297; x=1745937097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9D2Ohj7BMKhRiIF2UiB0PW+jmy/zmiJ2pgDRvvl1DdQ=;
        b=MTHjseVnwQQxG7mxXwyyOiioDZ6jgbLkRHuzZY5wwigbJbV9KFkdjmg+Mo93GzJNTm
         ykpdMyEScaz9uP0ougUh2Sz2lWV9ZTeCDUlHxYl3t6eCB8f12x6cRm+dIMVxTgWT4LsY
         1XvfS4mELBOPyCx9XVAHInqBL+oggjLWNPpD8Ig3s5+b0lE6RYXwoPIEL14vW9xK3Sha
         wHe8gQ6A4MSrUtTlYt6o9x3O5DLKl9xII0KLuuaymKo0MQTwhjcUWL5gthZqXSxJ+6r9
         YnNKL2DLomG2EGn6lLa2j26CR1g03atEbXds+EgsXyvdmnJoZAPMalY9Kun+1CEkDzUy
         65cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332297; x=1745937097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D2Ohj7BMKhRiIF2UiB0PW+jmy/zmiJ2pgDRvvl1DdQ=;
        b=l7Htr4mDNXvUnG6V9rBBoauJcujAY75Ng8m+YJ41nXzgu5rTKEy0S9jWzoOOugJZ2v
         TIk1O89ZU1/hRLQbUS8+GCQRE2Z+/AyR4LcCgl8BeGaOhCDHnwZNWrpWJwJwkYDYXDnj
         qABqvlXevDzuSoSAStLNU3zBL87xM/l/5M+tOMiybz/E+zrFty1WvenqDezQRYLsc/EV
         JZGuvhzz6AiAvhAKVm4XHxCwbLt8r3BLbzQ+PRgg9QfU0K+5jb8Qi1aGZRt3Nqw/iJaT
         sQLrEPlNqCU0c2wvvDWV7JUereo1ExvM2agBvpzgMNiHgkuUuhzONiNSvlINadW06Dhc
         Uxxw==
X-Forwarded-Encrypted: i=1; AJvYcCV4eVcvdGvfIkTbNHs0JCUxZQ0CQhWuPyU0f6/oaoHA9n5Rh0XjWZR1M6CFGtVpuUrhF/ixHylW9CnIINo=@vger.kernel.org, AJvYcCVRdM6sbIOxAhuv/MXddCA/5glFL5paxkbZLLT9hGBIxYNYTFcvPMGz+QeAimnR0LR+vb+tWuBPWlN7@vger.kernel.org, AJvYcCXJx0nd1USZYr/a4E6cFNXfTVzqQC1TtoMkM/CDheeb6zFFq2Vjmaps/V2wQcu774ZcE2JLEarlBNYSQp0g@vger.kernel.org
X-Gm-Message-State: AOJu0YxYz8dEMpc77RSSgUUPu568IiHydIOGb3GRwVX7aW389veAEeWS
	dtSmaqenWA3n7gnXZAq8ZzqpL9aH2Ue/T0Pw0vQjOeJtCB6x5WhG
X-Gm-Gg: ASbGncvRG5BHU8ptX5+dH5/5CyzxGgsst04PCxo8cbNrUaGWAOd+MU7DoQeQACEbXei
	T5IU8U3h2Ck8ZD0PLJ1XaLNmPhkAVo9iqxEA1L55CtYpyMoeTsBEgauQFvUaY70cir8pop8UilI
	O6aXY7ATMonJps0BLCutq6b9IvBhYsU90spQoWkNk4Xs1aZXZioFZBW+KDs8n+Ur3SdDjJplGyx
	AsaO3lQL3g1K2lky+9FkjP44oRJRHDCn5ARbS6sQKeHLLjtaXw57LhCFzMfl9GwZkNf1SRWN11A
	oxOZT5FHHUzKA12i0wzOoLTkevxm2OgHyqdDMPtZ+u4=
X-Google-Smtp-Source: AGHT+IHxR50TFifkBPFb1XIbV7o2Uld6KWH6bgmxrkwABwpSwd3+oXjHqcT/SSW4faB3cyazbRU9pg==
X-Received: by 2002:a17:907:3f91:b0:ac8:1bbe:1a5b with SMTP id a640c23a62f3a-acb6ec51617mr1298187766b.9.1745332296250;
        Tue, 22 Apr 2025 07:31:36 -0700 (PDT)
Received: from [192.168.1.101] ([212.106.161.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefc685sm672352866b.96.2025.04.22.07.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:31:35 -0700 (PDT)
Message-ID: <de6aa1b0-3557-4b8b-86a3-919fd9e5dec6@gmail.com>
Date: Tue, 22 Apr 2025 16:31:33 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Add uartd serial alias for Jetson TX1
 module
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250420-tx1-bt-v1-1-153cba105a4e@gmail.com>
Content-Language: en-US, pl-PL
From: Tomasz Maciej Nowak <tmn505@gmail.com>
In-Reply-To: <20250420-tx1-bt-v1-1-153cba105a4e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

W dniu 20.04.2025 o 16:35, Aaron Kling via B4 Relay pisze:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> If a serial-tegra interface does not have an alias, the driver fails to
> probe with an error:
> serial-tegra 70006300.serial: failed to get alias id, errno -19
> This prevents the bluetooth device from being accessible.
> 
> Fixes: 6eba6471bbb7 ("arm64: tegra: Wire up Bluetooth on Jetson TX1 module")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Tomasz Maciej Nowak <tmn505@gmail.com>

Thanks.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> index 9b9d1d15b0c7eafd3895f02db1bc747d7cc8923c..1bb1f9640a800af6c10fabf0ee3916f2566a6d4b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> @@ -11,6 +11,7 @@ aliases {
>  		rtc0 = "/i2c@7000d000/pmic@3c";
>  		rtc1 = "/rtc@7000e000";
>  		serial0 = &uarta;
> +		serial3 = &uartd;
>  	};
>  
>  	chosen {
> 
> ---
> base-commit: 119009db267415049182774196e3cce9e13b52ef
> change-id: 20250419-tx1-bt-5f202a7e4cac
> 
> Best regards,
Regards

-- 
TMN


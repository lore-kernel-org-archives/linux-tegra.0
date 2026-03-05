Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1339A069
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712937; cv=none; b=E3/0og6S+L7GTbiKt4WbOS26cQFasB8q74LITOr+YMVKk7MfYWexYYOxpfUBV2fnDxXtT6p5BbHy8oC6Br6rFQIh5AKrABTlZS3CBPqQCD6RbRl73GzXAoo3MsHk25Lvri61eCSYFxrLVtbUVJrrD9wKFG5ntrBK4heQt+zRETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712937; c=relaxed/simple;
	bh=1N9rpptCfEGuKF24I3MO+ctQKVCjB9J9sj4YNN7+SI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmYwgCXvNbm+ZACchkqRQky+KJE2kBB8+fX/SZJgucYJsFYgqqCLemw5E8Zu31K7sdbbJ1IkzIeQxguEZt34gZ5xmDI45pfVcfc+mF1jLHKvc9NUgrnZLIl0gRf+5ISC3H42qmJOK1MKTm9WAJ4qN4H3VbhjQ8ZS1ZNV8b2bQdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3599019ae92so2353767a91.0
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 04:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772712934; x=1773317734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS764krKV6WfB8kOxjvP29bXooB1nm1bNBDNiujlO4g=;
        b=jI7Cv6dtbpqv6eADzRBrE4nbdFGo1nsCNI0Xpj+VOrKl5KFjcCG0hxaMd/8pEZJML7
         G3JjcJf6B/BE+4mGqaHjARMUO49vRTHYH8jO165HmTIobyqw5a3oAm5MQGT6N0nIk7xO
         0Qg9xPwm+vXvj3wMKB4Fge3XnYELMuSRCmTeSbtvofIn5eRqKckGp/uIygG0xCtbJygo
         Q0+1hfh3EsNl9V6IhivtwLPYf+xnrJUI7kvN4wy67DGsNktzMFUniiWpaZriRIwyiPro
         flsCVMBRHRKg3nXwlWCYrYsyeiM0Fw7pE+BeF/P6BKABRZGrFBf//8JN0RdaXC8aY9hT
         ypvA==
X-Forwarded-Encrypted: i=1; AJvYcCVX3drbTwcJ4imaAT7HONxFXDbwSYiNDytcdvypoUqsXizr8S0HOgzNmNSBTFuC3zym5ugWAdr3L6A+FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWoGbLaWVw6Jg6pSgkWeYdhpJJ+ZL8GwDB1e3ABN5p+L+ZR1V
	UBX/oEriY/Y+j5brPFQj8z0LwJRbsvR7WUutoUwlidj/SyMvLzMKAgBn
X-Gm-Gg: ATEYQzydPhVegyDVtcLJDOCKqTNZrzDtY90l+xskFH4aN4D4mNQqD5yx3UZKv4ULhpM
	li39sWTIICSZEEF/ySBO8jUQovr09qsqCPXEiLtO8S222c2RXWoi6rWNpDs5Bj7Gfx2pddfCPPN
	958tt1AXZo2Wpy3NKLgxoN5P/AaSO/knKIUbaigg35MkMnsS7fdzCwysyuFGE2zKmq+qYHfrdLG
	pfWiq0jWflCkY0G5PSrCDsTyuWn5o4O+QP+9iu5RhXUiY9C3LmMNT+gECGn5hDYSu5COSpsfB5E
	2zQe/xgQDx6yalSrMlCk0lSEhAxYTBZsziYNjVvI/UCSIanvLh/ntJVUlNntZ6IsWBOkV9Ng8cb
	oB7mv6kKY/sDQxMpubRo5BF8+UqS6BGtYBwuiQbG4qp9p+lwyWxyNJ95+iueHiuEgsfRryxCvfE
	A1ys53PbOvpXslUqDScs1/7ohZ4AaiJI+bO6FNQql78OZKt46VIkhgmSMR1tzOUxjUExI5erfca
	EN7pnuKyOeO1QIAfPVlZPnMJpd0UQT2bQHEs/K/oLjQYkQvM3AJKO30hAkjaA==
X-Received: by 2002:a17:90a:d44b:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-359a6a92750mr4210979a91.31.1772712934483;
        Thu, 05 Mar 2026 04:15:34 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2c1daa6sm2391359a91.0.2026.03.05.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:15:33 -0800 (PST)
Date: Thu, 5 Mar 2026 21:15:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305121532.GA1649635@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305114352.2f7btqixg4tu5bzl@skbuf>

Hello,

> K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> K:	\bphy_(?:create|remove)_lookup\b
> K:	\bphy_(?:get|set)?_drvdata\b
> K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> K:	\bphy_(?:init|exit|power_(?:on|off))\b
> K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> K:	\bphy_(?:reset|configure|validate|calibrate)\b
> K:	\bphy_notify_(?:connect|disconnect|state)\b
> K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)

What about

  F:	drivers/*/*phy*

or something along these lines.

	Krzysztof

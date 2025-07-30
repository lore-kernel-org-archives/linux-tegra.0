Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7461F1301
	for <linux-tegra@vger.kernel.org>; Wed, 30 Jul 2025 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859061; cv=none; b=KW6yqaX9EqmOFQ2jalqvmHzoYMWCvpMPJtG6IUAEUpd7vi6LMU8kDLEybrPsYio3uBtbFSM3kHZsJF4CF8jwdpjfKSLl5p9hzQtBnRCB1DauGX1MXI/WKyqQf3Ud+RwgE18nyduDwyXVHPBi4IEf7Fv1Dr2IN+iobYsgHvg+gaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859061; c=relaxed/simple;
	bh=ejF5a+NRIOf1oWrPc8RSvxPJC407uoRHPB/IPhVhqf8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cUUCjvynanDhu7HNj+qFhnFFfKnN/gE4KM8CdZ1qANI80qWIKrVIaHYV663g7c+lRN6lVdklVwaQYOoctDD+QxyNPp7KDu22izq3sJhvv5m+GoD+cpKpgFbGCBHaV3o/sn83GWXxYEkY7nRuQtXgWxwg9mVRryO7iQTj+J/Fkpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eq53piXu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eq53piXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753859059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7EgCjCwSAoWT6dP7WChm7aBhbHSl4JFbz/gKARLGAAw=;
	b=eq53piXuM76oRDb2kbphVPCmP4x32e4Irja029oBvEiaxov/bHl5Gt6Z12oEVTMUeWXm3i
	pFr7a60R+Vh1MyynzRD1tMEeIuIh/QETZVXSwr/BBZuaMf3yTdkbnxBcuuEdBhp3VfNsMN
	ua60Ws8jVJVZUCcenKN1EaCXU8/8xJE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-FD2KDoovPFCBDuof1ZKS8g-1; Wed, 30 Jul 2025 03:04:14 -0400
X-MC-Unique: FD2KDoovPFCBDuof1ZKS8g-1
X-Mimecast-MFC-AGG-ID: FD2KDoovPFCBDuof1ZKS8g_1753859053
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b78b88ecfeso1433771f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 30 Jul 2025 00:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859053; x=1754463853;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EgCjCwSAoWT6dP7WChm7aBhbHSl4JFbz/gKARLGAAw=;
        b=qb3TnyD2+pk1FwdOak0yjhnyY7EvRUmFNbjzPgqOR3JXe8IuJr75/BRlYBSIH3fxkF
         pv8GdoxDLai+tVQsH6tXYyfudlZHQaO3Bd0HJEy0D/gEKrLkga1DF0tu2V/7G1uABxx4
         ydAI7HcH1sWGtLE3QoVEY8tGSneQ75SBUUf6PoMoywSJKf376ZqodartWqLFW58H4EJ8
         NOiFv3HtguRuAsZFi4JNKTe0qmi0YiIrKKV/ZpwgXxXRnftLf2nA12Sr/uWU/10/pPvk
         1jyoXfc1OxxfKd9EHWxuoIoWF/nC2eSkJXbjzNKuQUcIh+C683jpgu9XXTI9taRkG0Rg
         9jxA==
X-Forwarded-Encrypted: i=1; AJvYcCUHuqWV+o1yD5mtA8IZHqph0OAxqkyD967DEsNHxvHu5YNfY4/b6kobMkpaKioWe7nfspkTOJcZ/iuueA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQvji+cNs4ZrZpXJvPppIvuPyBoLLdhcdyqUyn2hMqRvxaIhWX
	9YGaBDzVVKZDjVXTD9bCETzUfvrK3iREW+rFPiDsMVwC/0RyPMZQibxeQusnPKnYFhdIf4eyJT1
	KdtAYmf+EyCGi8moz5JFwni+7w/QWpKx7MkOyv6aRJW3lhmDXdHElP/2hyOGhcvyg
X-Gm-Gg: ASbGncuyZKXMIGi1aDjfC0Ef4iw96Mmxv9cW2gPND+ebsbmnFPbCkrfn6vlBRV5ZiBT
	TNIlTRi0vxDMtpvJSurC6kbS0ZL6PTQDGDQ6SjFPHTmSWTA9RUCL7+uZN4bQD3e9WCU7wmpfqoy
	CHR9ut4m2hOUCKUUgDw4u5jeY3bBM6Evr0r/rxvSJ0AMV62gR2Qm/Bh1S+eZCQ6852aIX1lBRBQ
	K7YoT2Fnmeq1ScLrGl56G4N+LvTs+1Iiat3wvTfBbxsPzV81bL9TWMw6dEx4nE67VotnQNVT9M2
	PK0PR8yEoG5aUXo3sP8Pvfftkrsa4WEg6vl/EV8GbIG8B64I5sJ4uwJO5IKXREbZsgZztmEEGIK
	nHx0=
X-Received: by 2002:a05:6000:178c:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b794ffdafbmr1455233f8f.37.1753859052964;
        Wed, 30 Jul 2025 00:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNUbYGDL0unBoGUvLAcwoshm16lk2z/rlSxU4KYNEG/RVgWXaLcOgnhaU/dRAgxynEmknJng==
X-Received: by 2002:a05:6000:178c:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b794ffdafbmr1455181f8f.37.1753859052432;
        Wed, 30 Jul 2025 00:04:12 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-093.pools.arcor-ip.net. [47.64.115.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b78f5edsm7115817f8f.28.2025.07.30.00.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:04:11 -0700 (PDT)
Message-ID: <532f5e18-8613-454c-8497-8c224360ebbf@redhat.com>
Date: Wed, 30 Jul 2025 09:04:09 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 uapi headers
From: Thomas Huth <thuth@redhat.com>
To: linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250703173859.246664-1-thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250703173859.246664-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 19.38, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembler and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
>   https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>   https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>   https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>   https://github.com/riscv-software-src/opensbi/issues/199
> 
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.
> 
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.

Friendly ping! The patches should still apply cleanly, I think.

  Thomas



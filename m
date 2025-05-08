Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60713D891;
	Thu,  8 May 2025 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738921; cv=none; b=pXrixdbLAHrgXy4Z+xd8+BCL0kBNsfdDxVOWDWy48mqx+5kkBJsygR7rXlwKvOBZnKykrUfIIbz3qTz9q6JtrE3LLnRjvK12vjm0UsXKQTehVwANdnfTfpbk4ZssxN1lEDKejntw6Xqv+Atiz4zcM/kqyIVHkFlKUbdzKG2VIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738921; c=relaxed/simple;
	bh=nKXeoryRWZyfozlALz/gMgLZJWpZbJjP9ZhiMeLCAZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqy3vmF7n6pWq57QzMt6DxSbQmyHHYO2tTwNAKG1NHaLGMTRCpPXnslTuINpWi5iMZioADeLVtzWYdwICYLhePeGQ88cOHE0YtQpG/VKQDZpSasBjAbm4hCfwOJawPN1sf31TyzvMv3jMyt6KAe0npkWOfItWH5GdS9IHUDzezc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h96xfiiI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h96xfiiI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso12814685e9.0;
        Thu, 08 May 2025 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746738918; x=1747343718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+wsUkJO0RztPZsvUmHBVaL2bfuw9bYNlaeajMcqcC8=;
        b=h96xfiiI2GQt22XbF1YtrWB1gOS1XA1DFyYSynqqV2E2PXeIA/8cAxxyMabN14ZRty
         liKoK5/7T3UO7AoD/Aj8lCHkbVIJ8FFgbn72KlNdEQFC5PNb7ThFHfvSvbqCGv/bSbxr
         roW8M3kJHr6H+6nrtogLSdFvG84KoL9JlD9o3PNYLAI4OwxGO1BTBTlFQRerGMBxm96F
         OPfx7V0DHMQ69nVG7TjWfiWScm8gdgsgMixWuS5Ip+oTsTAF8wpysWAql62im+UyL99t
         SXj+IJbdEmMuPWpcg6CR/wLi61Jl2tMujhqjaHYTFADuxonuEl7MY2/IBltL6WgMRFkp
         oxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738918; x=1747343718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+wsUkJO0RztPZsvUmHBVaL2bfuw9bYNlaeajMcqcC8=;
        b=XJ7PKPCJ57fAy1vUFAu/TT2K/CMSkjrK9qap5JqSZdCO9knLgfwiTMEsJU2mdlRp4F
         BcOVuz7j7ivbr/ijJdq3n9EzsqhKUF/mc1P39XVhxIOCajvVl5EQWFoZUpJNzdyzFPXg
         nqyhMHTyvj3HYmKJQ3ine5WBlVcQCf4/hc/qmTZkUcNjysoDflLS4CzyLnvMnRG7YjgY
         iLo9aJdXmNUF81ICSPtzdF4s9PpxhgO4byQRlLKegWIHmk59ilriXgo4Wbbg3hCi+ZDT
         P5IlYfSWaD3wOcugFbGbjbKkz8ef8W/xx0FtW+j20Kh6SOhczUjgRxX393QL+Mt3ablc
         Md3g==
X-Forwarded-Encrypted: i=1; AJvYcCVBLk+3kWMvpEMEUGXxmfy19KiWzU0m4FzKlJEtf/hwiPV7cpHwN40IEoCQ7plM1evLWhe/zL7SFCUinHU=@vger.kernel.org, AJvYcCVxGbRH9nFpRm2/mBEIAqTfr+j0S0sq/byZIMJWZCHmz7ZIug2Jy9IIXyUr0fjohOMEc54Ocl61pueysRE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhn3+u1oYr6nKqXlluQF4q4Xn0U8dShOi3YbYq73eA2bnbEMnl
	XbsWYr5ObIJlGqJxySNHP/h7DjlZ71Tl9gUP0k0QtQRFkuoaLwtq
X-Gm-Gg: ASbGnctGaSu8mWXMTjAqwBuJi9VXZKzq1jEpU+cIIfVIFF8CBf776JqSd8mVrLlV/Ze
	Z/EJG9JuFk/9F5eS41xdQBlffYPB8MnfLZ/qrxcvgY0V4Vr4XvahLVv70X37RSBn2jBeNY8mALY
	Qx8NeIbraexkHPTN1+zVaCLwkGnQIoGRTm7Vf0CodBjo00wB2kItDyP2NeOR+7U1bzdpFFaaTAF
	8Z6b92DA+y2wN9zTaE0ZaP6itZ9DZlK4SlqFxoR3f9uqvlmAfo+5MQPXvQn2uImGQOV1JLj+32q
	l2x4I7mPKhXYPytYSmbYrStTDFb10C85NE+U/MHWZdHxqBlMtj0Klvtc6CxWsMpShCFKUzPw2Zb
	dqLVQtPCJjciy1RHtDk1KplPX2ZKLZqxj
X-Google-Smtp-Source: AGHT+IFBBjd15su7QJAfzUcRdW8vPL4Y86zFld115UOnPwje+OXBJGVcsmNAIIOFAqvCs1kpRz3GVQ==
X-Received: by 2002:a05:6000:144e:b0:3a0:b979:4e7c with SMTP id ffacd0b85a97d-3a1f643a4bbmr796911f8f.3.1746738917948;
        Thu, 08 May 2025 14:15:17 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4cc2esm1062784f8f.90.2025.05.08.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:15:16 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tomasz Maciej Nowak <tmn505@gmail.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add uartd serial alias for Jetson TX1 module
Date: Thu,  8 May 2025 23:15:13 +0200
Message-ID: <174673890827.1569748.754360952735325946.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420-tx1-bt-v1-1-153cba105a4e@gmail.com>
References: <20250420-tx1-bt-v1-1-153cba105a4e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sun, 20 Apr 2025 09:35:37 -0500, Aaron Kling wrote:
> If a serial-tegra interface does not have an alias, the driver fails to
> probe with an error:
> serial-tegra 70006300.serial: failed to get alias id, errno -19
> This prevents the bluetooth device from being accessible.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Add uartd serial alias for Jetson TX1 module
      commit: dfb25484bd73c8590954ead6fd58a1587ba3bbc5

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

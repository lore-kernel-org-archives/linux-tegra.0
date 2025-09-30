Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F123F200C2
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759202143; cv=none; b=Pc4L/K315npx39q+R+TEqaAzLmV9sRpRn3PU7A9UTi3g2zF2zMdYX6VMseiuQ972PDyi87yeLJPPa6atsvgwct9KvQG/CecTzWdI8AZ89Jd7Nvfc5MpKxeH31Ec4jEmwJH+VFsPzGvYUOchv9hFMSeLYcFrCATYJWV1NIptdqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759202143; c=relaxed/simple;
	bh=f1mcXd8+Wda58Pe4UjO10xfHJyJf2Mdi7u1iGWV2Tdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pU+QZyBp2i16v36QmNzw5jZHYrAP0pX9+w3+GEUdqkp50NC447KyPd7Kd1TBgjTF9MJsQEFmrU5uEbiHFOayMeUkiXdpbdqPjMCBd1JrZ7Z1080tSE1Iasitrdb6+9X4I0unaGtIxMKQ7v/BhJkws55Sm0pUte1KETBURmTa+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cNC7kJSJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cNC7kJSJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eceb38eb1so65716745ad.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 20:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759202141; x=1759806941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9VNt+2mjTk7M/315hb/0C625yS1/uUIWUcK/eJkk2E=;
        b=cNC7kJSJnvCv1QE5J/p4MBoT+/J7HvgO7fXGrhUelPMSLqwdHUOjUuqzgPeStzscy9
         ZvvQamEPg0POs++dr+Sq8CnXcavqTPv7Sr//xT/KZc6Ijx5VxfcpRk252pOxfHgDNQfK
         jPwZUo2ImgJBz3oA66HlfnVr2fIQ+gmqciW/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759202141; x=1759806941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9VNt+2mjTk7M/315hb/0C625yS1/uUIWUcK/eJkk2E=;
        b=NDQbdFhb4mwWMvKJAH0AK5bFcijnY8cDHuYTXT078m1qBBBErJleoe+h+kIabRCZew
         szWw28CzambcFDjuCCy9Ig9PKE1eNCaenaqS1ntKp85KwTZrNLYrsUQS+2g0XSSFV/uW
         XkfkkMuYv/I8gL78hU9+e/Vw+wHjhhW7NamNGHfj9z+Q5SdUrLnQtCNKMoK+OI3rZY2D
         jKS22VkYWKEQPQNF/fIPpe8qDyZ+o7EiflX1ixZBFtbtXqHqY6c6vdHI44AdftAg3I2Y
         N1B4mlUwTwvEU7nKS6hLLChh1dgBeN3dIIEUfSiXKa7qIw1wlgyTrGZ8v/IaeePVF3yf
         LUDA==
X-Forwarded-Encrypted: i=1; AJvYcCXIe9ncDhfghfsAoG3iXwJ7fR1JkI8ZETdGwfh1CA0adWGG3a/E9wgRCT6NlMd4/uFxKSA9TcRhRoCkIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQAuKvjb/NddOUn9Nt5rPVtYg/4MSjETsCNBz4uotqHWElVKdA
	X0GOR4wq8cH46gEThgPUHccUoblTJamTxCWO9fnLbMMba7GPn7R+zxxEVGtens7XBYmXU6QvDNc
	3R4o=
X-Gm-Gg: ASbGnctNtaccQd+gBQbXPMbbWlzebptP6QVSGRZRn780C7zaXN87LPLVorqr4NKPP4+
	RVE3CXiJuaeTKCHXnk6XKCKKKOw2u2qABJlJmzl9W+e2u55rU76sp8BDvI61y7iiB2QMa0AgTJ7
	kusCkS47/nB1aLj5mtXRng/tJmXVyqS9iAIlNNtzZgDx0WvlkOUYSgoWaomXUdh96MpnXX/S3yE
	QiJD9uOz7sFzd5i+JxzwgN02d7ojHCNGRDg28Yjojj4GeZaU2YJ4KXx7DAwtJnPXib8IqMWJV/x
	gp55OuZn0AAQY1Xt3HhHWjnrZQacoP+O45pknXewBh3aTtt0zN8A6L0rjb+dhhbq4iJn6e2GvDn
	Qj1UCxofot9dlkVOFJnCk0q1JYdE4FePlPGxRpXLIp/hwxlVUFJ17OZomqs5U+Wg/KzIwMvBzf3
	yvpTtBCeZt6GADbq7SZC98khYP
X-Google-Smtp-Source: AGHT+IHUBSzOYRBWBKHYRIuI6QvM8pvO0uwasuQbNiXgrFYo+LTPn6zJaoFS9pYhXmjmLPoqHTuDIQ==
X-Received: by 2002:a17:902:ef0b:b0:248:7018:c739 with SMTP id d9443c01a7336-27ed4aab56fmr202053175ad.28.1759202141386;
        Mon, 29 Sep 2025 20:15:41 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fcasm144941125ad.93.2025.09.29.20.15.40
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 20:15:41 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-279e2554b6fso43348555ad.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 20:15:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8pADcHbnZYEsGXNc+LyisIKgDutdiPJ0moCd8H3x+/kvlNQqVvKZW2LbocbyFWD9mnM7LTnaWRGadcA==@vger.kernel.org
X-Received: by 2002:a17:903:278e:b0:269:b2a5:8827 with SMTP id
 d9443c01a7336-27ed4a3ebf5mr154705285ad.16.1759202140267; Mon, 29 Sep 2025
 20:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com> <20250929142455.24883-9-clamor95@gmail.com>
In-Reply-To: <20250929142455.24883-9-clamor95@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Sep 2025 20:15:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VO2sXssuhZyz+aKvN22xH5eButHOQgKK+qEkPT3Ug2XQ@mail.gmail.com>
X-Gm-Features: AS18NWC8gI3JaOT7-DFuGJwv3EdaIz2pXOb_FdBFJQHicmbnwrHDBbTXVpKcO4I
Message-ID: <CAD=FV=VO2sXssuhZyz+aKvN22xH5eButHOQgKK+qEkPT3Ug2XQ@mail.gmail.com>
Subject: Re: [PATCH v1 8/8] gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> Add an eDP panel entry for AUO B116XAN02.0 used in Lenovo IdeaPad Yoga 11
> with Tegra 3 SoC.
>
> The raw edid of the panel is:
>
> 00 ff ff ff ff ff ff 00 06 af 5c 20 00 00 00 00
> 00 16 01 04 90 1a 0e 78 02 99 85 95 55 56 92 28
> 22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 12 1b 56 5a 50 00 19 30 30 20
> 46 00 00 90 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 31 36 58 41 4e 30 32 2e 30 20 0a 00 f1
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

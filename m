Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3251C242D7F
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760653086; cv=none; b=Ppu/OdnlnShjlmj92NlNv7N36mjgGyz9MSAjIdJf6k8s/EBZ6JiY4Q4k8sRTBFcKXaHG3uWt5aXhiWRDmIOqujQYPaNpcCexMyXDbtd5co4nH12TQPThw2X7CkklnsMW7j+uq/fNePGE2gE64K4050Y0AU2OVEmJ3ezYbePhjf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760653086; c=relaxed/simple;
	bh=7xqMM4w688p0AnL2bHbxl1+atuUYQy+3HnHSF9sf/IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=la83bnjSV27ICI2fa4oaKQJ32vxRYzmJMIjXyWTfHLYyT1F0B01GHJt29E7bdPO6qixTi/m6bNc+Yc1k3y9Cxof5dEJW6uQlc1uE041SZdm0mn2Mpua+d4tuf6GQc8Lx94XKUnCXaXNg8Zm2aycNDpFSTvnOwHPVo2fR8Sw0ZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U96/ogYb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U96/ogYb"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57e36125e8aso1237077e87.2
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760653083; x=1761257883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xqMM4w688p0AnL2bHbxl1+atuUYQy+3HnHSF9sf/IQ=;
        b=U96/ogYbcYL1tNOzrvlNbNVZ9WdG50oiIB9LtlYrQwsmb4OttqDVAnCdklGnurG+Uq
         JKhY90VXyuH/4Z3CUVnTek9d9wC1e8C+1tDS0A6LbmQ5v+2f5sTmcqKp3W9OuBQbZyl4
         ImJTw6/JZilkj9z4PthaiswZRhwn6AFRs9xS6jV31MiTsMFov33cEXqPgcY0yD6f2cMr
         Y/eXFFzaYvqNhcBjGuMwUQ4cpfkZr7sE6RT6F13ZntgyNws/Aw4wmuZB2fhakAlDR9DS
         SO/ZdspmGRukI8fXg3oqeJKSwlLxcxffvRa3qf9/cCFNE6EMIc5c2RlnvWfzqdEtM1qu
         ZXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760653083; x=1761257883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xqMM4w688p0AnL2bHbxl1+atuUYQy+3HnHSF9sf/IQ=;
        b=U3nJICjOKx6rWe7Ev3/9rteQEc56cU/TGX0aYRbgFfyLDefzc1/ZckqOOkpVS+7r8f
         6juqmx+xptsB/TkBQoeU3AZHFJRmBKO2aRmTVRS7GdObJvTAVSGB7/OhUhcs2DZwcQso
         2IRBCmudRQk+OtKc55D+wi+/WutpYNEJ1AxDyc07O33OOJMgwadjhclyMj4XDcB+rZks
         vlQXo2PDfoqKKntca901jaunSeyqZxKepNluUegmEtZg6YwaLq4F9i0Kl1WgR4U1ZzkA
         eRtXm+nfFnd2sOX2h8UecApwoWLrsQpBdT0b8HggcCTA5J1RtkMPV+HcsIdTI0nhZG2o
         ogKw==
X-Forwarded-Encrypted: i=1; AJvYcCWWyGRGEvMZ4CeTD/ZCDpfGSyVwG7BSN+SRqV3V9OayZyQQ6TSp1QMQS2tdLP807rZvEdkAC/F8onB7vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRV0wonaADoknHBt8pula9LhjyqTm02dECYAQbbtYXiDmv+Efg
	TZvymHDoaTiCQMc5v57tZDRz3+cD9ckFBr5W6JNEoUQGKlOPBQnhYM3F7mP4YyOLd86ipFHK+ze
	ROzrcQMm1+TDax6teoaeK7t202aeEzQfylQVvsO0kLQ==
X-Gm-Gg: ASbGncu5QW15Rh78+gg1OoHH/KuA3hb69OC5w5LuRoif4MfPEYEBjJCqJywNVIG58KP
	MP12bsRT+VVloKBTzzCGo2Vfa4DNA6sz98v3n4aoXSDyDnDPOP065iI0djg3bugr7uokB1H8ek1
	B7QJunGzSi9xi2mu01pK80YL8c37a6EMm7hC2aPscumkpAw3c0ajgj2FTamYgF47A9hP2dQPYz4
	znK1kqnPVNQ+77tnOYJsZCph9RvLuog7UzGN4ChdkQLyHIoI5wCR1by+yOCtOGu0kmNjyI=
X-Google-Smtp-Source: AGHT+IHRpvTzR9lRZrlmQ1podNEFEF+NC21f0G3G257FEgsRUC3w77A0jnF1673Idk1A/qWEdilf/Xf7lGab2jdyAQA=
X-Received: by 2002:a2e:a596:0:b0:372:8ca0:15af with SMTP id
 38308e7fff4ca-37797a6fb5emr5125231fa.35.1760653083253; Thu, 16 Oct 2025
 15:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
 <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com>
 <CALHNRZ-dRvaN_SyHRfAsq2MO-ec8rzkeCy6CtJpYdWTobf1-Wg@mail.gmail.com>
 <CACRpkdb46OwzNQuSp0+QQVjy2LojMyhdE7XrNwdsyqGi5okASw@mail.gmail.com>
 <CALHNRZ_+Oh2AGZTvJ66EjBEKEf7PdQsMM_BTNNnjENJpbOKiog@mail.gmail.com>
 <czukh3b6lb7x3uwn2khcgzrkccyveokdpksxban7arhod6ygh3@uukoulmn5gil> <CALHNRZ9J2VFLm39wm7+8Le8rt2HpfeHgDOm6mc-s7_Ya8aXe1g@mail.gmail.com>
In-Reply-To: <CALHNRZ9J2VFLm39wm7+8Le8rt2HpfeHgDOm6mc-s7_Ya8aXe1g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:17:52 +0200
X-Gm-Features: AS18NWC2jQDWzQH1uHLFWOu77qn-QxNZZEbGaap9VZGs-W6Fej50AwlRr45fuS8
Message-ID: <CACRpkdbYkWL4BPyARSOCRQoVHJkTFpDA+Mfo-Aq+-dLGosqJOg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 7:54=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:

> Reminder about this series. Patches 1 and 2 are in v6.18-rc1. Patch 3
> is not. And I have seen no indication that it has been picked up or
> will be picked up within the 6.18 cycle.

Patch 3 is a DTS patch so it should go through the Tegra tree to
the SoC tree, I guess Thierry collects them?

Yours,
Linus Walleij

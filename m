Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5848732A3F5
	for <linux-tegra@vger.kernel.org>; Tue, 19 Aug 2025 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603010; cv=none; b=bdS6hzg7NtMn5JWAvdNWrrC67KUDjVPLlxZtZT5bybDPONEbSUEhA0Tdr5gK0qc9cVq+JPjcj4rRCjHg4CZeYK10hbSGUwk51FT2lI/U+spAOYZqPi74j9jeRNibBc0eiolgJpwQJNNeCy2X+Oxk3/+odWETsAwjSEP4yDppPow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603010; c=relaxed/simple;
	bh=lMubVHIOYZHjuIy4jzyQtspupuCgz8Yv3TMEP2lh7GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gh8hwNDISZb269PSKE0aS8Ok1vHq9UnAeY/q7ZFLJP1uwZw6A8nHmydK6bv2Ld98utLA0VIfhEdbjGt94CSz3O3h5dzWhAUzm9d2iuO30i+KFUMJIFVWphAv3vjNK/iTllfjjf8gTpiD1/Q1dWvoV4jlf5ydHwtllqsgwGO/e1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5NNZKBS; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5NNZKBS"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce5097638so5406146e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 19 Aug 2025 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603007; x=1756207807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8Zt8RWp0BgkL/argy/j/Sx1Y0JjzJHgLTbPSG2Iyz4=;
        b=Z5NNZKBSSh4otR1Jge/1ROUAWFsBfwWVaD9qPmacpgOb5ZO//S+Uz9uQ4viMMAWFf9
         YGTi6/Hw96RChy+2MA8q+Oow9fBuLUu1lWJh6yqDNP1Qk6U3mtjoB/ia4IVYAg6VDGtI
         tBZd4WiOknuv7ZyQ627c/KXO5CywOgF2CP0lE0hMHi239W9i6+lrmVtiCCWpyFu9D3sv
         FCRSn17nHEQKkVnENzYFyzu/Yb5OiWms933FV8UD9pWcAPoNf7DmIJizSzyjtHIGcNS2
         HOrtPhfOLCh5OcBGUFswsx0NembOxLaTOFt7FCyobj2JwkJOZj4zLOgVooysdXPcDBxe
         aK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603007; x=1756207807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8Zt8RWp0BgkL/argy/j/Sx1Y0JjzJHgLTbPSG2Iyz4=;
        b=ICZMvNeaCIIQQLKQecvmmJRBXcai/hm/+asmlIRuDdVDJbFGY1SMWYfTKz1vqAKhnF
         GlGSvsoF3hk3k5X3L6jshyXPtlBMROaWk5p0KCsU04FeNogjdC9FgSXRgpkRk8Vex2va
         m1UmIJTDZgydo/jzf7x1im3VYSVb7ZN+ShqciEBEsInPFLz8Ck5hKtPMGudxUXhNI0vy
         dr6Wqv7cJUwGPn7CEGxLT76mKBKjHH5c+LQeMC8lPtmxcUt2ATHKLIGkvqVv241shsY/
         9cm+yDLUUi/LwodsjY/IsG61QG2zqw7ke3L3UBALVn/5U4q9oSZ3MmMKdPaPt07k94Qy
         uXyg==
X-Forwarded-Encrypted: i=1; AJvYcCWvTmqO+884Vn2LkZUJDmi5PK8zyM4QT3Ds77Wfzr3oewtELGtH4XKrK3EiJbbgqn+pw8ka93Ujpr5M2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmsacqBy7Pdwri0TgTWyG0r8NO/sbNTikQRU+ucn/r6K9MWoHG
	damrbf/WoDRR+X9vXck2wDAznP0Qd5t9h5BT4YUjdX8B2Uzang+LvOoEskUUp6i1RCK/33EVkK7
	uYbTpnleJgH6en5o2gmyqa4mbAIfgPLNlOydcPP7EVg==
X-Gm-Gg: ASbGncub3nawk55jx21INFF7r5NqkOClbPCnNDoDu7CHZWUO49g+3N0Fofgz/3toLV7
	/Ecu6B0O+LRizntBGpu2uuxjpcrQ9kUYnuZRFe+jyxnZZrdprAR6UwdkL/05qM+F7TnRLyfR2Om
	qjkGQ5LWaJNKG8dBWPb8CqKsWin0UbUN8NDY+cXJrZRAZbKJVW9MZunRngvgcpg5hVtiBxDiwR0
	FyMClQygpmy7Owqrw==
X-Google-Smtp-Source: AGHT+IGIQkeqWSXk6UW50B0lvRJ9yh6Ui0meCyjjUOq/i3AdK3dvZnjrLz811wrbO084+jFl2Soan4QZclj+LnmGujI=
X-Received: by 2002:a05:6512:318d:b0:55b:9460:2a30 with SMTP id
 2adb3069b0e04-55e007959edmr704413e87.11.1755603007489; Tue, 19 Aug 2025
 04:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
In-Reply-To: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:29:55 +0200
X-Gm-Features: Ac12FXyJeMR015VuulCaDAkb5ecQnwsNmUlrUKxO75YDJ_lmXPNInWa--QpmnnU
Message-ID: <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:

> This series adds support for Tegra186 pin control, based on a downstream
> driver, updated to match the existing Tegra194 driver.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
(...)
> Aaron Kling (3):
>       dt-bindings: pinctrl: Document Tegra186 pin controllers
>       pinctrl: tegra: Add Tegra186 pinmux driver

These two applied to the pin control git tree.

>       arm64: tegra: Add Tegra186 pin controllers

Please funnel this one through the Tegra SoC tree!
(I don't know who managed that, probably Thierry.)

Yours,
Linus Walleij

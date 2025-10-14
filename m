Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D8D12E1E9
	for <linux-tegra@vger.kernel.org>; Tue, 14 Oct 2025 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443430; cv=none; b=RV0DjE2XJy2M4lNC+vo66nYJkMsdzxUoHhWtfd//LZ5HbjbPRS0vdA/P6s6pJ2KbHyXZ3Hq4hnDCfJsDG5RuE2TO5Yr1UqOAATqBJb8ymE9h2eVJ0LqmagSJISpdtHrHSbrJ/0S38ByvS06MFby0bnqWaHaaYx6TKO+UxYPGOzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443430; c=relaxed/simple;
	bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/ClT6UojbaAF4+wxxVYlcbXDI7wYz4KKgeT0LHfd0xJJVOYIzyPxHotcDsFSytC2vcDOGEk7Cw/MvFl8Y3WpYHfV1ytBiVecqfcEubfwvN3xDseQV4tHUiVoOc7wr35CMlEhSeg+9O+2ZFGW0Clri9J5iQqgEDW370hR01oRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeRbIqUR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeRbIqUR"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso5174067e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 14 Oct 2025 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760443425; x=1761048225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
        b=KeRbIqURvSmDKHLD9BjfyIl86pAK4C1iZUq/tjbs9bCMuphFQdxqW/bAwAcKUAv6Lm
         t2wwL6yXnVXaxgrF0sLYb737SQ8RdSXjPkeXO5507NRFOtJA4msOXarJBHf2TSkPrEfZ
         pxFqUgNRQ7AKGBqXyiDY7KwpgVVKEutHHW2tS7ahbfy4iBGKMRlFQyzT/5jYpbWmfRXe
         lf/ysQHLr3QRASu7pWgUnhdiN1VaT6ddwnnzRTyJY8hWJDGJTH7ftYZHxcgmQyuu+m1+
         +N+7s27oeoUcsRHx5dygwN8+RN/TogsDtRbxTubRDheKks491Bi1l0+2JQtjj6ZQrTq6
         7KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443425; x=1761048225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
        b=FXWuOi4ww/PBePweIDuFZuXLHwXEufycRCMXE9YO0yG6UPx9GUFAAYoaX8ezq3jb5a
         +6YhoP2Lm0WV3c7sKmkDdMPk1rcDzQVKCFIXe86YN7aVugszDwjIuvoJsv607XUKC2ek
         kZBtEkBZtqRn1n5s4BhVml5G6oXKIFn5kiHy1PwChQ0ch1knke0mW8/VkMrVob6QsLjO
         lNBoOrrn21W9HqPsjo/N+TKyVI1I1uZnYfrbMA+823je+rS9rR0Cx3hlE0zOzI0Xuui9
         mMPgSKgOgRDCyoxXYxm6aGBB3rKX+ZR9hd+bQhhGxdLj1YWJwvJPP1EVkqGlUxEj5kbn
         Vt4w==
X-Forwarded-Encrypted: i=1; AJvYcCUdlkEs4eYIba5vgGuQRbiEGVJ41jnkiFJpAaOzoeJ5hdVusnr7EeuhsCzG0tL2YkGfeS2Uaflo7DUMdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRobPOuucMG8rnGUASdk1Mb8D/QHYHpWZVJ6+cmEyyUSg6MU/8
	SgQb7dnVrmzRXllz1MU1qXyO+SekFGcAKViIBXwtGcEuHdX/hNwyVyrAm7KifGonZ0RdYXuj2li
	UYpItAukBoPWD7jLjy2t89IMRFRYMcdj+5yJFD4cCTA==
X-Gm-Gg: ASbGncsvMyr389OiUwzhIhT/Ph4I9PQXlFDvXTzhk0MMAZdz92SsyZv3dqMDawwq+iU
	6OMQjNhoewvVgkQXGY/QckXDfWH2LSu2O9ucaxmQbsW5jdPdY3xIVdyKzb98WYRkmGEW9r2uhw6
	IyQBqnRYK9yJ0LIQBoX1s9U5aDMbaCVbIlkS5w6h+NCcAOXZ3zrE6fSNmOarAxDGpyV+0ggcN5t
	EQiJm/Dd5EUXBRv3YKECmztlzuauDW48T0MSvoL
X-Google-Smtp-Source: AGHT+IFD0BB7RH2Ep9aDetjvf52TraFr1nZFUAFZVtaRLq2brbGFG6VPJ0RQdb2vqcIUZBE6o0FGikD6X+TXoiS5UhI=
X-Received: by 2002:a05:6512:3d10:b0:58b:26:11da with SMTP id
 2adb3069b0e04-5906d8ef684mr6189769e87.29.1760443425099; Tue, 14 Oct 2025
 05:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 14:03:32 +0200
X-Gm-Features: AS18NWCj_bKF0VIZCo40xgE2nZcym7DwrLVXQ08YjlTg5hV9lzx6rx-fa2x4Vss
Message-ID: <CACRpkdb74fh_eFCd0MM4RK1_KtNRugLPp2yMA20FrpHq+-o6YA@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch 1/24 applied to the pinctrl tree!

Yours,
Linus Walleij

Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3D22E40F
	for <linux-tegra@vger.kernel.org>; Wed, 11 Jun 2025 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625144; cv=none; b=mYpnkkDpItOr8ebLtGC3uMDER3a8GUB8pWYSn92xcFa7WcWcYhLvW9EadGkCAv1fDg+XB7fvFfnE0nZQPWmzPr2tTlB1xVSYcywyW1W1PNg5obV+aVWd/VzAJRUi/rpWRa4wtbmaYEdPuAxtAcxlcagR5WTsjUlXPhdkNisIljo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625144; c=relaxed/simple;
	bh=dhY8tTIaHxzBeyhk1xPMKaQLngS8G/RjM44iDX1MTQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZ9bALvzpttq+xWTQzr3t3ifRoeOok155B7l5oVuGAfFH/e/qG2DZ29FyZYnt5R6ij3M5zI3JpK5icNTHaSOJgXsEC/nQOUsNP/gZbWuwXAaI3EVzYyZuigAhIHNYsloMrSZPwt1z7bEqfvJfNeQoILRfpITpb65CEk+ZDA1TyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jocJ9c58; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jocJ9c58"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5533a86a134so6025854e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 10 Jun 2025 23:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749625141; x=1750229941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8nA2PNnIRRvEbnFF50ioWvbhGVteh9Ywj6FtJtDCnA=;
        b=jocJ9c584qlVDVn6UJhYMjrkzw9Wz7thkJ+41v8/8fjP4fZD9JlkteyJbZBgMs60zu
         Ehr56YhE/IZZsEMaddr0kcfsM1TOO0094kwB6XyGKTuQSpH28mmYhWpUTk6vmwkSf3hP
         Wl8JHP3mzrncyKn+5pYIlREWzw0ImLZ8SScx1A+wg59wy5sA7XgYTGS5KFFQU6MmNjb3
         tl9rPz/ix2vZmjFlgzhY4eeVvlq1UFrZcz5fVjtSE2C9l8l2wYKgdr4evEt1hSkgg9yN
         lcHEdQxtyzCUcQn+gqVH1mhhgN3avvekWhpK1tSDlEVQPS+k0putfQPOMpxjjDVYjHdD
         H8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749625141; x=1750229941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8nA2PNnIRRvEbnFF50ioWvbhGVteh9Ywj6FtJtDCnA=;
        b=aiXb4elgJ7NcguDG76cTpfvb2WfIR2iQX8BEIoqWuGwrQtDP8METn6fYaqdbTKGHao
         95caYuUrP6ord6GOufBStusM/wSuT37PaSGVWrHY8mjS63jE5HoD2a6N1wzMcFVMwjnN
         DMpiblXIx0AEJ4NWSNXa+R/CcrE5FbM4dDLJpJ8ZuBnT2TkySEIQcZY4+BYTuzSZMVyx
         98Q7cvhl9mESBMKmLlQziBtCsoCoI9NKuKwUitQF2q/NHuwFEIC2kZgIqCrf9Xrlt40T
         hYcUPPgCLECpaV6tLFP+Zp3HDh457YAVHGM/SqN5e2CcIYxpsZmDxoX1UYn3JslGFnD6
         210w==
X-Forwarded-Encrypted: i=1; AJvYcCV74vSL+0J7/9W1/IJ+8fvT02fycXJvhTKUl15rtFajwckka+zkwur75ey8Pq64ieGoy/I+3FqUjksovg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWuzubKDsWKuZpIe8gCO67772fwWmP7NWm5Y4e4w6R5nT0aGEr
	8gUWbgNUyzIIJI4w9+hpltt4B9RaeOKGHTPFNtSdwW6rTESavupmRC7ArE4oofpqi1VhA6q6ifI
	7BAYm8w0rjjv058yy5rQ5Z/9m27jP5jXVAzuQZ8Oj8w==
X-Gm-Gg: ASbGncsu5raUqI34cPhFLoS1z03qLp7xwFduiDbuOWUkgpjKFweQVIVHCGVlDs98Gva
	EKUJlaZhzVuZxT5alaZhH0CvXtbEMskfI+wNhn1avBki5hYnI31/4JEOxHKcZ/qRDds6tV7G7vt
	k+21gkofrhvbeKg+pM54pTzK5YREDTugarcJXhEfcDz5w=
X-Google-Smtp-Source: AGHT+IG6utHIOdDkcpuozNh2nqM9zH/+sRrcv4+dUano9lJ8/d+qcOtmsSZATDFdcJvRJ4JBx+FV6cWHmQ4clAOQL1E=
X-Received: by 2002:a05:651c:221f:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-32b22100cf8mr5212561fa.0.1749625140694; Tue, 10 Jun 2025
 23:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com> <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
In-Reply-To: <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 08:58:49 +0200
X-Gm-Features: AX0GCFtY4lWmGfSr3aKIZM_841dA1Q0ZW3SK2jFhQhq_82hUZBSPfb71HJ3Q2qM
Message-ID: <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Thierry Reding <thierry.reding@gmail.com>
Cc: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Thierry Reding
<thierry.reding@gmail.com> wrote:

> One thing that's not clear from this patch set is whether we actually
> need the Tegra186 pinmux driver, or you're only adding it because it
> happens to be present in a 5.10 downstream driver. Do you actually have
> a requirement for setting pins dynamically at runtime? Do you need to be
> able to set a static configuration at boot that can't be set using some
> earlier bootloader/firmware mechanism?

Actually, speaking as the maintainer of pin control I hear the following
a lot:

- We don't need pin control, the BIOS/firmware deals with it
- We don't need runtime pin control, the BIOS/firmware deals
  with it
- We don't need runtime pin control, static set-up should be
  enough

These are all enthusiastic estimates, but in practice, for any
successful SoC we always need pin control. Either the BIOS
firmware authors got things wrong or made errors (bugs) and
there is no path to upgrade the firmware safely, or runtime
usecases appear that no-one ever thought about.

Aarons case looks like that latter.

I think it'd be wise to send the message to any SoC system
architects (or Linux base port overseer or whatever title
this person may have) that a pin control driver is usually
needed.

The SCMI people heard the message and have added pin
control into the specification for that firmware interface.

Yours,
Linus Walleij

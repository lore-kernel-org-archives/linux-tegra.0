Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF1329E0F7
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759957909; cv=none; b=Un/56J3MklCCgyKKXNuWEX1T0+nq/dby1nvVIwZmphJ3w2lkhHIc72uL/k780pBH++aZoAxzlpcHIlGyuI2Fm+1D6UOsBwtzTPBT/WSyZ5iN3nWL9dwSYf8xbWP/kxQ6bmlotJwbZh7ab6Uy62P95bs7FLDUrLZfScR1zU+IfZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759957909; c=relaxed/simple;
	bh=hZ8KM21uCwat8g+u/QrX7yrwt7duhcZgFx8yHhxTBh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9Pj5JcbOg6yupQpEJgC7lfUNolQ8JVAqkf6JGCgzE2NoGrv/kY6Zpbv+RWiNtvXCHEnVo5Uqzv6/2leFPSy5kCrgdepwv9bA8Okbjebeyya/sgVZqIHnUbQUQbuHoe8YCpWjFfzaUlGpafdc7wt6lpxSrav4087C4vit6YXlu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZhGgSCY5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZhGgSCY5"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b4aed12cea3so38267466b.1
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 14:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759957906; x=1760562706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cAv3aIfZwqmRDaIqSQ8Kf1PKLE+RCGlZcqma3KwimQ=;
        b=ZhGgSCY5Z10mD5CVfRNMmoBuU2Rj+IF8Wu1MnU9P2dO+TKcdP0EGD1uWkNAq0bJA+p
         WR5z3JDli9WJ1CGgdRrnp/dHy0xHj+A0AuzQY6s961nlW+gmPWmB4hCVbRQy7uRcEIE/
         f8u7XOTAnE+xsqdiJA/vm2nuTUwkZY+GNdppw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957906; x=1760562706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cAv3aIfZwqmRDaIqSQ8Kf1PKLE+RCGlZcqma3KwimQ=;
        b=rTVagTl+WqOvHpAkg6aeGWQjMFHn4gdwpa+vyAujejb7CVIBcgJ0jWYY83XGomZNe8
         MHwwU0c1yBJSjc4PbuWKuot75gp4iUwFROf0AjMQNitzQrvjvp5IYo+qla33uX+IVj9T
         PGJOStGsEI+4tLeG0QpphTfSCh4m+tuBYGAfWPYGFPtWcz1xL1gi9PSbKDU51Tn/I1vb
         YcBdWIIJCXcsmLa/FXZuuD8F3K3bUo2f+cuwfySEFWWK3TzNRmEswZJ/0jbf4wR0y9bm
         FaLI8D8dFygXxNgWimE4jtmKxasj52+8TXDQPrqkIHxTPJobn4xkfcv/jw0d+OOoZkOL
         MT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrMeaMuVGT/XNfvL0d76vGNwkvsFo7mogWubk/rwsiTknyeu77VJ0vx6PJdqXSOT4PjklIxTQd3avusQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0DWcqB+/1zvDYAxVfcG3073f+An01+oU3dIS+IgKBs43RNYS9
	zoIGhWMMFO8EIlJQ4DfpOH0Uz9QhiD6SG2gbPrIt+zZ/7xk7xDHiXvla/WIrL/S1PyhWrqDvh+O
	JC3+peQ==
X-Gm-Gg: ASbGncusJfEaFTCekopDdgo7JOOJDMJmkIRcK6dtzVy/F1UO6NzfPzwrinI9uNLDJcU
	Ss5DyD0SciMkSFY1wW7fWNqzeeY9tGWH+w133b4XqDIWCw0hCevIFuutNnHiRCNn0kP3Z7+BOf1
	RiZG1T8mZcz7HYlJ/yhgoUHiuArAyiABHMID7UtkV25F5HMwiZ0G+nTbTWB3WwKhqEl76kxqpCu
	YW0daDrtW5mE2gftea+47J2oPz9VFNR1O/jRZFwaktSvPdlYdPFI96eBJ7ev3vnWqDTtZaTnVmW
	qgusjhN25R/wZ6ZLOBcSoyOu3rB7wMrCCMGR9fICq7vUxz0k3svxBzA8OqZb08/UZ6LTty7Hjbb
	cTEr/T7HbzH2l266DVKw65N2QWeSJuRO7LwfnJi2hCt0O6ULu1WcyJX45oICtju+JHFXEtD2iXg
	wrvzMoNM6OjA==
X-Google-Smtp-Source: AGHT+IFtydrQ3tKHqRgt5MzfZtbrZDqSHNPqbmBWChPiYLIhyHdisdvBnKu78bm/A4WpxyO+oPjNvw==
X-Received: by 2002:a17:907:d1c:b0:b30:ea06:af29 with SMTP id a640c23a62f3a-b50aa8a3c05mr596163366b.16.1759957905959;
        Wed, 08 Oct 2025 14:11:45 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f93esm1751007866b.83.2025.10.08.14.11.45
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 14:11:45 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so52178566b.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 14:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUH3YrGJq0/NOMCmp5S69evtBvZM0iWb5Pz3AowRNeu0o/ANDjYufPCwSHpX+rXNEy/DpG7fj4ZDqbAKw==@vger.kernel.org
X-Received: by 2002:a17:907:3d91:b0:b42:f7df:a2ec with SMTP id
 a640c23a62f3a-b50aa391ec3mr529354866b.9.1759957905420; Wed, 08 Oct 2025
 14:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008082800.67718-1-clamor95@gmail.com> <20251008082800.67718-3-clamor95@gmail.com>
In-Reply-To: <20251008082800.67718-3-clamor95@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Oct 2025 14:11:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=b2ivRzJsJiWMCQLOzEbLQRcFdJvVOGkCPB1n9WFygQ@mail.gmail.com>
X-Gm-Features: AS18NWA_nIjegIylG_UcLKKJDvhd5Cn1SpayqPs3VwGjbaJ5oTj9e8qwAVTiy9c
Message-ID: <CAD=FV=W=b2ivRzJsJiWMCQLOzEbLQRcFdJvVOGkCPB1n9WFygQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] gpu/drm: panel: add support for LG LD070WX3-SL01
 MIPI DSI panel
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

On Wed, Oct 8, 2025 at 1:28=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:
>
> The LD070WX3 is a Color Active Matrix Liquid Crystal Display with an
> integral Light Emitting Diode (LED) backlight system. The matrix employs
> a-Si Thin Film Transistor as the active element. It is a transmissive typ=
e
> display operating in the normally Black mode. This TFT-LCD has 7.0 inches
> diagonally measured active display area with WXGA resolution (800 by 1280
> pixel array).
>
> LG LD070WX3-SL01 MIPI DSI panel was treated as simple DSI panel when it i=
s
> actually not and requires proper setup for correct work. Simple panel wor=
k
> relied on preliminary configuration done by bootloader.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig             |  13 ++
>  drivers/gpu/drm/panel/Makefile            |   1 +
>  drivers/gpu/drm/panel/panel-lg-ld070wx3.c | 184 ++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c      |  31 ----
>  4 files changed, 198 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c

Reviewed-by: Douglas Anderson <dianders@chromium.org>

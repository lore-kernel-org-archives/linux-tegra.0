Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548754;
	b=OQqAsCj/9DN3VGzNGMV5/+o5gGrc+9xYVx8oi5chUEiVIyL1UOoC7+6GaUQFMwlNif5W
	 ULL2a7XuUvkG/H/Qwpxceso+Wek25k2WNZrnYuUfbVmlFYeJNGEIF2wP8rdl59UOEp/+S
	 CCxmFgwJ1hMlIivWc7y7XTj9946U/3x21ue8+qNXXuZoNVRu3ittErnkCvS4uiBmqDjKA
	 fGcwzGglod/WnGQtLFGRU3B9Fo26cev1NEKAJQGAnt8ZVxjRQ6qrzPGnp9KS37zOt5DIy
	 aCd+3DrfnGVhqtbGSzAUCqyKs8JpQ//PxAnMe6A70h8/3O1NzRYbEbtxevhn8KGJ83A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
	b=EIikvvWR3hcZS4Sxob4DB8QG7n7dUy3E3guatixPnqKMtQvtduUlTpDMANnLX2U8uzhy
	 uTP649SyYexRxHd9BTTRNDgxyXgUwlTBi+P0I2vIXIUyng6zDqq/qrRRM8j3vsAHNxaPs
	 acUD0ikYbEW7dd872CAmwBvFaZT3xk8Auc/18uizH/KChbp/MB27uYNOTVzbNFU8D39Fs
	 rvITKJZoC2eWFL0QnC6Dlrbde7T0vaJPwhqZP+9TNVdgY/JKHMXgfbhojCLeEPzN+aR2t
	 rlhm8wl+2qWFqS7vPozCAlH1LCsE6LaM4OVtzE7tPoKWT0N3iUSCJFtIKKDbRBLrC/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyOmQU+G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACEA606A325
	for <linux-tegra@vger.kernel.org>; Sun,  1 Nov 2026 15:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACEA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyOmQU+G
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so3836875c88.0
        for <linux-tegra@vger.kernel.org>; Sun, 01 Nov 2026 07:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793548752; cv=none;
        d=google.com; s=arc-20260327;
        b=dLHI+O15WrD2Qxx/ncy8EC3EQXqFvGHbR2GCd6SGAsA99LF3UvxWD0TWq18plL/oxD
         YXpY9ORkTg7iZMHF+X7+pCEYeFzqsXGzTiNjBdT1EAgMEvtZKQSF04uOSy9RhP3VaHuJ
         1xvYugRLWKbMz/TRn1UU2RmxrWVeWlTKNslOlzTmQdMZeYSrXaHj+d++ykka2PIQI06I
         PrSf1ajodqCzkjddYqlQYtTcp1KArQlx+aMwg06MADKzPG8r0Qecah752lEgp+4d5dUu
         yST9Lq185YdQZ3V4p9vjA1LdE6S1dWdlhTQQqUc7qGfK8rdDD5FxyDuyNT1Hsivwgh6a
         KXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        fh=AOOk4z+BHcXjFwjA9ask2nHRW9YHc698u576jKmjvP8=;
        b=TVePH6pDm+iaM+N+LRyCklYTLQTM/GelEZFeJibcM05KG9TvslcR2Qq4E9oThtDaA2
         ZW516ebeWtlbag4HsWS/wTDvaZqKKcTvH3g/CcaQHuiexpM3sV/0ybd5h5jTLY/X/IKv
         8kT3EZNqRWT0T+5X3BQ5n1120j+e+VmoQi2Y5suSI905IeemM/V+zF15ZiKlF5+y8Bla
         SXZ0telnFRBac3Eu/TuQ5/Z+yxAnBjsCuq9LYLnu1a112dVlyLh4X1CzQeywoO9Ee8zZ
         YGE6t+j/g87MiyeVnHSk/ayOUTBq9g/hotruUlhzdUKX0mxGoop9eq5vqvDZWf/FPtOo
         W1WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548752; x=1794153552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        b=vyOmQU+GIUzXlWzuISIAqmcM+65J78pwMqPSy/SmvKYrqsO5olf638kBeiXOM3v7fD
         7Gjz2ZgbU+Y14eCQ/WSShxwfOn/HC5FFJPn+gZia6EiAo7w+pYIMU2t2Ia0UWj+TUBPg
         PJDZOD7lvjlbUhpVweHCokLOA6EG5D8SVEorKg9Age6da+KPUy0x3ZqNQOIZ3sdcYOsI
         lf0khruygB9gKpxiaUoEzlksGd02/37GJ7qNZFPu2SNZAil98x/HUwjVANp1Xlcy+UWg
         056SSxMwD8fwFs3wlSDLNpmICXNxGhgJxtkxBA08Ee/r62MC2T6Qxlcy6FnEvqnVfVsh
         DI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548752; x=1794153552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        b=C/WNM18Wlg/QojvI54dJZdFFmbxJ0y/9mdJ4+oOeH/tiMK1G6Vqq5lP1z5q5DqjS+o
         09yScOkjURN5Yq5peI3SIUViz2QGHz+q9Swb0/CyqSjk/mIvOq2cBsXHdlhSSKy9De9J
         sXWVcuknI66ZNcPRNg7et+QzcAd+zXbc/7ANa2m8aIGhVAdrNTutuxZrYhk7EXaihYR1
         AkBlsW9sVdAqe83I4iCaRg/5hmYLYT+VFKSQrTdhg/geo90LN5ahaQ6tqbu76NO2wbRh
         EFQvI5NtWKQiqrTpDosvACFPLG+ZyNw/tBRhx4Zp3XHnYUaY18MFeottWnZb0WE20XZI
         /NYw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ5yETjXjX2slZTBMSj7bEnAwLin5jg3YD6qVgLt9En8bUpsVVosnWW/Nn8MveHW1w2UpVv3lV0/QAIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mjcDuDNG5sK62XtcIaxocwIutqG8onDnMLv7IVaUa7rrDz26P
	byWyk5nu3Wx9BF+pfXKvAjpfg7feRgz134+8wy4/jGszH3P3bT0lq2XEca7Rx5QO3OOssoyD8u3
	3353SkLHqwryYP/3Od97KXad9c5MwK1o=
X-Gm-Gg: AYBFou3jO44b4Tl21MX44F3cX42mAZHOHWvcNo0dKl4rgpCKCl4fiw3SjDqDd/NXwXT
	w/g8zuhOB7cQlanhYqnCFcmq584OLiBXSEjj9cVADGZoAKc1Dl1xpUk5mpVjXY/Hg1hxObSfTOD
	SvG4FOOtmdKFb0PcBXWNBw6ak7W0c97wAV+MicmyQLk5QBiBUi3ZdkM3MEqkTlpheDt9ZXPJuZx
	ucO1iAv1CdXXJ0tt/9imnh90tinTDBXoHRIOoQimdrEemTHm0zPfKIhS4lnea6YAEp5tYIBrCta
	Az2QHYHtk8mxxmYo0CRgxaBtNMhrMv5shvlXa+G0T+LIbkEmS0k6+b0/KCswUKgsHb2ywB0wtUW
	3+uEisl9hMPThzs0059FucfE5E2RPATZ7yXUsePLWAVND+cfqCnkIeFCS+NaeB5jERwAN/hA=
X-Received: by 2002:a05:7301:6198:b0:36a:1e9e:ae61 with SMTP id
 5a478bee46e88-36a42602aa1mr11000618eec.38.1793548752284; Sun, 01 Nov 2026
 07:59:12 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-upstream-iio-cm3217-v1-0-5e1724cae7b7@tsv-stahl-riesa.de>
 <20261101-upstream-iio-cm3217-v1-2-5e1724cae7b7@tsv-stahl-riesa.de>
In-Reply-To: <20261101-upstream-iio-cm3217-v1-2-5e1724cae7b7@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Nov 2026 17:59:01 +0200
X-Gm-Features: AclHuK8C4vxEYccTnlJFTZvavpWf-GCXw0Ej68N8q_v5q9HytmNW0NUmwJ3LSVo
Message-ID: <CAPVz0n2YSjPsmhYHnm9UfNtU5gg-pWcxe0Rybpf12jrXUKn1aw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: Add Capella CM3217 ambient light sensor driver
To: admin@tsv-stahl-riesa.de
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 1 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:46=
 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> The CM3217 has no registers and no ID. Writing a byte to address 0x10
> or 0x11 sets command byte 1 or 2, reading a byte from 0x10 or 0x11
> returns the high or low byte of the 16-bit light count.
>
> Command byte 1 holds the shutdown bit and the IT_T field (1/2 T, 1 T,
> 2 T or 4 T), command byte 2 the FD_IT field (800 ms down to 66 ms). The
> count scales linearly with both. The driver exposes FD_IT as the
> integration time and IT_T through the scale, so the scale list offers
> four ranges for each integration time.
>
> The datasheet is not public. The bit fields, the reserved bits that are
> written as 1 and the startup setting of 2 T and 100 ms come from NVIDIA's
> downstream drivers for the Tegra Note 7 (drivers/staging/iio/light/
> cm3217.c in the 3.4 and 3.10 kernels). For the resolution, Capella
> gives a range of 0.01875 to 119156 lux. The driver takes 0.01875 lux
> per count at 4 T and 800 ms. This matches both the upper end (65535
> counts at 1/2 T and 66 ms) and the 0.3 lux per count that the NVIDIA
> 3.4 driver uses at 2 T and 100 ms.
>
> The sensor has no data-ready flag, and a new setting only takes effect
> when the conversion in progress ends. A conversion takes IT_T times
> FD_IT, up to 3.2 s. Leaving shutdown starts a new one at once, so the
> driver passes through shutdown on every change and waits one conversion
> period plus a margin before it reads the count. The timing was measured
> on a Tegra Note 7.
>
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/iio/light/Kconfig  |  10 ++
>  drivers/iio/light/Makefile |   1 +
>  drivers/iio/light/cm3217.c | 383 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 394 insertions(+)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab P1988

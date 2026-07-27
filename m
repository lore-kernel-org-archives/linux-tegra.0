Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3063D3DEFFC
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139832; cv=pass; b=E7hioiiubTKKY+39XT47/sGcEQDu92nCkFZA3b+6CKCaNnFF9ZhcC3ZdJWHWHsAjwnUS/0bJdfLJr91dX+HobVswhlURhZi1cUm5W0SIPSMy9l0TSAiSD+ww3FZbYdWzrxRv49l0gSs8vhARsEObx6lTa5itBsMUO+8LY5W+XeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139832; c=relaxed/simple;
	bh=u1SOk4ZoDfRov22oP6IGlVlZUwuxcDk3g0Ri71MIV/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4dUA2ebzxTUGuPE5fk9IIz/sxBmJaSln+9ihORDRNfZFLmKntkCgMitX1k8AZiVOFed4wW8oZk6K1tCdyIFsSGqRlFPzTJczKvJSXEaRVBCOdgKwNcLL7M7a+MSmAMoBLJTxQW3npo5jPKJBWgyNUNKTtbc70EaEnKj+Vgd/YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ftg7j8yE; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ftg7j8yE"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848743155bcso788476b3a.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 01:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785139830; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJdZ7O36xwPMWt57ds2wxyE1xRQzf7+2ij0fdUPLJyRkCpt/1Y+f+jGGhyKbWsD+i+
         njpKEzmXfTiI2xIQMZX9sBEiHt0QkHYpvMjiJbX1DC40JkkBARWI6/h/J+rFcY5OGakZ
         w/u5VpMxRQ2yMXGaU9ZxD97nJltszKXYkpYh3qBxjkfrl1rZAS9G6E5USOJUdlTd/qH/
         +AruM6Bp1msnYZxUnEXV5uvt0qqGV+G0Swwe4ubhxo1sH3AlVyTpjB5tYOhi41aBTf6e
         kaV6NUg+ZZelkhnDF5nwjauzCOr5uzg5wupuXgx6Pf027ITeQHK79uteGxpjGtw05xp3
         Zccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        fh=7DTf8b4Qbx9/AsFe2nZwnwOez4tY7q4gorsG4GHQkq0=;
        b=ltFXTSs2acxSN+aadoXPmOACKk54Q8AYRfp3bnx4CVcOukmgIANsBYRE8YcIHoyXsB
         /gl5cU4zD53iwuDOH9HFjbudZQqGufthqQ8EhPJy7Yj+Azr4lanJv3TpZCxYWB8AaPVI
         +2XIFPauRf2JE/eyZqjLXW2KjjZz1DzEUvRAYKaqQ+9jCIq+3/94YJ9xFlibjOU3P8ph
         PT+8r7tElPiBurT2pZGJFgbgov1wBTgfzQMtMWtCW9uZguCDzz1qhzW1Fp27B9Q6oYdV
         Jj/xRlc3CcYD+SG9hd3PzX9+sW6HsqtmaWhHRo0hmsuXcfWwFJ/38y5IXZoZep4dlbmN
         +UiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785139830; x=1785744630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        b=Ftg7j8yE5443E0+1kOkxdGJ0Dwk+/h3CbggpNCxjE/GViSPtj2JRVuVJZDDfoxSmpW
         1Ksv7V3ZgJSkWRXCOtlmSTd0h1/+DFJz0tXn3nhaRi2/7QkhnuICTmWT/nGaQ+HRIs4Y
         eavz0w2LeQ5tnIxbuJ8pfId4KB77n20aFyd9lelBJjmYYsKscl678vpVU/hg+M98WNfI
         alBcsbPiAXmu5ghuZ765zaXwhtVXw5oRlo7D9BXFu1Kos17zn2GQw9ie5BQD/X0UXINV
         RRwSLDAyeaqBVmk2iA/2G1VsiquNDEaCUoHfM/+i5NDcsEwX1jrIoE5BlLRlCv/f6q0I
         al9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139830; x=1785744630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        b=kPN1dTO+lrwPbXCsStG0+w7sNJu/yuZgB2mWYT5Rz3h26uaRR5ywq5PmYBQOd0fj1+
         WT16gcphaBWG2jyJBVZ44dLJNNBCx++Yzc4+k6eAi7pVzgrwRpMp8nLwkwNa3Fi7chH2
         kwcYeuVXjN7UuapcFjDtIfuEpngeZ2ywHz5sund8B26yxi2tvsPSH39//KB24LGtcu+T
         4L9YT16peOi+LKMhboeqbfe80auKC4fhbPNoLePxoX30AT01y7yjuGwRK4pvbLYc4eV+
         GZqU04K6/LKkex7gAz3+XOYkUAbGOJdDPo196CNWvgAAWdSyj7V40xDUFnVou/1jum09
         N64g==
X-Forwarded-Encrypted: i=1; AHgh+RqtO7+oMeM8Uc7hVidaJbwqYMZSoCtPA87slDbEUoO4GDrjwcSV4FljHFco/ab0B4QvdF2X8AUm0sQjlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCe6drsLR6Njd26c/QFsYoDHop//ABnfCt36xLYhtWw0kl2o44
	QskB81r6WyN0TpJphcee0vn5qP5CikUwk0vAjt5PPRrj2BNMj5zcaosSKlTvWBK+7DhQ5EOooEc
	+qI9QjMWccICSkjRHI85WJc3ndBMhMPo=
X-Gm-Gg: AR+sD11wh547Yjr4fKT/nq172LbZQNkmmYnVUdcDCEgN9dVxp2hl8fnDdcqd7flt9cv
	Gq1c80t5yBgbMd3XjGkd241Cxsc/GuXkzsMRBg1ObSIk5Q2UTboSkzZflQlrjFspOziOjZdg/kI
	sMoYfBdaUmI9db0zSjMsSeGcQKsbvDvIH4/X/sRhaOwOOcxAdtullezABI6sYiu411D1SLYIzGW
	7umsN8kJVwGnfJgIwrDsSbg26uGQ3bbfjokRVO+kKPlRIo9Yg5rE/BlgJbtysjDY0UQzRaPy0Cw
	lIZz59Rd1fLqHr1RgVU=
X-Received: by 2002:a05:6a21:110:b0:3c0:9c19:b274 with SMTP id
 adf61e73a8af0-3c67dffb181mr6607471637.66.1785139830433; Mon, 27 Jul 2026
 01:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726100408.3262831-1-congnt264@gmail.com>
In-Reply-To: <20260726100408.3262831-1-congnt264@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Jul 2026 11:10:17 +0300
X-Gm-Features: AUfX_mxifE27HgmqQfF8z8SxvpEZvclmuq7ha6af2z_fycdCEGZFG-xRFnzkrOA
Message-ID: <CAPVz0n1V1YJsEJ3+SbkMnTzCbhyx3vJP2OuCPe1Ft1+ukynxHg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: tegra-video: fix syncpoint leak in
 tegra20 channel init
To: Cong Nguyen <congnt264@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 26 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 13:04 Cong=
 Nguyen <congnt264@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> tegra20_channel_host1x_syncpt_init() requests two host1x syncpoints. It
> stored the first one (mw ack) into chan->mw_ack_sp[0] and only then
> requested the second one (frame start). If the second request failed the
> function returned without releasing the first syncpoint, leaking it: the
> caller tegra_channel_init() bails out with a bare "return ret" on a
> syncpt init failure and does not run its free_syncpts error path (that
> path only covers failures after syncpoint init has fully succeeded), and
> the channel is subsequently torn down via the kfree()-only path, so
> nothing ever releases the orphaned syncpoint.
>
> Release the already-acquired syncpoint on the error path, and only
> publish the syncpoints into the channel once both have been successfully
> requested, so chan->mw_ack_sp[0] never holds a released handle. This
> matches the handling in tegra210_channel_host1x_syncpt_init().
>
> Fixes: 0e2c4117c351 ("staging: media: tegra-video: add CSI support for Te=
gra20 and Tegra30")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

Very nice, thank you!

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>

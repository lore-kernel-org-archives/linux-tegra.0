Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B0199230;
	Thu,  6 Jun 2024 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717696157; cv=none; b=BNdO7Z+PWru2z1IIJwhuWQDssm8NXixNKP2eXkjDVV6MiyNn18es6OLUf+J0GnsTjUWzaekgecLE14gyi1SYzNp/e7nVlR2QXKrDdXKaYqnWi15CNRkpeZW/xkrRgxeBxQpg4EQnwFoHPFx6ltEcF0dSPq4xJ6+yklFyrqXReEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717696157; c=relaxed/simple;
	bh=hqve/mulyLJiBfE+JwFQYjy+4+Clzlf8LYtwe6w824w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3DW9q7GfzL/Nua5aEtqDW/67Xmfcr+J5+DR2XMn2YZihFs6Dm/T2eweGOs58b3IWbz5CCtxRxBmiezYNdkIqrSAkb4uJKvpPJSOLHq1qN1qfRFXIf1r9fGaazWshtC4fjUr34hZgw2qrbJsNl4+Rw27BytIXha147uk8o+G3D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+TM3UaK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+TM3UaK"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a68fc86acfaso199749866b.1;
        Thu, 06 Jun 2024 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717696154; x=1718300954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqve/mulyLJiBfE+JwFQYjy+4+Clzlf8LYtwe6w824w=;
        b=O+TM3UaKFM2Wk1eIYKRKyU9G3ZD+g3Eu+B4NbAayt+XamRclOl5KEGPVlJQeY94Xon
         309HiPa5hO8pOkEPyQTvQ8OFhASvf/ScgD2cqbWDJpR8B58HlPo+UeWgOxiWPZoHkYfg
         B6rIFY2y6ob9AXPMySgpdAjLcSNmfcO89LVYi/diW61MogE6c5yMYvibDzdhAh4vhl2k
         vtoBF5YBjuO+zuB6n/Q8VvLGf0cSE9Lshjkhj7oTrfArwWU89lKFxeHMSVV5M4MF36xv
         kir6jqHLxLO03zGMhKKWlWZiKLhIoePe82qQGsC2FDQfFnkiE3p5Ux3YJV5WTzUjmw7T
         uL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717696154; x=1718300954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqve/mulyLJiBfE+JwFQYjy+4+Clzlf8LYtwe6w824w=;
        b=QOO+bAzhzgfT8sMyUbXuqKPb1NY2teZE7FkZnWino8MN2NmeoSlSk/eoqDG9N3BUsJ
         x3hp7dgHN7BgnrjVwBmRBvEYe08WZ0I+9l8maLibC8uKWnsEllj3YYMUBAjtUKRj0nbo
         J9V1uzD2fCne0DKVO7lVXryVdOH1X2vz5SM2hQap5lpZ4AqRGAYL3Q7acJ6VtTAq5PuU
         U8JSXeEYJlbaHQ3581bmlWMCVnLtRFnHXX+NykneupRXHSvwbdDuOGmlT26oGAjPBVIV
         5EqMdVo7+s1a302uz3G9NB6vuvM6xRzRv/9aI8vzQQ1YgF9stpT+od7EK66ygHcgZ7Z6
         8dYg==
X-Forwarded-Encrypted: i=1; AJvYcCXUbO7RPuk1EkxU3WByGLuxkyEq795oMez1pJM4z6tkeBchnH3VJwnLiMKep/Vlj1zDz/Ty6dUMjUsh9jFFoNONd5EppdHSPUYHwCNyfrilgwkGYtjn0AlBVjDUAhiu2bFsKCjbWfCX1RWqGHQ=
X-Gm-Message-State: AOJu0Yxei8FLjrdRAThl6Ri5R+ziQZN9oY4DyOlIqlSEbO/r8f3af+sJ
	/jD+0qd08iPNwCbHRXxxeqjoNehCSdoXgySW07jL2i2WF3IyHmZQDbH4g/FECbbISA7x4SZRGur
	xt5pB0KjlMWcBNDdTdqeEaDSag7k=
X-Google-Smtp-Source: AGHT+IEG5/l42iqtt6FQoctQwwpdfKRh4GmvJ6EkJInBigLMBrI50JocigddObnILLUbHKVkXEReMz9TvkqsQEtsHmM=
X-Received: by 2002:a17:906:35ce:b0:a5a:5b1a:e2e4 with SMTP id
 a640c23a62f3a-a6cba5ccdf4mr36618066b.20.1717696153849; Thu, 06 Jun 2024
 10:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606144608.97817-2-jean-philippe@linaro.org>
 <171768935175.54606.14878127902164737048.b4-ty@kernel.org>
 <CAHp75Vc-ALE=VDJs9062y-z5JW9_=z9axx2DL6B5ZeWD7zo-qQ@mail.gmail.com> <202406061046.A2137C9@keescook>
In-Reply-To: <202406061046.A2137C9@keescook>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Jun 2024 20:48:37 +0300
Message-ID: <CAHp75VfDjiOkvNxDXUkaptxmJNP18sfVKU-3H6p=08azzaD_Kw@mail.gmail.com>
Subject: Re: [PATCH] mm/util: Swap kmemdup_array() arguments
To: Kees Cook <kees@kernel.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, andy@kernel.org, 
	akpm@linux-foundation.org, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 8:46=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Jun 06, 2024 at 08:35:13PM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 6, 2024 at 6:56=E2=80=AFPM Kees Cook <kees@kernel.org> wrot=
e:
> > > On Thu, 06 Jun 2024 15:46:09 +0100, Jean-Philippe Brucker wrote:
> >
> > [...]
> >
> > > Applied to for-next/hardening, thanks!
> >
> > Btw, is it possible to get this for v6.10, so we may start enabling it
> > for others?
>
> Which others do you mean?

There are a lot of users of kmemdup(x*y) which I want to convert
sooner than later to kmemdup_array(x,y).

FWIW, this patch even has a Fixes tag!

--=20
With Best Regards,
Andy Shevchenko

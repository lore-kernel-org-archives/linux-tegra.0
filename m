Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A977425CC73;
	Mon, 18 Aug 2025 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531426; cv=none; b=X4IvGB3zvUnZApIAYgsoBk5Vp4Oq5Ek8IUTzO3z07snqAcuD5EcojcxrUqAtvQL11jxsqr2pArrjs5vLq+G8nSaJK28tZtzLzt6+s1ne3noGXA09wUTjz8AhIPCA7THax5mFnBO5CYsSpEhzqXCkwxWiso1s6ULi2FOoQBqQEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531426; c=relaxed/simple;
	bh=k/H8oG8FJ/KNAXVFQEahMziIkd6GKMRM8pwD91rQQ9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CF2UtvMXuYmGdDKPUPZHUkAlROafjMoQaDohCZJtWPbuBmZSbMAZU6Rwa75zbIKNWO1O5mHKXHXG1sXmX1A0fEd/yFFEeM62A9MNMC+0NEIdtPo+DHmK3/v2wE0J6tVjMk2DnFjamdd8r1VMAYdtpsYwn9ZxgCnDlHyAD1Y0AbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-50f85ec0885so2982920137.0;
        Mon, 18 Aug 2025 08:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531423; x=1756136223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPnXyjQyRiPNxWrfvyKTF8MriephV3eeN7jOjaXGjKk=;
        b=qijQ+Pz5O5TWt8aICVsVtvdNF9SZexQRzNW9RSAXykJq/P+5LJ1RU7Nhq4CGNTU/WR
         c5UZN+GX8Z8f3AdNbD4XNXottGZ1v3tdUFMigyQSLPpova7Se3aocQ3yzx/2VRTcygQB
         YyH91pxZ6pZndSoae4ePPZGv1mAjJAVtCjei/ufrExMcRsQzzfwtmcrNu1/MZnOU8onF
         VR36a+q5o9n4CXcoGUaeeeu4aNhptLRUBtxxg1lscM1c5nAAZGAt+IVtOQC7qHN2pTsz
         XrmXKaJl1SwEGIgY9peRtry1ssF8nrtQtz/1plkmboMshrJ1P74jxuXKHNrLs7DExmDC
         tRjA==
X-Forwarded-Encrypted: i=1; AJvYcCVafoTRl0YwmpD/8+0L1C+CiWjUnHquRKJ5pCFsN9mTRZOYytHUwzJPJ0ZZu4rT18lPy3HFmWffn/qMc60=@vger.kernel.org, AJvYcCWtLMsxaAoW2BxNn7vTUQAZ8EPUYWNZvbFiw3Fyi5qdJNER5lYXDrdsHStN/t6WuUdLMilpdoy5hkRTPRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqPShmCjgmv9+XJoh8COQfY6qbkfS799ibHLKOlT7L1e5Fpym
	GbWs8uPZy00A1vtGQjQBdatxItgRg8kdclZEZ0gVJBxFpHbVFwUdUh2pFsdFJrEV
X-Gm-Gg: ASbGnctaaCoyEFMMoZZwkOSS44Z2MMtMPdBcVtx1DXY60tSNXPPpUTpIeVTTc49dBFW
	keYEGtd8gzUhZ3dDo8/grwGy3mCA+xyhSAfRvh0gwipmpsHRltL583r691WEXyAfI+NMB6DhzV0
	ZLl3XySYuoKDIjNgS4jmWxPkhhO3Be1L2hVhxhOEPFnwmpPsIWnBn4CuvkX5mabw/TYQBq2GpoB
	l5YtUytc8GG0m5WxBGwkLRvrbNM4Uv+u2BQDM9ap6zfVeZhm/zeFVfn9izyJTBoXKRFoMkQFyco
	mygmHT6oHrydmFbGiN3T2uIoLX2jPwwVAqi4o3z0koI6aN0k263G1OEIN76w1u7wjf0bqGY4j3g
	5k8mQVrzDfC3B2mHvZU98d1x2V85pRZSkMSOBGka24IIyGL7ZDAydBnOupH8p
X-Google-Smtp-Source: AGHT+IE1p7HQE8jcxTfzSEQChtRQi3fjUTieEsJ3XZr+Wd3o420HqePGkwqGoVlsC5jP6lBF/6L2sA==
X-Received: by 2002:a05:6102:dc8:b0:4e6:f7e9:c4a5 with SMTP id ada2fe7eead31-5126d30d22emr4633194137.22.1755531423212;
        Mon, 18 Aug 2025 08:37:03 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127f2269e4sm2067681137.10.2025.08.18.08.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:37:02 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-50f85ec0885so2982906137.0;
        Mon, 18 Aug 2025 08:37:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEwDJEqfAfy6D15Du+khIY9xDuVitnmwYop31nzThrYoxuGXsmmF7RxpqivkAx+ZkGx86gkrBJOhhk2cA=@vger.kernel.org, AJvYcCWbXuXl9sMOqO0IMCSqLT48XkKO5gA/FN96DlJhCHPlzUrMiPt5ArbNbcU3hUd5Da3IOyfL/Pke4AIGl8A=@vger.kernel.org
X-Received: by 2002:a05:6102:4a84:b0:4ec:b2cc:de60 with SMTP id
 ada2fe7eead31-5126af22cf7mr5384089137.11.1755531422341; Mon, 18 Aug 2025
 08:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
In-Reply-To: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 17:36:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQfUCYdt-PJX8rYP3bf8Z_ea3Obgunm-_7KmJxMrU_fQ@mail.gmail.com>
X-Gm-Features: Ac12FXw4gbFdT9fnsf3GhA6Uid_mXhbaQ1tCt30kMl8rgK4UTMaDn8DaYsPtEDE
Message-ID: <CAMuHMdXQfUCYdt-PJX8rYP3bf8Z_ea3Obgunm-_7KmJxMrU_fQ@mail.gmail.com>
Subject: Re: [PATCH] staging: nvec: Silence unused argument warning in
 NVEC_PHD macro
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mohammed,

On Mon, 18 Aug 2025 at 17:10, Mohammed Guermoud
<mohammed.guermoud@gmail.com> wrote:
> The NVEC_PHD macro was defined with three arguments (str, buf, len)
> that were not used in its empty body, causing a compiler warning.
>
> This patch silences the warning by explicitly casting the unused
> arguments to (void), making the intent clear without changing
> functionality.
>
> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>

Thanks for your patch!

> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -28,7 +28,7 @@
>         print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
>                         16, 1, buf, len, false)
>  #else
> -#define NVEC_PHD(str, buf, len) do { } while (0)
> +#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)
>  #endif
>
>  enum ps2_subcmds {

The proper solution would be to remove the custom NVEC_PHD() macro (and
NVEC_PS2_DEBUG), and just call print_hex_dump_debug() directly instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

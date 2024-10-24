Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69A721364;
	Thu, 24 Oct 2024 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790155; cv=none; b=XOIiOIxozUcJ7wVbwM+45MDj/b+uyC4GzUaCXZ37F8Ai8bUBw5fkSlQiAp4LLLXLVmCdV2GltIxUf5EoXlCYsfY0NYf8PjgHlu/SclLcAbUmkM4eGSZG5+1XfBWS5TgLRkB4KmOoHm57FEkq8RQ4csnBlFCDxT2wfMkDaZNW+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790155; c=relaxed/simple;
	bh=miuUK+C9UqcII5LUzgz3TqjO7CFqfs1uxTPfIwmAqrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN25ykXzHujl/wKc4czH20gUfrerNwQEvt0k8udiEy0dt62mjkPIv0wyiuVIHIrWRStG0Fzy2IfsN/03/9KP69l3yGMrRZXjZsdRc7iLiP6qMGuHHTw/LBUoPaPW/L3W9Q/EkxqaFRzpC21ZIxhkF+suFO5atC9LRyPlXQFoWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klI7fn4g; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klI7fn4g"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99ebb390a5so425083666b.1;
        Thu, 24 Oct 2024 10:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790152; x=1730394952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9GUQ7w8N3r9gVuJfhRZTtK9B+5W12JGKG4NDazj9No=;
        b=klI7fn4gtjn+pHtvJao1mPN7Hld0gJjtL1TphSEEF8xuE5lrwQ9x81cLvVXXEM2Heq
         zh0MF8CflZG+d1dxswwA9T5XNzjF2gcckVuQr+xgGyjrCO/hBw3gPu2xZF1PPfhs/6ou
         KbQ9ANYYvgeXmYibQZkt8m+/xlni9+ge/SGiQnRAtEpPwR1Uw54wQ2KzGN73GJ5dWvCr
         3qmrgGooA+9xDaL+EeE9oy1i5+IaCxlSq9aWxXpfK5Ll9s+dvo8YSq8DKrcvJW73Vnc5
         xxA9sam6P1vqAx9vjfQhGPZ2th9dQgWqGR/Ue+EyTNjubsvfLKdtg/+vkJSU/vdqqxeE
         BR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790152; x=1730394952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9GUQ7w8N3r9gVuJfhRZTtK9B+5W12JGKG4NDazj9No=;
        b=jcZUs289Qvm85vY7ckoGHVrBtyDmdpFYBd1zUrSH59Z2WOAcK6Rpnv+kY/xrdVoHBz
         thgwYNE7WzVjYzJ4Wj+0LAFcInVfFklBR5CjhaN3IqHkfPeKPLc7y2f9rTBzYGYsHw1l
         JurjQNGhpoD/pVWTzc/gHfm4CRiga0d4nruf/5FdY0dbdWVrczPRiucof1IU/vxtrAq5
         ddtFnbXdwVfPYp4b7vJ2qee2EuGtghzLsHwbPKizTSJy3WOpF400dPlrlZ0wmoFoZZPL
         phOUSLO0vXpjPVuFFBze4h9ARTYnNBAKkZRVrb5WJOivstsDLwpv8DMMs4gxKkOeeNrl
         rXkA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5ExzOv49mhjcZ1NGi6GddqKrtLPU9J3t/PryZNfNhKiOsF2Be93BDGuKMy7xEkZZFz/xmjzVgfw=@vger.kernel.org, AJvYcCVY1fAuYIQc7gI2tAi6FacxTZ5MmLSU7S7GS3tUN7XD89mxqdxy5TwX9MEuz4zDXBTVU9jsefiWPRTxFis=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHncQVayO+EX/6atlAk3OBJs9hd63vlOPulZLdT2QPD3R7Uyq1
	4raSo9bkYs5Mql8AZT3s2tZ8C8WfPzBJ2w+FK+r/RXINhp5AHjVH
X-Google-Smtp-Source: AGHT+IFHC2qTy/jZuWOCk1sR1eH7dE/yu5C9mjDMZyMYAvfJpmUHzcxTr/zYswBWdTGJHnoU36QymQ==
X-Received: by 2002:a17:907:94cd:b0:a99:5587:2a1f with SMTP id a640c23a62f3a-a9ad19c145emr342150966b.15.1729790151920;
        Thu, 24 Oct 2024 10:15:51 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559929sm640165366b.105.2024.10.24.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:15:51 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:15:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Li Zetao <lizetao1@huawei.com>, mturquette@baylibre.com, 
	sboyd@kernel.org
Cc: pgaikwad@nvidia.com, jonathanh@nvidia.com, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next] clk: tegra: use clamp() in
 tegra_bpmp_clk_determine_rate()
Message-ID: <ymehmrggfpuuen4f7st43qijfvvgap5pdipev6iyw4nar2stes@f6oau2c5f4ma>
References: <20240830012344.603704-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jvgzug45ctbz76id"
Content-Disposition: inline
In-Reply-To: <20240830012344.603704-1-lizetao1@huawei.com>


--jvgzug45ctbz76id
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH -next] clk: tegra: use clamp() in
 tegra_bpmp_clk_determine_rate()
MIME-Version: 1.0

On Fri, Aug 30, 2024 at 09:23:44AM +0800, Li Zetao wrote:
> When it needs to get a value within a certain interval, using clamp()
> makes the code easier to understand than min(max()).
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Mike, Stephen,

can you pick this up directly? I haven't had any other clock patches in
a while. If so:

Acked-by: Thierry Reding <treding@nvidia.com>

If you'd like me to send a pull request, let me know.

Thanks,
Thierry

--jvgzug45ctbz76id
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcagMYACgkQ3SOs138+
s6EYqg/8DpVH4dAlTnDRDURt1B+zh9+XXaqTJOr2Q6OdHrZEI1TwA77o2R48MgCd
uTgA/10wQ+VkQE6uoVYb0B/LcmzTh7tE7DzpyL8iXmbsL4Zvb6eKgZGNJ4zHfiRV
+jFRUv6Ld2yBIqmam+270WD3iS3XftoVWcGdc4ihrsM/2RN6HCsqcYBqQencJtUt
ps9OrTe0TyDwo3X0PxJLMQpJ879eIZaG99fAdbdFN66QbL93ebe3HjCSo9JMM7Kt
bkUXvXM0BCaaHrZYjyqR86jbOOSSUkIQhSW9DuPo3WpTcxALMteqMKPHvZj+hS6R
Ap6zDHGcGeerOFE3XYulpY8mlw5P1OLoCWrfWwl5axsNFCcuwk/zHKCSFzU/T7yt
qdyVOoHt76w9KamEV4/Oh1OpWB6DwXNWDl2xoBe1IA6jQsh1D8ZG0y+C4z45BnzQ
wvNiOWMoGcxEc2F6WIzcUWv62ZVTLkBPMwlPMskceSnGSEl9IKltc7TG7iFjEkiU
wuItDscc8HBn/kuyx5ngX/aKmDive597D9apBn+NIhChfvqRDZn/gZ0utEvTZQeO
0cWSWZ3M6t/RDZMQ8WQT0nRIgu7l79TWLn/0VSKyxWSR8AgvhmAn4IZ/WQw9dFPZ
bj9VHiEibLChd4uVqxIM9CPDBZVvxtBjKKyN0B4qbVTagFUFEWk=
=42yy
-----END PGP SIGNATURE-----

--jvgzug45ctbz76id--

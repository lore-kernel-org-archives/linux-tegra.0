Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A414D9EF
	for <linux-tegra@vger.kernel.org>; Mon, 11 Mar 2024 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173050; cv=none; b=AvsWiFpN7SYOa9JWNk8/Stw8mifSa3+dzGUX29v04885Ko9/iwbJLGnnLxIz5LL5lamacqhzWWlTXc3FPUUt7u3941OCypOTxkd4Ghth39UxrvBGdKAjmpkDTSVOKckv97dwSGtEi+Lbnqv6YIHRa/XVmVonRLT8e7oj/vPFmPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173050; c=relaxed/simple;
	bh=eAF47USsvl6GvU6CcbuiuNsY6BM5J/F4iddiICFuahI=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CLqfxQlZbtHgAupXE7R+q2LHqBZX1FsOaXBYqn7I5VUlQ6HUkC6SKTndkltYmytOJYGbhhAvl3IiModJuJtgHaHsPf3zUKgoAJWesmzL3JSlV5NHhGXAF3ic9KtYv4cIe9t2YjTIm3OBMepdbru3wMusxjlxtwE2pD1CG2DnrVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbk9aOpJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbk9aOpJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56847d9b002so2354909a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 Mar 2024 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173047; x=1710777847; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cvFf2k0hLdwTCSIUw1b2M4KOaEGLFXLzuaUdA5ebJIk=;
        b=mbk9aOpJKRRn3pfqZkfWGlJmItVBUjzDDJu9OBRqAqlRcYy3SbOOm/cqOuovIqe9Pd
         rR+yk0T9wEMVqNWrM3rNKqX5XO/9uEjq8UblN2EaugKRuupE3w+sbnigSLeQasnJ1gch
         3upquIdXzerGtqaJk3MwjFFrLER1AQXpbQ7Dn0eXIJbEQZflP9Qqz3QJBVaekL5gs/rm
         wZrjEGbo1/N7MR0yrEySneIIDuszD+7Tnws8YOZ7flBOEDL9l2MqvmJAnJLld/JOk3gY
         4O+xafqPrpkSnp9e7Y2TizX5vQPQ+Pq+JF8ZCgLc8CD7Gc3Q0QmmEsCunm0taJVPDKR6
         5pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173047; x=1710777847;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvFf2k0hLdwTCSIUw1b2M4KOaEGLFXLzuaUdA5ebJIk=;
        b=lcegLeWZKFfsrOYzdtn625vEYUCdr1FwXrc2t5CSstZ/vuSXfSJl3vPNcO9o68mAFg
         qTnCGwYJrK/YRLlR+21kbDzjP3kb4pCENY2Hw8IoOD+tvKwEszoe4Ila3WSGG9PjwPco
         bpbym4en/PBpUyGThBWhAXYNMStsqJahVtu0IZO9xApWp8UBjacewoTuHqdMIwY+b4f1
         xgELzQvfEbMAKk4VXQJNq3aEZBnA4oSnfpkMLXjZVVo/CV2lHZxQiAlSCd3ovJldi5x4
         qmmjtanhIUk/3VIIui8rg+R7R3EfPGsbRxCsHQ4PX29J7anpyvJ38bY2GFuU1dRFXIna
         RODQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7c27ipfPeiYDjI+Dqs07fG7fF1rereutL6ER2T9X7x/yzHm2DndaQlsDSmDS3Lo/qd5UFo5xM4zsUkorHcuq+821zelURdUOrPaw=
X-Gm-Message-State: AOJu0Yw7pWk5QNFwy5hfOYHDadbdKu9H5cy4BCkfP00a9RGAFFtFAOv0
	0yq6sr6k00EPKr1gaXA64+IX14K3ngmpZouw0OBHt1Fv1SiyaIiRIdqKtcos
X-Google-Smtp-Source: AGHT+IF3/wqnxno1PQ5O/Un7JaS4AMZcCQLtv0MunU2CN2KzLO75PZEjJhGMu4csFW2tBl37PcI+jA==
X-Received: by 2002:a50:cd15:0:b0:566:16e4:b6b3 with SMTP id z21-20020a50cd15000000b0056616e4b6b3mr4253238edi.36.1710173046751;
        Mon, 11 Mar 2024 09:04:06 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s20-20020a05640217d400b00566ea8e9f38sm3033913edy.40.2024.03.11.09.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 09:04:06 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=a67836c0427bcb0ce7e2976400776a51e382e07418ed8532f736485bec42;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Mon, 11 Mar 2024 17:04:05 +0100
Message-Id: <CZR1QZ6F6QA4.2YFL58PNYHE0P@gmail.com>
Cc: "Jonathan Hunter" <jonathanh@nvidia.com>, <timestamp@lists.linux.dev>,
 <linux-tegra@vger.kernel.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH] hte: tegra-194: Convert to platform remove callback
 returning void
From: "Thierry Reding" <thierry.reding@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Dipen Patel" <dipenp@nvidia.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <0b0a5d3816973ee88d4be9fe9f2349065a42cbff.1709886922.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <0b0a5d3816973ee88d4be9fe9f2349065a42cbff.1709886922.git.u.kleine-koenig@pengutronix.de>

--a67836c0427bcb0ce7e2976400776a51e382e07418ed8532f736485bec42
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Mar 8, 2024 at 9:51 AM CET, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/hte/hte-tegra194-test.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--a67836c0427bcb0ce7e2976400776a51e382e07418ed8532f736485bec42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXvK3YACgkQ3SOs138+
s6HfcRAAo1TclDTpQAvLx8p+fqtLLph42rATzcRewTFPKzcvFVtSqgrJApanWri2
a+7Wx2QHOxA+Xrq/7z07ILjxbobztUFlQ4HN0/vhz1iUmhPcwJc7gyQhO7i80D/z
5Jb1uLd4jtSvEl8BJ5x3+vdDKcQDY33kwC0IMeniBrEBkw/G8vONNFyjHqU4xjh9
H5VvStZd/yxwd4ZlNGFI1PFBmtOtdZ8x6WPVQDuoHAj+AdwtTgA1t35NHlET+RtZ
OHflL4fl6xlDm94/CpbM0Lxp7ynpGROMitbvx0AVh5V+sQFl4WXWlDDWuOSkiZd7
fgP6ysDO+7CdbRLw3QYtSW4DbRLFoIw3SdLIT379sziWN6vlEAjDt2JuvCuMNrj0
8pcOQhShvJO4B+rz/OO6fHuUrdcqEcIAsWxCfzJDyiJv1IrjSuQc+WB/m6fN/P2N
bsPaxZkk3PBpcfniVUMw4x9IuKgtaD8SBgzH2/UWkfOqQ4xPZ1isV3y92jAbTOsH
cSwGra5i6z997nvCpe2uCXOy5j+ZHSUdkbj9SLOUz9QxsRDJ9+2wrC0alQKcB0Uj
a99szkJNlCUoLvWNeP/Sk5v8UaqsLoc8YNWiriu446Bee4lA6+IAhPntWsRuJtnt
PXwBbOFS35c+zdA9Gh8OMb8iQiBrIiDs88willhGP4mQd1ull1M=
=c35F
-----END PGP SIGNATURE-----

--a67836c0427bcb0ce7e2976400776a51e382e07418ed8532f736485bec42--

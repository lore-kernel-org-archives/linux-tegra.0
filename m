Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D172D620
	for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708360283; cv=none; b=eB3FSLrFCB99U0PHwfyL4BpB5T0gz7K54GXXKgO+aGgz3d2bvIRlTy0yCpBNN+IaKdPNgGexiV717DlkAPSUCa3No40ipjATwIRtrKAgoWiLXMYNwbJrr48aL5Fi8QCRo3gn9yOYzlzAAjUhcvXPnQXJS9vi0dMvhDK3KNNeInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708360283; c=relaxed/simple;
	bh=CJnshEXb5iP21arWLxZBg7eXP7IT09TyOJfu5lknJns=;
	h=Content-Type:Mime-Version:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=m/iu4L/EojqVIpNtFHtbsXBn18UleMdlnq35v546lTj1uo67VceSKVCNF7WP65ichBmIDzudbl6QrFQlwoGCTFmUlAEqjF7eD4q4Ch6HeHtXiGPXLAM3LoIZUq5Yk+n0nUGmwgyBcVOyP2gNQM4vqlGAwpsGfivnXF6fuLRmYhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDqbQ7k+; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDqbQ7k+"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3566c0309fso529299266b.1
        for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708360277; x=1708965077; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CJnshEXb5iP21arWLxZBg7eXP7IT09TyOJfu5lknJns=;
        b=XDqbQ7k+OYRtZuxH7yN9qGODv25VdRoXye4kaMrxLZslF2Ii9Dh5gvUT5dPw286Kp+
         aPTdh//oh2IZAlbHi3XDuKzBxR1uokTXzUI9wsHAOE2J4ASkyQjxBA4LLKi6TggPXlUR
         1rH6R8/4YAYGI0fM88GPGIwLEY8fMaYjSTICJ38cxZuupgx+e8baqbGk7WG9mhh/tbjz
         dPMeTVGPfv48go/n+y0Wqi4ui/u46b+IX71JBgEEK+ZUha3e1U5GUpqLwOeOj89b235b
         UxP/M+EKMB1PHL2W/qmlZgoAPJMaePXajURsBGD4H+I87McLdER0XeSBOA+pbA5FqhQe
         r4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708360277; x=1708965077;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJnshEXb5iP21arWLxZBg7eXP7IT09TyOJfu5lknJns=;
        b=LNlXm8CmuNYM5ORChvre9lPYQgyjlqaLpGfMEIAG+I1KR0F6/VEQobEyS6yaqGdJfU
         MU4zo3n8/Mgs7+W7TgvTD1tRcIOw/s44r/XjNYdAG8kromv8WsZaLOL/B4/3fx3e14n+
         qa1kZSobmiu8Yqizb8yWZWy7EHKj++68VznUxjBa2cu3DDbMqM44CwNNfw0a2l4bWQHN
         KYph5IplZrbiHmORzz6vBjgWzvr1RCfNV1G33I9is2AUppVS2hHbi3yKSk+4jpuqSMYH
         QBXYVNZD21bYOlSr1qNxVKKmMnaL+XGkqw8QEP+Go2HvbGNSGEcYNAhzeiIiaMdCCfKW
         RrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQz6XQV3JzCivpe8xSTRjbnN+VQAb8jWFSOcKYbsOyPBjt8mE8roO5/CwI5NjaxVTCo8mHdDzr8Ek4YG8B/SezjQZH41UrkZv3/iE=
X-Gm-Message-State: AOJu0YzkTbtyYc1Qe6xGAg7hc5w0+DJ4H45hcNXY52YQASBOCxpb9Igg
	vuhdVfiSZocoOMHI4dcPdvtrNgn8pnJfAc7Y3jxlUmVBB7Qjd2TI
X-Google-Smtp-Source: AGHT+IHwY+g0l6OBkTZ/znpmFhm6zjeMvBV15GsnsAHatlQUq8ac60IGd6BvGeEMX5W3lkEExT16JQ==
X-Received: by 2002:a17:906:f150:b0:a3e:8f38:8d76 with SMTP id gw16-20020a170906f15000b00a3e8f388d76mr2234550ejb.59.1708360277472;
        Mon, 19 Feb 2024 08:31:17 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bn9-20020a170907268900b00a3db46018a4sm3088388ejc.71.2024.02.19.08.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 08:31:17 -0800 (PST)
Content-Type: multipart/signed;
 boundary=63829e55cfba98703e2f61921804ec1df7a9f29322c3de52c6af38343b10;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Mon, 19 Feb 2024 17:31:16 +0100
Message-Id: <CZ976COWNF9P.9CWFVDV5ZKAY@gmail.com>
To: "Mikko Perttunen" <cyndis@kapsi.fi>
Cc: "Mikko Perttunen" <mperttunen@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] gpu: host1x: Skip reset assert on Tegra186
From: "Thierry Reding" <thierry.reding@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240214114049.1421463-1-cyndis@kapsi.fi>
 <CZ6F0Y2S635X.1X4B2G0KT43NX@gmail.com>
 <cea93e4c-f6f0-4017-89b5-30e3d7b482dc@kapsi.fi>
In-Reply-To: <cea93e4c-f6f0-4017-89b5-30e3d7b482dc@kapsi.fi>

--63829e55cfba98703e2f61921804ec1df7a9f29322c3de52c6af38343b10
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 19, 2024 at 3:18 AM CET, Mikko Perttunen wrote:
> On 2/16/24 19:02, Thierry Reding wrote:
> > On Wed Feb 14, 2024 at 12:40 PM CET, Mikko Perttunen wrote:
> >> From: Mikko Perttunen <mperttunen@nvidia.com>
> >>
> >> On Tegra186, other software components may rely on the kernel to
> >> keep Host1x operational even during suspend. As such, as a quirk,
> >> skip asserting Host1x's reset on Tegra186.
> >=20
> > This all sounds a bit vague. What other software components rely on the
> > kernel to keep host1x operational during suspend? And why do they do so=
?
> > Why is this not a problem elsewhere?
>
> My assumption is that it's due to a secure world application accessing=20
> NVDEC or display engines during suspend or resume. This happening=20
> without kernel knowledge is a bad thing, but it's hard to change at this=
=20
> point.
>
> The reset line (CAR vs BPMP vs non-accessible reset line), and the=20
> secure application code programming this stuff is slightly different in=
=20
> every chip generation, which is where I think the differences happen.

*sigh*

I guess it is what it is. Please add a bit more background information
to the commit message and also a comment for the skip_reset field so
that people (including myself) will remember down the road why this
exists.

Thierry

--63829e55cfba98703e2f61921804ec1df7a9f29322c3de52c6af38343b10
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXTglUACgkQ3SOs138+
s6FSNA/+JKS6P4nREJMSGDNusAkqIp/UTtXTLulM5h+O3EKLTT8JAomrUY7oWjYg
GvMz4BqpbShqgj/LbVbHMxPgCRhTizhINzsAyL6HmgdGAapk3xZ4G5uwW1xzbs7C
X8KaT8alBagFLs52hcpq0DX4kVdyqwzV4Sffvp03dtc1lYr2fHgR8l4Ram+QH9GH
SzMNaCk9DqF0mdHQeTy34/JhWfUfB83cv969iGqKkuPsJuk+Ji4YZACOvKAzgKTP
Y5vkggjWoYAzg3I8JaYApw2YVXcaZ1DVIBK9ApNAwMtk/L3ldeWeEIFFq+MFyyEs
hvrsBM4NTx4CSR6LhtBncWYy6a5mvWahHYMjrqY8I5IosgUUZF3quyKxwGcJVz1o
Y1pPOxAuj9n9B2+wn2uZIraOR64IH6CKKi9acLgRUfoZo5+E+r0HdhJB0z1zySsj
l2qjFIYoCuS87FvUGJyfZAoLdK7MUMSIRqjtPFCpRqTu+gUSEpR69a4zlwOM74GN
sN1+IU5saWx+IbDGCQ6FoKRq5tYclsgQ9Mj/Ljkpmv5yK6msysKZM9Io7oJXW3Qs
+N3f95EWR48dNpPBo/tdaR7X/HVmczq16Tb8e5O2Sj0pHml/US7OLDRc+ISN24SJ
R6qHw15H/+s1cxebsyI2LHvSiZWRsD+gs0u38JRy6toYiDJCFX4=
=R2gT
-----END PGP SIGNATURE-----

--63829e55cfba98703e2f61921804ec1df7a9f29322c3de52c6af38343b10--

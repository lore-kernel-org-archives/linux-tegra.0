Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C07F202F8F;
	Wed,  9 Jul 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752093463; cv=none; b=uGNKQNO4GnTyJ5TAnyiikLpt7mi6ZBwCSLum+JZpsQ31vvr0g9/EXpep5s5hRnpfVr9Nb5UG7IGjYdzT4yiFjVhlEsgDFI3YrdWLTUL+ngd9Asf3OLmrtkA68X1fHdaPice2BHZ15f5yAw3sP84KlG7RZg1CtTZQrt2br9Q/if4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752093463; c=relaxed/simple;
	bh=cEx2MpYBYM5A3c4N+KaKWTNKExX+2JbEoqnQeVZeAng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bg8Gje7r2moIIvNG0vt8jtfV+eC1cpia6e/t2WmjJnLq9BsyMdEag4cgVkPuXU4/WREEHoJs8CnGSavePDIq2lVTbd1kMLt9zF2pITpWEv2a5tNY88MyMBjcni+Iij6/xpd8C8jhBDchQZTYFJjou/eZPJyI9zS4zluuEJJgFx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2XnqmEn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2XnqmEn"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f379662cso314252f8f.0;
        Wed, 09 Jul 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752093460; x=1752698260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGdjv3KmD+0X6ev9+zT7oGVPpx3cJXwFKVZG7Ewb9UA=;
        b=j2XnqmEnzrH4U6kBdeBNqUeRqKxAU7vonLi0ydHkci8cPYXrf8rS3AxEqpUOvmYp3b
         sUGhZ+5WoMy7OQoWKLMxb8khuEmhD7J1jLdD7jKIQRbaBPWBwbt/C8bnyJk4bTZNe42o
         ZIm7adCQ3VWG3RW10Ga2TE5wLa5qP9nSyx2o3R6K6uNFT3M6myKxW43xjaUDRr3DaL+P
         waGgH3jvdIgZhYgo/CQcd4RB+6U8Kr3L0tvaZb2gruo+k0ADgmvnbmSkqPavstTGzYop
         J2LMohZT4wVJD1OcGc3DP/y9Vz7GqUtEUpCC4TXadomwVwNGZoXbo4d/GEheOHAX2IM8
         8P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752093460; x=1752698260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGdjv3KmD+0X6ev9+zT7oGVPpx3cJXwFKVZG7Ewb9UA=;
        b=rnYPrPsk8G7HayOKOZ8cvJkftE8mx6P1jS1g8GQ3ENhAIwpllJasrtCJ2Ml7fmLahJ
         CU6rgKCmckpKNurwLwxD4i+tDMw/mEwMbHTiERNuiuJDS8lw+09iN567K9BBf1aWRZKx
         K8dcFQX9WGNES5m67Q11W0QQBYtb+ueo9mOoq/+BVcwk7AmyW3Cc+smQn9o8Ev7HuhaT
         3lp6ZdVlHC4S5cxlp8hqz2cW8JfA4YHUz4U0gTyFJmBn++qlNFdkp8YqMCR43grmbP2j
         LFelA0gkKTWZaUg+23tpSIuetYq7dkR+6yoiw9VQJnEwqoD7j0h648+b6dundHcC4o9t
         nwyw==
X-Forwarded-Encrypted: i=1; AJvYcCUQm1piuBnzk0CXdDWKZPU/fIAsZZCcSFValOeYhzMNWbJRZbSFFu6OoXfV3ALXJWDY6EcYB4twwxgFHdvH@vger.kernel.org, AJvYcCUUTKzeJXnCZIO89JF7aWacSYo9QQMKz35NfFFhBGiHmWK9ZXpt6uc8suxidc9SQwqBLQgwK5XTwypUbUM=@vger.kernel.org, AJvYcCVY1D9i/ylSAnZsSHPJS/oCwl3etovlb5oQqFZO5xhbHoq4GRBU7r0NKZqijB5BCo9Lmhh50Liz5xEk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxojer5MBVnAEz2wipmUMyq9Fr7R01SaprXqcgxmVTvwzd0LFtn
	Gr/PAw4HDNZLPAs2AldGIHGVGjMvEYREcpnUtIZo+FYIJeve2Vlw40Pr1xx2oQ==
X-Gm-Gg: ASbGncsKuHNgUK3y3WzVEBywfeBG1mq4D5LajZ+BmyFyfYwW4hN3hK1xwtqxI4GbXnS
	5MfKEPMTKMyKls2X9mycozVAblekh4RJvBiRSvfIkMJGVn7aP99bwiS7YxltXnbHNglBH8nx9qI
	WpOOrjrq1XLx/orJgGdTSJa22Lv6/Uk+w/+q1dJ2o0CQLsQEj5YJeg6ESASBR+6CUO1vZqwQMUj
	+SR/MvtaeISiQpb++Vi7hqXGq6nIjjKWhzsXxxcpVktoef0E7smiXrC7PeteXijiK2mLmzk68Xn
	ryX3YD6kCbJ4xHG8CJxHxNDYOV+u8vXBGtlB5/XYSgbd48Va4Zj09EFSF8K3YKkdHlGCKKSNOpo
	5TG/0vc/cOfrJq0uywtkJ806kPO81Y8Qji0HH5XUfrIB7ZebT
X-Google-Smtp-Source: AGHT+IHxmWI+2/orUGPk9n80rhIAGDETDoAC+vGv+Zy/ZCftU8dYrn5mmsheD669MZytVh+gJbQslg==
X-Received: by 2002:a05:6000:210a:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b5e86d1435mr93918f8f.47.1752093460389;
        Wed, 09 Jul 2025 13:37:40 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5103082sm36168465e9.29.2025.07.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:37:39 -0700 (PDT)
Date: Wed, 9 Jul 2025 22:37:37 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: memory: tegra: Add Tegra264 definitions
Message-ID: <aw2s7wv5k5phwsr56xkjhktgcmgpf6pyvci7kt2lgk2llcluuv@2wepaezjflnz>
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
 <20250708105245.1516143-3-thierry.reding@gmail.com>
 <7aa9bfb0-0d2c-4e7c-9bfb-58934d305f0f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gswpbg6g5fnj37qk"
Content-Disposition: inline
In-Reply-To: <7aa9bfb0-0d2c-4e7c-9bfb-58934d305f0f@kernel.org>


--gswpbg6g5fnj37qk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] dt-bindings: memory: tegra: Add Tegra264 definitions
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 08:20:44PM +0200, Krzysztof Kozlowski wrote:
> On 08/07/2025 12:52, Thierry Reding wrote:
> > From: Sumit Gupta <sumitg@nvidia.com>
> >=20
> > Add memory client ID defines for use by the interconnects property in
> > the device tree and tegra_mc_client table in the MC driver. Note that
> > these IDs are defined by the hardware, so the numbering doesn't start
> > at 0 and contains holes.
> >=20
> > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  include/dt-bindings/memory/nvidia,tegra264.h | 86 ++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
> >=20
>=20
> This looks like values for new MC added in patch #1, so this should be
> squashed there. If this not the case, commit msg should be more obvious
> on that.

Will do. I thought splitting this up would make it a bit easier to
handle dependencies, but ultimately it doesn't matter very much. These
are all fairly small files overall.

Thierry

--gswpbg6g5fnj37qk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhu0xEACgkQ3SOs138+
s6HarhAAgJ/5VTud5O8Y3O/tagqjz4zuyu1DDRnn/igZGV25NM0uppKKGEQUKOwS
plHcvKhFE/oJ35YBLMQZ9HXV8pWvB+MVl53SYdXgzaUQQpRjLklpgWabwmBmIP3z
lrEhmYKbYcFEK0b1YiCuSw20NQQEcQZ1Em3Iy3lIzqvh2Bj1WfqWFdxPoG72G8Do
l5hJmTZNDB1FYIU+DzVUJgwfHKnZA1slYZdEewP3JmXcEFgn59B4JtafSh6ykc70
dTEkw+g6Ycjw++FNI14jf8pu8vDEWwkDkE0s2yvTtImweI+vyDwB7tJVNEVbZLxa
KKNTravtAiAMPiUTONF4CYcF5bxXVLt0+tC90RLlmBK/RR4sY8B2WQQik32AsEsN
6V7vcaCI3xLd7RZHNZOJg01OCxoVWSzFaXhxb2MNGGKkq+v1kJM9mznoZmba8kQP
UZW/zag09Q6dT/lQE2FKGdxJ/MoftpWcJsaaUQLvJXi26+vg65bKVy7naXr0mjmI
G90EI0kiXyOVpdOtrx8iIXu9TDU+AiHbuGHNW1GavUqgu+eEMAn5zt4vE/yejadR
ivJV/hvlPfvGwUX3RVLwBTyJFIaHpU91R5j5Eqs+G3AsbdnI57F1Yyn32A/bg9Sg
ornPDDazZtfwDZw3eK91Uj553jpTswFestuSgBL3YPXoDhKvFI0=
=iMgT
-----END PGP SIGNATURE-----

--gswpbg6g5fnj37qk--

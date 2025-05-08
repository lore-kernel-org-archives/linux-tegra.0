Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9BE224882;
	Thu,  8 May 2025 21:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746741266; cv=none; b=hGq1eNa8N6whQyf3xJF52oX21ZgYpSAZrA+/9RhxLYREVMPmno8Y8atBOUsfvCsUhZMAwP189HzxmzrFbZ1q9A6afqBPTI5KnyjFGA7yvRLjlkVbcnbVgivmWVXKofsWZJPQRfx7b3q19MbnT4Jxou+WrfcJnyl6Q25rcpV8lN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746741266; c=relaxed/simple;
	bh=zJAUDzhYWvqbLPmA0RiivyQSrmMiJPd04BPkKPjCIeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duXcya3KorR8I7eXDV2jM7bDwyeR8Q98i6Cn0gc/AN6rvZZbBtnAUEdS4zAgY2nEW+amHFFQLzIH5CIVtrfxVi0paMvD1iJ7kSOiCuQ8W95lq+1R3fb4w3N8i7e2nYyfrUWlg/CRWMvEjkpP3O0wFW0diVkkaUFNLK/gyyj8Kpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QO++S96+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QO++S96+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ede096d73so10415665e9.2;
        Thu, 08 May 2025 14:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746741263; x=1747346063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1nl5alJXZeEkOwentFRexqwkaWt/M+lbSbiqiz+7S6w=;
        b=QO++S96+CcbwYudfXaH1S4QBi51UryDCV28Jm7xE6GmE4GP/f5uAPROfE5F/U/ZQUr
         BTTJu6IqEnjoEuhVHfwz51iykGgubFgRA+Em3qKMdGFJjhmZNWU8pPmCQlqFD9i0Msjw
         k+cdgpaPgB7C3D+IQNqgKCRksKRfqy0S718Nw29EO/1aKpJnVTm9OAFpJwmliBGyYaCE
         kw2Pd3CDBL0X8M7AQcPO1Ot1V6/AaHcboAVwOpKZIa/M1d2rMz1crUfL9I7mFUrShe8V
         mlsp6OolJDypYIJS/CDt45UsPKDZkvxqjRbj3UwLOgE2YvgoYa1rgUpJ8wZyC1ia8BcL
         Dyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746741263; x=1747346063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nl5alJXZeEkOwentFRexqwkaWt/M+lbSbiqiz+7S6w=;
        b=C4uGjTnwEZYUap3cbDJW8qDtdDkwB46f+YDh0ApxB9S4Mh1PPazsd4xF8SDf01Bp7S
         F7pOfDCY0gwbajn9SUGr3osi1mOuUBb8wkMjmOlueAOJKDffcMYI1BgQTlxbzoJWKU3t
         QjgX6ZnpzK1CXRIMSR3COErH+CFoHOqMQlCyzO+BBIF+Frabd4i5M6vfUPCgcpbB+CGS
         b2E3pge9OEJ9WITFfa6k1uUwwrFjfEEpHTdR1pjB2KWmuXk/IyNO1RxHcR5WX2RZTTpT
         pkyLeAuzYRUJt9Mq5nDv2Xker1DnAVj6b7ZjIEpzHnYakJb1xc4tdet8F7WlC97Kx2oH
         3rew==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZJNjo7DzsP6pWQx96XhUoQt8Us8X1TdXKA36f1vpjVkrhlBIe1RmRcg5mGRbfLPHPWLSuaObj3VNLSw=@vger.kernel.org, AJvYcCWJZn8QxFJDGKx/u/LU6vmJAB59/WI8Z2pg0esyKw5V2TXWshr855D5T44iGKnrhdFmc2XmvszeHawhrfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH2TmNlr8k9Qg6YZ4jDAvYclw/gQxKAG+/P9/NIuCGSJO7wJLz
	X8zT9RSdcmx30771u8XvXUaQLEpCnYiM5yq2Cger29oNp6zEfpf2IMOmEg==
X-Gm-Gg: ASbGncuSqc5i9OKBBd5ERwhk8rwy+3+5jxv+JT58pwo7bb4U73csaYmbHzVZqdvfO/q
	FmBX7e+8UcTqtWLJmnOZCJt9uQfj9NJkCOYdAs14qVI4TBEw/1NTf5vdssHzXiAjMmpGUk9VEEl
	8amcBwwNMaJ0guf1fkMIRAy0loHaUgtWKqjZul56UuVXfJsnWX5Iv/DgcsfUaGiTo8mRtEUDnXL
	s0VF+T46xNux8kHEiz68/rSM1HOqnkYrxn6McRmfHgJ8m6Y/TwcyPec3eLbM97xgO8XlyaD6YHN
	GJoBDq1QCopSZDEikpF/n29XGY6a9jAo0g+g++9m2s0Iraqm2lOw5LAncZxlP9zFhnFNYLPkFeY
	ORZni/DNSFWEusNN/eyVQ4Qgv1128nl7tRM1TPQ==
X-Google-Smtp-Source: AGHT+IE5i1ET0boq8mdS5lV60YxGe1tCFavZZYDoBfU4C87dLQnm9YecESXQC1vuwbPJO61Ms+G+4w==
X-Received: by 2002:a05:600c:608b:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-442d6ddd61emr8812085e9.31.1746741262429;
        Thu, 08 May 2025 14:54:22 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d14e6d74sm41050385e9.21.2025.05.08.14.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:54:21 -0700 (PDT)
Date: Thu, 8 May 2025 23:54:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: jassisinghbrar@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] mailbox: tegra-hsp: Fix null-ptr-deref in
 tegra_hsp_doorbell_create()
Message-ID: <s65c46x3a3jltt3nfnuop6oehsrduw6g6bdacbcugrbsy3fsdi@65xyv23uxuqd>
References: <20250402144115.45564-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yzwrgeq57o5b5zij"
Content-Disposition: inline
In-Reply-To: <20250402144115.45564-1-bsdhenrymartin@gmail.com>


--yzwrgeq57o5b5zij
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] mailbox: tegra-hsp: Fix null-ptr-deref in
 tegra_hsp_doorbell_create()
MIME-Version: 1.0

On Wed, Apr 02, 2025 at 10:41:15PM +0800, Henry Martin wrote:
> devm_kstrdup_const() returns NULL when memory allocation fails.
> Currently, tegra_hsp_doorbell_create() does not check for this case,
> which results in a NULL pointer dereference.
>=20
> Fixes: a54d03ed01b4 ("mailbox: tegra-hsp: use devm_kstrdup_const()")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/mailbox/tegra-hsp.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index ed9a0bb2bcd8..147406149fec 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -293,6 +293,8 @@ tegra_hsp_doorbell_create(struct tegra_hsp *hsp, cons=
t char *name,
>  	db->channel.hsp =3D hsp;
> =20
>  	db->name =3D devm_kstrdup_const(hsp->dev, name, GFP_KERNEL);
> +	if (!db->name)
> +		return ERR_PTR(-ENOMEM);

I don't think this is needed. First and foremost, db->name ends up not
being used. It was meant to be used by debug code that never ended up
being written, so at this point it's mostly here as a way to document
what the doorbell mapping is (though even that's somewhat redundant
since we already have macros that match the strings).

Secondly, these strings always come from tegra186_hsp_db_map, which is
rodata and so the allocation path should never be taken, and hence the
allocation can never fail.

So instead of trying to fix a non-existent problem we have two other
options: one is to remove all traces of db->name (as well as the string
in the mapping table), or we turn this into an assignment since we know
that it's always rodata, so there's no need to copy it.

Alternatively we could just leave this as-is. But then it's just a
matter of time before someone else comes around to "fix" the same thing.

Thierry

--yzwrgeq57o5b5zij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgdKAsACgkQ3SOs138+
s6E5fRAAhotmsNGR/NTTbFP0mQ0LUtQJwoRJq/ZER+g2rsvCIPwZNvVosKOROAmZ
3qQOP3Dm5AqyjodqnO+T4yeWjbszltue2om7zBHaHu1tenvB/uN3tb6Z58W4iXba
+wxUXBeYdqwnWJIXj2agaF1kKg+Vg+0HhWuHSzjnqDE9cMZAR+B+EmRIZgw/X4Tz
v1QV6ihmq6C30Cg14nMgNdRJVBuDnblrn1d0CclhQEofikNRfHtLw7heG2amKNqO
h0xiJmNtZYYp7oruBaD1zMvwsUAuhdDxcN9mSOWmycMVBVX+8/o8SsE7YWN2gl3Z
IBTcuVnLlC67KAy2fi5ksjQG2YGTwY3dkMAoYETdwEoc6nolkRuFwjHL/pgz3fwy
U1R34TK+xX6L+qSRpCkz9j14ZFpPhFjyFpupkDnf5Yt3OioS1pqrA4oL6VyseJWd
KO+mWjMEGyu1Do7MDRNo/Y8ayN6hRl5ywOkShodamDOk9QcPkYTDoRv4qfjMPI4G
tfL44H0hiPhRXnTCTGgZ8aETlBFzER3aaOEsv7q6CTiIIJ13a/xCspZasuOmzeKd
w2knMTC5H5EX8uZaw0yEalEI5ORs97hC/uA6fDdLJu7ETc1EF4QvGSq8vOZ5DMLl
DAlKrSCnFon8+LKYeWBYS/igJwphzFvG4jMpvT5BLOl5di4/kCI=
=3YIT
-----END PGP SIGNATURE-----

--yzwrgeq57o5b5zij--

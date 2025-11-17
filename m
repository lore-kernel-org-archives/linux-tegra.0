Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAFC32A3D1
	for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384179; cv=none; b=CvezmjMhV9y5NcJ2MLQhOfNRQ2G6kodbmJaJ1UZGZVinqsvSba5AEfKav7rP+Ntao0J0SLbdfsmN9C/d2wSEQG615d1NkhAYyK4lDABLtbc2FKPg0EYdh+VmTqdVSJUAtzJdiW80wlsMV38KYDXNQJYt7TpltMPWPvopQScX6ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384179; c=relaxed/simple;
	bh=D8JKevJhdf2pIaGBDhah2ObNrwU9TQx5FS+7oH7yFQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRB2ndDZpoKhgnc0haLB9zRAtGSXIBggzLHLobIIcLVFANq4rjyePcQosmcpOxwlRTV2XN8GJlcBsX6NRDfmWHZB8NERc9lkBRGr2NUwTDU3b8Ee/w4ZISDMesDdvnGa9RqMY/0YwQMAtYeVq955QRm/49KAsS5TTF6A9BEXEec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9wa5GaG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9wa5GaG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so45447235e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 04:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763384175; x=1763988975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UtQClQj27s6zv9IA4AhMxU7/PHrcAy8OI38mRHxa9s8=;
        b=Q9wa5GaGjcJ8GnAn0H7hkFGe4Ip8VQXE2xQ6QMSqxhhVsM5J7/lMuGtCNnfSaX315i
         EBqh7mBu+J5qXzbFkGX0lC+qvm/FmkFOcK8RSEwf9z47/8u0Yi8FGyw86reN0wye66j2
         ybdYEXHD8J714AEjScubbBSDQS+I13KoBFpXpigqZoQ3UqA2db2DW/eHbwdUuh8lozAM
         2GD4HfVD0U8a5oFeLtIIoQDqMM+ABelltADe7IyK/khaQF35FeyVpOBYX9NFlgUqLIco
         3y9mB+enDh2ffYxX7HdQk8RRQwhJ3wmXqZhmx2e8wvnlWUjXqsYlw8E1BCrXk80fw/sH
         fRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384175; x=1763988975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtQClQj27s6zv9IA4AhMxU7/PHrcAy8OI38mRHxa9s8=;
        b=hLLlcGwz6di3KMsT7OmtXj++CLcbOVOk38Q1HFr+zBexVFP9qzvTnRQxw9fXfYJzDw
         yOo5gRK2h8u4T2lYswLKnZyfxd+0mRta+AmKCPsvHqeSMkSDl2ax7qB21C7ifcOSxnq1
         W+QfoDizf5/yiGovp8d8dBpb5mbeGah9Do3TJsxz3b2guqKu/NWlnuZSDO2Bd+wKhZ9s
         d+F94RicMvx29mBtncc4v9La9iy/OV1pM1cXDwDRo7EkW2/2uVO0YSLM281HJLS3tp/I
         zzvFWvHVXwcr/mNrn2KgS/5zlT9JXokQff4QzV163ITXNt5WdYcFY0x1GOybl0NxXeY2
         1eCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPJD87hMCfZZGAfkwBPmdRj2C5U9Az9GPImQ/+tmAT7EVzh6SpwcPn5/Jx+2rjRvRqfu0DE71Ha2BFpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmnjE0dIi+2xcgd47Vtqiq+yKoAgKzU6VFzhFCoLgvnQaQSZh1
	ek/nMKC4hL1tUodRMnYfcapZqtumIJ0AwKs7RYDE5oTwzsbwZqkYU4fFI0vJcg==
X-Gm-Gg: ASbGncurD9JYZ7srf+HoEpZM7l/DCCN070X1CYr5TxtRM9rWz5FgTqmSuBzbqq+VrVX
	RoBYcyDxYgxO5IPRK9+qv9XIXZAFELzwXxgpSfAh4/LKBTCeqoBNjmtL36oSp4neKiVeCUsB5i5
	E+uoh51l8pvwCFToiCKDiXhTkYi/HJjWC6m/x7/g0amwrIIsMnGd73zRudfMTF5KyXuvD4kuYi1
	bpc08FmNBmxSjXF+fyfo1R9GbnS4qKP+dWmUnK3jOqH4H9R029E+o4W+lRmzL2DR6lbg4e6vf43
	lz5yOnlUpg0GlBS2zENGwFireoBg3SieSXzNNxVr8ZRsE0KfV7hGmqBrOyOKEa7TmlhhdCjn348
	h/buArQ2OQwfOpIwgHTqSnmXW8npyn9tsi4f5XdWBsynqdKAofaZq2xoR1JJBuFfmCd5wZ+MB1d
	3H/cAXrpMjoWyKvpwQ/sJuCg6E2ryEzQtwyEIhwanTXyG9m1LWP7hJPjyyr4LqPniv0Y+NaqxJF
	Q==
X-Google-Smtp-Source: AGHT+IH57ecXdIuEBtdHqbof8FxE77BlxQn90vBWkhWWPRNuN2jxvquiJGk+VRf0FNachim8KEymaA==
X-Received: by 2002:a05:600c:6052:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47799866420mr47099985e9.28.1763384174937;
        Mon, 17 Nov 2025 04:56:14 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm141496285e9.13.2025.11.17.04.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 04:56:13 -0800 (PST)
Date: Mon, 17 Nov 2025 13:56:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/8] ARM: tegra: Default configuration changes for
 v6.19-rc1
Message-ID: <la6n4yiqekpykfkt2d5kdt2px6vnz5djge7hstjs5mu7jnved6@6tdr4yggfkmx>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
 <20251115090044.3140331-6-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sberisgpriyevh74"
Content-Disposition: inline
In-Reply-To: <20251115090044.3140331-6-thierry.reding@gmail.com>


--sberisgpriyevh74
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/8] ARM: tegra: Default configuration changes for
 v6.19-rc1
MIME-Version: 1.0

On Sat, Nov 15, 2025 at 10:00:41AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.19-arm-defconfig
>=20
> for you to fetch changes up to 23a29a81b44e3a7a139fee4d3eada5f299d8985e:
>=20
>   ARM: tegra: Enable EXT4 for Tegra (2025-11-14 18:05:14 +0100)

Looks like a fix for this is already in Linus' tree, so you can ignore
this pull request.

Thierry

--sberisgpriyevh74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkbG2sACgkQ3SOs138+
s6FuihAAws7+fjys36vJMOzOHFLEBas9dF7S+5AuTIaZGhZtxTmjaILVyWTycZJ5
PeWB56yTkpRPkHFw5aIuF6nvy8rOp6vYRCmMRZPdVADBCkclFdnDyKjb628QAPz/
pda88AkbCre4nHZWPXvOy4cuw10c9aERK+8C2RD9BFft03kX/hqMuzdo9NbCCq2j
puNPW620/Xd/lu4tEHqNeaEejbV06J5yrbvxRU7Yw3Im1KsVmKrzSlLm9eE4tfFp
eRV2T/aUqXEVKUJNEXaTYWyCg7GIrsW41ZgLLRNOVj6acFZb5VPHfD9dB+QB4oSg
JdeYssNwytIh8lS0cLBcIQVUAPuSUR/mTsa4XVzo5dh0/HqZIXTg4g23/5yoLkxs
tGjWtY6iWDBenFSTbis8yDkNhX/4b8XD8G6adfAGU9u9qxYHucc8fLD2GSDWA2en
gN1gYCD4hTj9g2rrZpF+oaNoFmHl3kaojZ+n1C8kj4M/WMxy2ngMlxA6eGM4ysHA
ywehnhP7c3iRQV9Zfn54cUyjpU6sx/gekSzZC2qvBYq0N+Koss0VvgES6ENaUNi6
k4LgS9RGWL7BGCmBF7dmXCVexn0CkppspJl2Lzz254COJYUxbxEhddjb3RHmfYbY
esCZlyqtLcg76ccZxmAHwSMEIPNyN4jSqSQWIAYUkP3Fjj0cIM4=
=k0z1
-----END PGP SIGNATURE-----

--sberisgpriyevh74--

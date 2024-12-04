Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE02220E024
	for <linux-tegra@vger.kernel.org>; Wed,  4 Dec 2024 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328526; cv=none; b=Y9Q0xvJ49yjsJPROLAP+MCSkDjW6C9JesS24URTyzBWYRVXUKGVWeKcKYldFKpIHMqmuLN4wWBfgK4mErLiB3yBJb+QfVdOi19YycOvQRUSyrZ3tVp1AwIAeqo973hEAtS161pYHa+p8MMKQ91Aa6EjCqOiQaX/BFExVBLAP8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328526; c=relaxed/simple;
	bh=hPAT/TRFjBB8HyWgTua/k1CEZ9xaszsekzTaHu0li2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMZWJQDDS85sdJ4MMorP0Y7NZ0jB/HTEfrVL3lc0QfUFxC4BVWik/3h9hA5MywDLlg96V4QXCTI15RBzDqmxBhvlT1QKVoe9uHzNx+tC+fRbTKuhCGGhQk6awpum2A8pefJpX9roZjYvBJHBa+Nn5/GkFcBDqrz+55Tc/ltEwWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5sSxh6v; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5sSxh6v"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e5db74d3so3252724f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Dec 2024 08:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733328523; x=1733933323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPAT/TRFjBB8HyWgTua/k1CEZ9xaszsekzTaHu0li2A=;
        b=S5sSxh6vuosR8ltZXsO5c2263WrFrNtPJV/3Jj96zfRhxbwtNYma1pyC9jx1GLNBqc
         jIrGSPQb+/I0Y1izqHSK71cc/cbFZkb/OIlOTsiFDmWzcThzdwlh5KY+SxNR09Anhnq5
         jt5GNlVZBiP+WIHkvCaH+RWfOIYVqi5Expc1UpqNJJVnKV3k6wS/+xejrrOW3pX72L+X
         GAnMeNMoWekjihrWciYDDAmBZVjMWcxF+e1zjWOvPXQgeuaQ8e88fYTKKXLMcbOd3Lcu
         yNWtbjJqnIvTgN1Qtztgm2Xej/QTBSRIyjOxuzIBxh4Y9hD7mR90SV/da/ztk4gLebRh
         uCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733328523; x=1733933323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPAT/TRFjBB8HyWgTua/k1CEZ9xaszsekzTaHu0li2A=;
        b=rONyFUMX8YV+VEWXSsjTz9FDqdTwnH/FDTgV+llyUmHN/8W2Wugy/b5tTBTGRbEW6P
         tjPq1A4fjj1WmToa9a+omBMxrkBTBHykeHrZDJlqA6UDYrx1kr2cvKSzQFZ1UX+EHU4u
         F7Ib5avSb5iz8FhSgZQt7fbHOb/eR5p4AmoLi3SzRY7FPgBqIn/1yf6tZn/m/t8mRNhw
         BskepPjIfvSzDCXhDaZfzHxRTCPdP49enrB10iqd/RDvjfBiJe7UzA4KIBV02gQtIQun
         lSQ8jiSo+Yef4acp8/VOvKp47cWJ39LJpoq2qN6AJnLjLOKGTWp41vaxAqj+tkQR5+DG
         mgQA==
X-Forwarded-Encrypted: i=1; AJvYcCXST3TS75Qqr8dn11k724rV4D/lu5TfGBlIsRSJ1vn1YvlUZ59lNRVyOrdo54ryWYLmh0scB84Vs+sZ2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQaNklM9DK/Tm+P3O4dXUedyjmlw0slJdAOoMoj6Tjkwm6dYTX
	ELzm4jNVFKNKQe5hSLJKMsAfjgCRKDHe6q6yfsR4c+fylT00xWIc
X-Gm-Gg: ASbGncuv/u2313Wh4Pb+T8pmcf3ReJsAHWvfhKxrQRM3r+FWdSkfOuFIrPARmg7uFz7
	rCfUwMoqqbskChm9/Om6KL2C8Rg2hc2FBweyV2/3o77GmJu19NoJ7p/42NiXsMBIfNiPGWsFjxC
	PUynHkG89O1MoYo7/Ya0vC/lcddbwpWxR6wI19KBOXmqM9yZkWFFnysXbaywreqmvMSk1Jun6+Z
	I9iCb0uWMldFTTVAwE6rYlmgNq6vYcPma7x3TCEAuJEiQ2p2yDfWb4xrURp4x40G369FSGDXKPh
	FXNfF1N0jYhuzcyl+KiIFwv+N8EwtigHh2Gs
X-Google-Smtp-Source: AGHT+IGeyxif1bNXgCtRbLMVJShhmRozA3MwedVVN9gh/m866F+SNXEaqN+dd1NRnYdztBfC9bOtLg==
X-Received: by 2002:a05:6000:1f8c:b0:382:4926:98fa with SMTP id ffacd0b85a97d-385fd419f39mr6416846f8f.40.1733328522599;
        Wed, 04 Dec 2024 08:08:42 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e1f3f2desm14327449f8f.87.2024.12.04.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:08:41 -0800 (PST)
Date: Wed, 4 Dec 2024 17:08:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: tegra194: p2u: Allow to enable driver on Tegra234
Message-ID: <uya72ol5phxspynrs7iurusapaucypyiqwmrlotsaasz2vzabf@ptrfi2ljgw3k>
References: <20241201002519.3468-1-lars@metafoo.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fmkpfmpnx7buzb4s"
Content-Disposition: inline
In-Reply-To: <20241201002519.3468-1-lars@metafoo.de>


--fmkpfmpnx7buzb4s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] phy: tegra194: p2u: Allow to enable driver on Tegra234
MIME-Version: 1.0

On Sat, Nov 30, 2024 at 04:25:19PM -0800, Lars-Peter Clausen wrote:
> Commit de6026682569 ("phy: tegra: Add PCIe PIPE2UPHY support for Tegra234")
> add support for Tegra234 to the tegra194-p2u PHY driver. But the driver is
> currently not selectable when Tegra234 SoC support is enabled.

So it's not selectable when *only* Tegra234 SoC support is enabled. I
know that's quite pedantic, so either way:

Acked-by: Thierry Reding <treding@nvidia.com>

Thanks for the fix,
Thierry

--fmkpfmpnx7buzb4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQfoQACgkQ3SOs138+
s6H55g//cYre8QUcrtX+3oYPLhOYpkqzobtfVznfUp2az4g8cgu9qwCb14rV1X14
uDKR9UYGUMS8m+DrvvvAVO+JMdIA8y9JA33tSKC8m+KKb0oydJP2Q5pq93gkq/VY
K/BSUQXXCKN/tVuZktvB6xWEuRQPWvpLxKboSJsOnCfuQjhrceXCnjHlEpcMibwL
3DcXKA73/JYaKJZeUcQilHmPvnxdvmW8F916rfpECofd2GjBMaovrqMz7j9Hy4tz
+2BNcvGrG/Txf/1tS7krfY3O7rEtzp0szbQeSTnLXQxVzhcjmVmUGxFJx2qhjNQ/
0NRr9QSCKCLc+PC7TaQ6Al7MF3qwUhQJn0wcb9FWVTAUSfqD9uYKhU52jVVcRvIZ
D9fSIMVxbmsykDBYORRiKoBmR4jMrtVFzAd6lzkpZ0At/RgHD7H6KosMyyowzLFk
4djEB0oc2CPB7PQGjjZrMw8kHoxbSxrV7hrmJbTdOtzoIZGw6nQhJ9VDU80yXaLb
CKdTfci2nclPmXfAwuC9pR+Vp8sJYkPdnja9ENvzTK/f4zQ+g5/SJN7YaMlQpvYQ
QzDhdfvmuSScQv0N9FevoC6fz2HwXAXLfVFNzBPgmVF+823ii4HOn9veLJdaKat4
5UyxGzPKho9/D7MOscMTzsFTmqCFoTsRVKu3KDFao73D9nRc/Ss=
=1L63
-----END PGP SIGNATURE-----

--fmkpfmpnx7buzb4s--

Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660412C0296
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 16:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763139023; cv=none; b=WVKRks6izHrors0jJOLpmF2KNBlQSWL/KYn162WD0SjbHOy2qD6ILsDRbOecejLlxwiTmJU9CnZVAcUdttowfpc5FVpCuNuGQZ4Is5hwfXXCTd3F/ojle3Yqnnrrc1iNK9Lt3ZCOIWmNrg+dhUjopo5AWENn64YE+py/yajagvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763139023; c=relaxed/simple;
	bh=qTut9Ewy8dQSzfkbfa8/nMy3/bP67a+YVpEX5V7fsQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQ2JdcJAphu5dz5ZpfOYfkQt3k6EXJAMvRhCjM4McxwLoo+mYrNT7zf1kNbM759+OvEIuXt5vnTE5Vz5d4AqQDfRgPHmx3FJBUiHWogIrlBPB5i5DwU7nBHAld6ayRqDVWYPFN9p6e6fQUTYJCSk53YSdMYky0cVphvDhalN0RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhuCOWi+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhuCOWi+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477632d45c9so17036475e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 08:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763139020; x=1763743820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bNlYOo3f7iFBikvWUb2qjHTSCBHAoUxCAr4nMk+scgM=;
        b=BhuCOWi+BIBgzHf7UO3lLCK7VWgm73q/2c70PYumSWL3BF1NxOIG2h/2TO0dQCUsRI
         yvDmb/i2kncXd6oRITsKU+BN54H6ids+/mCN/JZVZe3aDqBFzfKMCX9fahg+KpPW0NKp
         Wzs2eipSqvHy9Ma2Hzlk9+0pvKju+QzTp31+4Jo4mO8MwFUdZitiJVvLE5LhpxJwxdc6
         Gow4K5kbZwkxf26XmCkTPz0FdFsd3OqEWGEjeAGuTsBP+AKcZiMdysdbGkrXTDf80vwO
         IVUuPCr8r6a3uQIMSbH3HE5z7Ff321vfYAkQDpZwU9qJjM3SDdSfHhC3/kjmxXWWMYR/
         pz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763139020; x=1763743820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNlYOo3f7iFBikvWUb2qjHTSCBHAoUxCAr4nMk+scgM=;
        b=QqBmDfTnyC7QKAA9MWVMWcXcJRpFzuc+bW7vtNLeLHqVHNpgFhIPykVl3BgQHEyOM+
         ypee4fP/5XAooxkzPlwBJkLO2FtAAqJQgD1+I9g5JbBUei+FMH3LxABOqQfV9s2WLATC
         xfs79IYjUQfGkTBrrJKYG5092raG5HGN3TQempARiyfxNwylfHu255/uksBV0B44hSnk
         NfhT8xyB/lGLvRkA7rrK3jTShCYAO9KJrD/StxRV8BqkC5gJdwHC8EYUGZvPNFwHpgmI
         JpqCQ9BmmoykrzqYZmPEKCkuWMT9PWBUIFV+L1rFSYzJcFJG2NNKp38i3ukzjCkEWT3G
         cVCA==
X-Forwarded-Encrypted: i=1; AJvYcCUVYVN8uB5mmcc+j/oRfkf/nQdhqaPzqNB05432msCFt4/QyHaDvRlUWwcyq0PdLoxSlEZyk0tG5i9YRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIC58GdXD3Uz/jlL40TKTEpOA0e42sIyQ6zmLBWFBuDCLiyIyz
	Rkxe0tlIGNdzR/Py1eSJrznZDKMPh0q+L+xqFNDvl2f7T6y2/9DoaUTPwuMeHw==
X-Gm-Gg: ASbGncsy0sp5NtTmsd7uhwQz5mdG3VzNgYjyqzUtUncKjX2ZASrjpzL8Hp6eCPIKOlk
	mHkgeSeb/BfboZ0GVN6WxSSJT8ayu6O0Hr8choMVooKZLXUbboI63BsxnHWRIkdihGgcPiwYoJw
	v1Jr4bGGvRaIGE+33mWh7oHXoeuzw6ZIdhjXTGqAbHj41vVwtE2IRZ7W5R8FEvacV28MAW21HCH
	05dZo2c1ip5qXzdGFW/JntM9WN1e248LfCOxCnJNgj1AuU8XXHI6MABLXI9eTNpeKV6i7qi7Tm9
	vvJbhG9MmIpNX1D0pteDUEt9tOtz/ot6CAyvp/sRkviK/3r/2WWsigYV3RYROCKrRd/5noG6hXH
	Yf0QyTl7/4yCvxL4X3aOdE0mERYHvghve9ID2zm8T6Gr4MFe40uX9jQS9JrDQdh3urzsWBHYG9H
	RPdXDIw1cMkM1M5OUiRT6GtcwrhFknVyCqSEYS2/5+zYX297AzRAKzb62KH065dNA=
X-Google-Smtp-Source: AGHT+IFXRuimfT/UdDZFh5llKU8oUWgdFrdqwK0w1rug2KZ0kehK7oWIptlRy5oH5t3yBxq5Rz+agw==
X-Received: by 2002:a05:600c:450f:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-4778fe4a05emr34052525e9.16.1763139019587;
        Fri, 14 Nov 2025 08:50:19 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47795272c53sm17396905e9.9.2025.11.14.08.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 08:50:18 -0800 (PST)
Date: Fri, 14 Nov 2025 17:50:16 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] amba: tegra-ahb: fix device leak on smmu enable
Message-ID: <iqorxn35xjmylfxjxhnwi3htfloythelsslxndgbfu2tslkmmf@drbc2dikgbof>
References: <20250925150007.24173-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kotf53gdc3t3vlcz"
Content-Disposition: inline
In-Reply-To: <20250925150007.24173-1-johan@kernel.org>


--kotf53gdc3t3vlcz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] amba: tegra-ahb: fix device leak on smmu enable
MIME-Version: 1.0

On Thu, Sep 25, 2025 at 05:00:07PM +0200, Johan Hovold wrote:
> Make sure to drop the reference taken to the ahb platform device when
> looking up its driver data while enabling the smmu.
>=20
> Note that holding a reference to a device does not prevent its driver
> data from going away.
>=20
> Fixes: 89c788bab1f0 ("ARM: tegra: Add SMMU enabler in AHB")
> Cc: stable@vger.kernel.org	# 3.5
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/amba/tegra-ahb.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--kotf53gdc3t3vlcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXXcgACgkQ3SOs138+
s6HA1BAAm/crkTtB38iCaI+uSS7RPmokKMeH14URefVtM0cwkYL/m5GApAxSF4jl
hUWfEs7eeuyTFmcest4poJEVtSXx7+uxB11VZWAHsErXDizK+GidvPSRUdYH4mFd
/wC36QiwjcLVQwzGouws2rzYdNT5fcAFkNKsrCHweqPPmRKB5T61WhyqJ2R2s5xP
YQJjk928/QEzgHJryKMtRlXPlKrI/HNq1n2oaZL3JJNqeQVwcjCET2ekg8AWsKwN
FXdfsGHO8aJTzXdNW5bebgWbDz08wjNeAq/UMODvOMUxPFDF7S4rcViOlkF7WGhY
8nA0nT/FikYzSrtA2O6QGeE5B+2FWy02Gb/f9nBNyhBhzxtglbwzCyHTM+m5QVJK
32EM5LhxnSe7INOGQ9eAcaExXbh4+VU/31aTm1cItVEIgyYj8Sqt2Y12Vwr29Mli
OrO0NUy6D0prmk5W61Zm3Ry0arkg0bgNJFNXpvRBxFN6AMU2SYEFi/l7MNaUZLKJ
gzsmEL2P9YVxXl1UCwdNSy290SUwf10yNgpeC37gXSLn7UizmjTYijqg3FPLtyqL
+FKB6JZT0+9XIYiqH1VVAoT2wWLRpqq7DFGZTLgsIQhUkB7gLJRAiVhuflbFhWQe
o+MvGZ5wHULthmb4/Vd6KlnOvrM48+qdScRF4OfmFWx1XGC3WR4=
=4Kgv
-----END PGP SIGNATURE-----

--kotf53gdc3t3vlcz--

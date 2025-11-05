Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E40313E14
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349860; cv=none; b=B6yQyfhR8+BKp2GJ4+ZKUc8891rgkX8U9hsw/R5ebbc/frmrg1CzrALZDn+i0n5iViPQPlRMRSzu9fG5X1lQILFHOXJBDjet4zSqHJzRe+0uK5R780T6Vrv/xlEZp8cXEiVUjHxg1Ec3f9wMqNXsrCjXa09io6XyRCkgHdmaYVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349860; c=relaxed/simple;
	bh=7dfbJe450Lh2RXqkUUITEMSQluOo/ousxB6R6ebDm5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BD0F+/rgsjslrcaVkLyyd4rTqDdN8ZCikZQAE5+v8Mw0VJ9aPF85SGPziUGfU/ppG7HoHnT69mM50XVvJ3t4tWf+RnIGSLYmjY6gmM0SzenHK0BcRh8FAvmv6aeRkZVcJPGzLd9umLdNUkYxFDqh5lVAvdZRSJKM6qP1XbkZqeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2/OVbem; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2/OVbem"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4711b95226dso86150695e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 05:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349858; x=1762954658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=meMfOGtlg3RqGUre2thA2pbsV29ZdRKeS73vMYZgshw=;
        b=h2/OVbemE6yoOSQpzhwEt5jkQXlRA+VahZAiCffU5u93sQBMmBWiLZyWA+KtsozJE6
         iU3/teYPYhnik9kIqeru+gGcoH8QmRge/JOLfekjxToK5gyFpnTIxI1m6TxyLTwAjlLu
         Ybnoc4FTTMdHoboAqUBa59BnLXurl/47++CMZUuRm2j/+i0GwD8X3ma01kDNj4nmvEtx
         9NchkKFglksteTQI/JhCfwzzKMCLGeVb7/76Hy/v1aNXhcv0nOuBjQu03s5Y/2rBA1ce
         TtVgr/F2TepXGTLefsfiohoz2O5B/15siZ55QKyDloKVV/A5Hza0B/habdyXCWXKV3LF
         ZpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349858; x=1762954658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meMfOGtlg3RqGUre2thA2pbsV29ZdRKeS73vMYZgshw=;
        b=kGk3soZhhHbOjNiMpkXnLo4K2yCK4vmxNH75xVbq9zl3FnRYkVLlzY9YD/xFF0301n
         LrVf54p60z+Pv+2qBjoJZha5TgyXUfb6xt6DQHzEGJ0BbKSQlYuDi9pW0S5LmRUpod70
         7GD59TV79h18KPDw3yq3kQ9BWaWN60QkeS6M0e3Mknx/2lsynlLRKWm5s3ZGRd/EdYBH
         KtkWt4HcyMM54NohrXjmCCzoSz9wCwN3WcolE+bOO0+Ddv6mu16fvh495+rNnhCQn2Kx
         8855stkkwjNsKqTTAdHUcN519sbnKNUD9uHDR+Ngfldpn0S9Pt3Ts6YHD1mZH4yaADwl
         Yjlg==
X-Forwarded-Encrypted: i=1; AJvYcCUi2Ela8I0Ta4FmBeNK8UTq9eyX2cdyd9+RyGeVLHyCEr8xuTTwUvUhpeIvUxCvWg88+IQyJLU1LD97mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZ5RSV3tZHOOoD9bDrNkzsDmgyF/ne6sGXe5NsJByG+1uyu0S
	FdpEjJacmU0JPfjP8g/JZbbnCYZ81/Zcl5Zf9okBdKFQJTkQ1m9fpXZY
X-Gm-Gg: ASbGncv0HTF9ribBBxdOiRJgIcqjlHp26enEog3K+gZcljnoe6eS8PwJYUTwF6Cr4mq
	cRVcXusxD3kVNEO6mZhOiYksPORVMIex4kDNcm7+ShhX3fIw1s7wVJREAVfPg4CxNMaoIEVDwbb
	2RmaFd5vcgvYnYGRvzfHnKubBZ/fcf3tnqS9XukiFMl21lcr8w3dRTLVD70UXD5XgWtB4xUwrc+
	0VTUIXjYbHAdrDhraBA807sUyT7l1UH9cR4npG7r8NZ5fZ6kzvgKB7rGjozxfeOaXU9wjOBop5Q
	K5puCAfttyN1B4iVIw+03hll0hK9l9JJSBQnD8Nksg3KgS6Ds/v6CvbHtBAJN2Lz0RDYB6QJI39
	fXVuvSNeRlXHao45YAlY5nxeUh7yggcILxQFkFgwbbkjxy8XobGYKd0jQxCW/UdzDzMr9Pf3d1s
	/oOzV+4ov29dD+PD+qP5WO0fYWILHiVeYOWdBSPifOSz3+AOa2dHDFutdnEDoqD3k=
X-Google-Smtp-Source: AGHT+IE23qUEC3bPnkrd6XaYOcV61wad6I2xgT35I52FO8qjaOdi2P07+Ns4nuWyu1lEoEUP3cZyNQ==
X-Received: by 2002:a05:600c:5403:b0:46e:3f75:da49 with SMTP id 5b1f17b1804b1-4775ce4fcc8mr25716655e9.37.1762349857489;
        Wed, 05 Nov 2025 05:37:37 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdee770sm51496845e9.16.2025.11.05.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 05:37:35 -0800 (PST)
Date: Wed, 5 Nov 2025 14:37:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Vedant Deshpande <vedantd@nvidia.com>, Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
	Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep
 nodes
Message-ID: <cvbvbshg4asz4ddrtsotsjc5srouwktirpxbhsjdmlxfzklytd@7sav35bkcmm3>
References: <20251009142253.2563075-2-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbqrtx74fq7nlswr"
Content-Disposition: inline
In-Reply-To: <20251009142253.2563075-2-cassel@kernel.org>


--tbqrtx74fq7nlswr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep
 nodes
MIME-Version: 1.0

On Thu, Oct 09, 2025 at 04:22:54PM +0200, Niklas Cassel wrote:
> When the PCIe controller is running in endpoint mode, the controller
> initialization is triggered by a PERST# (PCIe reset) GPIO deassertion.
>=20
> The driver has configured an IRQ to trigger when the PERST# GPIO changes
> state. Without the pinctrl definition, we do not get an IRQ when PERST#
> is deasserted, so the PCIe controller never gets initialized.
>=20
> Add the missing definitions, so that the controller actually gets
> initialized.
>=20
> Fixes: ec142c44b026 ("arm64: tegra: Add P2U and PCIe controller nodes to =
Tegra234 DT")
> Fixes: 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> Changes since v2:
> -Add pinctrl definitions to all pcie-ep nodes, not just C4 controller.
>=20
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 57 ++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)

Applied thanks. I did add blank lines between the blocks since that's
what I prefer. I hope you don't mind.

Thierry

--tbqrtx74fq7nlswr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkLUxoACgkQ3SOs138+
s6EYLRAAsc49pnk+to7vxy6pYRF4Zvh/tQxeBksFwe+GpnDL44/4X3ki63GnDHqd
DYT8MFP4eBp5uDU8MOMfwGq5GyMwRFgQWgOiybT4PyJNkU5amkV3u8lnl9d4fHFD
r9N0jzQDKND7FqpbMdaa83alnnYj/D7yZ/i/cAbAEo40VTmaB8vCzsXB2WYyXOwr
Ee4hVB0WmstsNvyr1Mtb5tNQ4I8hetm/wLqP0kUVBbjebvJvggHtWdK/ERZ/YRwJ
Py9uU+cO9Vgccun4xvkvXTz5Z3E1V0Y2BBgcMsD3BwJwERpuJPbzdZlKKThZbzW4
L6lfn9exwo+oH8okRh2ORRgILlSwM25ght8Is0u9vGDLN1r9hEttMgyD2EjS5WMu
Q8SwxAwN2k8MrwXkk90GIlJdhq325FKomxAtt6ZzkTOlY8esM7fiAQn08xgVe53u
dUXpDLB3x64ao5JrzvrUwGoz/bUjMCNQMdxkUIN5N5pStkTFuzMVsjrRMfMDbGAJ
z/L6ayVQ1nRHrDwERjkjInllxnu+HJ+gvz2YtzXb0kuaaKmVJ+gji6PakO63edLu
svregK0vypfir3CVCqoxLMBZpj2Z/J+W0SpwqgmUo5/UniY7JvJAW5DfcYawfsqw
/wMG+ep8IOBI3r2myZFVQ4OtrZdObqdtu1kk2EqAeP9xQgQ+sfE=
=DTt9
-----END PGP SIGNATURE-----

--tbqrtx74fq7nlswr--

Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA21DFFB;
	Fri, 28 Jun 2024 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589195; cv=none; b=it3Oyv9giEz0IV98I0394uxj7ADmivPz/tdHbuikS/s4rfEXPsUSXoldFf5YPvkrVsCmWX6uoTrKbdauV7wm5kvwxGcJkG/J/r+wamu/5xhDWUZ+VGIhjl91gDUqB7uiNCSb7Z9Z6THDzz6LFwbGAwytGSk/sM/oIByQSakC/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589195; c=relaxed/simple;
	bh=jRyliQn5syJIKmOVpGv2OoDwRlXfOL0ONKMkE++WKfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNF0U9Hnpb36+Sv+zSHqvUzSKQHq+pPsyoK0QdXhROswYcj3eOVpgI9afMaQpMLKIQrYNY9gXhrueX1fl+Y/NklYv9JdluRlxTd4gO0xdq03lp8fFoWAVZvTELkjdb0adXiMW+/llFLcltykNxPduXG5L0kdrFS9WozRhzOnbNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYVMdyoe; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYVMdyoe"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so8829171fa.3;
        Fri, 28 Jun 2024 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719589192; x=1720193992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gy+8+jdo8zbIhGunFCz0PmLEMh7RQsmgNaAtZeElXZw=;
        b=NYVMdyoeVxbrNhJ28GAO03onDPZn62d+6TOFCshXqJLqPS6kYga+aDldmEYSw9LEUm
         ppZx26Q/g3zPTs75+FUWIrtGX0CxEhjSvbS/zitEH6ZslDT2/XXgwioCm0OyErX/Tofe
         086pLqA0vx4jS472LrMc5ABjzS7FekfYJHgHfdnO3UTkrM7L6/mxskcIkGc/KhmdS72V
         dl0eXOMNIAsFjQmJvU6g+B29PZ45CzRGTeOEAOA0Uhg0w8AeTZilJav70yCLx7k+S6uk
         aPeV4ctlIPq5D9T6VP6y7vu2e97njJ7aIy0TnvK8lF4k5SB6m6AMj39VLI3tUsKCGNBl
         W0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719589192; x=1720193992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy+8+jdo8zbIhGunFCz0PmLEMh7RQsmgNaAtZeElXZw=;
        b=SBQG8238ynv2+gJk2XqTSC3pWU6Pf/63rAUOrwaGa879T5kM9/XRTg7d0zcL4TBdti
         ALl/fFdPYN+lGK3l9fRaGxTLVzy80wMrb8Mf//trd1UV9sCrx6ob9V/1XmdmqyNV1ZSh
         k5eliEz6QCPKxifSY1DY2oHxFrZC5fgyA2hdDK/VsUdeVQKOIjHrXIGJJS+eN8HtW7Ac
         48btc6Vkc/EwPREl2EKbqdHOiInNT532jS5yfO1sM40FppjZXTqB5xBKK8zw5Psw4QH6
         bMF8m48OlHq1R2r30FajpHVJv+FsKWfT3VHS3yEBjBnUukMJNItsW+9PjtZBODW4bfnz
         pLMg==
X-Forwarded-Encrypted: i=1; AJvYcCX00T12msaIxRtPSHHyagXKEMMqFKsmDO2b2666nJO9vUPBevWbbFpZFTmcdWlpuEy7yO89/mVXyFlWyvEdCMJk9K1mB5y0SZ+Qkzp9M6HvA1k/pyQCJqVHFvpRpEOTjI38PAjkKfPA
X-Gm-Message-State: AOJu0YwswqasZk8hX+z7tWKB7b3J2OjVFs9rAF/6lgepi0xQfXAunuf1
	sTxrv3nKdvTxiJ0RN0OuBDw1f5jyQxiuTu+JhSnjRpj5ZaC6USk8WPwgNA==
X-Google-Smtp-Source: AGHT+IHoCYvPIBuCanit9pOzgFbPX7Eb10jpmhfqhVUANx3bFAWwtTM8AeGgtAR47EtQfY4OSTMALQ==
X-Received: by 2002:a2e:9ed5:0:b0:2ec:50fa:1e47 with SMTP id 38308e7fff4ca-2ec5b2a0a1fmr109422991fa.21.1719589191468;
        Fri, 28 Jun 2024 08:39:51 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3912asm42357385e9.10.2024.06.28.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:39:50 -0700 (PDT)
Date: Fri, 28 Jun 2024 17:39:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Vedant Deshpande <vedantd@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tegra: Restructure Orin NX/Nano device tree
Message-ID: <oxd6qyz4vpqxkctdyovlcgtqvc6ngzx4qmuvkt7slcvoqnsmci@m42tcant2a4z>
References: <20240627215316.1456275-1-vedantd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fzczzzaqw3bseirr"
Content-Disposition: inline
In-Reply-To: <20240627215316.1456275-1-vedantd@nvidia.com>


--fzczzzaqw3bseirr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 09:53:16PM GMT, Vedant Deshpande wrote:
> The Orin NX and Orin Nano boards share a common carrier board and the
> module boards for both platforms are very similar. Therefore,
> restructure the Orin NX/Nano device-tree source files to adhere to a
> simple hierarchical format. This will help make clear where changes
> should go, and eliminates redundancy within the files.
>=20
> Previously the carrier board file was independent. However, given
> that it is so tightly coupled with the module design, it will be
> more practical to combine files together for a simpler layout.
>=20
> Following changes are made to restructure the device tree source files:
> 1) Change include hierarchy. Top-level dts includes board dtsi.
>    Board dtsi includes module dtsi. Module dtsi includes SoC dtsi.
> 2) Data from the top level dts file that is common to both Orin NX
>    and Orin Nano is in tegra234-p3768-0000+p3767.dtsi.
> 3) Only data that is unique to NX/Nano is present in the top-level dts.
>=20
> Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
> ---
>=20
> Changes in V2 includes removal of Gerrit Change-ID.
>=20
>  .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 77 +------------------
>  .../nvidia/tegra234-p3768-0000+p3767-0005.dts | 32 +-------
>  ...00.dtsi =3D> tegra234-p3768-0000+p3767.dtsi} | 28 ++++++-
>  3 files changed, 29 insertions(+), 108 deletions(-)
>  rename arch/arm64/boot/dts/nvidia/{tegra234-p3768-0000.dtsi =3D> tegra23=
4-p3768-0000+p3767.dtsi} (90%)

Applied, thanks.

Thierry

--fzczzzaqw3bseirr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+2UUACgkQ3SOs138+
s6FEKQ/+LtwycgLTJ1ZJbc6Vx/tb2MRljY6NXKVL1WvpioK0NoxdikwVzZJu0Njr
oEqiooH6N6/XJXPaRS1KGZDtTOEtgwDGKaRVhQ8TMJVHF6tTxt20AyfOqoOwdyfs
jhLj6WxDcS6q/aVsiAh0Pmy77EhGktdRZLyxHNZ4zGbL8NEXo3detuEg9c6V1zoS
w4qf8KFca6zceFYxBATGgZO1AL5AZNhQBEwcWn0wvf2+RTYqQCNn0anXbLYso4BX
hBTYE8G8PQYDKijKtnujMsRBrKNomXaTGZr3QFs/Hhy9lmefaQn0V69dwp3q3JvC
2Hu41rngYN7QPHXRj5Zeu9717VTmM6Ri0jtLKnzWNf/eR5J1iWxdr36XpuTpoXnC
YuHgmAdpVdy+E9N57yP6OLG3a2jqb1Pd4CPm8t9wXrGFKHh7fFnpdjMF203K5Y5j
PztfacIM3a7R9sKvuSA21KtzPrBVcquWs21bdmd39hjwRvJxOp13fscgquPNPxug
FQpUHywNGcHDTMs7mfjh7Hxa1DeoL4R9WXOx8tvV39Tdp4VRDrluYWv3WhGLxijX
sWb5f79hs7D3EKeLcEyNyg1sIpxUWK0BtTQPfVb/DvTCq2PQ6vGQbVO+HQ03Orn4
5Xgir21R5KRzspb9YeuDQz2FGCJ5//+RaeAvD1IgJBRDkejxhA8=
=8DvT
-----END PGP SIGNATURE-----

--fzczzzaqw3bseirr--

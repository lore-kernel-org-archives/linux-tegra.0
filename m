Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3B2153CB;
	Thu,  8 May 2025 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738478; cv=none; b=cI29xnwU1S9IB2XZMR7NiOReKig/hN98MeBHBgC48WraEyX3A7Lj6kr/ei1QOU2giebY8y4xbGqm9W+CzIcq7CLTYf35CP6BlxnBT0/wp5nakEnv53sHhCrXC5yjMRbmPA05+6uHlFvuTLzmjN4TEp87aLjePQBt8DwNC/xByYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738478; c=relaxed/simple;
	bh=yJtUOKZ7C8szIMygAm1dajXLu+5qD1xXzT4bMyRFj6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPJ1JCqGARBe8o1xIWrA747JHkzXVuUUwLO+iBZaWE9Kue0ijOxUpV/3GGQHBSYg796d2TRpVXbuOUbLrBj9UiaNfWZUamYk9912qF7/XoV9sdXNditIcyMcuXxAVFANiQBXr761sSXtpzF9rWUM0JnqOoEaFScR6ij/Akn1W8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhR6Q1cc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhR6Q1cc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efc4577so864127f8f.0;
        Thu, 08 May 2025 14:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746738475; x=1747343275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYbWPo6uQsEJS6A+xX1ongkxMwfdgXIiawQ/d/CnsdE=;
        b=mhR6Q1cceHKEf48U+352Fgr/p9n1yAMAF8WxP13MlOondc1feZsELEZuOcihOPPpaY
         cx/XxCcVbXoYkIwIqu3G0wav0KKePu1h4+8UCKlS9ufQW9imn3ZTyXBTdddc5gMyx65A
         xOwyvtEEKizEfUptG1IPm8pLlOA3H0oWbizGaX48vWQwYEWu2TzbRRBrspc7R0I/Bj5/
         sZpFzvafAKBcLVm+RZ50SpMWuwtLVzbg9aQBzIbvc0eJn6bnYTmpHz+4yZJqE3LM2FuK
         hMnHP+YNQgGfTAF8zyhe82o3fo66SEESOaSDfNK0fiqQMjZDIPfd7C6+51awMgRA7iou
         1m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738475; x=1747343275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYbWPo6uQsEJS6A+xX1ongkxMwfdgXIiawQ/d/CnsdE=;
        b=fOOilImy8IeMxF2lALB/UoQ0R0twbO1sSSVq6TBqoLkX1KC2RVnvZWLDrzKKwmboTf
         R85xw6qqIYRAMJ6Hgekkgj+1GfTqWNdqNLbSrgP5DbHNpwOs+nA0m+E6v9buQGHX4c82
         4jfC73RGPhBbuaE5i4AGwNuMRnrPUXDGrUHftEt4CJWq70dC9XtiabCt5ztGhkYQcqHg
         lSJTyOPlu1DNZod6qWA7nbZPaMtYnAC7Pe2EvdtOAolsKB8pr8/svTi6lYOLFTTikZds
         gMTEGgpSBTB7Gp5Cu1nmjmhjovT+ZrHIYLEAgixtQ7EbzqOyi8037Pqra+vIf3/2OO78
         LUSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5oiGRmJ3J+1JDTRhPsAylQNtLyE1TvQNZaFFRI/fbhcPnGWuQLMrn/9miGBBEAb6mWiADt4cksUM8i8TX@vger.kernel.org, AJvYcCVvVjNbDdRB6PjIhfG1+fQ8B4qxFpFd59tGp7KuHtrmk+sA+7VM6pHt0eCjC707AXI57u9uMa/4LBw0@vger.kernel.org, AJvYcCXEwpFOh222mjy5IyHKk9j6sisUqfjC5BBdYvmbQlFZysm7lYg6VsOV17qSi9EudARbyI1QRZcOl+kPPuo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv5L8gRUb7ywxAv0zFmtBHWUyAgr5n+WtJKF65IUguVpHsbZdn
	8LGZ7rEma2D66f2dQmM5FXixUfX2Cv39QDzCN04U3dKYpix3m5qZ
X-Gm-Gg: ASbGncsuHJi5kJZXNH16c9DVcoXJlqbu16pfpq/DsZw0rFfxmSsqUit/9a84jXGhZ3+
	LAz8xWtVej7vtiPIWALVRzNNFIN2idtbTs7OldiqMIf8bFWMHc2dyoNPv7uhuPfPtyxaB5gpkkF
	F9WTCFhvka7DywuUfjpWMTAe8RjcOuMXoGhoLZqF6/EXybNok8ZWxYhnekWcAM6a6JHG6nzUc8g
	WxJyC5izF/nfny3DY5LztnbUi86vnfk5NqrMfZnFIqLUSe9Vy3fFDUU9xxfiih7aunlx8eJeO87
	d3AshKRtJqNLs2BZNebGvPPkDu90ezdC3pCF5+roruDsf8gC4E97fIBLXFrWeHRoICu96T8bmq7
	+50B27lXDeyLbwjc0YgX/3ZGM49I=
X-Google-Smtp-Source: AGHT+IGTseWny7Uj8cCMN5LaniY+2+B1Hv99JVeX/gagZKm8UBoqVwgM6xZ+NJjE06yC2prPRr2iKQ==
X-Received: by 2002:a05:6000:186f:b0:3a0:b4fa:a260 with SMTP id ffacd0b85a97d-3a1f642981amr764920f8f.5.1746738475205;
        Thu, 08 May 2025 14:07:55 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf2bsm1016093f8f.80.2025.05.08.14.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:07:54 -0700 (PDT)
Date: Thu, 8 May 2025 23:07:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: p2180: Explicitly enable GPU
Message-ID: <6q4q3xp4pbfgfgfthr52jqdugtanhybibgfvkvvajfahmbey76@zujalrprovv6>
References: <20250420-tx1-gpu-v1-1-d500de18e43e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wje2b2zjtrgil3ss"
Content-Disposition: inline
In-Reply-To: <20250420-tx1-gpu-v1-1-d500de18e43e@gmail.com>


--wje2b2zjtrgil3ss
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: p2180: Explicitly enable GPU
MIME-Version: 1.0

On Sun, Apr 20, 2025 at 05:25:17PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> The gpu node originally was explicitly left disabled as it was expected
> for the bootloader to enable it. However, this is only done in u-boot.
> If u-boot is not in the boot chain, this will never be enabled. Other
> Tegra210 devices already explicitly enable the gpu, so make p2180 match.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

This is risky, because the U-Boot code was explicitly added to avoid an
issue during boot. It's probably okay to do this nowadays because all of
the boot stacks deal with this properly and as evidenced by Jetson Nano,
things still seem to work.

It may mean that users of very old L4T releases may have to update, but
they probably should do so anyway, so let's give this a go.

Thierry

--wje2b2zjtrgil3ss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgdHSgACgkQ3SOs138+
s6HPPA//fIle7wk1jX2l8Ql8Dd0ZR/cND42SZFK0cjmRyr9Rph387YCyi6BDHZwO
epiC8nUIUaLi+trAwq+Yb1Wn4/X4IfnoY83JlkyAEINx/a8p98T3lvb2DIM/igSp
gEpjYlBXlk+IO3vJMA7jdujj5MMCzo40AV1vKKzSUuHPle0rzJ2DUet/UvEhCIWv
jdTz9w7bwU2miKvHPJltIV8Xq7qPhxDRpcF5vbM/Mh9Hqq7raxk6vZIQIUVjQyUh
2FFX2e0O0DSy+d+Fbscyc8vBtcYdxvEAAHOoVtd3eRufREqSD1worvzsDtPYNTSO
vCQA+U0CQeDK5li31ACs7HH8ChtUW7/os4lZ7OZHvjWZh9kXpbPGUDtZCfeQPeZ1
XSaO5lLrEgXBatwQXsUFsPognUmSKm0wUvkeG5+ZC9Xhv4JA9H7bOYKp0foU/cGI
VhVzlarTZsa5o3+c6VzxmzsjBmRptKipjgZmW34f0exewYKSqIx4O8cnbom5Ay4q
K0Dsfm2HYReOm1YOk4VNf0W+Ca8Bt9CE2f0epqkvUr7DM/depw5Pn2f3Mwr+5v7t
C0CZOc0jejYO5m7Q7NHkSGOFbGKvTnokcdzpVCMruKbmHc6xnd29F6fWrH46QNgH
NPhtEciijmUxaR5ivhvpu0DFwqZlruV56nBdmzWEnGj2bS8YQ8I=
=FFed
-----END PGP SIGNATURE-----

--wje2b2zjtrgil3ss--

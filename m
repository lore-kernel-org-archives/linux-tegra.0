Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439E6DDA8;
	Thu,  6 Mar 2025 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741289824; cv=none; b=p1Z2YVMlJrTosQiT92p8O824UrzPvilT0Mn/+1LH5zz4vu2AvrAR/a+RpY2yN+/TbCb6er7ThkXAcLTTdDHjQFMADCOqngQpA7CfLJf4OdUJwnyUlkr32dimHp5ydfXtl6EbVRS81RcYboXOLun/3Cdmaf3yzI6c9OXs6gMcrgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741289824; c=relaxed/simple;
	bh=xmLeLLuOqWlnKZU5Kw1ds19b+o0/qTsEL/Y8MZMz4I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIG6kLPC6El2Db72mhFPQ2eCI+etzpx43xF4Wrrezr7skn2/BzhDyFwDNR02JZozm4VoKnsw7PO8o/o9E4ye5l7zH26+KkGlQ6NNsybFS00a97a2BldmNwubfrWt+H1LUoz1ip+Y3qRtRl/4wDtA+W+oMw/XTRxDbvlI9SKTfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECq0PQLJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECq0PQLJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso8495765e9.3;
        Thu, 06 Mar 2025 11:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741289821; x=1741894621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ8C9Sw9FfdwqXyg0cxtLsY36qiR0FX7daVo+7J2gEQ=;
        b=ECq0PQLJKEV9AXALUIFHaY1HtmAkW0O3rtIEkMw/op7lylx6CCZxDKoklMXo0GqgZW
         UtfuxyBWuCFgpXq8IUi+g9s0sbAOnagCtxYvaQT5lnbECElmKqiTL9cnTwXPrYlVqD7h
         dZIgZE04KUzopxO/0uhD1LEpHtAMc2DncC/qCNVyAFwoJBM5Xq/n41372XBcZSF1V4Me
         RuPh/S/8oz4gJT7MNjQXepYE5HbLTBl3xmrGhvgKeyPvDZYbJTl3BrpTfUiC+xF4zJks
         tj13VHhmrsqRbENA2VB/7o72WJrhv8q3f6FUCkfgVbiwsKsuDQs4+FRR+BZUSUhf/TTX
         /5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741289821; x=1741894621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ8C9Sw9FfdwqXyg0cxtLsY36qiR0FX7daVo+7J2gEQ=;
        b=Lv1g1JdSQg2hAvRU+kvplPWU1G5eZY5XM5UoPRtxb9ajr9v4kUaV1i7aIN4OkdhSFD
         PIlWxms+6aofq56u62p+su01nDtACEH9BWn/LWXmYOqljqZBdpwE40KETOX2ozc1xEhn
         kMaWr9U5SyCNO8NJ8TnOG+LSx1baRR+NBmop6shVpYA7JuL1SslDc7gCQ2DRhrdel+ho
         nWDSnzV7zo/eFn3TAhPHPvxjFqc5X2WG+fXfLeG7ibridTBRSZ+rDron1ijAm5b93hNl
         piUCDxAVqQPC9xdHooZJ9YGhCOsQxtaOxWwdc468IMz60shpCmc1oqDQdrrJBM4WuR5I
         xroQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkdqP6mbC+ebHq84aAYhpzJN4flA4bBAwSPlvQLYj26u9KjbAyDb/8N/YnF/bav3KKJ6czGxeIhoFMCrY=@vger.kernel.org, AJvYcCWXvaOG+O4ebwfk4ANPHV77bR5PrpccnVWkWa/im58r0hMMsYZsGUznG5M+qK1/A0tvQAL7yiQNHyOc@vger.kernel.org
X-Gm-Message-State: AOJu0YwjCoKxyJG+BI29UZ4XDdUZFcL7F8I6zhsv09MpoMMsbH40OEhf
	MOM04pmVdM5XL74gWihI8GWmq9bbfcpmLzF9d1VZjMj6a65+PKT/
X-Gm-Gg: ASbGncsvLSMeAxndFkuL1nfchH14e5sxlMhn9fLgKMxd1LB5dWTAlzE6L6dMcxrHdCK
	S2TNTr+jca9L7S2lu15xGE2BI3KbJgVxWrCBycIPKXx3iMsAyV0LVH0ndYyj/MfLjX1GffiJUCj
	50WlnaVYA1V8h7/h9Uhe0DvWrM7MEprBR3zAGvi/7nL4ZNk+b1VV1LOIMoICitwZyacDhpaj20L
	n34le8QgosCSg7mkvuSph3s+hsHK1DRwZ3kawHmP1zlU5VUfFZAELic+d2c8KRAsulhnEQL8G5s
	m3jCMIKWVdZAd94cpTPIRCLerGdjJZbtj/2ymvFMykns4vw8yIItFyTXpKkQ+QdFnqM9gQaeg6V
	/amFJ30uA5v/dRYLgN1BzzI6c/5D/eF8=
X-Google-Smtp-Source: AGHT+IG+3OsARlshTHM4ztowlY652WnhckEki40shG2eyI1jf3bEC1qAUu3fh7bqZc0AJiSp/fHMig==
X-Received: by 2002:a05:600c:4f87:b0:43b:d025:76a6 with SMTP id 5b1f17b1804b1-43c5a60a0edmr6432495e9.15.1741289821290;
        Thu, 06 Mar 2025 11:37:01 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcbd27996sm47317845e9.2.2025.03.06.11.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:37:00 -0800 (PST)
Date: Thu, 6 Mar 2025 20:36:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Brad Griffis <bgriffis@nvidia.com>, Ivy Huang <yijuh@nvidia.com>
Cc: Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, 
	Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Enable Tegra234 USB remote wakeup
Message-ID: <a2dhaobegdvwf5iymqrkvjprymdkqe6mvn7k4saykgj5zih7px@oshqzwxouteo>
References: <20250206222731.3691073-1-yijuh@nvidia.com>
 <174128447782.2030480.15735320967070322060.b4-ty@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q7xsfwlolsl4ar3y"
Content-Disposition: inline
In-Reply-To: <174128447782.2030480.15735320967070322060.b4-ty@nvidia.com>


--q7xsfwlolsl4ar3y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Enable Tegra234 USB remote wakeup
MIME-Version: 1.0

On Thu, Mar 06, 2025 at 07:08:07PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
>=20
> On Thu, 06 Feb 2025 22:27:31 +0000, Ivy Huang wrote:
> > Populate the USB wake-up interrupts for Tegra234 to enable
> > the USB device to wake the system up from low power modes.
> >=20
> >=20
>=20
> Applied, thanks!
>=20
> [1/1] arm64: tegra: Enable Tegra234 USB remote wakeup
>       commit: e6709a6f78132468d18e56e201d6ed313624b78b

Nevermind, I applied this by mistake. Changes are needed for this, so
I've backed this out again.

Thierry

--q7xsfwlolsl4ar3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ+VoACgkQ3SOs138+
s6HtGw//RE55Z936N+lkOLtUmBZ2GI9FF/PpK5baKu39FpVx0dJEeCtDzn8myNQ4
jMMr5fBlX+qfINYQ461CT4FZMQTNRqbzRce3wHTLuoHTOSdvSBAUi92GzjZCCMJX
nYtduuKpkPe2Y9T8EpRQZn9ZUSwivYGdhBiEBLAo9OBiGR1za1kZg9bA2JXVgC7m
jIJv5xkmttXlc4vm5Sg6vghs+Qhf4mHPHpHo4zJ4xOqh2M71cX6SKDv1pbLbTurx
PJSeFZkNLiTR5nrqcoUBcI9ff5Ct2+PFm7Ca8ECWshsGNO8lnYz7kx6BgPYPc73C
Lalb5/7kDP1935KpvI5LQLRm/yzUESDxsLlEk1G6XdBrNSV2YKE0GsWs20lUxil3
ULo/RjnI/kcU1hz8bOzMoGLFA1sjD0gKYmW3NbpsgWEOcPOj0AA0wKDCGSJ4atxk
z5pAuG6IS5E6S8rHesV37uHd1aOCm8neNPKpYtmBv88PYyMCQf/PGK55FLF/EQfz
toPsFK91nNYw3KvlWJlFAQiJ+tFj1mwj9XAgQn/DBpOzYyJynB3xTqCyDvBZx6hV
ursL/pLFiQWtOt7eRot/NqCVUre3VcsEMDVNvytti1U/5uUK0i20A495D1rCL/fX
O7cfHpO39Q5zmyxXiT+2EFdTg0FzvrOZCR/fkjR5e87p4Lr1U1k=
=jOCs
-----END PGP SIGNATURE-----

--q7xsfwlolsl4ar3y--

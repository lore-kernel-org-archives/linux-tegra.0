Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D8D1B3724;
	Thu, 29 Aug 2024 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946085; cv=none; b=jt3FzNt5Y/4dcLGhv4Ex4T2zdxoVNoz6Yi2o/kdIkAGXAFahsxDiRyXhhLxdla9jSiC+YZXbij/B+a/tLCMHxZAVmAqfRZR4lhhS0VRhyHi40mN5hkXGyhTfko15j38OJY5LtEwGd5oY2H3HORhIRF1YDmQJ7vzwHhSuNQuRDkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946085; c=relaxed/simple;
	bh=Ztfsn4uoBm+OCEsp/kQohVQso0nkA2KGeX0+og4cMU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTftznVjqe8B9iZVoO18p0jN6Wa2QROkEYY3bE1RwdlPjZZU/rN49mkCLiP+OPDBpzoz4gO/JVz3t0U1BLc4SIFTRvmxFeW9WUdNcCr5gEaXMyaIomsrA5zhSiSSIur2Hpoiu3EJfC2wcBUp6xMGxRb16yHMg0CVvyUkxNCmIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7sUjw28; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7sUjw28"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso8509525e9.1;
        Thu, 29 Aug 2024 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724946082; x=1725550882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cUrNKj0rpqVVpKcsIVOFo09A674eF4r9ES8kGcaHcEk=;
        b=b7sUjw28xhyib84S/pJoRbOB4zl42R0m7NwrOY3tv9p6ugctp2uDqR/9FZifnt69Oe
         5RepIiUzki965Qnb1p2UkEuealVqwVYHU/7JNjN057MUJId9Xv/cnmxyITXgHkaFnabP
         CHyLcxwgeE9aIU0ZdAnpS7eM396q0nr8M30DTLgQrcyXpGqV5wyQ4C+numlqmRdXUTkA
         RO8z59dQEDkizYobGkj8vgC7B0r+UEC3s9GBItsCa8IcQub7nl2gn+svp5d1IR849om8
         QALFzHvhQTmSmQPuG/QBm4SUewrb1CbKD1IoojKCb5rwBYCaFFNXaYtyhSH2AY9cUD5F
         zRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946082; x=1725550882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUrNKj0rpqVVpKcsIVOFo09A674eF4r9ES8kGcaHcEk=;
        b=pSfy+WQ0OCenZKfnkfhw4cSGax5011blyIq+hehSzZS5jF5ar73nqgi7nFXUsKFREa
         NrIanHfMRpYZ4MSZv4SS6cbnDwNKCfH1aXtDxYil57xrSQDB2SnRqI5xMiG8fJ7JlZxg
         PrtMzP0T6z3JuCg/xs1wjNbFDSIDU0YYRIvrfXBtwBhPO6SwcVgKrTrICpfvw7K/UTZN
         FzADWYyv3Gf/ThTao4FTYISVy0XlnxcXqZRbRIczCAGXfhPZwtDRnadax9gJvz3+oBId
         jpMEJC7/Dikhdr29o4mZU+FxIuK3cp9wnmqEocei5zYV13Mio9uwl9UtykV94Y3d4F9Q
         dlmA==
X-Forwarded-Encrypted: i=1; AJvYcCUYO261SbrP9pa05B6UnCAbKLJQdFmEPR/P75klzhCdKENzNj7rqStd5IaLUPdzEd8J8wHLKQgbI36E@vger.kernel.org, AJvYcCV0GaIAfJ0recROzY6wsfETURF13oblMvknM1PHSfZnbnGSz919XihVCGm4W2NEyKAgTltuQoSOsGnIrJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyGvWTW/uFJfe1rf8aZ3m2heXLcbOrtusZyXJNtB12KGEKE/Yj
	iC5Xi5uatGG9JYpKQ1vojRt+6sNmqP1Kr5RmggYrepP51UUPhEd9iJeS7RZ4
X-Google-Smtp-Source: AGHT+IEFg1IsOfBFa5ryPCVXwT/DNuq6SQiFxgLN4eCZcU5P6waNIgQPGCzDbqLyIYP0dtV4vf6/QQ==
X-Received: by 2002:a05:600c:1391:b0:426:6f87:65fc with SMTP id 5b1f17b1804b1-42bb01c19c0mr35426415e9.17.1724946081707;
        Thu, 29 Aug 2024 08:41:21 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb43esm20895515e9.7.2024.08.29.08.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:41:21 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:41:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dara Stotland <dstotland@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Tegra234 AGX Orin DTS Updates
Message-ID: <tsaabyu32ekrxtg6b3qwlml5bjffwqjezoosdqy3lgi36hwctz@hnhecvn4v7sg>
References: <20240826164725.775199-1-dstotland@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="btzd5uqnvzjhjll4"
Content-Disposition: inline
In-Reply-To: <20240826164725.775199-1-dstotland@nvidia.com>


--btzd5uqnvzjhjll4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 04:47:18PM GMT, Dara Stotland wrote:
> This patchset restructures the AGX Orin device tree for improved
> adaptability. It also fixes the placement of several nodes to be
> in the proper files.
>=20
> Changes in v2:
> - Added "arm64: tegra: Add common nodes to AGX Orin module"
> - Removed "arm64: tegra: Create SKU8 AGX Orin board file"
>=20
> Dara Stotland (7):
>   arm64: tegra: Add common nodes to AGX Orin module
>   arm64: tegra: Combine AGX Orin board files
>   arm64: tegra: Combine IGX Orin board files
>   arm64: tegra: Move AGX Orin nodes to correct location
>   arm64: tegra: Move padctl supply nodes to AGX Orin module
>   arm64: tegra: Move BPMP nodes to AGX Orin module
>   arm64: tegra: Add thermal nodes to AGX Orin SKU8
>=20
>  .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 135 ----------
>  .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  | 115 ++------
>  .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 125 +++++++++
>  .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 108 +++++++-
>  .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  |  90 -------
>  .../nvidia/tegra234-p3740-0002+p3701-0008.dts | 230 +++++++++++++++-
>  .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 248 ------------------
>  7 files changed, 476 insertions(+), 575 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
>  delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi

Applied, thanks.

Thierry

--btzd5uqnvzjhjll4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQlp8ACgkQ3SOs138+
s6EHKg/+IfuuF7TJhP15l0g7MQLWf0Y/T6KNTssrH/gx/ketTMbQPrTq9D6EaaJc
3kpoqj+4oQBBwdm+frWt0lJZQEmZXBWTl+dC0kHMN1HQ6Txssozd1GrB8w841hUM
N85WTjKNslxsUrjGuEhsHBqfZOIWeiM4bWxexXc4UQYiHNCluoZOaiS6Z+Hl+tk7
y+D1QsSHsIZVTByabg99EPjBVJ+7pevHb9fOwcJqL7cNURD7IcMJZ0vZxnN/DJg9
KO3VkLDvgr6TMkYMGRcoxg7UHMDIL5Z095DSMvMz6AL2Iz1jOxZnUFFThqpOWH2z
4dtHHigya9ZmiXVa8jFiPXR4llk1ltlXZker0FbgPovH9RepvAy0dF7RJJxNS2Qf
xDymfPIFpD4Ak1PKaBtVF76T1W5eJzLe2PLjC0oROg8Tv48ApOo5rUbzsjA0YHY1
Frw7/c25Z2OroHdH77O/aPCXzOv3JYiMQN/I2YpbSlHu5Pxo+r1LALeRA6nDvRFB
InKlSyLCnzdPvHcbEkAjX3f0gSiY8cgDYLpD+n3bKlVkbnJs0n5JBZCNnM+nGOdg
jYECaTXmHSn9MgYWypL1LiyH/SC+mC+l/J1D3y71FaQ83jJMfX5bwSQfKhp7WB92
t6F98PTrxNPk0+9WZXLfa9Q9U/NlLYChf8SZb0M3F8n4X5hFW2g=
=Ws1b
-----END PGP SIGNATURE-----

--btzd5uqnvzjhjll4--

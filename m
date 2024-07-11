Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3529CF0
	for <linux-tegra@vger.kernel.org>; Thu, 11 Jul 2024 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720695429; cv=none; b=NHkyYidTTP+f0S6aNendNLDu+7uF0XkibB8IkdMyuTDzxrFbSOjSF/Fp8hHklyqDf3Jdkn3edoYu2I+CT54zttkhMmdZ6WDVVvwiPVORPNq6/94S3oygnzo5d0ML8Zh4EdR+IwUEgeIYZ7fEwwq3D8oOu5hHjVPcY8SPJaq+qkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720695429; c=relaxed/simple;
	bh=yQHzIiSWTitM6V9sbofVZMI4IiRhu75e5ef/GJ6xGvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iR/LBXY6dUfvTRoqEdK0ntKpreoJqOR7YCq+21bfncXY+gJSsaM8rjwm9EqSKmVj0tSsIAIr3emFxpyQf9sn/uv458++cdq3IWa3WzjTEGPUnK2vCVEzZAnvvCusqMJ0jKUTwUATrwF3Sh/0jTuPmFhrZgwA6xyfiT4Ho4uIz2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7F6nr0y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7F6nr0y"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-367990aaef3so378149f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jul 2024 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720695426; x=1721300226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQHzIiSWTitM6V9sbofVZMI4IiRhu75e5ef/GJ6xGvU=;
        b=C7F6nr0y9e2gkfRwhfmAb9c75lLSs0I/vTckecz+2Lx8M4rqjviL5rK49vYRfqOhEB
         pswc4FbW0L0i/FpqNEqx0VlSIrWt0HaKgTcRYvT9i5dmuRGemAmQhcEnFO2Hir+ZyFDv
         CeOV/TJknOUSIJzkxQj+pGdBeHE9yuCnq8Ovc824EA5Ru/FwZM9mBC1jsZJodD8vHiMq
         x0Hd4r0AvUGOd5wRW9ILqjrCmPda1xy8pJkYaORE2hj299PKsf8dIu2Olyv5pWB+QnTU
         6J6Gi7RnthaCozHlVp3qDIDWvaaFqqmGIJ8CG2exTAKpxjXsXvB6vJu2XD1ctUUV0Ftg
         FGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720695426; x=1721300226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQHzIiSWTitM6V9sbofVZMI4IiRhu75e5ef/GJ6xGvU=;
        b=wUMGroS2C5gVpoNkFq/HnHJrjvF+aWjWKnT21sCAnxqkRYYuS+/9GG/On5YWp8U0c1
         /p4NUnsMjo793YP+iKRxatLQpkRLVFloL/12x8edTtqBcAR5YJZqa+v/YfnjYTsjmCS2
         6HecbAsts83oKlZkZs+mG8TQfBONhHdwE6XlImD1K3yoS5EVmFBCtcUuuEEjUG694o/0
         LTBkQhbuFr0WrmIXI7jHkgtCKkskORJfVgmmBaPmpLiPefAEEMAPOlU+pBbrw69lFgYa
         qZMzkVDo2yOpHQUCDm+t7+G4xChqs4Vq+sF39S0QlmR+kUDJIcV/CXafoYIzipgHK5ER
         iEAg==
X-Forwarded-Encrypted: i=1; AJvYcCVEESMuGEQCKhP0T8PAxbuOqStjOm+On+69VmEN2p0sNLSzMXRwH7iyoPrZiJ2UdviYsmW5wXUj/Y0EOFKscjzfVrTXvQ3Uwpp3P/c=
X-Gm-Message-State: AOJu0YwXwo8gaEVFrgjmyVR/tJGrB+MWLdicPZ+rYuCdwMoPmv+0bNNb
	+Al+g/sAVyWp7J3m4pceYKQ1lYub4Tm/0XuEcC950+lC9WfPJDL9
X-Google-Smtp-Source: AGHT+IF2Ibor+jL4DgtClDb+oJtw4JCDSesmygzczZLE3ZjQ9XeV2LIgdeo3rP3YPLpYvQ4tTWqP7g==
X-Received: by 2002:a05:6000:1865:b0:360:96d8:ab7c with SMTP id ffacd0b85a97d-367cea46d63mr7859906f8f.11.1720695425638;
        Thu, 11 Jul 2024 03:57:05 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06desm7494517f8f.76.2024.07.11.03.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:57:05 -0700 (PDT)
Date: Thu, 11 Jul 2024 12:57:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] soc/tegra: Changes for v6.11-rc1
Message-ID: <gxwkwovnrvmjmksezn3itwipj3pzsszucgx2mybchl3k5o3zfc@y2lmubyuk3gm>
References: <20240628210818.3627404-1-thierry.reding@gmail.com>
 <211ba53e-5cd5-4a38-867c-5eab9356b2ff@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jljr4zgn2ukzifbk"
Content-Disposition: inline
In-Reply-To: <211ba53e-5cd5-4a38-867c-5eab9356b2ff@app.fastmail.com>


--jljr4zgn2ukzifbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 04:01:12PM GMT, Arnd Bergmann wrote:
> On Fri, Jun 28, 2024, at 23:08, Thierry Reding wrote:
>=20
> > ----------------------------------------------------------------
> > soc/tegra: Changes for v6.11-rc1
> >
> > This is a simple change that condenses two function calls into one in
> > two places to save some boilerplate.
> >
>=20
> Hi Thierry,
>=20
> I have merged all four tegra pull requests, but for some reason
> patchwork did not notice this, so there was no automated reply
> and I manually marked them as "Queued" in patchwork now.
>=20
> Maybe double-check that the contents I have are indeed
> what you sent me.

Looks all good.

Thanks,
Thierry

--jljr4zgn2ukzifbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmaPun8ACgkQ3SOs138+
s6FpkQ//ViFuXU/GxH7DFY9R+9u+17XKSppQjY1FhVi7IEtXrcGsUaPdz9wJ5qL+
HYCY+3QSAkX972ViUVegO39sfVT5pulFtSi5fs9o767p44pGVlfgI6mUNW2Kxyyn
8GSHOYLocfuRlSchccqVE+ITlHAsrGUM/2DguzqEzpbk0yxk9/FxXMlh6PxRUZvO
MofANiUSOfOFJ4Qb02iWE6IF/RdfJw+LFQcfwmjPiKFx/Eb+rmseB73MvIlsiMIG
Vk8s0dyBnfPMU6gNNlnYZNuM0ayHkpyKa6qXjWsZiW+4GjtYCN0thOdRg1Rm0ZoY
A/oBG/7kvN2SSI/b3yrvJZnX+WD+LbpWFpO2WcD2FF4IVpQMgCTaRnlkXIBjVsuP
sfzkCQZ2EPqp0h0JegOVBe/YiOsHr8p6SiUjQ/koSUazCaf1ThDxCO4YDWlGNvVf
ZUxAOKsdtLCPduOjCxW9HXFDDxQXRkL5The8EowviR5f7Tys4dHjGP1RtwW1eqZE
3qW/RVL22T3aiWBbdJowtZtizug1ZfxSuvLZbai+TXzjyW6QgBtHbMdEYOBAfRF2
em8ce8DpINbzavR3TcCA88XdVQ+79Fb7P2Nw01sl0JLAqo7ges1/ikNGRL9S8dOh
NmbollSRtLBxGspR3hLoHQInkEYPcwTs3s994gK29cbP6OCRlU8=
=2mdQ
-----END PGP SIGNATURE-----

--jljr4zgn2ukzifbk--

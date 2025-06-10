Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612DE278754;
	Tue, 10 Jun 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546918; cv=none; b=nzWZJbinwZ9WqUBTq4C24BbBMXUQNZW5t+0IxBW9NSYx2gTmNwayfGXp3jf0xUs+ocAmruAPAHLtonmgFdC0oWBW61MYac1wCY8EMPXu4KvijFgdQoPQ2ZvBNsyi7nqShizxIVD77FYDy5tICvrB6WbUP55p//vUKLWbeAHpyOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546918; c=relaxed/simple;
	bh=OMjEdAFdmcV6ZwyVPelJvNH18GruRxDe/BNmKSl3e84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RelJBOpGsoUsYyeOrDWlkh8bJUvJp6zfJVone+9sFO2epAxDpV245+yedbnhMooIwktSRd9rd0eemxupg1LA1j4CKHjC/X6wWXa9xqelT3fkVZINARQiALGKO83sJIn7tcUw72ekartykRFb/Hyg06OhAlWhMhuUqWGJP33vknY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6ZeSvMf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6ZeSvMf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4508287895dso38023685e9.1;
        Tue, 10 Jun 2025 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749546914; x=1750151714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MAzL9OJNNLRO4WKadHozIzXtPHjuC0n6jvYRjDJjK58=;
        b=T6ZeSvMfD3ytLqMsT+axDGAcN3aFEZwxQde0ISoMNGy2vyIDCeYFUtvueQuJ2JOaYt
         o75Sa3GS0S8WhFCqToUBFm17ZW2RHIHSpuRuIvrBScbddbhaDwOZdDFozeJKvxFJF9Ki
         VliYN/xw8nBSCJKcgqa+P1r6xTnkZ9eHF2vBu3j3Lym2GaqYEfsSqwv7d62G7XTZJgdT
         +bVYITQQzyz+MGhx1oApsGviK7cGQ/rnZ5J+WcPusUIpeLKucbuVKDmiDi8DqzieIdLd
         U837lfwqINUis0yLXPbLTHBSEbAf9R2RTzmlRquVqmgVeHycsZb8dGCHktLPaYV7vqzX
         7O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546914; x=1750151714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAzL9OJNNLRO4WKadHozIzXtPHjuC0n6jvYRjDJjK58=;
        b=FwGIB51kLz+N5Qu3d8NXE7fbNc2DNEw7Rx9sg1hWDiskKDhJYq8jGjGnmgdtPGmIjd
         Q4x9Koh1myovZqQOB8GrIrep/qXFg7TZAbyyUNVrljUvqspDB/thebc/kMp9aFgnvZPy
         vRS4PH3Z4PmHCWx47D1gG4xBgXrA44z1tqRAQ98SZiwhK9bUaBDvx8oGbJ8aMt4nYiVP
         DgS4VuwoyyDXsed8zhcK8H5jCk2u6KwqrCishCDdv7JBFGWlcG/gAcM3NW+vI+8gP/H+
         u2+k+MyFSX5d+Uzx8Ow/tzNkZLfichjBjjOvkFHtMSYKJeWsMzANjKczj7SKyC8LirOW
         SNZw==
X-Forwarded-Encrypted: i=1; AJvYcCVBrl6xOigaJDeDEk5sGMvth69tupIxvfSeKoHPTprLzWdA9Dd+wnQjr7Cx1xsRuFBqt5syR7WJVceCMa4=@vger.kernel.org, AJvYcCWstaDqs/YdaUqUS/IARmb0QPE4orjXCxoPooQbkZkdI1OHM28lpkWuoEh1nQrGsH7tFm5m0+LZukLiBtOw@vger.kernel.org, AJvYcCX5ogq1+O3JSwZB4gXsAA7dNo1wer6huQUhNTiRC4333+narl8f/ibYvSgm3HhtNfIRr7jrkVu4bVg2@vger.kernel.org
X-Gm-Message-State: AOJu0YzF3MX+mBHlTvGdr8rKeF5fn9SdYJiR3LTbnQiKOl4AFqwADBml
	SBivpNJDQRfjUdThMVNG4D+XhIiV3usgLf5FvaHAmKXzbB7KwtvgOFKH
X-Gm-Gg: ASbGnctqSd38vjnAXDLdP/AP8U/j5llCljNkCVtcSquSeWDeMNfy693BdhEhL+EOONY
	itOKduqa6w0CnxSv3583QgtAkjFUcTqRNqsxQl8rlK7s4B9XMWcsbwE27W0BdxoiwnnfF88Cabj
	p8md1nwwms1UjshOqHJinrB2ZfNx5SsK7jaY4dVBs5Mt//Y2g9yDDJT81+JOU8ONYXW4q462w/y
	v7kQ4DBdfkBSOBg08954Ze+QVmO5rEaKGrygF/+ZD3wey3ucRzEvwGenhambee0bsUYfAIfqLja
	aTVWW73+oLA4a6Dl7RrMfA/7lfkooon9LHvAq0lRkbF74k4ih6n60MovV0qmRZXmkO6hBjCH2gs
	GKbhGR+9trrLRiXLP0Ty7nO1pD+uTltFOUFVvauxoM1M81W1W
X-Google-Smtp-Source: AGHT+IGM2+afJT+5RliiXm/UFRz6U4gnEGVbbtSS/DN7WoURs9vyYezUQ2aVrpksBzox70qfANRxog==
X-Received: by 2002:a05:600c:5303:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4531cffa4bemr26081645e9.13.1749546913541;
        Tue, 10 Jun 2025 02:15:13 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324638e9sm11573567f8f.89.2025.06.10.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:15:12 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:15:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
Message-ID: <tx7zodgijgip7jhaxookffpa6g6wdnbbl75mz46aff5ch524iv@ky3ltt35amon>
References: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
 <CALHNRZ_Zo6w2KgRTEPcJuZi93bOqQD4Spzr4+YfqnxJZVnUPsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zlxe6zmtcamlsoiq"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_Zo6w2KgRTEPcJuZi93bOqQD4Spzr4+YfqnxJZVnUPsw@mail.gmail.com>


--zlxe6zmtcamlsoiq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
MIME-Version: 1.0

On Sun, Jun 08, 2025 at 11:25:53PM -0500, Aaron Kling wrote:
> On Sun, Jun 8, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Aaron Kling (2):
> >       dt-bindings: arm: tegra: Document Jetson Nano Devkits
> >       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
> >
> >  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 +++
> >  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
> >  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 43 ++++++++++++++=
++++++++
> >  3 files changed, 50 insertions(+)
> > ---
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > change-id: 20250513-p3452-059708ca9993
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
>=20
> This is sent as an RFC, because it doesn't fully work. In my tests,
> this boots and everything I can see works, except for hdmi. The
> hotplug detect pin never changes, regardless of hdmi plug state. This
> works as expected on the downstream 4.9 kernel. Based on the
> downstream kernel dt for p3541, it's almost identical to p3540, and
> I've mirrored those differences in this series. Things like the hpd
> pin are the same. I'm failing to see why hpd would work on p3450, but
> not on p3541, when using the same boot stack. Does anyone know why
> this doesn't work?

My recollection is that the HPD pin essentially loops back the +5V pin,
so that would be my prime suspect. Other than that I suppose it could be
a pinmux issue where HPD is muxed as something else.

Thierry

--zlxe6zmtcamlsoiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH954ACgkQ3SOs138+
s6G9exAAi6ISleCAMzkbsYYuFcCui+KRvTLHXLfAvJw/MXABJhQgTYH9sxavgRiu
cniBxxOLvTcXINg8BdTbTM4dgPcHBIqfo0A5SiQelsET5PXRMvfNjzN0FzwwfjaF
Ht3kzFmkPRCLqkW75+UFKYHLJdtujAe334hkIg5wk8Wvse1FDR2bmPxkRa2ljP6+
d81kkl+IkMajJXdzjFUoYAl8c7uHTWDL061F/XlOA4IYrSUErZFZb5CI72AilvD5
z29FZllWusetqE8Q4muzRnCZ7OMGPZ+MlhYejSCBS0CQjjFAx8z5cV1/b2crw4yk
lio3ZqkuhPZUo5peLR7vn7TPLV1uUPeM8o5/LYsfsSYvkHQKJdCl+BAf4kY45pNs
QSjr0vq37oEYSQxO3UB0I08bWJBbnVC0TKG7v7olOYiB66J7/b3gbQhWAvargIIT
O2LzG4xPMihWahgdUjKWEuP3SvEnYdGzX6D2Te3xD8B856dKedMXGDkSDXVvR2FA
Cb7LtuwdjQXT7DMDiA8icRBdKb6AB0OfMhM4cv1FtEr6BAXeUFKSyL1GlYCzhie3
rnuwci3GaSlGbg8Ea3KPBoyw40wnINqGbb6dGYQbFO6zsD++GqvjDeiTAaKLIm5T
RupESDMo7ugVeHJnnOtvtDSzi//04oVXTtW/K5vfc48qJml0tkQ=
=7Edi
-----END PGP SIGNATURE-----

--zlxe6zmtcamlsoiq--

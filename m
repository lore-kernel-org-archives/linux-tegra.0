Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A39288DF;
	Thu,  4 Jan 2024 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJa1rc52"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a26f73732c5so81635366b.3;
        Thu, 04 Jan 2024 09:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704388046; x=1704992846; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2SyW1ljH/rssFJkg/rVAYtLLFKTjt1n/COVQ2+M3E0=;
        b=SJa1rc52y2hhEXj/lwP+FE0Ylwdz8USemF1VDUH5Zq81QHDCTtpBwWu7umn/s0oMI5
         QW7/e9uRduAi/Hl5TNyixB2Z57W6mLjxJEMfEKxPGkb/+KScjj/Rmeyd5OHNfmbouWsq
         IQEeD7v2TuuXFOH9kAMBG6E/ddJoH1YLyk3l2V1QtcbgnYZcy4SngC/1q7H6tQ9+omLY
         4dtfW/gEvyrUboLLpQVVs12Si3qv9JZy1gQFnLkt/YLBYyMtSHGunrYf3iT2SKSFY0SA
         99oE3VCxs2thDrEapYLvVUZ0lTorP+8VWdILFHc8ZXbngyQLi10sPpYnSy2p1YbYxZ3O
         LNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704388046; x=1704992846;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2SyW1ljH/rssFJkg/rVAYtLLFKTjt1n/COVQ2+M3E0=;
        b=cprgk0+DEycupAiGtYYa22k6GBkjeuo2nWDA8F/AdR6NLs24mm/M4wGGMIb4rVeRxW
         /e+Y55dAejE6z+oGWf4rAO84KBox/UvVzzeYAchGgRas/zHLg96CrH+NEAEIUJ0vyEgh
         NeL/Bzn0cdMaBnY0hpBhlHGKFGA3bK8ijLnKFagzcGfyaS+xJks2Z/PQqZqDPvSOxWiT
         1eMRJ8Mw5pbIFahbLL3QgTZsPz1nlZRUFpwjDlEN+BbLJNBwRV6HY9/w+Sd/62bxfhHj
         IWI+cSmx/stlijY0h6wLyYDz16qeztUMzdPjkFtdF5iSLG262EcPrfStKClC3oleDkm3
         qM5w==
X-Gm-Message-State: AOJu0YxSVneLvMK8gLbLV5fW6Lpfj+LXQQp5mXvcqT+D1GPUG9xR9k6w
	nqo1QGKSYWDUEr7melvcf0Q=
X-Google-Smtp-Source: AGHT+IHGK9oYxAcGfl4yhjtI1jKqFpMVSateD+U2nEbIL02mypEg4sGmPDtlRR4zlNdUpqqj62pusw==
X-Received: by 2002:a17:906:e08:b0:a28:abc4:344d with SMTP id l8-20020a1709060e0800b00a28abc4344dmr400956eji.151.1704388045814;
        Thu, 04 Jan 2024 09:07:25 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b00a2714f1ba8asm8684722eja.160.2024.01.04.09.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 09:07:24 -0800 (PST)
Date: Thu, 4 Jan 2024 18:07:22 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	robh+dt@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
Message-ID: <ZZblyhfzQjzyoUc_@orome.fritz.box>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+KuTAd7PWpR8QEqv"
Content-Disposition: inline
In-Reply-To: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
User-Agent: Mutt/2.2.12 (2023-09-09)


--+KuTAd7PWpR8QEqv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2023 at 09:58:02PM +0530, Sameer Pujar wrote:
> Hi Morimoto-san,
>=20
> This question is regarding audio-graph-card.c driver related DT binding.
>=20
> I am looking to enable following DAI link connection in device tree for
> Tegra audio:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /-----> codec1 endpoint
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /
> CPU endpoint \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \-----> codec2 endpoint
>=20
>=20
> I see that, "remote-endpoint" property can only specify single phandle
> object for connection to a remote endpoint. In other words, the link can =
be
> one-to-one. For illustration, please see below example. However I see it
> leads to a build error if phandle-array is provided for "remote-endpoint"
> property.
>=20
> =C2=A0cpu_port {
> =C2=A0=C2=A0=C2=A0=C2=A0 cpu_ep: endpoint {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&co=
dec1_ep>, <&codec2_ep>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0};
>=20
> =C2=A0codec1 {
> =C2=A0=C2=A0=C2=A0=C2=A0 codec1_ep: endpoint {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&cp=
u_ep>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0};
>=20
> =C2=A0codec2 {
> =C2=A0=C2=A0=C2=A0=C2=A0 codec2_ep: endpoint {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&cp=
u_ep>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0};
>=20
> Is there a possibility to re-use the same CPU endpoint for connecting to
> multiple codec endpoints like shown in above example?

Can you describe the use-case? Is there a need to switch between codec1
and codec2 endpoints or do they receive the same data in parallel all
the time?

Could this perhaps be described by adding multiple CPU ports with one
endpoint each?

Thierry

--+KuTAd7PWpR8QEqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmWW5cgACgkQ3SOs138+
s6Hxog/+PQIdWB1f2Qc4wGtlaMYlXNfqoUR9wIQVXTDWszmtCbaGfCqsky+ybAyh
KTO9caYbfyg7bDLZ2At4OsORuHOsW9jlwTdgSr7UT5d2l5tVrgR2Q+fmIvYiNLGw
QED9fINtd4upTXiWjetmASmUSdv5wEtchRF5KwnGTlck1fd9BnSNqeyXKjab2gPN
Yexcn/NK0o+fLxHj7KIcYYLEoygZZHbalWjbeSE78JioqDseotKmk05ivBz/WpTQ
n3LOG4YpgY3XZxYoizdXODvyfr75ev5HzFGQ7xFDwTjycVJYfAGyqAuHhuIChGR2
/em3aqtxpasYGYXjZiGv18HqCyH8JSpAWC/3Yh61D88ikmwElT6+d+8hnLwocPeE
WMchN+IFsjodcPcS/y+cO+bekuFcTMY9+WnO1q77rAxhg+PyzG2eKgYBC8KG0TQk
SHG55K5lDgLzkbYNB984D8lZyPLsdCX0JQhAXgem8FAq901C6rYsN/xftZiq+1r5
XeChVV3LGuZVJV4uM0CH4XN8F6DQelfT5qzx1bVsLI6uq50v7JQPXMQ+yMqlqhHe
hSnzYv0rNSmsaIyEHz5EQUBc1Uf8PT4G7CwFMmYtPRe/+Q8DD3WCzut1viwV6KMo
PRfFQeONhFEKcjoiFLV70S5NdhJQESUqhF7bcbtzMqot6pHKav8=
=+yDn
-----END PGP SIGNATURE-----

--+KuTAd7PWpR8QEqv--

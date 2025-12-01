Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC1290DBB
	for <linux-tegra@vger.kernel.org>; Mon,  1 Dec 2025 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764598736; cv=none; b=eLr/dta5zhy6ymtGH2ii2udGp69UieV9SXA42+UPLomulgWvERfvsdGe1CRTe8vAaozxb1OvhTAS6ceWSH+nstjXRL3tIK0YrqrdURdpddWUtxW2iS+uJhORYzUp62EKfAUuMIwTuGAdbWVtiVZRpgfR0VIEsabnHbpU+9qgyhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764598736; c=relaxed/simple;
	bh=53LkXaYFrn3GVJ1cIaB3BFaBBqn6BqjYqqHvmEyC6b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpiJeKSMgW8gAaTCquaKxqp7UJth5qGfImO7Ndby1UDJ1TjR1p7SFnEYXUT1T+9IHKhGwNzbd9cAiH5oQXEL5cVU6qc4BVAPO93ttViK/bYGPEkVdD2lGgcr0Dt0XSLgJOQPnG2ZN5jWY/pXZDXWjjiIkdrootoU/q6Ij4qTYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lfhlw4OD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lfhlw4OD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso38065355e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 01 Dec 2025 06:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764598732; x=1765203532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zrU/m1NsQKsXrrOPLuPzfw00NgfNm1183Aja3qoirBc=;
        b=Lfhlw4ODPByC4VhVMdASHQgH5s6JHY0SqbFAues7tvOzCm/T2iq8JVOeiHUbrgtA1D
         flVHHpZ8ENDR1gxKYRXdSh/rUpgEfbsC1rRtegOy+6amgR9WhMojA/uKMb/r7Lpun1RD
         rJL1ZfGxGcnDCPdqVNc4kTxjcagVnPGWfTbRQOVwnwUaCQKLaZ2jlvxxNpTJfhndxx89
         UU1dQefxusE/lo1KCFheOT8b9ElBJCV7hUCMlGJNQ7jySA7bUYB4+gX6HS+0audNe8/f
         lHvrL8gpbOK3piY4EWsVmga/RoSS3CrrEvQZLmxC06B5hFrOALvT9T4FSvItWbBE3D1h
         9gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764598732; x=1765203532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrU/m1NsQKsXrrOPLuPzfw00NgfNm1183Aja3qoirBc=;
        b=G3yE3JEcn10B4om95mjZecMy/Ep74Qt2Z8ihuFE3CgNPv6p5Vk4DgEKWrrM4Jm/bPV
         H/ohJnljiZNO1bCPxbEsljXLBOxICvTBOY/FXMDLQUtQE4VtqME0s9vBkJeAQAb3Kw2i
         g32NNX8YIiUiJVKeIgYszUwmi5OYGKTg5JeuMOQTK31q6sqAsHIQYAbdAcbv3Zj66wBb
         xXarhDkG4Utqpo84Vd1skpeEeZ/MET98E9gJvx2ft3QOz5nm5ji893RV2KWTOsCE68G6
         9m9Cu3K4Rn2C+cGc12+tRIV2YjH8VjiNcTatFQQJm6FjYsiaUwvslrkZL7mFkwg2G499
         xEjA==
X-Forwarded-Encrypted: i=1; AJvYcCWoDtI4DluZj7RxJj2syqM1l4XzmoXnGnGMEiqdygAaxd+KUsH4ZBPztNRmuH4b4lwYqy63SqQ42FfH3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0d5c1ovftRres6GZ1vcEQApJmkQq8c2MoTxlr+IdA5JSt85w
	ceMLqrHVGZNFPWovnnOr8oKI1yK7IvcZJ5kafL7op/MwFfTaQWgoukGb
X-Gm-Gg: ASbGnct7T0ODEqjQChcpoDmwlKwIqSejMU1c4jhSfSizgN/Sfv/7yzuXa49Hw5CllIa
	CD48+S1QxGLV8HJ9+zr2J4Q3xhxrpLcxZcV9L83Qg/9FuiYh74tlhMFBf67uR5VB+CtjAFAnPru
	UTpY7WVIqRfVX6sLrhSqgV0rI744i9EhuqKhT+khJ1uHi7FUJrygZ44eKclMjT0FpVFaWmaf6b4
	i4jRHZ2lEniHeNSWa9/8vGyFc8YWTasu8fwx5D2mhMtlXxhBuNNl1D08iP1nKjg924h7SbqUhUo
	OnGPmehJZJFnthtOu6rPIXjhLtTTa5a9+dqT5+SuvELYBUnD8h8Mw25HkKeyND786CH9H0mnw7Z
	Z6yo8dYY7qmhc1/5nCWAlpx/OuvbDD772Tju9gDj2hgiGZyFkKZzwV0Drf/YkpfXDhDHsop4F6Q
	uCtuunBKUqej9V0SzLIm4JNtcHI7HpV7F/sQugb6v6j18wkahs+6SY9ltGoQ9D76PsblBgc7zT3
	A==
X-Google-Smtp-Source: AGHT+IEWJAy9TFAQ+VOIZ162KEF2lzriCvlTOGHOqCcNNfqx4TM96iV2z0z1mnsWDrSD2qljqTJPoQ==
X-Received: by 2002:a05:600c:46c3:b0:477:6d96:b3ca with SMTP id 5b1f17b1804b1-477c01743e2mr375540815e9.5.1764598732075;
        Mon, 01 Dec 2025 06:18:52 -0800 (PST)
Received: from orome (p200300e41f07e000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f07:e000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm303266005e9.8.2025.12.01.06.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:18:50 -0800 (PST)
Date: Mon, 1 Dec 2025 15:18:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 03/11] dt-bindings: memory: Document Tegra114 Memory
 Controller
Message-ID: <v6adntm5a3wxxxsmufd54t6pgmoj4njp63q362orkbeew6t3ef@7pfiz6ou7w77>
References: <20250915080157.28195-1-clamor95@gmail.com>
 <20250915080157.28195-4-clamor95@gmail.com>
 <20250922160040.GA92842-robh@kernel.org>
 <CAPVz0n3cmFC1PdFnLJ0Vf60i3c6pDO9Lvi8dmAHzBgwgsrPXnA@mail.gmail.com>
 <20250924152430.GA1735105-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmjgfgew7ig24nkq"
Content-Disposition: inline
In-Reply-To: <20250924152430.GA1735105-robh@kernel.org>


--cmjgfgew7ig24nkq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 03/11] dt-bindings: memory: Document Tegra114 Memory
 Controller
MIME-Version: 1.0

On Wed, Sep 24, 2025 at 10:24:30AM -0500, Rob Herring wrote:
> On Mon, Sep 22, 2025 at 07:18:00PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:00 =
Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon, Sep 15, 2025 at 11:01:49AM +0300, Svyatoslav Ryhel wrote:
> > > > Add Tegra114 support into existing Tegra124 MC schema with the most
> > > > notable difference in the amount of EMEM timings.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../nvidia,tegra124-mc.yaml                   | 97 ++++++++++++++-=
----
> > > >  1 file changed, 74 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/memory-controllers/n=
vidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controlle=
rs/nvidia,tegra124-mc.yaml
> > > > index 7b18b4d11e0a..9cc9360d3bd0 100644
> > > > --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,t=
egra124-mc.yaml
> > > > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,t=
egra124-mc.yaml
> > > > @@ -19,7 +19,9 @@ description: |
> > > >
> > > >  properties:
> > > >    compatible:
> > > > -    const: nvidia,tegra124-mc
> > > > +    enum:
> > > > +      - nvidia,tegra114-mc
> > > > +      - nvidia,tegra124-mc
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -64,29 +66,10 @@ patternProperties:
> > > >
> > > >            nvidia,emem-configuration:
> > > >              $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > -            description: |
> > > > +            description:
> > > >                Values to be written to the EMEM register block. See=
 section
> > > > -              "15.6.1 MC Registers" in the TRM.
> > > > -            items:
> > > > -              - description: MC_EMEM_ARB_CFG
> > > > -              - description: MC_EMEM_ARB_OUTSTANDING_REQ
> > > > -              - description: MC_EMEM_ARB_TIMING_RCD
> > > > -              - description: MC_EMEM_ARB_TIMING_RP
> > > > -              - description: MC_EMEM_ARB_TIMING_RC
> > > > -              - description: MC_EMEM_ARB_TIMING_RAS
> > > > -              - description: MC_EMEM_ARB_TIMING_FAW
> > > > -              - description: MC_EMEM_ARB_TIMING_RRD
> > > > -              - description: MC_EMEM_ARB_TIMING_RAP2PRE
> > > > -              - description: MC_EMEM_ARB_TIMING_WAP2PRE
> > > > -              - description: MC_EMEM_ARB_TIMING_R2R
> > > > -              - description: MC_EMEM_ARB_TIMING_W2W
> > > > -              - description: MC_EMEM_ARB_TIMING_R2W
> > > > -              - description: MC_EMEM_ARB_TIMING_W2R
> > > > -              - description: MC_EMEM_ARB_DA_TURNS
> > > > -              - description: MC_EMEM_ARB_DA_COVERS
> > > > -              - description: MC_EMEM_ARB_MISC0
> > > > -              - description: MC_EMEM_ARB_MISC1
> > > > -              - description: MC_EMEM_ARB_RING1_THROTTLE
> > > > +              "20.11.1 MC Registers" in the Tegea114 TRM or
> > > > +              "15.6.1 MC Registers" in the Tegra124 TRM.
> > > >
> > > >          required:
> > > >            - clock-frequency
> > > > @@ -109,6 +92,74 @@ required:
> > > >    - "#iommu-cells"
> > > >    - "#interconnect-cells"
> > > >
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - nvidia,tegra114-mc
> > > > +    then:
> > > > +      patternProperties:
> > > > +        "^emc-timings-[0-9]+$":
> > > > +          patternProperties:
> > > > +            "^timing-[0-9]+$":
> > > > +              properties:
> > > > +                nvidia,emem-configuration:
> > > > +                  items:
> > > > +                    - description: MC_EMEM_ARB_CFG
> > > > +                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
> > > > +                    - description: MC_EMEM_ARB_TIMING_RCD
> > > > +                    - description: MC_EMEM_ARB_TIMING_RP
> > > > +                    - description: MC_EMEM_ARB_TIMING_RC
> > > > +                    - description: MC_EMEM_ARB_TIMING_RAS
> > > > +                    - description: MC_EMEM_ARB_TIMING_FAW
> > > > +                    - description: MC_EMEM_ARB_TIMING_RRD
> > > > +                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
> > > > +                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
> > > > +                    - description: MC_EMEM_ARB_TIMING_R2R
> > > > +                    - description: MC_EMEM_ARB_TIMING_W2W
> > > > +                    - description: MC_EMEM_ARB_TIMING_R2W
> > > > +                    - description: MC_EMEM_ARB_TIMING_W2R
> > > > +                    - description: MC_EMEM_ARB_DA_TURNS
> > > > +                    - description: MC_EMEM_ARB_DA_COVERS
> > > > +                    - description: MC_EMEM_ARB_MISC0
> > > > +                    - description: MC_EMEM_ARB_RING1_THROTTLE
> > >
> > > Like I said before, I don't think it is worth enumerating the list of
> > > registers for every variant. If you want to define the length
> > > (minItems/maxItems), then that is fine.
> > >
> >=20
> > It worth because position of value matters when reading and list above
> > provides a reference to the order in which register values should be
> > grouped.
>=20
> The schema does nothing to validate that. The only thing that gets=20
> validated is the length. It is just an opaque blob of data. I'm sure you=
=20
> have to define the order in the driver as well. One place is enough.

Hi Rob,

Sorry for being so late on this, but I just noticed that v4 had dropped
these items descriptions and then saw that you had suggested this. I
have always found the explicit mention useful because it allows DT
writers to know what to put into the properties without having to look
up a specific implementation.

If the DT bindings don't specify the order, then how do we guarantee
that all implementations agree on the order? While it's true that no
validation is done via the schema, the schema is the only specification
that we have for this. Without it there is no reason for an
implementation to pick one order over another.

Thierry

--cmjgfgew7ig24nkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkto8gACgkQ3SOs138+
s6HFVA//bOnUI5x0pMH+aZ0FS0k/qH/djSWzAvFTrK5cY0onr6xpH6+WvrUb8B4f
6uuehVHmVOVcMfPWrhJ24ydQsI3RJouP2ZgfRdW80gN6tRr3Sg7aLaM400HPTfiy
ueUNUSjMUQqRFKbR7YbuMk/F/t/yvgoNBDebzvHwzJV2mfpTXYWJpyUS4SY0hZOj
7Hav1nmXGi6hX6mU4OCwf6sChzMgATCGy6W6WQ1ka0R8tjyb6XG7zMkpWKFJxPvK
xAT+Sdzui7OCknvXtXknsGdhug4lpKN0A5eLqKtnzI5BQG7FFYsAuKubzVMLaprX
1iu3jNH59ZarofA8Rypgm2sUyFbl/yEJAmQlAt1EkZBXnXba/eV8SdmMZrwy6MzR
9TkEEmQMrYqZ/SFbR34KYmtQfGjx+POAbRVOzvLZxpNUKG4MTFkPTtoiX59gH4ta
p69j0xbLjYigBzDy4sJGtHVEjDyeB9x+3iJ0o9HeCwQqJ/BzaVTj/GD8BTsyzenu
A1d8osMl3Clhqa9MsFHe8nAHycCJDZ5XOvwIixcxkd1/jNOkzl5ZSP7a9rtGQjAg
0/UzrthuSEdMCWWpJImOw8LBrvBnEz0Fte+Gqz6cSblYEx8INoZlUwVoBPwt8ZWc
qfloinXffZgtWSXTOkd1OCRTBByFtK0K58IqeI4EI67oJ6BMzDU=
=0r9F
-----END PGP SIGNATURE-----

--cmjgfgew7ig24nkq--

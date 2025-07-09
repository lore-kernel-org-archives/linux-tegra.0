Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D5202F8F;
	Wed,  9 Jul 2025 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752093373; cv=none; b=F2fz4jjAJeAbgzA9Zd1oPgNCGJFCtFInyUl85AQpw7+mia8XXIFAEWP5JI8bEQgBiUdLPSv5DfJ2uMaQ0FL0j8YXkU+p4sq5yxmuvIhUzzl2CE75vM1saREiWSVqe5gjd84K7ARBWP96e5HlZ2ACMvG73W/LKO53dBookw+fMGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752093373; c=relaxed/simple;
	bh=c3UHhht/yT3ib42s9jPJQnqbR+fX5nr9MFjTgeyWB/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K48RdI2Zq4k4Sev4GbcpQQDZjVoZEoW9Idi3HQfWCUW6iVDxq8oLDE6368yNgFQztjT+atUoc+y7U00PHGTM75ouzkvywT4T7eOQsw8Q3qAnmcWr86rbkHL9/uWGYKrm0OkOPhJ5TQWnAYwnh+M4dMg+uRr2ztfMRCyTfYSYQig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZJEsxNH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZJEsxNH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so303767f8f.1;
        Wed, 09 Jul 2025 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752093370; x=1752698170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y29/ym4L0MZltpXAdKD3JoqA5ATljycl2PRXSWr1woE=;
        b=CZJEsxNHvHlzbUhu+CGm9R3TzKXo553ZSf5JLTIrC4cqTfXrPgTmgYRs5K15kK0jpI
         89JzY+4CFpHXAmLxRKOkuMeaATGkTraOSoRZC9QNtWKmoE6vcgxs2P4X8o6v80TDJXMT
         7pyfYjykCaAbJKOL7GMxbKfvB5AZIPqWdw/TL2gnhfIY7pAxTxZ8pvwyN7BaoPM3rBLK
         Z23ZOSxBN10LCwHDiGYBDamTrSGruOaQVQDC4K5zc292fDJUyBL3dCXfHuHEVAqdGa54
         mK8UFLIv4pmHoXnrOr9xUulKuyymkeyY8ChhWwetVKzjYi6aRV5twoYXBA0iSrX7MJ3A
         Ty3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752093370; x=1752698170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y29/ym4L0MZltpXAdKD3JoqA5ATljycl2PRXSWr1woE=;
        b=CVn0ThCVBNjjsQ0k1t1Fn307xX8FFfE6J2wWu3CF4pZy4hFf64yMX+5WUxqG7vvW4n
         SEzHM5klCSVjWZjtOiFalbiVfdfvxFYBq2LYrW8zphlKZKKVaxNFl+eZIgWEXm7Iu5NN
         w6uh9b229bTJ1MIwwk0Js3+iy9y2E7anIeSmpddKWhogA5pfMo5u93hFsWZZc8gLJRLV
         sm/seC9nW9RQRJuMHFQmJajNuQSyk+iOKTfOqa2/7S2jLv37hunBDBVcbSRhZVkJa805
         nxjdyoN/TVKu1bTpfacG81GD7lXdlYb46Gl4N51FW+ZJmccv6S+HIgRzHdZHn3ZSZk5f
         t4iw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWi1CPkc9rvtw03O5zl26lW5p5IhqW89h9DKC10STAdXdz8sAMgrkTODHF/fF5+auDL8GCJMiMdWV@vger.kernel.org, AJvYcCVfQzRQ0kPHmAcIP5cLAsFXuNd6MW5kJuMA/9PzEjf3cnkkk72Emnx9yhcEjReOORFMCCdecko+uav5z6w=@vger.kernel.org, AJvYcCXCX0PrEQmReTwnHqvRJDtiV/WWRSFo3kizqwuSOSm41PzL2W01/pgt0kbUrYj2W8UFEPZoxZwvyheeNzuP@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ56TGWjvwvpCnujMwrHJJrU5fUvwqD+ue9IuAktr5cu5zcuaz
	u3XFQLMqbKRmmVA/nfwl/ZL39Tp0bp1B2HwE/AGpu1WPXQneyhn8zcm/
X-Gm-Gg: ASbGncuKeetetuGWwPj2w7wa2ZFllK1U882LUWp5PdVWGnADjWKW/xpVJMzDWmr01Ww
	fVvyVeF16jkDoBC2f+m2cz5HirSSEZNfXYmi7EAX0b8R7bgqRkZ0/L1Sy1Gv8rnsjt5Mie6Olom
	hUKF+WSS/sL+jWjlAKS6CSckRse3iqMHMARpbdrQKLUVPbKI76J8dcNpmPmMJq+WUVhnaEJ/14O
	mIcpUsd3bGf/F2Lq2vWvzkf66dbYakagtQYGIVytN9uptV7Yl76KxPIrWros0vuQ1qrCucJakcM
	qIDOncopghTe5zrQZR2gs8A0/H4MRsqm/U+nm1XgWNuwCh7MfSgWonF9579V4tqEZKom3//kZZM
	K43YDMEeg5TRQN+6PTU+tvJZklJJBZeTYpCxBsjZv62PG5Z1C
X-Google-Smtp-Source: AGHT+IFH1iqTTHNEedaWfa0iqGZpnZbsn8YFpAWL1bsm1Q8amIn8wdf5T4PMSfGgjTQYSXwV8popaQ==
X-Received: by 2002:a05:6000:1acf:b0:3a4:d898:3e2d with SMTP id ffacd0b85a97d-3b5e44e6b83mr3524010f8f.24.1752093370054;
        Wed, 09 Jul 2025 13:36:10 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e4ceb587sm2666847f8f.101.2025.07.09.13.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:36:08 -0700 (PDT)
Date: Wed, 9 Jul 2025 22:36:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: memory: tegra: Add Tegra264 support
Message-ID: <2ohrp2tbun6xdi77phk3fa4xsy24xomgg3uzjqqogmz3vfdqmm@megeivnzsgqd>
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
 <20250708105245.1516143-2-thierry.reding@gmail.com>
 <abbfc54d-96af-4e9d-8c2c-8965aa99076b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzpiiwzfsg5jlu7e"
Content-Disposition: inline
In-Reply-To: <abbfc54d-96af-4e9d-8c2c-8965aa99076b@kernel.org>


--yzpiiwzfsg5jlu7e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] dt-bindings: memory: tegra: Add Tegra264 support
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 08:19:51PM +0200, Krzysztof Kozlowski wrote:
> On 08/07/2025 12:52, Thierry Reding wrote:
> >    interrupts:
> > -    items:
> > -      - description: MC general interrupt
> > +    minItems: 1
> > +    maxItems: 8
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    maxItems: 8
> > =20
> >    "#address-cells":
> >      const: 2
> > @@ -74,6 +79,7 @@ patternProperties:
> >                - nvidia,tegra186-emc
> >                - nvidia,tegra194-emc
> >                - nvidia,tegra234-emc
> > +              - nvidia,tegra264-emc
> > =20
> >        reg:
> >          minItems: 1
> > @@ -127,6 +133,15 @@ patternProperties:
> >              reg:
> >                minItems: 2
> > =20
> > +      - if:
> > +          properties:
> > +            compatible:
> > +              const: nvidia,tegra264-emc
> > +        then:
> > +          properties:
> > +            reg:
> > +              minItems: 2
> > +
> >      additionalProperties: false
> > =20
> >      required:
> > @@ -220,6 +235,52 @@ allOf:
> >              - const: ch14
> >              - const: ch15
> > =20
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: nvidia,tegra264-mc
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 17
>=20
> Missing maxItems

My recollection was that maxItems didn't have to be specified if we
already have minItems and they are both equal. That said, I see now
there are a few cases in existing bindings where both are used in
conjunction, so I must be misremembering. I've added "maxItems: 17".

>=20
> > +          description: 17 memory controller channels
> > +
> > +        reg-names:
> > +          items:
> > +            - const: broadcast
> > +            - const: ch0
> > +            - const: ch1
> > +            - const: ch2
> > +            - const: ch3
> > +            - const: ch4
> > +            - const: ch5
> > +            - const: ch6
> > +            - const: ch7
> > +            - const: ch8
> > +            - const: ch9
> > +            - const: ch10
> > +            - const: ch11
> > +            - const: ch12
> > +            - const: ch13
> > +            - const: ch14
> > +            - const: ch15
> > +
> > +        interrupts:
> > +          minItems: 8
> > +          maxItems: 8
> > +          description: One interrupt line for each MC component
> > +
> > +        interrupt-names:
> > +          items:
> > +            - const: mcf
> > +            - const: hub1
> > +            - const: hub2
> > +            - const: hub3
> > +            - const: hub4
> > +            - const: hub5
> > +            - const: sbs
> > +            - const: channel
>=20
>=20
> Missing constraints for interrupts and interrupt-names for all other
> variants. Now this patch claims they all have 8 interrupts with any name.

I'll add back the interrupts property for the other variants. For the
interrupt-names it's slightly more tricky because on older variants we
don't need it since there's only one interrupt. It looks like I can do
"interrupt-names: false" in those cases.

Thanks,
Thierry

--yzpiiwzfsg5jlu7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhu0rQACgkQ3SOs138+
s6EndxAAgjzxHXgyJiqSvY6Bu1TgmN8YTKl8O7KS0vpNwiGldECJ3ov474vN6hGs
B1vPywsJ0pOVMMRJLtpXyF2LzMFqpBp5z+0Xp/+0tyVGadVtzucyFcaNLLtSZxOu
XDvRvobVYghVL8XbRrNcx7mBIuuKc4G9QYRRrI8O4nLksyUdRDPt3u4OwsUaRFVa
rzGXr5+LsSqLwOcDHrDeE+BZCZuXW6Yw1v38Yctunx1Ct2WLdlFKNFBrnSqy/Rfo
ttCH6IR1peqHschD/YLZEFQBcxSoeNhk0pgUAGUlR6UO1ZvtYsD0SRLRc8//jz0T
TEeuUWXCv8pVyMhKQHLCTqI/gdP1BaDtr7BrqiLxaTLQDfo4jkabQI+rWJ4zRjNA
kVEWR7SuD91XvQe4wa63/gPqJWHiIGhMpQ1p6pCVyykuF62vBu7nbMcWAZDmKN1I
lhuDmbTpHkOB8AiugX6WqdVgZ5xJqDkSu6twE6ScUFwKf57q4cnwBWqmmG3XIeq9
AUqJC5iX5sPVZQB2YMpaVncC523JepqlcXabptN9Yu+XMbbj4qQ3TcCRbz2Lt/aK
+kcJG1u3LS8rXAkvwzh47HlYWFaYVZbF7b6RfDEal9t59kz7jjoZmjeAn8Trbdut
s3ZrmQ9bivbQwRy2DWzW7T7iasMoFX0Q7NOUeSaEbKkQeKwz15g=
=zaJr
-----END PGP SIGNATURE-----

--yzpiiwzfsg5jlu7e--

Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5972E22DFB8;
	Fri,  1 Aug 2025 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754041803; cv=none; b=gPHSqDiR2qGopnthhXPS4OZ9mucQDIqrv/5kVj/BcxMdgzljGp4sjUBTUYvdOfS/ABHqxWGuj8f6RVfHXJvnAv8EWj5vYN/G+Hk/dnuKVWl+6AUbdhEWxl/TZQbLGBz1oAsYM8AZ6IsiAZeR2XHrZXkMILPM6ze9BWUPjF2B1ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754041803; c=relaxed/simple;
	bh=QB7yktojV4SmiuIB2Em5vaLnXdNR8TBgORvLFQ22RrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xloq0ctAox9JKIcZbaPTdFMet4q7CopDwBmzf88L/pq+FRyYogVuxYFyfXV5r0ayZ72i18g9T22iK2Wfuvsw9DFd3rWx8lIvFs4c1OyE8+AxgXYBywSsxv+v2G0Nxf6hg1OSBlxc4pyOrpZqKwqgM4XXvCI0XdMI5+vw8PlfEPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKnp0afs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKnp0afs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso8202555e9.3;
        Fri, 01 Aug 2025 02:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754041800; x=1754646600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QB7yktojV4SmiuIB2Em5vaLnXdNR8TBgORvLFQ22RrI=;
        b=HKnp0afsVA4vPj7RB8S7xNdz8VOQ9mshR5hiUWekxp42G071yUPOMf1/p99Z6nrt6X
         3hKnm+PRUXxFFOuf/ekjWUSEdrO3luDR40/hyrTH6RajgmYRi8w3AVhPPJ7stj6/VsZm
         DxtLj/s21Ce1F081nTSDToaMA8zQwccceTuiXPPZZtKo1rD0hIWVjpcUS2bkQRC9Frgp
         BqlqGYOLOYhnYKeK2dlHUjoQ0sgE2H9acnnoHWzWVZnddvUAigadT6YJoA+7DhnzCajd
         gDF0dz9snYgr22JiTI5nqmwh/8b4wYjHSflwSvFe9LBzhfmujIF/O27//yHc0NNDu13M
         5tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754041800; x=1754646600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QB7yktojV4SmiuIB2Em5vaLnXdNR8TBgORvLFQ22RrI=;
        b=Rb0vWJC9ooh0YXFMAP3tzcSQib+9hZ6JpT4OZd8Vs3JGB07Ff7EHAxb89wfBWB3TX9
         YXJBDd2Cx01npGxx8e41JhdG4oxnoRALnZdqYIApLgpw3WthA7I897LncySs5MWpG/HN
         0xmyYvqEdPrv6DW3Wj/ucqwHlSatxxbnc7g+9ipnJyVCCafaqY3qzgw+LeO0MgMWt0oB
         3TTNHZqkmMBgY8LvG7vQGbuRiopB+dJb0/m4Bqzb2HjQXajBZxYWLRowAaWixsfFzUKJ
         x2WE7a4rA4SgXX/DIGivoEhV5f+09FApbRmT3lkHd6AoaTkaku/r41h+FMT/7Bu8itsd
         wqdw==
X-Forwarded-Encrypted: i=1; AJvYcCU9nH+0v3iRor330Juvl4BxZMpSaY3St3HApl8y5xVHh2CaxP++F8Xcfb/CwKoIv6czO1UNYZybkE0XPGAekUwM@vger.kernel.org, AJvYcCUKJ1z0usa9DyQJgcIwtS7FQSAqlnXjZQDMt4grwR4yfV3uz1sBjT0PCphD4vCHPk4dESIPiufXSWPuNPE=@vger.kernel.org, AJvYcCV/D9CrTOt7ZePHloM7IfIakVGUVuGGRAdexRdz/nGTCepiDcPzDUvh8qBxxNrFuB77Q82mNl6sbDYj@vger.kernel.org, AJvYcCVJXst12TegiwTKMuDxolSwp9zjosO8AJQxYYfnr9O8m8rQXAPUOrEq/kfwgtP+m1ekoV2H1mOD+IfvK56m@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3TYLUNaVZ7YSdyLKSsbhkYBv+YW3MX1bGUqsdB7DLM8/ebi/
	OgkWtFQmJrPMndKp47P9LsUeMiGjvr2fPIWOnmhxwka6rwCmL/Uh23zL
X-Gm-Gg: ASbGncv/FyXC78eE4hUfluCcJ/Aq0mHkC5UM2dqbtWiuqPYaR6hVRpRczA+5qtxW3k0
	OsB43pkA5VbfhiH6lluuKpwlYQH9US8GZcfXJi/10zQOcQdCGM24Fdf84bXqe+DWErc3KA0fN/A
	jUzroVDu1osf5W0SdsLDQq0Im0pv7B0eREjUiqlcdv1YqJb/a/CEwp7q790anksnNn9OMbWYlqd
	w6CQbq1UjkR1rOWuwIRngddLgw1UYmUtGYbOdJupBPIFX+llIvKR+o5Npb5PjJIqe2JkIsWM1RZ
	ufj7wod2Hr1dz70yOdugm3FLzmdO5fu3CpWyOXyCMW8tb/cZQgaMTJBlDZt6LBxOcIFMeqSE58T
	kevbtxG2fPp7zLHBrCv8RaKpVvHfgGQSKLh4NtlNjHXfMehuKFXYu36C1W7nl3ZQP82LBC7h9iK
	iJM9S477KM
X-Google-Smtp-Source: AGHT+IGM1VbcACYVMzznygtA8YnBMiWc/770n/UqPcXfYjRmcqZqIg2si3EXfeB1ZBYpCKSU7rfNXg==
X-Received: by 2002:a05:600c:3ba6:b0:450:cf42:7565 with SMTP id 5b1f17b1804b1-45892bce8c7mr82868975e9.23.1754041799445;
        Fri, 01 Aug 2025 02:49:59 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953f887asm99109165e9.29.2025.08.01.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:49:58 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:49:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
Message-ID: <m2jfr3glrivqykyblgk2beagrtbfxyqcoqb3bowadixpcduauj@cqw6resa3uhn>
References: <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org>
 <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
 <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
 <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com>
 <yczvbwanjadyfife3hnp2khxkgs77pokypqkxotlldjskshskt@xckrkfucg6xx>
 <CALHNRZ--ZUxqrXHEnizXC8ddHC5LFA10oH+CgQmOcTt+cJ1CWw@mail.gmail.com>
 <6abdc70c-0def-4cf1-b1f4-ea9bdde4fcb5@kernel.org>
 <CALHNRZ8=ikQe4L6h9VHpTGm+OFU0iZA_OV6LUP6jDUySBv4+Lg@mail.gmail.com>
 <lvj5atllziwnfreau25fejckllzhgur3rgh5udpx6boz55lgu5@h6fpsnz4xmkg>
 <CALHNRZ9VEUzU07j_fUWhNnF24y64wkO5_Vun-mf6d_m=Xyx4dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjc6ud3w4refol5k"
Content-Disposition: inline
In-Reply-To: <CALHNRZ9VEUzU07j_fUWhNnF24y64wkO5_Vun-mf6d_m=Xyx4dA@mail.gmail.com>


--wjc6ud3w4refol5k
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
MIME-Version: 1.0

On Mon, Jul 14, 2025 at 01:01:19AM -0500, Aaron Kling wrote:
> On Thu, Jul 3, 2025 at 2:24=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Mon, Jun 30, 2025 at 01:48:28PM -0500, Aaron Kling wrote:
> > > On Thu, May 29, 2025 at 3:53=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > > >
> > > > On 28/05/2025 19:35, Aaron Kling wrote:
> > > > >>>>
> > > > >>>> Friendly reminder to the Tegra maintainers about this question.
> > > > >>>>
> > > > >>> In lieu of a response from the Tegra subsystem maintainers, I c=
an only
> > > > >>> hazard an assumption, Krzysztof. I presume the pstore carveout =
is
> > > > >>> bootloader controlled because various stages of the boot stack =
can
> > > > >>> dynamically allocate memory, and this became bootloader control=
led to
> > > > >>> prevent any of those from overwriting pstore. I worry about har=
dcoding
> > > > >>> an address in the kernel dt, then finding out later that there'=
s an
> > > > >>> in-use configuration that overwrites or corrupts that section o=
f ram
> > > > >>> during boot. What are your thoughts on this? And is there any w=
ay for
> > > > >>> this patch to proceed?
> > > > >>
> > > > >> I haven't been able to find anything out about this yet. General=
ly it's
> > > > >> difficult to get the bootloaders updated for these devices. Tegr=
a194 and
> > > > >> Tegra234 may be new enough to make an update eventually go into a
> > > > >> release, but for Tegra186 and older, I honestly wouldn't hold my
> > > > >> breath.
> > > > >>
> > > > >> Thierry
> > > > >
> > > > > Krzysztof, based on this response, is there any way or form that =
the
> > > > > Tegra186 part of this could be submitted? I can drop the newer
> > > > > platforms from this patch if Thierry can get a response to his ot=
her
> > > > > reply about how the bootloader could conform.
> > > > >
> > > > I don't NAK it. Eventually it is up to platform maintainer if they
> > > > accept known DTC warnings.
> > > >
> > > > Best regards,
> > > > Krzysztof
> > >
> > > If the decision is up the the tegra maintainers, then Thierry, what's
> > > your thoughts now? What is in this patch should be compatible with
> > > existing l4t and android bootloaders. But it does add a few new dtb
> > > check lines.
> >
> > I don't adding new DTC warnings, especially ones that we know up front
> > we can never get rid of. The memory one is a notable exception because
> > the system becomes unusable without it.
> >
> > ramoops is not in that same category. While it's certainly nice to have,
> > I don't think it's critical enough to warrant that permanent exception.
> > Where possible I think we need to work to address issues souch as this
> > at the root and fix bootloaders to do the right thing.
> >
> > For any cases where we can't fix the bootloaders, I think that's
> > something we have to live with. Having the support for this live in a
> > fork is a fair compromise, I think.
> >
> > I know this is frustrating, and it's very painful for me personally
> > because I initially set out to redress a lot of these things and failed
> > to do so.
> >
> > However I can't justify accepting endless amounts of quirks upstream,
> > all of which would set a bad precedent, just for the sake of things
> > being upstream.
> >
> > Thierry
>=20
> Alright, so to make sure everything is on the same page, let me walk
> through the archs.
>=20
> T210: This fits within dt check requirements afaik. If I send a v2
> with only t210, would that patch be acceptable? Though, I would like
> to double check that my assumption about the arch is correct. The
> downstream 4.9 kernel does allocations for ramoop I can't quite track
> in the vendor code. I'm assuming that by matching what the downstream
> kernel picks, that it's within a large carveout that the bootloader
> will never touch. I've not seen any corruption in my use of it so far.
> Is this a safe assumption?

I haven't looked into ramoops support at all yet, so I don't know how
this is handled. If we can find out where exactly this memory is and
that it's guaranteed to be static, then maybe we can hardcode this. If
not, I don't think there's much of a chance to get anything in.

> T186: Software support for this arch is eol, so what the bootloader
> does cannot be changed. Presumably no other choice but to relegate to
> a commit in a fork or out of tree patches.

Sounds about right.

> T194: Some software support still exists for this arch in L4T r35. Is
> there any positive feedback on making bootloader changes to meet dt
> check requirements, or is it too late in the cycle?
>=20
> T234: Still has active software support in L4T r36. But essentially
> the same question as t194.

We can probably fix things for these two generations.

> T264: I assume whatever happens for t234 will be mirrored here.

Yes. We do try to incrementally improve things on newer generations, so
anything we fix for Tegra194/Tegra234 I expect will be done for Tegra264
and later chips, too.

Thierry

--wjc6ud3w4refol5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiMjcQACgkQ3SOs138+
s6EXbxAAp/2ISBeceWrB2Fi/iGZ1o81c0FJnyu3V3xrJS/qzF188lvcMdeLQ2bsN
AqQxJ8JP1bl5MEpJ2gcJ+W/0DadKxIJGyxVEUPHblZK+A2V/6V8ha5HLJ0/cdgV2
Z7yWTiDQx4rZgK+ojKqXcjnS+xFC0WXNkYz5dvhzZsFOIneH7/vywTgmX8j83bhU
UZ5YrtyD9aeQcJH5ttB9TCcFOPcK/PeZrbBEDudmPk0GFJWPCCr6OEtoSO6r7Hpi
U5mCt/FfMrGe15ko3YB+YSXbofd9SMQIVtUxJgQtihrZAWX9fS7Ccc1EdKhIHDNg
3P3T1LzNFRAuf6wID6AELgWJQuBZMuaBGBnjRKf1z5+8ilyncXJOR/e2QHNZQDyl
XwatXoFrMJb0+MgjD5zwD5jyZKDTT7Y3oSZQlOTvdRt52q6gPCW7jLJwQhUdPX7s
3xXwByUP7UuxZAMAMGLQmXNEOy3wPHihgRTG1xuhXufjiTpqKga5LG/PjKouD+P3
20CG53EmBhQF6p/MlYcxClJAGRJgpp0Vnr9eUSoNEesEof5olkPWFBmTUME6xyLo
kjfLbVIfQZWuhougWjNf+MFLRB5Y/GbbaDPp09lma78iwO6NTZvim69q4LLSrreM
3VizxRCsbmnvu2UdkY9fiSWnT7WCAwpM4eSY7U/LdxKoiUjqMes=
=7rs+
-----END PGP SIGNATURE-----

--wjc6ud3w4refol5k--

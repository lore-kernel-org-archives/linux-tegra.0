Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA34D599;
	Thu,  8 May 2025 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691334; cv=none; b=IOWy83FitVwZmC5YDXyHz7WTozqBHZUA6i6knE0gLRn3i1Rk2LS51/rNAi/z4vdA/T1EF+pM5q1a1+lc9tH0WzhmyBmzAmjitToaX13tACLL54EZUyuctRnCq6iu+hakM08x+3d/VWNcG5CSo/aSMsOBl/kNeSe5xGoW8FfTE8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691334; c=relaxed/simple;
	bh=6l12G9ysU55Tjn3LHLSf+iUG/z7fhyi39z6+Odruzg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ0L4MHkJjKPsbKTgoH3TZPMCU4Q03rMCWPbQzvIspxjWR0DIEpFaGWi0L+MZgDQMeV16ICFMFwVBGqGjZ0fm75g6citVpZ87t2qkCcJ1PS5E1YmPCBuYB9Jb6jhCcIaAsuByBvk+IQm8FvD6jcvtohEhU4aqDagHzRySeU8ml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwjSq2hd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwjSq2hd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso7532005e9.0;
        Thu, 08 May 2025 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746691330; x=1747296130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4P7GUp/MmoSYGvIOevuz861A5gtSjkC93eopwwOdts=;
        b=HwjSq2hdkK/AJKHHpEIu4oHam+9vT1GNEMSCUwVMFFAZZ1r7G08QqwHqdW0jMOcaL5
         6RTRfFZqtDvfRDet3L2WOXCeFRR3+3zcpyEier3XXfqfq+xjGJLs7SvCfRf6GlSrjqq9
         dubNFnl2FHoQAHWiOzblUScvLrxj4Qbo2ru62hR9YsNdp1oFHcOAljA/FoPoFD8k98zF
         JxN/sFNNX7dwNt4On9cBAahtvRJtAiO3uGbQgpnXt/bqWO6oXqRqnZ9UNMoLmQrx4ILP
         MsukM+mO1lAVXCGKQeHc5J0cMEQyEwsHlzZMUcsPkqfukvLLEjOypzsKGTubM9wH8LMt
         /4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746691330; x=1747296130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4P7GUp/MmoSYGvIOevuz861A5gtSjkC93eopwwOdts=;
        b=fyWw7Su8qigIRRef1sto9a670blXpdoLESlLjgR7Q9FB6jei02GfELEGz9gpbnWqJr
         fCq1grtibr8wleKW8V66e0GiJK6skROtIliFbDQGtrbnkiODAMScEy/8mZ28ZQr05n9j
         F22mQ92/UtHWf6hpBK804ZJjD8wquCALFkNYrOBIjB6MqtDTLEMrf/mb+TYcWyR5Rm1F
         twG3+oLPNH2nouS1cSnJ5yuLfUlcy+jJzazHizq76Ys4oDBlvuLjx47uERRR1BWgZA8q
         KHypfRJsnkw2x64yS5MADbALjwOxwwiJyi9OOUPzsVJeCFmppb1aOBWbMCl4olr1DlOF
         4yYA==
X-Forwarded-Encrypted: i=1; AJvYcCU6m/mrCxmyRVz1lZPaaXhKTp9x+jGKK7bHshRpis+SPJ3A1t1ZjnmrD3tODFjcCx4rPRp3O3MzWZr2TDo=@vger.kernel.org, AJvYcCUac1o3fH37XBLxrm+oA+IlaxhcT0yIjVStHv1tajJfBFK0RW7gv1robh4k4CoFM0vVlT7k5Bf2HXRD@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+BGbu955jrFZauSgjCBMkB+R04LYqFMaahOVO7ZH9F0MbgYz
	ieeekpwQa2subxznU1HAbMQeZTn45B7wpGH7GunJEhBtU1Ro0btjbrTPFA==
X-Gm-Gg: ASbGncuN4MjuIFTnMorcMkCJuiuwUa51uh5q0jYbXm4X4YlMrlsmwhjyj0niRN3a9mT
	5kflSfxJuADgbARCywnzS/Lth/ytjkjGwaB9t/kZM2zzSdc3gaJovZXQRhhbn4ombOAcRrToIYk
	y1qZBNuGlbccc0WEOb80RCwKX5Mb3LML1AZ95K8su2+tFF1gYG54M5jkdTGqMqQQF+ZAiGlXjBY
	lVVTgYZJnppCtxS03MjChYmvR6Qbw2qu9pgFJrl7DMbN1GAusleNnkePpGzf23GP0z1Ns2oEQMw
	fZV53ovg6zA4L7sHKm8Ea7sE7YH225wyNrGEoMgCPDBzSXcb6KdrpL+EHyZ4mo/saOmUJaMMnvr
	yZfm9wOyXmT1LT25NzPF6P13jhD0=
X-Google-Smtp-Source: AGHT+IFlxePKQi6HEnSGaurdqKQsN2yyAvjgz+TUgP4f9rs+wkZwgrv9s5iq6PW2s9d4n/gu1XoG2Q==
X-Received: by 2002:a05:600c:1388:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-442d034b2b7mr11858745e9.28.1746691330469;
        Thu, 08 May 2025 01:02:10 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3285c7sm28119685e9.3.2025.05.08.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:02:09 -0700 (PDT)
Date: Thu, 8 May 2025 10:02:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Message-ID: <hitexxuelppvbdd3hyxf3qoncdizj6mvhiuhp63s7qpgkgqd6f@63xybk6n6dfn>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-6-thierry.reding@gmail.com>
 <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
 <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
 <f346c140-52f6-4209-b62e-53dfa2c8c7c4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uokfqxsit7nwu6f5"
Content-Disposition: inline
In-Reply-To: <f346c140-52f6-4209-b62e-53dfa2c8c7c4@kernel.org>


--uokfqxsit7nwu6f5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 09:37:27AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:31, Thierry Reding wrote:
> > On Thu, May 08, 2025 at 07:48:22AM +0200, Krzysztof Kozlowski wrote:
> >> On 07/05/2025 16:37, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> This doesn't currently contain any stream ID or memory client ID
> >>> definitions, but they will be added in subsquent patches.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>
> >> <form letter>
> >> Please use scripts/get_maintainers.pl to get a list of necessary people
> >> and lists to CC (and consider --no-git-fallback argument, so you will
> >> not CC people just because they made one commit years ago). It might
> >> happen, that command when run on an older kernel, gives you outdated
> >> entries. Therefore please be sure you base your patches on recent Linux
> >> kernel.
> >>
> >> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> >> people, so fix your workflow. Tools might also fail if you work on some
> >> ancient tree (don't, instead use mainline) or work on fork of kernel
> >> (don't, instead use mainline). Just use b4 and everything should be
> >> fine, although remember about `b4 prep --auto-to-cc` if you added new
> >> patches to the patchset.
> >> </form letter>
> >=20
> > get_maintainers.pl lists 13 people and 7 lists. That's *way* too many
> > recipients for something as trivial as this series, in my opinion, so I
> > tend to curate the list of recipients manually. I guess I went a bit
> > overboard and should've at least listed all DT maintainers explicitly.
>=20
>=20
> Usually that's a sign you combine too many subsystems into one patchset,
> so the solution is to split, not remove maintainers/lists from CC.

This is literally only DT bindings, includes and DT files. These can't
be split apart any further without causing other objections.

>=20
> >=20
> >>> ---
> >>>  include/dt-bindings/memory/tegra264-mc.h | 13 +++++++++++++
> >>
> >> Filename based on compatible.
> >=20
> > The compatible string for this is nvidia,tegra264-mc, so I don't know
>=20
>=20
> so nvidia,tegra264-mc.h
>=20
>=20
> > how much more you'd like me to make it based on that. Do you expect me
> > to add the nvidia, prefix? In that case it would be inconsistent with
> > all of the 8 other Tegra MC includes that we have in that directory.
>=20
>=20
> Same story as for every other case, why this would be different? All of
> them - amlogic, mediatek, samsung, qcom, every soc - move to new style
> since some years, why this one should be different?

Because we've used exactly this naming convention for more than a
decade. I get that it's nice to have consistency, but do you really want
me to go and churn all of these files just so we can add a vendor-prefix
and drop a redundant suffix?

Thierry

--uokfqxsit7nwu6f5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcZP8ACgkQ3SOs138+
s6HmwBAAsoRxhX8O9IY2rHF8lF9Rcg3IVjljdM/eVTB10iCxx6f7rrbRkSPu3TqJ
38j87L7XAyoyKvtj2YgHZZyl+yWQ08I6K+bOGQsDlnXwAI9JCRb8pFTd2L/bZXMu
iGbutScoOA3oUPU6x4jxlq6MP4dRYFLjHezt7J0GLdCgKFKL3nSbDGg1H0sAdD4I
dReJM05WczlF7dwRhLHBxU6GBLrmPMSosDwuW10E0sN5iLr3q9OkzhWW4qhW3NS9
hxigpZ8jwDEv1kjsuSP5buKtZJqAmvaOfEldSikN8taOe2cC3g1oJ47mnp0qAV7B
3AhEmdqDJRPzhuAFSJ5wutdjCr57iGPacYXQKzMlQa6twqpipbQEbK8UyH9MHURP
7yAhU7bvz3WKeu9NBjHNMnmIWyE8mdAQuc4TujI86Asy2ST6M5DPsYaQbBwtV8aq
eyKzCo0QzOlqfzE7tajKqN+HsZlCrH2imBCMXvBE76iykECTHMnYenq61ZlnsQYz
VLrBfmMvt639YkpGIpmZndBhknYArQGr2LwcyfxOYtRIX74ft6I5yOS/guG1sX52
f/386CC/9uIplxfRkJwli7I6vGd80g5eZHvFsF3zrUPDhpJ9gpZlIbwGxB3wYZP9
oNyujUfSx9hKg8NpWgDM4k4lyfhsv7VprUuekRrM45Do2KXYVx4=
=Ejv8
-----END PGP SIGNATURE-----

--uokfqxsit7nwu6f5--

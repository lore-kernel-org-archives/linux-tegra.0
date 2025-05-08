Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A516BFC0;
	Thu,  8 May 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694740; cv=none; b=ijVrImy9xV5toWdIZkWU0Jz15SE8j4P9nxY19lwit6cypHsWwz6ryIEoRxUlNU7W+guSSB7tIwMbL614AOjxVdlfx0NDCvAuBYxpYXUs8dBrqCRjgk8EuqHobe+OS6yDZdcM2Vm7Nc3MJL98lwNk6VNg3/nat3xEr9t0rsSZTgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694740; c=relaxed/simple;
	bh=plxb5037jVxGsPUc8bcLLYmzQYP1O/cVRf47wludlyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsoDMb/dMxgyo4ff2qZHVPxYGxTEhOE0lShzc1a/c1iwlewI+F9OcyPnsSISXP2kS7yqRVGB2sC26yE29+IW86o1W3R/DBNyFUllyb3h95Gl5mFDltxovDx0E8Rhehms8ldkH68uLC85CVs1b2thduL5t2bZBHP/po3PIUKtIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/9Ngbwk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/9Ngbwk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b135d18eso410106f8f.2;
        Thu, 08 May 2025 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746694737; x=1747299537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3njpwnWBUHdyjgi8K2/1wk/9cMLPfkLXGNSkvChm3CY=;
        b=K/9Ngbwk489GIubLn+IpI/6J4/xOJ4jysF9G9pD11LtGEDyEvniC5xVGicgQjq0kTa
         gFCCEarmU2T22FrLsPn21yzhP7637JjY0U3ed6k9S1RT3OWkx6Djz0YezCwQ5FgTRgA+
         bdhuZU/fKk2SAEPht5uL0W/Qb8NGXKL+1jrsio4ajYHpxRftfMZqKoaolZt1SqYkl6DB
         h2s4Oprme3aM4lprMMqSxtzYNyFCjzHBiOdOkgDlJ4bEqQwrvvavoAPq111u15CYbnHV
         4Ifr0lkPtobqFGgzk0K1qSJnGMldulAnA3j2PdTqpbHikf2ONOuFeabLT0kaHZ/GdLJr
         B6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694737; x=1747299537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3njpwnWBUHdyjgi8K2/1wk/9cMLPfkLXGNSkvChm3CY=;
        b=ORi+EZAtlhN5f1lDpSbiRRcAMB4MWrvUXYAmF2T/Zsjcmi7b+KA3m6R4C8zZdtBgfd
         8j9uBKFqo7UdHp9h7qTNtf4rf5zRbm5jV3YHwLWGEET2OMDb/g4iGv6QBkCZXl6165xi
         B0u+rNe6qkkuMwHJ5Q59ni+fTTRjOPFpiHGG4b5QwKmTkcwOyzHJUHwde+StIH+L67wL
         pI/MWDw0duTm3fS2ZIt2rvg/ob5BaCSvY2YO/P6SS+BcQ52y6XM/iAgN1hL5HnbhSrn2
         V5llJwk7qAuJ33rre231Yz2Tx7IXc+GhSuz3pIhPpqZuJIpQX5R46Ngwc4/uliAbaalr
         hH9w==
X-Forwarded-Encrypted: i=1; AJvYcCUEfGSVTadj5ciToXrmWf1swfnNpPLbMXlTg18mYQVwfoTpQk+U7oBLbsA7flyQbdagjkyVJ21Bo1NxsPw=@vger.kernel.org, AJvYcCXVU6lb6DaaA8WoTunGP19gJqM4J3tzktpznIhvX+U93yQe6Jto9X0igVA7882zJLdDYK/eW07QNQOH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/LhDEk+UZ5EsL1JB8qAiw9t1oACM0/1tLRYUS2lPiJKFRBgF5
	x7ChoBB2bxtcVFRk5FGsvt8WsOikmEdQQkfRPBgm8uSGCgCTqdiQ
X-Gm-Gg: ASbGncubsZkHifqpm/R8fmZbfH7GzTmQ5lC8lbqa5xhniZdWYhrHLkIp5B/bM49VuYF
	4hdbROBRFLirHIixSS2VECLna8nVVnTzBytcN3d3k4dyncx4bcpUDSWhdKoHhhUmnBTcZZoRRto
	ichzvLsww9CnPeHd08EybI28xWhwGWTFnOhUPM7dfP6hODZhhZ/JAOSXbgzptmmmcQfYHUcApj3
	E+97RlH2mzgUPfxz9bQOp3WA9j9XEKld3zw2te1DXmLDRAQHF+TRWy00zNUoBaEN7QPw3tWYYyd
	G4Spv7b4on3fpsA3ZiN80DhqUCsopr3ccahFKFSP2Vuh6LfRqOs8EAlOY4HmURS9H3jQqf8vPGv
	PKhuGJj+0T3MEKGwJeAwmiZ0gkTTntIhBeqdGJA==
X-Google-Smtp-Source: AGHT+IHRENLBMEe7YXiOL5c7kFEzTbBPsJlvi9dkV+r0VPyt0g4hUHwZfO3pKS1hsn8AmhRaqsQ5oQ==
X-Received: by 2002:a05:6000:40cf:b0:39c:1f19:f0c3 with SMTP id ffacd0b85a97d-3a0b4a39f62mr5477643f8f.46.1746694736993;
        Thu, 08 May 2025 01:58:56 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3bc0sm19961157f8f.35.2025.05.08.01.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:58:55 -0700 (PDT)
Date: Thu, 8 May 2025 10:58:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <ry3rfjn5owscxkwf2ouqdc4rsdvdh6hi2bi7rqeiufh2oekakz@6eqkbwkumdcw>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <8a26a37a-26ce-41ef-96e4-10ee09ebe704@kernel.org>
 <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>
 <rz64mnhdb5vu42tcerlobmulkyxvpqgeeer43t57thwzxnrcou@6xcpuiiru66b>
 <0501c0b2-df78-4c93-9ca1-7f32767b0225@kernel.org>
 <kut7odtjumfmqia7to75yda4qwtsyhwmm3xejkwtfm7yxyap5t@icfpljkitpwp>
 <321bf682-71b4-433e-ade4-97e8c9839564@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bxazby72sxylsoos"
Content-Disposition: inline
In-Reply-To: <321bf682-71b4-433e-ade4-97e8c9839564@kernel.org>


--bxazby72sxylsoos
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 10:51:57AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:59, Thierry Reding wrote:
> > On Thu, May 08, 2025 at 09:49:12AM +0200, Krzysztof Kozlowski wrote:
> >> On 08/05/2025 09:46, Thierry Reding wrote:
> >>> On Thu, May 08, 2025 at 09:40:38AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 08/05/2025 09:39, Krzysztof Kozlowski wrote:
> >>>>> On 07/05/2025 16:37, Thierry Reding wrote:
> >>>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>>
> >>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>>
> >>>>> Missing commit msg
> >>>>>
> >>>>>> ---
> >>>>>>  include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
> >>>>>>  include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
> >>>>>>  2 files changed, 16 insertions(+)
> >>>>>>  create mode 100644 include/dt-bindings/clock/tegra264-clock.h
> >>>>>>  create mode 100644 include/dt-bindings/reset/tegra264-reset.h
> >>>>>
> >>>>>
> >>>>> Filename equal to the compatible. That's the standard convention fo=
r all
> >>>>> the headers since some years.
> >>>>
> >>>> Huh, I cannot find the binding in this patchset. Where is the actual
> >>>> binding added?
> >>>
> >>> The bindings for this are in
> >>>
> >>>   Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> >>
> >> There is no tegra264 in that binding.
> >=20
> > That's part of an earlier series I sent out (and linked to from the
> > cover letter). It's here:
> >=20
> > 	https://lore.kernel.org/linux-tegra/20250506133118.1011777-1-thierry.r=
eding@gmail.com/T/#m96bb396b352659581a9e71a4610c51e6ab4d5b6a
>=20
>=20
> Then this patch belongs there. Standard rules apply: binding headers go
> with the binding itself and the binding itself go with driver patch via
> driver subsystem tree. At least usually. Nothing here is different than
> all other vendors who follow such convention.

This has nothing to do with the bindings. We add clock and reset ID
definitions that are used by the device tree nodes added in this series.
There will be other patches in the future that add ID definitions to
these files when they will be needed by the device tree nodes that will
be added at the time.

> >> The header always goes with the binding and the drivers.
> >>
> >>>
> >>> There's no 1:1 mapping to a compatible for this because BPMP is many
> >>> things. It's a clock provider, a reset provider, a power domain
> >>
> >> Sure, that's fine.
> >>
> >>> provider. These definitions reflect the IDs assigned by the BPMP ABI
> >>> and we've used this structure ever since this was introduced back in
> >>> 2016.
> >>>
> >>> I don't think changing the convention for this is a net advantage.
> >>
> >> Headers still should match the compatible one way or another. Can be
> >> nvidia,tegra264.h
> >> (because -clock is redundant and you do not want to use the actual
> >> compatible)
> >=20
> > I get it. You want consistency. But what about consistency with earlier
> > chip generations?
>=20
>=20
> I will fix them after finishing my time machine. :)
>=20
> > Do you want me to go and rename all of these files?
>=20
>=20
> No, I don't want to change them, but I would be fine if someone does the
> change (although someone else might claim this is a churn). That ship
> has sailed, but at least we can start with new bindings.

Totally pointless, but... whatever.

Thierry

--bxazby72sxylsoos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcckoACgkQ3SOs138+
s6HuxQ//ac8xfzjdddtwASnBo3ZzwSG58AAMitjqUhOimrqLRXMqSTlPkD3QXvcl
VYB8JpRW0KYjo60nzf44noGlvi1y6hq0vspwNd43rjKm2wfyXfx+bsFwK4aOajFE
q+JG9/PBk0fFBcAEHj7wQG3iVA60bBFXp/6EQbiDcvvrjyl1Oysr7lmmAWVO1zuU
6JamkZJSt7nL7BNr8UbeCd9zV9r5M83L/vx2iX2ZLjt/4ekFUR/PKXwuHO+kDomj
eXU7hJTMlMzYZczHGZFSRGetnjYFwNw2nhngq5rNNOJPMBCjky6r53Ay5kKjWj7p
JGfE7u9jLwPvEZ8NkN5p4BdijUohmxsPMHhYAd0OJ+/3A7GVeBOM8BJgmKh8oeof
dFSqRinhsvJv8BN23yPEgUnB00PykvuPoe4qBKxIYlaQSzeNzL6HYYnDsBgu3HAc
UYDGl3cwYcbKsFJ+qm/u3BP0j+XNjnOKsjlAWjlPcPaNZMbYGryQUFn1UyIRR9jU
/Z4aQ3Mvl3qfLx3AhcsSis00IK0OAp7WG7FzcWALaseN5qlh0flKx87gFT8DMXLQ
T0nuh9Q8aR16RcTy5uzy+y8ymDUI74G9x0pImmut/tNhGgxlrrvBlKfexZ/0Qbng
vRqsBhAwm42rM0ff3XhtLDzhYlEo2Qfjs7wPUagHvY3nGg/Vl+Y=
=k/X0
-----END PGP SIGNATURE-----

--bxazby72sxylsoos--

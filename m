Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8AA36CE1E
	for <linux-tegra@vger.kernel.org>; Tue, 11 Nov 2025 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762879052; cv=none; b=gAwq8Q4C9dTspTwSb2aFow3CuL9gV+9V74fL92Tgd3PW6uvOQqAr4S+twGIYH0sQLIzOFfvd3QF6ZvhMRqzzbkIITaG+0b6LOkyQANQFBU1a+xTagQ8/BP/gx8jsWcmT2IOWZbjravTeAsw1CKJU0Wj78/kZf0ipvdtXHHwy/5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762879052; c=relaxed/simple;
	bh=Kk7Nvqf3DpZZL/JeU4bI8EvbNH8Ly5HQtMkZZD88cYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaaUffF8Vxze6nVKPIB6+5ndWlGoHQVUcJMwoQ03JlfP445vsF/evAl6PGGlY9jDpCRFNM2nZ2N3gFcsZFv5JGGG3ULHlo95sfereiVtnL8qfHh0OFpNPI1tC/rXuLR6WLPn95MhCGMHmwMyt899Uqwmghdo3Q/k11FGgjnuYdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBNQyqr0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBNQyqr0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47117f92e32so38732965e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 11 Nov 2025 08:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762879049; x=1763483849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4No0QNFf/L18xTG1SvZbfs74no8h/OOppd/gdjh6N2o=;
        b=iBNQyqr0blWtJy6F2zXP2N0irGy7QereHIDBP0EEaaj9QqDxBwsfoYWqsDabUrmxfE
         rWPKB1V964JtDVQx973NEoE+6CDbS9U3TUpoeJVAPUriAV05NiXgd3/HsxkOjlyPCmxs
         gBCGm5zRkCyvYQNaK8JG2P5QYD3ng4sGytHCGJwT9exwWp3/jWEwx7z/wVYAI+TkoJI9
         5ADwiEIXm+3C1w6XcQ6zZGFF9lSQWxfvKOhPq4QZ0hS7ot5gYGyTT3OjbwXv2wOG2VE1
         GlJSflUnokOdmUgiZcFhOnIotEor0wOLJESPphD8NzqVs66pClYaTiZyoMUkxWV+etO2
         U9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762879049; x=1763483849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4No0QNFf/L18xTG1SvZbfs74no8h/OOppd/gdjh6N2o=;
        b=DdyuT3ys8PjumdwBUCs8nKvHO4RHmbNZf0/j6+csJD7Raj+VfM39zpQ7b0d5s5CknH
         OHP15Q5OgFNk5Uo3SiMGXZgIbyy9xlJq9ZQdwsTs82lko9cHjPNuSl/Argp3naxGTlu2
         A2YWRnM2a04hCpDZ34hprIs55WM9mgGJvm2QIsncOpNo2gYo0b0xQDSNFz/bF1uUOEvm
         3m5LhwWDi05fHHlOh15UGKOuaquA3vR7384iXmGrb0ANpTaRYry7JAGhG/kAT55SU2kg
         PXbZvJJJaTYo571Jk0Eax3u6UTdKf9RbUKt1qTChzffMXjdGTbrh3YbGp4/eUy29EcLT
         +p4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPf3iU11UBebfpovaoV6x12LgLVV6blGnj2e3tn2GN/uRkMs/MZ+nba4W9sxXhuldxUfZFb/j4fLr3Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIod/H1bKtCcWJSsTfZsPwMa6/JG89/Ld34iQZ1zLwB744vjyS
	qv1NADbdkWAcZ4CyhNyaXt8cGQ85qqx48L9ezvF/hiECuWsONxtkUSrXbYD4RQ==
X-Gm-Gg: ASbGnctb1r0xj8CLnqBhcThkcCLuT15B1mlWJ/bMLAcKtnbd+NpfvdRR+28cWOZjKgP
	mpZcnYsL+CV0nfMNxh1yT+lyu6QLzP0E3D03P605OyIDPX36txIwlvMCCmzLbgSM4UPQo8iCLGu
	xTcpv+eRAa4PgsaDvcylqIZvU6GVM3/ecj1Rv1WHsjGTiaOxhbvo8bblIQ/Cm7m+T8fc5G8FW0J
	3hef48G7tSLQkqVPg3XPqAELbQx8H/5M3hz+bsxKV0KCQbmnl/k8gpULB74hcP+9K+YO4MpWDnL
	Xun4kUr7ae5xdby/f6T0TQH2u9ICLGknjcGGijPfgHxRAmMPsL8x9Nj5/C7lFjhGOy6zSNPt0qQ
	Zu+RAUqtDJtjaTZ5WGrNATKCDAEPl+0IU5OvYFdZ3uYITJsdcQMAoN5ZU4ZmjXG/lqtLEwuy2gn
	neD2xTjVpOncgQ6OUOByiTN2fdpWGIxMLKK3XURSmrWPMEdr1HWEI62p8hUszz64rz3VNrHvrI2
	A==
X-Google-Smtp-Source: AGHT+IEolKhWhDeSc/C/7BpvjlFjYTbQ+YMrNBX8pYXb4ZUFryolOAKjkIoLPEuk/FEbpi/Z7B2VUA==
X-Received: by 2002:a05:600c:1c8a:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-47786ff784dmr1034295e9.0.1762879049175;
        Tue, 11 Nov 2025 08:37:29 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47781d44579sm22526935e9.4.2025.11.11.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:37:27 -0800 (PST)
Date: Tue, 11 Nov 2025 17:37:25 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Vedant Deshpande <vedantd@nvidia.com>, Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
	Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep
 nodes
Message-ID: <g6dixnq2xngzulk4j37bvprrrzai43nst4l72b4gksjfbsrhjb@fqrvjvwlhclf>
References: <20251009142253.2563075-2-cassel@kernel.org>
 <cvbvbshg4asz4ddrtsotsjc5srouwktirpxbhsjdmlxfzklytd@7sav35bkcmm3>
 <aRM8yTtKBVEMSsQK@ryzen>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="75h6xkwcvfl3tr3p"
Content-Disposition: inline
In-Reply-To: <aRM8yTtKBVEMSsQK@ryzen>


--75h6xkwcvfl3tr3p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep
 nodes
MIME-Version: 1.0

On Tue, Nov 11, 2025 at 02:40:25PM +0100, Niklas Cassel wrote:
> On Wed, Nov 05, 2025 at 02:37:33PM +0100, Thierry Reding wrote:
> > On Thu, Oct 09, 2025 at 04:22:54PM +0200, Niklas Cassel wrote:
> > > When the PCIe controller is running in endpoint mode, the controller
> > > initialization is triggered by a PERST# (PCIe reset) GPIO deassertion.
> > >=20
> > > The driver has configured an IRQ to trigger when the PERST# GPIO chan=
ges
> > > state. Without the pinctrl definition, we do not get an IRQ when PERS=
T#
> > > is deasserted, so the PCIe controller never gets initialized.
> > >=20
> > > Add the missing definitions, so that the controller actually gets
> > > initialized.
> > >=20
> > > Fixes: ec142c44b026 ("arm64: tegra: Add P2U and PCIe controller nodes=
 to Tegra234 DT")
> > > Fixes: 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definitio=
n")
> > > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > > ---
> > > Changes since v2:
> > > -Add pinctrl definitions to all pcie-ep nodes, not just C4 controller.
> > >=20
> > >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 57 ++++++++++++++++++++++=
++
> > >  1 file changed, 57 insertions(+)
> >=20
> > Applied thanks. I did add blank lines between the blocks since that's
> > what I prefer. I hope you don't mind.
>=20
> Perfectly fine with me, you are the maintainer :)
>=20
> However, I don't see this patch queued on any branch @
> https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/
>=20
> Did you perhaps forget to push?

Yes, of course I did. =3D) I was waiting for feedback on a quick patch I
added to the branch and then forgot to push out. Should all be up-to-
date now on kernel.org.

Thierry

--75h6xkwcvfl3tr3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkTZkIACgkQ3SOs138+
s6HpexAAn2ugjuuPGj+VEo0hz3MPmYh/Bp+7+NtkgEYoiWg22IVAvA7cE0Orvceo
kxHRqmF05hRZyW/ssdQy/VHs0XfUlk3d8kc3N3ydE5zQxxD86SlqjYhSgwmu5fJ+
gBIeLoAmqSGH7SbZ3aluS4HMFfmhNvEbzqfC8xiv5nRIpIV7Ws/wkQz2cACbUWk5
DB1/5/fNyfmaAHf5kYymqviYqzGGNWmbqKEN+VuAS5oX/flXrMQML95Wj6oiWY6T
xuDLTr60JLMTM7EDNpNwyqYOFhi/MQpEurNnkBC4G5/nqu80o6aMlr269PyjchYh
ELHvFEFHbhMKAuSbcuz3bbL3H4uz8LttcZWeWA0o6LA0GqYBUfVl5fCIntRXbqE2
M49JoFFdZc/SBZDy5oPswfebUdb5+U2TNPoFZWbiKDoEU/cShj17p1ghcBd11H5S
cxgIugHYtlRoUVuZ0uim8NJKpQY64Zgvgfj0zhWHkMkhK2DqGEkGuSWVjcRXdGtA
jNvAH3MvUsHC6TAUU2aUD+uOVszIufj87BQpyWqYXkV0aLfTovnHzrdmWrDZfMeM
vnhohRSFfUQolM8bVIiEvwwnfuvNK++SZI0IeUyHNHgr7kYsdcNi4ripuOd13val
NL909gH/1Sqg6O2QdKUpG8Pq30mAk98RCXF+8okaKrbt9Pokm10=
=5u+O
-----END PGP SIGNATURE-----

--75h6xkwcvfl3tr3p--

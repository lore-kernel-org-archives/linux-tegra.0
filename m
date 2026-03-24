Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1863EC2FA;
	Tue, 24 Mar 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352020; cv=none; b=QwOKUykg2EljNqmuiv9tgbN8JyBiUt4KRJRjPaLZwYkkhnqBIvOe4PWyzk9tMuebdOtKXQvS+aubgr+AhSA0CcIWhy+1NDjCeTRa3cMLAY1r787jOoJfRMkE0DppqdNt7mGeiCUu6eZrx0kufLDJx0dHv+OPMa9YX3YyOMZuhuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352020; c=relaxed/simple;
	bh=99TVMl3JW+OzCcx488nZY5x3ldIcx7HNxDjx62+MIgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRDrjZTQYhDxl3STiV2V8sMT0/K3fd4RGdS1H80TPBosXvE7SVbFGv3+18DhJzeJzCdPeCLibPXC4pmYx5eA/BlgLRnHSBimnpLq+/i4gmUbf3+QbZwL/pqC9s8F3XFFSdQldZPRHRyBgsg/38Ui21Ghdp90ezQxWm4sn9fK4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tY03rrAa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tY03rrAa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24B3C2BCB1;
	Tue, 24 Mar 2026 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774352020;
	bh=99TVMl3JW+OzCcx488nZY5x3ldIcx7HNxDjx62+MIgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tY03rrAaqprhQlwExmqCkXCH4GGc7+nqQeXh/pKy/qsfRO8/eYJ3U44SVVjNHQRB8
	 jqV+TtzVm9izG4WlL3Gkkn1J39yu3Sc05oTIOKWi5YSlNp1GsiT+Avstx9JPrhj1ln
	 mq53FqxkA/GlRKMWy6iyUiMTJeZKagRzo2IsD3BHDzndUgSRmdP50gf0ri5PVsiOoh
	 zQxITsJNnoxFp5a7FvUfrzyaLWOl/+XKaa8/1bvA20RU4japZZvJ2ig7Fj7NQkmO9c
	 HmVr/g53Iy3eH2AdVMMgE09MIqCw6rt71Dhir76B2fCytzHWwgINoDnBCXGY0wgOyM
	 6YGY40F0qC26g==
Date: Tue, 24 Mar 2026 12:33:37 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
Message-ID: <acJ1humept5gbQlF@orome>
References: <20260324015722.12507-1-rosenp@gmail.com>
 <2776817.iZASKD2KPV@senjougahara>
 <CAKxU2N9E-9HLCJfGYD_r+qaW03fLz9NVW=RWuPvotCbSxv3ueA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n4re3oqpewphuzdd"
Content-Disposition: inline
In-Reply-To: <CAKxU2N9E-9HLCJfGYD_r+qaW03fLz9NVW=RWuPvotCbSxv3ueA@mail.gmail.com>


--n4re3oqpewphuzdd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
MIME-Version: 1.0

On Mon, Mar 23, 2026 at 11:42:18PM -0700, Rosen Penev wrote:
> On Mon, Mar 23, 2026 at 11:01=E2=80=AFPM Mikko Perttunen <mperttunen@nvid=
ia.com> wrote:
> >
> > On Tuesday, March 24, 2026 10:57=E2=80=AFAM Rosen Penev wrote:
> > > For this driver specifically, there's no arch specific stuff needed.
> > >
> > > Build the tegra clk stuff as tegra_bpmp_init_clocks is defined there.
> > > CLK_TEGRA_BPMP also depends on TEGRA_BPMP.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  v2: also build the tegra clk stuff.
> > >  drivers/clk/Makefile           | 2 +-
> > >  drivers/firmware/tegra/Kconfig | 4 ++--
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index 760d9643705f..334d5c522394 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -154,7 +154,7 @@ obj-$(CONFIG_ARCH_STM32)          +=3D stm32/
> > >  obj-y                                        +=3D starfive/
> > >  obj-$(CONFIG_ARCH_SUNXI)             +=3D sunxi/
> > >  obj-y                                        +=3D sunxi-ng/
> > > -obj-$(CONFIG_ARCH_TEGRA)             +=3D tegra/
> > > +obj-y                                        +=3D tegra/
> >
> > clk/tegra/Makefile doesn't separately check for ARCH_TEGRA, so this wil=
l cause
> > much of it to get built on non-Tegra platforms as well.
> Sure. It builds fine.

I think the point that Mikko was trying to make is that with the current
setup you get the Tegra clock code built on all platforms, whether you
enable ARCH_TEGRA or not. Meaning you will get this included in your
kernel builds even on x86 or MIPS systems, or ARM systems that don't
enable any Tegra code.

If you really want to make this build with COMPILE_TEST, the right way
to do so is by adding a dedicated Kconfig symbol that uses something
like:

	config CLK_TEGRA
	...
		depends ARCH_TEGRA || COMPILE_TEST

and then use that symbol instead of CONFIG_ARCH_TEGRA above:

	obj-$(CONFIG_CLK_TEGRA) +=3D tegra/

That way you ensure that it gets enabled for build testing or if Tegra
support is explicitly enabled.

Thierry

--n4re3oqpewphuzdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnCdo0ACgkQ3SOs138+
s6GqJxAAvKYcguGVJo3CGkeArznpCaci8udawE6f2USJR36erBNPEM1glZg211Jh
tTSj4/MQm9baQSHUab1bBEyFSGmOM6Oc2UKb2v409gkXmsJIk4T14drAXgjGpFgA
Xb0v/5+PVnnMGO70MJiah9ERroMsqYcDxpiuDvKXK8mEoJKYmpMMn8gzPCJbSS7V
ZFbVHX+6SbMV0IapnFgIhWzZyDpjAtY4/pAaWlKbSdQkUTXwLhK65nLiVI3UFQSI
TBYABgRG2qHyf+2Dws9a3A0j7aauKSOb8pRy3pRVBtbcOHQTuCnDduuJgJklZVy7
PPu/9SWj0B+JFWVb1PI5ihORSfbPTGzy/txFrkYWprnEbfd9QjgysfOSgWmux++q
zmwToOfC05fkKivwxsvDINGZe4siCPBs8Gx38ccPzWz5lg7bw2pPhUkP6DlIIKgT
hzRkLWFoEmifa4fmjK9EebaizaCtPdyvg0brg+zdIKFKly5CgYxg8L0G4/S+iwyo
iCD9gLBSVuXonLZjhaRsyrh2VexUsw6zk/qmu74iBUXkxUFEClECimPmtACmT/MO
g+7/bz0pYUfT8A6EoBIKHOBAYFiJBHMmNpxR1UNzLLbz3Rjerb5S1cnmLH6KaKXo
/5jpK2VWDCaUDQy39+wBYL+WTkdlzKGUuLCjN3tR2HBQzcCml5Y=
=OG3S
-----END PGP SIGNATURE-----

--n4re3oqpewphuzdd--

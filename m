Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5A347FCD;
	Thu, 28 May 2026 21:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002055; cv=none; b=j/6IJsSuwcyuXRuLr4cbdYUA4H1voZp/JRdUnme9UR8PwKUiMxgiO+lwb5ufE4jDnNlnFY75d/n3Yjz5+tP9YlDj+ZSRGaAyx+yfS/sH3GoS/qbwiiMtjSdjJh9NDy+dydOP/l9iwcotgD5tz98kvlTtB5ytJ0/+pLD8pkMJUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002055; c=relaxed/simple;
	bh=scqpE01w2v3DlF7szI9N4JR8IVpLIFAt/5cZzarTa1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0soGE57VAGjZ1fkU43e9IizWQ00Vmh4bGFB+QGsY76C1isFLdCxvlYC+1TwKZlGV4mIkZAVnioTEBTDsgSMIhmMJDzEdakuu2e7IwbAJcidGw4of82wi6JXm2gdw3OivflVi4mpTuuAU69D0bsBzkZXJ0gAyqYqpg5blHQ1Yxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Db3EWa59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Db3EWa59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD1B1F000E9;
	Thu, 28 May 2026 21:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780002054;
	bh=nfy99XpRFJ17c0eHmBRG62F1Uh29bT974fzT5PipAlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Db3EWa596svxh5rBnXHCDmDByZnIlMqGtQGQmJJkkFrPb6p2QubRPZt2HY91dthWP
	 SESXpX4sP/R59w9mT3gUf+ubpHgEMXo5KMe/y0+1kkIFZx5exlaEcljtSakgtewyH3
	 VyAvEzsXY89x0lvkWZJpz+8h46e9QAOtToVGr+/gySxntKtSpBNDZL9V/kWxgbhBrt
	 BzTVuh/2QazW4ctCpqaF22dVMDGbRTofwQDJHlBgLCHd0++tLtRTRXEcJZnN4Xs4Xw
	 B4EgUkZAWlyzxqI8ELazB9OaCiB1LHacVm80+USZAuvGB2FS+YqC21UCHaGzSIDV/U
	 c6Ep0nzbk5eIg==
Date: Thu, 28 May 2026 23:00:51 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tegra: ADX: use of_device_get_match_data
Message-ID: <ahistLuvEk58iz-E@orome>
References: <20260522015856.741656-1-rosenp@gmail.com>
 <ahimtheMu3fjdTf6@orome>
 <CAKxU2N-CboLr3X4_5eZSMeEEyvA8i=OT5=YJ71A_zzc7TK9aFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wdyowv57jijriazn"
Content-Disposition: inline
In-Reply-To: <CAKxU2N-CboLr3X4_5eZSMeEEyvA8i=OT5=YJ71A_zzc7TK9aFQ@mail.gmail.com>


--wdyowv57jijriazn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: tegra: ADX: use of_device_get_match_data
MIME-Version: 1.0

On Thu, May 28, 2026 at 01:41:27PM -0700, Rosen Penev wrote:
> On Thu, May 28, 2026 at 1:35=E2=80=AFPM Thierry Reding
> <thierry.reding@kernel.org> wrote:
> >
> > On Thu, May 21, 2026 at 06:58:56PM -0700, Rosen Penev wrote:
> > > Remove open coding of the function to simplify the code.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  sound/soc/tegra/tegra210_adx.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra21=
0_adx.c
> > > index 12371f895234..a2c28369fbc8 100644
> > > --- a/sound/soc/tegra/tegra210_adx.c
> > > +++ b/sound/soc/tegra/tegra210_adx.c
> > > @@ -677,17 +677,16 @@ static int tegra210_adx_platform_probe(struct p=
latform_device *pdev)
> > >  {
> > >       struct device *dev =3D &pdev->dev;
> > >       struct tegra210_adx *adx;
> > > -     const struct of_device_id *match;
> > > -     struct tegra210_adx_soc_data *soc_data;
> > > +     const struct tegra210_adx_soc_data *soc_data;
> > >       void __iomem *regs;
> > >       int err, i;
> > >
> > > +     soc_data =3D of_device_get_match_data(dev);
> > > +
> > >       adx =3D devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
> > >       if (!adx)
> > >               return -ENOMEM;
> > >
> > > -     match =3D of_match_device(tegra210_adx_of_match, dev);
> > > -     soc_data =3D (struct tegra210_adx_soc_data *)match->data;
> > >       adx->soc_data =3D soc_data;
> >
> > Why not just:
> >
> >         adx->soc_data =3D of_device_get_match_data(dev);
> >
> > ? That saves you a few temporary variables and since you're not moving
> > around the assignment needlessly, you get a much simpler diff, too.
> Because soc_data is used later on in this function. I'd have to add
> adx-> everywhere.

Hm... I guess that's what we should've done in the first place. Maybe
just leave the assignment in the same place to keep the diff tidy, then.
Also makes it easier to spot what you're actually doing.

Thierry

--wdyowv57jijriazn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYrQMACgkQ3SOs138+
s6F0vQ/9FlhKD6HZvWGc2lDT1x1N9Tg1SvJsbKPqmuMBkeyzxXBBMZQfx6peHf0r
uACKIIPTdtCGVf+YZ5fDD9CogcD2uYoshRMRjZ6fGP/s4+EkWHPGnqamGtNHytax
46Su8BFeOaAYYA0gCsd84HhPEsVF52n6njRar+5eXOqnWrvza+dS6jgkgZjf40tD
+o7zhz8vuhnAJ4XyPbLHh0/9J6BFsZRoEuy0/iZlhIAqcvvKTcwFfWul16/0JPO6
xDk9xgtm6JQWgFbzYImA8kkC90Wt4FopBxzUgzJ6Fjw6QRZo2UhuxGkzKCJN2xC6
P9/Hl/vI6qC0ij4ZXux0dL3B5UeVzqdvVsQ2uX0GdMhgCzBx1U8s8rj5bFqPN7nb
bQgymPebGMy7IupV74ziivP0j+i1MtqdoH9MbncKiQY9DR055mYjUv7cok3siGBg
kQmf1ZydjQZLCUyISTuFHsQP9W96hfZ0+1vpsydI794Uub4NVC69h9tRnU2M6VYs
O1pKNyzglxG7avJl+p6Hl3u3r8oddYWgX8SNV75Jwv/+f03HdbdC1jlMtiATltwg
keCP8kGU7FC3D0/9lJCDpQd5erS+xuwg27HG00Q2ATx81bMCttY+fDDFqQvIVa0x
lWfMeFmD/VMp2dp0NZM9svqbwh2GQQD6j0H+91n+bE7wCAya9WQ=
=dWio
-----END PGP SIGNATURE-----

--wdyowv57jijriazn--

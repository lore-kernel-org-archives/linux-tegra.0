From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH 3/3] sound: ASoC: tegra: Select tegra30 i2s
 and ahub for tegra124 SoC
Date: Sun, 07 May 2017 20:12:28 +0200
Message-ID: <1494180748.13734.6.camel@paulk.fr>
References: <20170418151159.31843-1-contact@paulk.fr>
 <d18b57d3-a44f-e44b-9bd5-526993dc91e4@wwwdotorg.org>
 <1492533513.3504.2.camel@paulk.fr>
 <41ef55f7-8f17-4ca3-4757-bfefb1fe8321@wwwdotorg.org>
 <1493046446.943.7.camel@paulk.fr>
 <fe76985c-ef66-9870-a616-203b54a93777@wwwdotorg.org>
 <1493059277.1111.1.camel@paulk.fr>
 <a29c4253-48de-7e61-dbc2-b90d68cfa696@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8363465738705693743=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <a29c4253-48de-7e61-dbc2-b90d68cfa696@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-tegra@vger.kernel.org


--===============8363465738705693743==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-468egk1DGeUk7/kMocwL"


--=-468egk1DGeUk7/kMocwL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 25 avril 2017 =C3=A0 10:57 -0600, Stephen Warren a =C3=A9crit=C2=
=A0:
> On 04/24/2017 12:41 PM, Paul Kocialkowski wrote:
> > Le lundi 24 avril 2017 =C3=A0 09:35 -0600, Stephen Warren a =C3=A9crit =
:
> > > On 04/24/2017 09:07 AM, Paul Kocialkowski wrote:
> > > > Le mercredi 19 avril 2017 =C3=A0 16:00 -0600, Stephen Warren a =C3=
=A9crit :
> > > > > On 04/18/2017 10:38 AM, Paul Kocialkowski wrote:
> > > > > > Le mardi 18 avril 2017 =C3=A0 10:15 -0600, Stephen Warren a =C3=
=A9crit :
> > > > > > > On 04/18/2017 09:11 AM, Paul Kocialkowski wrote:
> > > > > > > > This selects the tegra30 i2s and ahub controllers for the
> > > > > > > > tegra124
> > > > > > > > SoC.
> > > > > > > > These are needed when building without ARCH_TEGRA_3x_SOC se=
t.
> > > > > > > > diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kcon=
fig
> > > > > > > > index efbe8d4c019e..bcd18d2cf7a7 100644
> > > > > > > > --- a/sound/soc/tegra/Kconfig
> > > > > > > > +++ b/sound/soc/tegra/Kconfig
> > > > > > > > @@ -46,7 +46,7 @@ config SND_SOC_TEGRA20_SPDIF
> > > > > > > >=20
> > > > > > > > =C2=A0config SND_SOC_TEGRA30_AHUB
> > > > > > > > =C2=A0	tristate
> > > > > > > > -	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
> > > > > > > > +	depends on SND_SOC_TEGRA && (ARCH_TEGRA_3x_SOC ||
> > > > > > > > ARCH_TEGRA_124_SOC)
> > > > > > >=20
> > > > > > > Is this really a compile-time dependency?
> > > > > >=20
> > > > > > From a quick look at the code, I doubt this is really a build
> > > > > > dependency.
> > > > > >=20
> > > > > > > If so, don't we need to add T210 and T186 entries into that |=
|
> > > > > > > condition
> > > > > > > too,
> > > > > > > since we could be building a kernel with just T210/T186 suppo=
rt
> > > > > > > and no
> > > > > > > T124
> > > > > > > support?
> > > > > >=20
> > > > > > In the spirit of this patch, adding entries for other tegra
> > > > > > platforms
> > > > > > would
> > > > > > make
> > > > > > sense. Would you prefer that we leave out the dependency from
> > > > > > SND_SOC_TEGRA30_*
> > > > > > and only select the right I2S driver to use in each codec drive=
r?
> > > > > >=20
> > > > > > If not, we'd have to list all relevant platforms both in the
> > > > > > I2S/AHUB
> > > > > > drivers
> > > > > > and in each codec's rules (which is not necessarily and issue, =
but
> > > > > > there's
> > > > > > no
> > > > > > need to have artificial platform dependencies).
> > > > > >=20
> > > > > > What do you think?
> > > > >=20
> > > > > I think we should just remove most of these "depends on" since th=
ey're
> > > > > mostly set up to reflect runtime requirements rather than build t=
ime
> > > > > requirements. The only points I'd make are:
> > > >=20
> > > > I definitely agree we should do that for all the codec Kconfig opti=
ons.
> > > >=20
> > > > > 1)
> > > > >=20
> > > > > Everything should "depends on SND_SOC_TEGRA" simply so the option=
s
> > > > > don't
> > > > > show up and clutter menuconfig menus unless SND_SOC_TEGRA is enab=
led.
> > > >=20
> > > > Agreed.
> > > >=20
> > > > > 2)
> > > > >=20
> > > > > SND_SOC_TEGRA30_I2S does need the Tegra30 AHUB driver in order to
> > > > > compile/link, since it directly calls functions in that driver. T=
his
> > > > > is
> > > > > already handled by SND_SOC_TEGRA30_I2S doing "select
> > > > > SND_SOC_TEGRA30_AHUB".
> > > >=20
> > > > Agreed.
> > > >=20
> > > > > 3)
> > > > >=20
> > > > > The machine drivers all do e.g. "select SND_SOC_TEGRA30_I2S if
> > > > > ARCH_TEGRA_3x_SOC". This was an attempt to make the machine drive=
rs
> > > > > only
> > > > > pull in the relevant drivers for the SoC(s) being compiled for. I=
'm
> > > > > not
> > > > > sure this still makes sense; this won't work on kernels that only
> > > > > support T124/T210/T186 since ARCH_TEGRA_3x_SOC isn't enabled then=
.
> > > > > Should we just remove all those and make sure the defconfigs are
> > > > > updated
> > > > > to make sure the relevant I2S/AHUB/SPDIF/AC97 drivers are explici=
tly
> > > > > enabled? Perhaps we should default all the I2S/AHUB/SPDIF/AC97 to=
 y
> > > > > (which will only apply if SND_SOC_TEGRA is enabled)?
> > > >=20
> > > > I think it would be easier for everyone to just auto-select the mac=
hine
> > > > drivers
> > > > automatically based on the architecture (so we could have the list =
of
> > > > ARCH_TEGRA_*_SOC here) when SND_SOC_TEGRA is selected.
> > >=20
> > > I don't think selecting the machine drivers is the correct approach,
> > > since then they can't be disabled.
> > >=20
> > > Making certain machine drivers "default y if ARCH_TEGRA_nn_SOC" would
> > > address that,
> >=20
> > That's right, my mistake. Let's take that as the solution I'm backing t=
hen.
> >=20
> > > =C2=A0but still isn't very scalable since we need to go back and
> > > edit the Kconfig every time we define a new SoC, in order to add that
> > > SoC into the default statement.
> >=20
> > Well, that's what platform bringup is all about, isn't it? I think it m=
akes
> > a
> > lot more sense to have to add a new platform once (and it's not like on=
e
> > will
> > forget to look at the sound part when adding a new platform) rather tha=
n
> > requiring users to hand-pick the option.
>=20
> Personally I'd expect all the Tegra machine drivers to be enabled in the=
=C2=A0
> upstream defconfig files all the time, such that we don't need to make=C2=
=A0
> the Kconfig options default y, nor have users manually turn the relevant=
=C2=A0
> options on, at all.

I think I was previously mistaken about what the machine drivers are, so I =
got a
good occasion to find out about them an learn something new. Thanks!

Agreed regarding the machine drivers, they should indeed all be enabled in =
the
defconfig by default.

> > > > Not only does this preserve existing configs (including external on=
es
> > > > that
> > > > aren't part of the kernel tree), it also clearly maps which machine
> > > > driver
> > > > to use for which SoC instead of having users do it by hand.
> > >=20
> > > The machine drivers aren't terribly tied to SoCs by design; most of t=
hem
> > > would work on pretty much any SoC. They're only tied to SoCs as a
> > > side-effect of a machine driver being tied to a certain CODEC, and
> > > certain CODECS just by chance are only used (so far) on specific boar=
ds,
> > > which have specific SoCs.
> >=20
> > I'm a bit confused: aren't the machine driver (i2s/ahub/spdif/ac97) tie=
d to
> > specific hardware blocks that are found in specific SoCs and not in oth=
ers?
> > I
> > can see these blocks haven't evolved much across generations, but they'=
re
> > still
> > either part of a specific SoC or not, aren't they?
> >=20
> > The compatible strings in the common SoC dts seem to indicate that only=
 one
> > of
> > these blocks is found at a time.
>=20
> There are SoC-specific drivers for the components (Tegra20 I2S, Tegra30=
=C2=A0
> I2S, etc.), but the *machine* drivers generally don't know anything=C2=A0
> about that. DT instantiates the correct component drivers for the SoC,=C2=
=A0
> and the machine driver just uses whatever it's linked to without caring=
=C2=A0
> too-much/at-all about whether it's hooked to a Tegra20 I2S or a Tegra30=
=C2=A0
> I2S device.

That makes sense now. Regarding the SoC-specific components, would you agre=
e
with auto-selecting those based on ARCH_TEGRA_xx_SOC so that only the requi=
red
drivers are pulled-in? Otherwise, I'm also fine with explicitely enabling t=
hem
in the defconfig at this point.

Cheers,

--=20
Paul Kocialkowski, developer of free digital technology and hardware suppor=
t

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-468egk1DGeUk7/kMocwL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlkPY4wACgkQhP3B6o/u
lQyZxQ/+L1rNyYrkU+AcBgOljgAcziHjreJ/5Rxn3Njn6yCwraSgdcIYV2ufjlao
jY7sKfkytd17PBmUAhFUCUc9dDXtN5F7t3ubnanIrgGGZQxzbOIX/py/vQl06qLZ
mQi+JNdQckKKltsUndY9Dc50SMWpxajjbYO5TE9lwRb33N6kYJoprqDxFWaCnXDE
f2Zyu7RLWOhPZpzpWwswcZ1eVcd7ZCQDIh6t6LxVB79yySF3Ez8tPZdzWZxwqnAd
8E3piJB02x6VFEuBo0YixRgYAl+OJVnNdl5mvM7/SR/2oQT2DlozhWjEA4QC41pN
aYV7ruHPTKuRgL6tB2PhdJQjZJHNtsma7zqeYINFpAqB5+ZQ51b7soE+8e1UWve8
5P2qLfOkjXmdywU396wYuix4xc9y2J56xFtilD7ExC/3/jTf5VtXhoJn/ZnSS18Z
Ae7rdjvI3fG80EnEOPvLth9aMMKhGyjXo0Et8A/28TVorjo4EeCMpaGG2ogyYbhI
JYUMB0eZorkYCadP5h28qOCUO1lsGbYjld3xz2qCsn9oaSyV/OvRUxYqWyJPPFqj
TwmSE3rPORVqm86YpLowNmLSWMbxldZQyDFPRm3p2iJ93JIeewhoOyGSzsXNt1Us
hhOV5eSRoUVVyNeNvOnnp9GcfSagu6a1IFgBLpSoFdnf2GWyQi8=
=I6e4
-----END PGP SIGNATURE-----

--=-468egk1DGeUk7/kMocwL--


--===============8363465738705693743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8363465738705693743==--

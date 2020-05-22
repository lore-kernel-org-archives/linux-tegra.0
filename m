From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
Date: Fri, 22 May 2020 17:26:45 +0200
Message-ID: <20200522152645.GB2377357@ulmo>
References: <aed72c87-0e16-6dea-a4e2-7fc6a97cd313@nvidia.com>
 <c7469c16-f6f1-f9c0-566f-3b1d3774f130@nvidia.com>
 <c712de1d-cfa4-2746-ec6b-54f318aeaac2@nvidia.com>
 <d2c71267-e696-c459-fbd6-dbb5fd312ed3@gmail.com>
 <CAPDyKFqdeGyQpXpM+xynd_rWbi0S6hCeQS1Dyiy6Hd2E_yfHpg@mail.gmail.com>
 <96f917a3-d822-1c36-d088-3e4a322c1761@nvidia.com>
 <20200522121357.GD2163848@ulmo>
 <2fa9db46-e310-dbbc-e1f7-f7058435a688@gmail.com>
 <20200522123437.GF2163848@ulmo>
 <920b9fdb-4435-b0d1-3f54-08a8ce97946d@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <920b9fdb-4435-b0d1-3f54-08a8ce97946d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2020 at 08:22:47AM -0700, Sowjanya Komatineni wrote:
>=20
> On 5/22/20 5:34 AM, Thierry Reding wrote:
> > On Fri, May 22, 2020 at 03:18:40PM +0300, Dmitry Osipenko wrote:
> > > 22.05.2020 15:13, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > On Wed, May 20, 2020 at 09:09:33AM -0700, Sowjanya Komatineni wrote:
> > > > > On 5/20/20 4:26 AM, Ulf Hansson wrote:
> > > > > > On Wed, 20 May 2020 at 04:00, Dmitry Osipenko <digetx@gmail.com=
> wrote:
> > > > > > > 19.05.2020 23:44, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
> > > > > > > > On 5/19/20 12:07 PM, Sowjanya Komatineni wrote:
> > > > > > > > > On 5/19/20 11:41 AM, Sowjanya Komatineni wrote:
> > > > > > > > > > On 5/19/20 11:34 AM, Sowjanya Komatineni wrote:
> > > > > > > > > > > On 5/19/20 9:33 AM, Dmitry Osipenko wrote:
> > > > > > > > > > > > 19.05.2020 19:24, Thierry Reding =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
> > > > > > > > > > > > > On Tue, May 19, 2020 at 05:05:27PM +0300, Dmitry =
Osipenko wrote:
> > > > > > > > > > > > > > 19.05.2020 10:28, Ulf Hansson =D0=BF=D0=B8=D1=
=88=D0=B5=D1=82:
> > > > > > > > > > > > > > > On Sat, 16 May 2020 at 17:44, Dmitry Osipenko=
 <digetx@gmail.com>
> > > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > Several people asked me about the MMC warni=
ngs in the KMSG log and
> > > > > > > > > > > > > > > > I had to tell to ignore them because these =
warning are
> > > > > > > > > > > > > > > > irrelevant to
> > > > > > > > > > > > > > > > pre-Tegra210 SoCs.
> > > > > > > > > > > > > > > Why are the warnings irrelevant?
> > > > > > > > > > > > > > That's what the DT binding doc says [1].
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > [1]
> > > > > > > > > > > > > > https://www.kernel.org/doc/Documentation/device=
tree/bindings/mmc/nvidia%2Ctegra20-sdhci.txt
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Although, looking at the driver's code and TRM =
docs, it seems
> > > > > > > > > > > > > > that all
> > > > > > > > > > > > > > those properties are really irrelevant only to =
the older Terga20
> > > > > > > > > > > > > > SoC. So
> > > > > > > > > > > > > > the binding doc is a bit misleading.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Nevertheless, the binding explicitly says that =
the properties are
> > > > > > > > > > > > > > optional, which is correct.
> > > > > > > > > > > > > Optional only means that drivers must not fail if=
 these properties
> > > > > > > > > > > > > aren't found, it doesn't mean that the driver can=
't warn that they
> > > > > > > > > > > > > are missing.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Quite possibly the only reason why they were made=
 optional is because
> > > > > > > > > > > > > they weren't part of the bindings since the begin=
ning. Anything added
> > > > > > > > > > > > > to a binding after the first public release has t=
o be optional by
> > > > > > > > > > > > > definition, otherwise DT ABI wouldn't be stable.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > I think these warnings were added on purpose, tho=
ugh I also see that
> > > > > > > > > > > > > there are only values for these in device tree fo=
r Tegra186 and
> > > > > > > > > > > > > Tegra194
> > > > > > > > > > > > > but not Tegra210 where these should also be neces=
sary.
> > > > > > > > > > > dt binding doc we have is common for MMC, SD and SDIO=
 of all Tegras.
> > > > > > > > > > > Its not mandatory to have both 3v3 and 1v8 in device =
tree as based
> > > > > > > > > > > on signal mode.
> > > > > > > > > > >=20
> > > > > > > > > > > As these driver strengths are SoC specific, they are =
part of Tegra
> > > > > > > > > > > SoC specific device tree where same values will be ap=
plicable to all
> > > > > > > > > > > Tegra SoC specific platforms.
> > > > > > > > > > >=20
> > > > > > > > > > > Based on interface usage on platform, we use one or b=
oth of them
> > > > > > > > > > > like sdcard supports dual voltage and we use both 3V3=
 and 1V8 but if
> > > > > > > > > > > same interface is used for WIFI SD we use 1V8 only.
> > > > > > > > > > >=20
> > > > > > > > > > > So made these dt properties as optional.
> > > > > > > > > > >=20
> > > > > > > > > > > Other reason they are optional is, Tegra210 and prior=
 has drive
> > > > > > > > > > > strength settings part of apb_misc and Tegra186 and l=
ater has driver
> > > > > > > > > > > strengths part of SDMMC controller. So,
> > > > > > > > > > >=20
> > > > > > > > > > > - Pinctrls "sdmmc-3v3-drv" and "sdmmc-1v8-drv" for dr=
iver strengths
> > > > > > > > > > > are applicable for Tegra210 and prior.
> > > > > > > > > > > - dt properties pad-autocal-pull-up/down-offset-1v8/3=
v3-timeout are
> > > > > > > > > > > for T186 onwards for driver strengths
> > > > > > > > > > >=20
> > > > > > > > > > > Looks like dt binding doc need fix to clearly documen=
t these based
> > > > > > > > > > > on SoC or agree with Yaml we can conditionally specif=
y pinctrl or dt
> > > > > > > > > > > properties based on SoC dependent.
> > > > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > > > > Adding Sowjanya who wrote this code. Perhaps she =
can clarify why the
> > > > > > > > > > > > > warnings were added. If these values /should/ be =
there on a subset of
> > > > > > > > > > > > > Tegra, then I think we should keep them, or add t=
hem again, but
> > > > > > > > > > > > > perhaps
> > > > > > > > > > > > > add a better way of identifying when they are nec=
essary and when
> > > > > > > > > > > > > it is
> > > > > > > > > > > > > safe to work without them.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > That said, looking at those checks I wonder if th=
ey are perhaps just
> > > > > > > > > > > > > wrong. Or at the very least they seem redundant. =
It looks to me like
> > > > > > > > > > > > > they can just be:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > >       if (tegra_host->pinctrl_state_XYZ =3D=3D NU=
LL) {
> > > > > > > > > > > > >           ...
> > > > > > > > > > > > >       }
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > That !IS_ERR(...) doesn't seem to do anything. Bu=
t in that case, it's
> > > > > > > > > > > > > also obvious why we're warning about them on plat=
forms where these
> > > > > > > > > > > > > properties don't exist in DT.
> > > > > > > > > > > As drive strengths are through dt properties for T186=
 and later and
> > > > > > > > > > > thru pinctrl for T210 and prior, driver first checks =
for dt autocal
> > > > > > > > > > > timeout pull-up/down properties and if they are not f=
ound, it then
> > > > > > > > > > > checks for presence of pinctrl_state_xyx_drv only whe=
n valid
> > > > > > > > > > > pinctrl_state_xyz is present.
> > > > > > > > > > >=20
> > > > > > > > > > > Driver expects either pinctrl or dt properties and sh=
ows warning
> > > > > > > > > > > when neither of them are present as its mandatory to =
use fixed
> > > > > > > > > > > driver strengths when auto calibration fails.
> > > > > > > > > > >=20
> > > > > > > > > > >       err =3D device_property_read_u32(host->mmc->par=
ent,
> > > > > > > > > > >               "nvidia,pad-autocal-pull-down-offset-3v=
3-timeout",
> > > > > > > > > > >               &autocal->pull_down_3v3_timeout);
> > > > > > > > > > >       if (err) {
> > > > > > > > > > >           if (!IS_ERR(tegra_host->pinctrl_state_3v3) =
&&
> > > > > > > > > > >               (tegra_host->pinctrl_state_3v3_drv =3D=
=3D NULL))
> > > > > > > > > > >               pr_warn("%s: Missing autocal timeout 3v=
3-pad drvs\n",
> > > > > > > > > > >                   mmc_hostname(host->mmc));
> > > > > > > > > > >           autocal->pull_down_3v3_timeout =3D 0;
> > > > > > > > > > >       }
> > > > > > > > > > >=20
> > > > > > > > > > > > > So I think we either need to add those values whe=
re appropriate so
> > > > > > > > > > > > > that
> > > > > > > > > > > > > the warning doesn't show, or we need to narrow do=
wn where they are
> > > > > > > > > > > > > really needed and add a corresponding condition.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > But again, perhaps Sowjanya can help clarify if t=
hese really are only
> > > > > > > > > > > > > needed on Tegra210 and later or if these also app=
ly to older chips.
> > > > > > > > > > > > Either way will be cleaner to convert the DT bindin=
g to YAML rather
> > > > > > > > > > > > than
> > > > > > > > > > > > clutter the driver, IMO.
> > > > > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > Auto calibration is present from Tegra30 onward and loo=
king into
> > > > > > > > > > change where autocalibration was added to sdhci driver =
somehow it was
> > > > > > > > > > enabled only for T30/T210/T186/T194.
> > > > > > > > > >=20
> > > > > > > > > > tegra_sdhci_parse_pad_autocal_dt() was added when auto-=
calibration
> > > > > > > > > > was added to driver and I see this dt parse is being do=
ne
> > > > > > > > > > irrespective of NVQUIRK_HAS_PADCALIB quirk so even on p=
latforms
> > > > > > > > > > without auto cal enabled in driver, these messages show=
s up.
> > > > > > > > > >=20
> > > > > > > > > > This should be fixed in driver to allow
> > > > > > > > > > tegra_sdhci_parse_pad_autocal_dt() only when NVQUIRK_HA=
S_PADCALIB is
> > > > > > > > > > set to avoid dt parsing to happen on platforms that don=
't have auto
> > > > > > > > > > cal enabled.
> > > > > > > > > Warning on missing drive strengths when auto cal is enabl=
ed should be
> > > > > > > > > present as we should switch to fixed recommended drive st=
rengths when
> > > > > > > > > auto cal fails.
> > > > > > > > >=20
> > > > > > > > > So probably proper fix should be
> > > > > > > > >=20
> > > > > > > > > - allow tegra_sdhci_parse_pad_autocal_dt() only when
> > > > > > > > > NVQUIRK_HAS_PADCALIB is set
> > > > > > > > >=20
> > > > > > > > > - current driver sets NVQUIRK_HAS_PADCALIB for T30 as wel=
l so need to
> > > > > > > > > add pinctrls "sdmmc-3v3-drv" and "sdmmc-1v8-drv" to Tegra=
30 device tree.
> > > > > > > > [Correction] T30 has same drive strengths to use irrespecti=
ve of signal
> > > > > > > > voltage and it doesn't have pad control. So for T3- we can =
update device
> > > > > > > > tree to specify "default" pinctrl with drvup/dn settings.
> > > > > > > > > - Keep warning message of missing auto cal timeouts as it=
s mandatory
> > > > > > > > > to use fixed recommended driver strengths when auto cal f=
ails.
> > > > > > > > >=20
> > > > > > > > Regarding warnings, I guess simpler and easy fix is to remo=
ve warning
> > > > > > > > message on missing 3v3/1v8 drive strengths as pinctrl/dt pr=
operties were
> > > > > > > > already added for T210/186/194 where we need and old device=
 tree don't
> > > > > > > > have them but the case where auto cal can fail is very rare.
> > > > > > > >=20
> > > > > > > > Otherwise should update driver to allow
> > > > > > > > tegra_sdhci_parse_pad_autocal_dt() only when NVQUIRK_HAS_PA=
DCALIB is set
> > > > > > > > and also within tegra_sdhci_parse_pad_autocal_dt() show war=
ning of
> > > > > > > > missing 3v3/1v8 settings only when NVQUIRK_NEEDS_PAD_CONTRO=
L is set.
> > > > > > > >=20
> > > > > > > > Thierry, please suggest if you prefer to removing warnings =
or fix driver
> > > > > > > > to show warning based on PADCALIB and PAD_CONTROL quirks.
> > > > > > > The SDIO PINCTRL drive-strengths are usually a part of the bo=
ard's
> > > > > > > default PINCTRL state, which is either preset by bootloader o=
r by
> > > > > > > PINCTRL driver early at a boot time.
> > > > > > >=20
> > > > > > > The SDIO drive-strengths values should be board-specific and =
not
> > > > > > > SoC-specific because they should depend on the electrical pro=
perties of
> > > > > > > the board, IIUC.
> > > > > Drive strengths we program here when auto calibration fails are r=
ecommended
> > > > > values based on pre-SI circuit analysis and characterized across =
PVT.
> > > > >=20
> > > > > So,=C2=A0 these fail safe values are same for all boards of speci=
fic SoC as all
> > > > > platform designs follow the design guidelines.
> > > > >=20
> > > > > > > If the SDIO PINCTRL states are mandatory for the SDHCI nodes =
in the
> > > > > > > device-trees, then the DT binding is wrong since it says that=
 all
> > > > > > > properties are optional. But I think that the current binding=
 is okay,
> > > > > > > since today SDHCI PINCTRL drive-strengths are specified impli=
citly in
> > > > > > > the device-trees, and thus, there is no real need to emit the=
 noisy
> > > > > > > warnings in this case.
> > > > > > For now I will keep $subject patch applied, but please tell me =
if I
> > > > > > should drop it so we can start over.
> > > > > >=20
> > > > > > In any case, I would appreciate it if someone could have a stab=
 at
> > > > > > converting sdhci and tegra DT bindings to yaml.
> > > > > >=20
> > > > > > Kind regards
> > > > > > Uffe
> > > > > HI Uffe,
> > > > >=20
> > > > > Please drop $subject patch. Will send patch that allows parsing f=
or these
> > > > > properties only for SoC where auto cal is enabled as that's where=
 driver
> > > > > needs these properties.
> > > > >=20
> > > > > So with this fix, warning will not show up on systems where autoc=
al is not
> > > > > enabled.
> > > > Yes, I think that's a better option. Have we ensured that on all sy=
stems
> > > > where autocal is enabled these values are part of the device tree? =
Just
> > > > making sure that we're not going to have some generation still spit=
 out
> > > > these warnings because we forgot to update the device tree.
> > > >=20
> > > > For example I see that we set NVQUIRK_HAS_PADCALIB but I don't see =
these
> > > > properties being set in arch/arm/boot/dts/tegra30.dtsi. Can you add=
 a
> > > > patch that also adds the properties for Tegra30?
> > > I don't see the warnings on T30 using Sowjanya's patch which checks f=
or
> > > NVQUIRK_NEEDS_PAD_CONTROL and not NVQUIRK_HAS_PADCALIB.
>=20
> Both of these quirks are different.
>=20
> PADCALIB is for auto calibration support.
>=20
> NEEDS_PAD_CONTROL is for SoC having separate 3V3 and 1V8 pads where they
> have pad state selection and also diff drive strengths apply based on 3V3
> and 1V8 which are used only when auto cal is not used/failed.

Great, would you mind sending out a patch that describes their uses
somewhere above their definitions? It'd be good to have this documented
in the code in case this ever comes up again.

Thierry

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7H7zUACgkQ3SOs138+
s6EmqxAAuXfPYU0myP2T6GJpitcn0FqpG/me0fl9uX8YJIV4ZzSywFF8nzhH5ib1
EqcNwl7znnpX61wec6n8H6wIjgNd5GaCTTQFEUk4EKV+9efKu/uxpR5jvKD+kLxs
eA9EBzoPsXZQw7TcM1eloYJFYePIwEAnLPD9itYhiStZvrxJ7/YrtbMoCqcyWqcV
BTFnA1cLUDmi02X9lN3nTvSHA5fNuLTFkiZg2wGAqQAA4+FtTWYfsUyYN9wN/ECX
qaIMFUu9pfBQLhoS0evqKQL3gz3uDRudxb/7NaVkya6UZDkZ74OeGA7mhY9Ady92
eYuL+J2nBQq30rO8Hmmd1JPSyJeBaZTEyITXic06L/6e8wFBl0E/v6NE/86HdyQO
CI2VoVPQbNaQlwiQRsA4F/AmO5Voh8tOoOlKu8rw+rN+oayWKGojyRlNvEbe271K
QRD3raBwCr0kaJC0q8h0vXxgwjNuIfglhn18m5KpHPayQwpAxt8PbxTSLBsHBeMy
eKS+QBb+4W3uoNyc0bJFMUSWQyStuByPefvzNgd2/bOEVhqqt9J4Jx+v9Q/v1UbX
B3WtCbg3GpI2uRwATFmqlRtaUSpjEwrWRrK37HTaMArPaWaVYX3OE4vTLeD5LfYa
n6LS/GxErUDjXGfXyMSxMnaG3NoJpI8lIlykWmbxICHZz7EvjrM=
=4o6G
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--

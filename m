From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 4/9] soc/tegra: Changes for v5.1-rc1
Date: Fri, 15 Feb 2019 22:42:07 +0100
Message-ID: <20190215214207.GA12838@ulmo>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
 <20190208150935.32108-5-thierry.reding@gmail.com>
 <CAK8P3a2tSaHsAOarZ8NHO-N4ZcLQL2rD2ti1rAe4meidWbVNEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5455359163277778729=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a2tSaHsAOarZ8NHO-N4ZcLQL2rD2ti1rAe4meidWbVNEw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Timo Alho <talho@nvidia.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============5455359163277778729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2019 at 05:25:39PM +0100, Arnd Bergmann wrote:
> On Fri, Feb 8, 2019 at 4:09 PM Thierry Reding <thierry.reding@gmail.com> =
wrote:
>=20
> > ----------------------------------------------------------------
> > soc/tegra: Changes for v5.1-rc1
> >
> > This contains a couple of miscellaneous fixes for minor issues and a
> > largish rework of the PMC driver to make it work on systems where the
> > PMC has been locked down and can only be accessed from secure firmware.
>=20
> Pulled into arm/drivers.
>=20
> > ----------------------------------------------------------------
> > Jon Hunter (1):
> >       soc/tegra: pmc: Make tegra_powergate_is_powered() a local function
> >
> > Joseph Lo (1):
> >       soc/tegra: fuse: Fix typo in tegra210_init_speedo_data
> >
> > Mikko Perttunen (1):
> >       soc/tegra: pmc: Support systems where PMC is marked secure
> >
> > Thierry Reding (6):
> >       soc/tegra: pmc: Use TEGRA186_ prefix for GPIO names
> >       soc/tegra: pmc: Sort includes alphabetically
> >       soc/tegra: pmc: Add missing kerneldoc
> >       soc/tegra: pmc: Pass struct tegra_pmc * where possible
> >       soc/tegra: pmc: Make alignment consistent
> >       soc/tegra: pmc: Explicitly initialize all fields
> >
> > Timo Alho (1):
> >       soc/tegra: fuse: Fix illegal free of IO base address
>=20
> Should that last one have been marked 'Cc:stable' ?

My understanding is that this currently only happens if we boot the
system using a DTB from a downstream build where these FUSE and BPMP
device tree nodes are sorted differently and therefore cause them to
be probed in the wrong order.

Booting an upstream kernel with a downstream DTB isn't known to work
very well in general. It's something that I hope we'll be able to do
in some distant future when the gap between upstream and downstream
DTBs has become sufficiently small, but I don't think we need to
bother fixing this in stable releases.

Adding Timo to clarify whether he thinks this is important enough to
backport.

Thierry

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxnMisACgkQ3SOs138+
s6H4wg/5Aa7RYMzZepcEY2x+X6Vk5FWr1FRVrEavfuX0Fu/MJdfZXlwcfN54sW3s
oLdZGV9uBTwL/WTyLcpWY4JaYZTYClIl3Li3AlveE2xvU2XN1FX3SHR5/xigrAqF
q3T/3KcJ4XNx0ds0QcaQH3REybadxzih5pGyJYbTL0NxxCaGb52CQbyiLoEQx8KS
SkxAL36leNUqTxkADYH57jyCMpRNiQf6b8lz3tyeCyt7UIflG9LEDTa/PuocTxre
St0BmsnBBUJY+ueIBozfKLl0cINk5zNZ3pER+6WO4xtca5BvLo7H1Gz5L6AQabJc
Go/QmLQ4W0kxk1DLiqsP/8CJR8Jp8l3qw783jPQgaQNntn27fVYC5zfFG3Un8POd
665ROyKdsAijeJ9nnylS5j2b92IunNC+PRGHXAbPT7h4ISjkmoarlRJzbkUw4bmA
vVsj3Mw1VGMA2ERO4mHG2yQtagUBN37Zobd8GUMseHFwghZURdpbFghyV3q9uSlI
13bZhdiS9xlIrjL5pHZIzMGSI7/DC3pnP77CJiNduGsSdAx9U3ICbEFGfZfVMj/d
cJByyVdI9wZJLNrOnwPK66tKnTkYaOf8T+wR7GMofv3pegjPWY6QL1fZccR+qxiD
h86mhtWyjy7+8Vhld9ZE+p5BewrqW5YWXT/CMSv7TZsW/YyHSxs=
=s6w7
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--


--===============5455359163277778729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5455359163277778729==--

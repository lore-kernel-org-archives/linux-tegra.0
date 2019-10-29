From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Tue, 29 Oct 2019 14:37:06 +0100
Message-ID: <20191029133706.GH508460@ulmo>
References: <20190926191755.27131-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190926191755.27131-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 10:17:54PM +0300, Dmitry Osipenko wrote:
> It is possible to get a lockup if kernel decides to enter LP2 cpuidle
> from some clk-notifier, in that case CCF's "prepare" mutex is kept locked
> and thus clk_get_rate(pclk) blocks on the same mutex with interrupts being
> disabled, hanging machine.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v5: Clk notifier now takes powergates_lock to avoid potential racing with
>     tegra_io_pad_*().
>=20
>     The original fallback to 100MHz when clk_get_rate() fails is preserved
>     now.
>=20
> v4: Added clk-notifier to track PCLK rate-changes, which may become useful
>     in the future. That's done in response to v3 review comment from Peter
>     De Schrijver.
>=20
>     Now properly handling case where clk pointer is intentionally NULL on
>     the driver's probe.
>=20
> v3: Changed commit's message because I actually recalled what was the
>     initial reason for the patch, since the problem reoccurred once again.
>=20
> v2: Addressed review comments that were made by Jon Hunter to v1 by
>     not moving the memory barrier, replacing one missed clk_get_rate()
>     with pmc->rate, handling possible clk_get_rate() error on probe and
>     slightly adjusting the commits message.
>=20
>  drivers/soc/tegra/pmc.c | 71 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 56 insertions(+), 15 deletions(-)

Applied to for-5.5/soc, thanks.

Thierry

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24QIIACgkQ3SOs138+
s6FSwxAAizux6FGJiu8C/lxKhpOifS4J9zZnsoI30S8mDSYeeRt1IqLcxtOXNiVL
Ch4E4gBOE6MMI7PWaiWwvTPcJSD9dR9Fc4RMvs30DN1dapyuuBANuqsiSWjeok7v
fomzpCvZl4BHwKP1FkNZTL39B5z9r4tdAP4DRQz3fOuMi3qU135f+RPJuVXkdmHk
DfirDHIvTvNYJNUY7EZjUZvHvno7ai/yuUiHAayXghcUrP8xEk4iYxWfXonAoqWC
TYVItuoUXz1KcBNPEpPKMIU2DstXE3IiDaTOB2wn9ooxI+nnKSN0It9DRQQTLc/Y
0LrOSwMi0OhJV3FlMoFc82t582ZxSwTcSkF629p4CX+M9JEuvFZ7r3oEi/WkP+3+
ZuMSQihQ02wjdzsX+zaxfV2SJRvGl8Q8HgbaZDwiVsY7ZpUeWT+ud8MzHCvV7WHE
CJMjKPfhXep54kUTIzTK8prZ9JTq4HIHCnaljszzrvDDbcFtp1GfVlJTMdAYYlaV
TZH5hPnzG3EkX2tF0ND0Ovfej1+t4ea9rwf6p0JywAfQxISawPKSPK91DoWw7vFN
DcinaU1607kTJdfx1ucKWEUjx/h3eChE2baLeRfaF2xWRYlTvPCWcis7H68TZVSm
axjmHvrRbHhjYRwOp0mha6ltwZgGiEu8x9LuliyVkqOQtJmIAUA=
=ISZs
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--

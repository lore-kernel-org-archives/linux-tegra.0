From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 4/7] soc/tegra: Changes for v4.17-rc1
Date: Mon, 19 Mar 2018 09:42:02 +0100
Message-ID: <20180319084202.GA24307@ulmo>
References: <20180316141850.4876-1-thierry.reding@gmail.com>
 <20180316141850.4876-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4370509872050424486=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180316141850.4876-4-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============4370509872050424486==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 16, 2018 at 03:18:47PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1=
b2:
>=20
>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-4.17-soc
>=20
> for you to fetch changes up to 0cad0983bd3c002e92dff1e9d7f28c2c312c1973:
>=20
>   soc/tegra: pmc: Use the new reset APIs to manage reset controllers (201=
8-03-09 08:51:07 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> soc/tegra: Changes for v4.17-rc1
>=20
> This contains more Tegra194 support as well as an implementation for the
> MBIST workaround needed to avoid some memory-related issues on Tegra210.
>=20
> ----------------------------------------------------------------
> Mikko Perttunen (2):
>       soc/tegra: Add Tegra194 SoC configuration option
>       soc/tegra: pmc: Add Tegra194 compatibility string
>=20
> Peter De Schrijver (1):
>       soc/tegra: pmc: MBIST work around for Tegra210
>=20
> Thierry Reding (1):
>       soc/tegra: pmc: Pass PMC to tegra_powergate_power_up()
>=20
> Vivek Gautam (1):
>       soc/tegra: pmc: Use the new reset APIs to manage reset controllers

I'd like to update this pull request with this final patch fixed up. I
had to apply it manually and it looks like I messed it up. This has one
hunk missing that causes a failure to boot on Jetson TX1, but only if
neither DSI nor HDMI are enabled (DSI explicitly disabled in DT, and
HDMI not connected). I only stumbled on this because I was testing some
unrelated display code paths.

Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqvd9cACgkQ3SOs138+
s6FKKw/+LhxrTCUHcJWHJN1wGEgXNYW3f4CifB11GT6i/Ed3WgCLL24hJRGackHG
EHu367iNDK38+8k7008QSltyEkESZwmTbQ9UbqR6/V0b8OgjQOVexPeehA0Cv+7S
Nlnt0hcKVWB0ZYp9NCPdypDDB7z8jvlsKBlwLlA+Pfg7UEG0QhnPy2zU8vYiGoau
onO9vXRxvVLPTsNlAjrG4pfSvQDBkUPmxk+3jZvzj1DNWn3SaEG88KZI9875mEWr
3ObUBkv+Hv0UsZsJQ3HU0oYwP+hTweXREluW8m65lGe+/383s3pQlxmwGeOofZsg
N1rRODnn2uXSSNwepvbSz9BNZjk1g452TVw1T3WAt8wOkuayZbyBExMEYsUSusf+
3nv6zt1uRMFkUe9fSBIzbJSldx3I4afh269cRrwXEMHiog9i1e/Q4JbtVT+egsBJ
oRD5iUdaKr6396b6ex9R/8lHVIOi1koqO4h3LfUFM1dsRB1frjU43r7mLVj9pmAz
a8IRwcvCgnAW6RX4WG0KT5LI6bxlku/XrVsOsYpQnTD6CCdl2eNVseBwIPBJzGpD
Oi7YDICjRAf/PFPbVyp7PUDpGDOpJ8614X4uMRC5xMe6lFCLu+hh2JFy055AUhVx
LxAIv9fjK7uFXvekxTiiZrjFGyRQ9jPZwQuvr76NKF+MsIau4jU=
=/k9i
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--


--===============4370509872050424486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4370509872050424486==--

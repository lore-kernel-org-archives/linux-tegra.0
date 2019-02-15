From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 6/9] ARM: tegra: Core changes for v5.1-rc1
Date: Fri, 15 Feb 2019 22:48:26 +0100
Message-ID: <20190215214826.GB12838@ulmo>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
 <20190208150935.32108-7-thierry.reding@gmail.com>
 <CAK8P3a2vDG97hP80i6rknqFnDdpoCGMBpmoy2Gp-jUWnGJ5VCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5530303226735087983=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a2vDG97hP80i6rknqFnDdpoCGMBpmoy2Gp-jUWnGJ5VCg@mail.gmail.com>
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
Cc: "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============5530303226735087983==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2019 at 05:48:25PM +0100, Arnd Bergmann wrote:
> On Fri, Feb 8, 2019 at 4:09 PM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> >
> > Hi ARM SoC maintainers,
> >
> > The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee=
500c:
> >
> >   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-5.1-arm-core
> >
> > for you to fetch changes up to 1c6279b49d3ffff38357e93d112512fecf3711a7:
> >
> >   ARM: tegra: Restore memory arbitration on resume from LP1 on Tegra30+=
 (2019-01-16 13:22:04 +0100)
> >
> > Thanks,
> > Thierry
> >
> > ----------------------------------------------------------------
> > ARM: tegra: Core changes for v5.1-rc1
> >
> > This contains three fixes for resume from LP1 on Tegra30.
> >
>=20
> Pulled into arm/soc?
>=20
> Should these bugfixes have been marked Cc:stable?

I don't think that'd be worth it. As far as I can tell these have been
broken since forever. Backporting this would be fairly involved and I'm
not sure if this hurts enough to warrant the additional work, given that
it's not been reported in all this time.

Dmitry, can you clarify whether you want these to be backported?

Thierry

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxnM6oACgkQ3SOs138+
s6GKghAAvzjv7yHNObjctpQ+geAbVuYXlxI075X1apxWDzKOl8VmtitxcDvX5Jfa
4xNCfSVrvGGKaPdn/HV93VS2DHNnvjfqwvAbmBIswxfEyVR145hy5nSSoVZo3pC1
rb+GFgMouNo9K1hvVljo2LwxmS4rD3vDzwkULBb5P3JMarGXlx+LQ81piP0zuZ5R
C5r/L8sER/wX+Klff9QZIRlLtDPXeCCFHIDG5VIQzUaf3k+DU99F1Zd7x5oNVNmb
bxEfKMvmhrvWH1ThjGAwRRiYenraLo1isnnMLKH3r/V53Dh5OYdMqB6tFHaXlKbF
eGf1C2OFbHqL6ohsPPhx8ljIU/CWqxcoIYosMv4VVB3n/v0rPxJ4KmW4nme5J1An
2Dks/hPr/H7kqRxcLnJ4z+3d65k39PvuS2UkPrfc7VyX+zKatFynOyE9qv2D6IXw
rMYeRNNZW8bQKul0rN0G/gcFyOyT4T4x6C78lCfJwr1Y1ZLDMTquuRMrunALfyqY
MvWxBVg/qdqAbHR8dGaqnFBJDRqXeY8VpDN44yXDcjjXazMBsggERB0Ltnpj1tSa
YAg/aJwT+3z5HzdycbL43xjLpT3TxPPYwk1T8rt+TOiosZ7WNNckwde1TFoJKe1C
1WnFn/d1GSQJ0w8ZjX+yZ/Pm+9dcx9C2fEkxusKn1qH+1TVez1s=
=BIii
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--


--===============5530303226735087983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5530303226735087983==--

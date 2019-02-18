From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1] i2c: tegra: fix tegra186 hw supported features
Date: Mon, 18 Feb 2019 15:50:02 +0100
Message-ID: <20190218145002.GC19190@ulmo>
References: <1550334787-27703-1-git-send-email-skomatineni@nvidia.com>
 <20190218084227.GB19363@ulmo>
 <42aa92c1-309e-88c1-1cd6-07592990730b@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42aa92c1-309e-88c1-1cd6-07592990730b@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, talho@nvidia.com, wsa@the-dreams.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 09:34:38AM +0000, Jon Hunter wrote:
>=20
> On 18/02/2019 08:42, Thierry Reding wrote:
> > On Sat, Feb 16, 2019 at 08:33:07AM -0800, Sowjanya Komatineni wrote:
> >> Tegra186 does not support multi-master mode and also there is no
> >> master fifo control register.
> >>
> >> This patch fixes supported features of Tegra186 and prevents
> >> crashing during boot as master fifo control register are not
> >> present on Tegra186 and prior.
> >>
> >> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > We really should've caught this earlier. Jon, let's think about ways to
> > make it easier to catch these things in the future on our test system.
>=20
> Indeed. This has fixed the boot regression I was seeing over the weekend
> on -next for Tegra186. However, I am bit confused here, because when I
> look at the Tegra186 TRM it states that the I2C supports multi-master
> mode which disagrees with this patch. Furthermore, it seems odd that
> Tegra210 and Tegra194 would support multi-master mode but Tegra186 does
> not. So is this really correct?

I would expect at least the missing master FIFO registers to cause a
crash on Tegra186. The internal architecture specification also says
that multi-master is supported.

Sowjanya: do you have other documents that suggest we don't support
multi-master on Tegra186 specifically? Or is this to work around an
issue specific to Tegra186?

As it is this contradicts documentation, so we need to either fix the
commit to remove only master FIFO support or we need to fix the docs
to reflect reality.

Thierry

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxqxhoACgkQ3SOs138+
s6GgIBAAmL08dlZUzeNGEZh/8lLWo+k9vYokFLfALfaeRu+SU35zzCpLBCO54w95
mLOBVtInTEC5dQ3ouIXuY+Aj0MfEp/n20KON6nGhrlLXnIq4Pp1Is3a2VMSlPiBp
VpaZOzC9LTbt6VNiMq8Rw7JS9zJdsp5xwGAh6RALMfJzpAAF5d7s3MGGa0y6NFiV
BL/QZ1stiDQJl+MmhyPKVIycdLUMJAEV7YtWpVN1Cp/qOVYK0JHGjuTDnenu7cSY
wwNdahj7vfLA/+HpjxhYXlthetroi7e/JXEX9jJvGU5CqwLIzlb2pZFVVb3pnFgu
BhTvP97ThiSpt1bwGD+caZwubYZBMHR8r4oLSHuR/kTNoElY3kG0ibzUCg0Etqxq
2elPtIKUhFs77i9MVfn0R7SxnUn+fndAzHn9gbcJJCBqg1eee17Xq/EQ0eDYCnh2
gfcFSnbcCRtWsIjcUMGiynRwZM2Ay8V4V+wocq9lxG166TmjVOdk0YOJn9MPHfw+
kkDCsLWga7uQy1EfWGUgo8yprWQ07NwY40vXIji+r9gs8Y91i5lQwcrZOpiKfC0I
uds648e74TsQgzSfIqSuFr7HmNnPj8GMLzdxXRnoVn/Mw0Zm0c0ewrIcJefTAfCw
eoRqyd9tq821Aphub7/hick+lbFHAX5xb5gYOoC4mgSG3buk1RY=
=zXzK
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--

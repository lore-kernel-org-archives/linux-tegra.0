From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/8] Tegra124 EMC (external memory controller) support
Date: Tue, 26 Aug 2014 09:47:52 +0200
Message-ID: <20140826074750.GA17263@ulmo>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>
 <53FB7511.9090205@wwwdotorg.org>
 <53FC3A5D.8030708@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53FC3A5D.8030708@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2014 at 10:42:21AM +0300, Mikko Perttunen wrote:
> On 25/08/14 20:40, Stephen Warren wrote:
> >On 07/11/2014 08:18 AM, Mikko Perttunen wrote:
> >>Hi everyone,
> >>
> >>this series adds support for the EMC (external memory controller) clock
> >>in the Tegra124 system-on-chip. The series has been tested on Jetson TK=
1.
> >>
> >>The first two patches remove the old "emc_mux" and "emc" clocks from the
> >>clock tree and the device tree bindings. This is, of course, not
> >>backwards
> >>compatible, but as these clocks have never been useful for anything
> >>(apart from maybe reading the boot rate of the EMC clock). If this is
> >>still
> >>not acceptable, the second patch can be dropped.
> >...
> >
> >Mikko, this series had some comments, especially on the DT binding
> >(patch 5/8) and how the MC/EMC drivers interact. Is there an updated
> >version of the series? Or, is the series replaced by Tomeu Vizoso's work?
>=20
> Yes, I have a v2 with these comments addressed. One concern, though, is t=
he
> part writing to CLK_SOURCE_EMC. If some other driver also wants to read t=
his
> register (MC, likely), we might need to have an API for it in the CAR
> driver. On the other hand, maybe not, since it's only one register. Thier=
ry?

I don't think any of these drivers should directly access registers that
aren't in the memory region that they've claimed. If they need to access
functionality provided by some other driver then they should do so via a
custom API.

Thierry

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/DumAAoJEN0jrNd/PrOhMv8P/jOjBPg3WlE6zcQIRVv004TL
pATCOhbPMWDGyWAlVOHOah2Tv+tHfTbS1y2dHqMlsqKTMi6xIB9hc4dD7xI4Ne3c
PV/a3vII8IeousdQSPspuX/Yn1lNXbuDXqYOjLlbhVmUHm1PW3NQZUMYYPEWQGLD
Ku7QgDHmOl1Pd14AGwU7kD4tRiqXd4x5q05idt5bp+IbKAUkVtprDBE3aWvt2Dzw
XFu8ZVhVcDFpYLx/GbguBy2HTDzgp4MTSU5Zf5PhYNLz0SM5Y2QuO8g9W6Yn9Ld5
2P4LEFWqwZSUELSuR35B2PyX+Cf/v5/HC5zyBLN4TzBSbfcQdyGq1l/JJT4ijlhq
QmISBh15TP75Ax7c4x5KU0sUW5BV2+InsBTkCzo30VNM3Z/wEzU9w2dfnCp4xBWi
GdktpS37jILZhhZHdA6wBLXDYA3vVTwjWgFiV116A2XjKwyqXXEPB5SZYeFW2rUw
M5t5au9zquWaqwh9CBT3zBGOQ/xl+C11RxWWKAXMpFqsnTlR0X5D6s3izaisp+9v
VF3yZyuDz5tHBKAWMwNGDHtEbQrMO6OrUwtUQJs9CkRpYL/3WgIQbxkPOHuUEZb1
lk1z4K/j51MpJaXld1LnbZdS6MZ71BUCsXetYd/hOXYJqQCBOa0kRB15JYyAYdXR
NsL5KvbHiJ0CPnulybdB
=VXX6
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

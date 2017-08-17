From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/14] Fixes for Tegra clocks
Date: Thu, 17 Aug 2017 15:48:03 +0200
Message-ID: <20170817134803.GE6854@ulmo>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
 <20170726013746.GM2146@codeaurora.org>
 <20170726082728.GD26726@tbergstrom-lnx.Nvidia.com>
 <20170727185406.GN2146@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JBi0ZxuS5uaEhkUZ"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170727185406.GN2146@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--JBi0ZxuS5uaEhkUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 11:54:06AM -0700, Stephen Boyd wrote:
> On 07/26, Peter De Schrijver wrote:
> > On Tue, Jul 25, 2017 at 06:37:46PM -0700, Stephen Boyd wrote:
> > > On 07/25, Peter De Schrijver wrote:
> > > > A number of smaller fixes and simplifications for the Tegra clock
> > > > implementation.
> > >=20
> > > Any of these need fixes tags so they can be backported to stable
> > > trees? Also, everyone is on To: line, so not sure who is supposed
> >=20
> > I will have a look. For some of them a backport might be useful.
> >=20
> > > to pick these up. Me? That's fine if so.
> > >=20
> >=20
> > That would be the easiest I think.
> >=20
>=20
> Ok. I'll wait for you to reply with tags unless you didn't find
> any?

I'm not aware of any bugs that these would fix, so I think we can apply
these as-is.

Thierry

--JBi0ZxuS5uaEhkUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVnpEACgkQ3SOs138+
s6HrKxAAnoKJdWE+ohoCz9yMcFpTbWB065HWpI/TwE/stni5xrg7sPAMMwh5ni/r
gLAxKbI/+4fLHMSngIop+P0n6ln6QB2b02oAw4kkhUEBw2rt4arK8EtNWY9hX8Cd
dAFaYb/lVEIqE3mzoo49j+pXZeb4aJ5WwTmIsOPTP6h92y9SIx6uip87n4yKKhV+
8QcMXq8SQuMGIM/RLkSWRWnVHZmVBHkIDOyg5rRWHMyM6rC/LlFL604gyU2dNFQT
c6HGGgwPPSc88wjVtTvRhZ2C4KkStqNcHBIOYssehXagjPQP7yy/UDMuEhTEpcZF
DGQzMnVY9rgU/t2whma/F6MiJDMPUeINclwSBU70kbvkXHb5qjgRRbpO9o9p+LB6
CXvfYR6M0Ikm9CgiagZu6R9cwodwuC3ftqXJUgWd1pY1i6p5mCvtva78YfrY9x0W
JNHawVlQfRpdqmSZoEFRMSR+YhBRaWPYCP5p5bbnUaQ2ZQB5Qqqxo9K/mmzu9Oug
IzcR3A/Yx6wVYYR66NLcuXyzxS8zKtxIbFkczhKyvevtfxjZ23c5Dt7KTZNLYrVY
slKmGaOLmFBnkQC6ZM1GijYEHBmoJL6wEz0hiTIKwKXtqPmYM4OBLOV2+oNKDbx4
u3P8fDmbCTfoZl+HDE1hRzriIpkDkx5UVvEGL5xy/PqG5g6F5SM=
=ZTd3
-----END PGP SIGNATURE-----

--JBi0ZxuS5uaEhkUZ--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: tegra: Add clock and reset names for audio
 powergate
Date: Tue, 16 Aug 2016 15:06:56 +0200
Message-ID: <20160816130656.GC4133@ulmo.ba.sec>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
 <1470134069-12178-5-git-send-email-jonathanh@nvidia.com>
 <20160802141833.GB20134@leverpostej>
 <4a793df3-3ac1-9300-62fd-cd628dc47879@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4a793df3-3ac1-9300-62fd-cd628dc47879-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2016 at 07:43:41PM +0100, Jon Hunter wrote:
>=20
> On 02/08/16 15:18, Mark Rutland wrote:
> > On Tue, Aug 02, 2016 at 11:34:29AM +0100, Jon Hunter wrote:
> >> Add the clock and reset names for the Tegra210 Audio powergate. Please
> >> note that these are not currently used, but added from completeness and
> >> to be consistent with the other powergate nodes.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>
> >> We added the clock and resets names for the XUSB partitions and so I
> >> thought we should do the same for the Audio. Should I update the bindi=
ng
> >> documentation to say these should be provided? Currently it does not
> >> state these are required. If we do update the binding doc, I was not
> >> entirely sure what to put in the description for these properties.
> >> Typically the clock and reset names would be fixed for a device, but h=
ere
> >> we are not using them and so there are no fixed names.
> >=20
> > The names are there for the consumer's benefit, so if the consumer
> > binding doesn't require specific names, they shouldn't be in the DT.
> > It doesn't make sense to have names which are not fixed from the
> > consumer's PoV, so if anything the above is an argument for *removing*
> > the unnecessary and varied names from other nodes.
>=20
> Yes I was not sure if this correct. We could always add the names at a
> later stage if they are needed.
>=20
> Thierry, do you still want to have the names present? If not, then I can
> remove those for xusb.

I would've liked to keep this consistent with other nodes, but as Mark
pointed out the power domain case is somewhat special in that the names
or any ordering are completely irrelevant.

Let's drop this one and remove the clock and reset names from the XUSB
power domains as well.

Thierry

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXsw/vAAoJEN0jrNd/PrOhP+UQAMIvbvQJOmNnfm9NvVs7IeJA
zyVfCs4gb2Qi+zGkaNoUWhFWCsufJeCY7PLE0DsMY5VilunXb9kIdJB53dJPZcs0
IvjnacTlCpgEISHAs6KJGhuXdtGdBBMu1UIexO8BqyTwy2/rHT+Os9R984NOXqLf
2kgpT9JG7EdJwhbHxq215IZrMPst8yw9s/YFtIaKMtUk+DuMDzoXC4zC/Kdzt1zQ
Q0VF+MBTt2KisOCXo3n+PhBvBDvxkXQ2FeG9IY3eRwuNFBfBh8I0OWklanM/IspP
K3XBeY+bAhMdMVSofzo0iLqs9srf5Xed01mvFCcMRLhBztYnIW4fJ3XYpfGSKdOk
kWSx3zaD1sNGWUbYxTRj0WpCoGGdFVUiA+QN5F0MEf4aImiq7p6XiD1eNsxfCrHn
wr4S2khbPyEW4B3NBi/5wtDSarIlPlopR8pLnWnOTLiegXB1zajjWMZ5NROwUphd
uTtUhFp6g5NyF3YhGW7LuVhYZVboRhXpqUKWHDjTdceG6H+BEOKg7QwVsms18DkZ
YrraZPrrLwZNgFwWxL57BHKXvPnrG5LZoG6lNXnQKcXuM4u90f+wO4DNtAVDQsDv
CfzJyfpIAhIJ0aNGTjnxWc++qa+hD8GC9yuXF/ZB3VDTSkfWNh4axtUny7RpngJ4
EQlK+Byx+s6TvRZHVUcP
=PpZY
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--

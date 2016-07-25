From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 15:32:57 +0200
Message-ID: <20160725133257.GJ21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
 <434561ec-510e-a3bf-c7b6-c961db299bd6@nvidia.com>
 <CALw8SCU0cz6mbO=oudCZ4-=2PHVORNt3gwmg2bzNjyhJFnWS3g@mail.gmail.com>
 <20160725121045.GG21170@ulmo.ba.sec>
 <43ce209d-1b11-ab9b-0e80-8f7fad45eb41@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YZVh52eu0Ophig4D"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43ce209d-1b11-ab9b-0e80-8f7fad45eb41@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mirza Krak <mirza.krak@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, pdeschrijver@nvidia.com, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org


--YZVh52eu0Ophig4D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 02:09:18PM +0100, Jon Hunter wrote:
>=20
> On 25/07/16 13:10, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Thu, Jul 21, 2016 at 10:10:49PM +0200, Mirza Krak wrote:
> >> 2016-07-21 11:56 GMT+02:00 Jon Hunter <jonathanh@nvidia.com>:
> >>>> +
> >>>> +The NOR controller supports a number of memory types, including syn=
chronous NOR,
> >>>> +asynchronous NOR, and other flash memories with similar interfaces,=
 such as
> >>>> +MuxOneNAND. One could also connect high speed devices like FPGAs, D=
SPs,
> >>>> +CAN chips, Wi-Fi chips etc.
> >>>
> >>> Nit-pick ... the Tegra documentation refers to this controller as the
> >>> GMI (general memory interface) or SNOR (sync-NOR) controller because =
it
> >>> is not just limited to NOR as you mentioned. I see references to GMI =
in
> >>> the Tegra pinctrl driver and so may be we should use this name.
> >>
> >> ACK.
> >>
> >>
> >>>> +Required properties:
> >>>> +
> >>>> + - compatible: should be "nvidia,tegra20-nor", "nvidia,tegra30-nor"
> >>>
> >>> I see at least one difference at the register level between Tegra20 a=
nd
> >>> Tegra30 and so I think this should be something like ...
> >>>
> >>>  - compatible : Should contain one of the following:
> >>>         For Tegra20 must contain "nvidia,tegra20-gmi".
> >>>         For Tegra30 must contain "nvidia,tegra30-gmi".
> >>
> >> ACK. Just curious, which register was it? I only checked that they
> >> have the same count of registers.
> >>
> >>>> + - nvidia,config: This property represents the SNOR_CONFIG_0 regist=
er.
> >>>
> >>> There is also a SNOR_MIO_CONFIG for the MIO address space and so I th=
ink
> >>> that this should be nvidia,snor-config to be explicit. It might be ni=
ce
> >>> to also add a "nvidia,mio-config" while you are at it as well, howeve=
r,
> >>> that could always be done later. If you do, then the
> >>> "nvidia,snor-config" becomes optional depending on whether you are us=
ing
> >>> the SNOR or MIO address space.
> >>
> >> ACK the nvidia,snor-config part, will though wait for further comments
> >> regarding what to do with the config registers, break-out or keep it
> >> is a one property / register.
> >>
> >> Regarding mio-config, not sure about if I would like to include that
> >> part in this stage. If you feel strongly about this we can do it. If
> >> it only comes to down to replicate the same configurations that we do
> >> for SNOR to MIO then I do not see much of a problem, but would like
> >> SNOR to be accepted and would not like the MIO part to halt this. But
> >> then again this up to you guys.
> >=20
> > What's the difference between SNOR and MIO? Sorry if I'm being dense but
> > a quick look around the internet didn't yield anything related. I'd be
> > happy to read up if somebody can provide a link.
>=20
> I am not sure where this term MIO comes from (may be an NVIDIA term),
> but from looking at the MIO_CONFIG register, it looks like a basic
> 16/32-bit interface with configurable read/write strobe timing. Does not
> support bursting or address/data multiplexing that the SNOR interface
> does. So may be it is used for interfacing to external devices such as
> FIFOs, UARTs, I2C expanders, etc.

Yes, looks like some sort of parallel interface to connect external
devices and make them act like MMIO. Perhaps MIO is supposed to be
"memory I/O". I've found some vague references to MIO =3D=3D multi-I/O,
but that was always related to serial flash (essentially something
like QSPI).

Thierry

--YZVh52eu0Ophig4D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlhUJAAoJEN0jrNd/PrOhEQwQALxNfzQGtX7EdbGWZ5rT9t9s
ma4jzPYyVQ/7vSq50FP+gvdBCCXum2XxMxyCP42lXu6NVgieVukNqJU/wqaMe7Qw
Flob9GW+5IG9J5/LHmHyFO8YhOaUDu4vE9fPX/d9UvHx8jTWgVLDROxfwiIpzQio
fdVMvRcaMa6AxOeJN1m0DACyKtPO/rBqmJTO+qbNWAF0mgTif8sNl8dM+/IduSJt
us81EyhOglP1vj/AYJD0CexkQ0onogZRPBLweGw7jBY3BQVkW8+MMwbt7CGzGlPx
aQnApeIfXKOYA+SOewTCXi+GzwHBHibp5uRAsfbVkGzOe6IBnwc/XvytzQ71oYQ2
Ai9mtfCm/U02F4oSj8f5rDViO7ruhyZpQ63XbTiOETjCkXBG3qPuWGNMrlLuDZ7g
OOabHsSacg0xaXnSe+C+aZalytOd0muNtcyul5XP6H4qbKh32NHMbys4eJOOR4hV
6kwRgj+mCdNcKqM9+oWUphMutfnxpB3IZN2M10HFhfrCeMMAPC3qf9WVQLHcbhs3
Oc4eJLfiagCDBQxSddlNFe30A1TsNe3Spjrj+bWuc2Q4xu9MjtEXXco5kH/b5J2y
3Roveh1wY6eyTP7N+wIR2LWKtR7jUkStiu8hzaLzwdL7hGjf2MQ7aTqc3eY+iThP
jbWxbRZ/N1z5XgCNtbOq
=wK7x
-----END PGP SIGNATURE-----

--YZVh52eu0Ophig4D--

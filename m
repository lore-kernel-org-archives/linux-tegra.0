From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add Tegra186 BPMP I2C binding
Date: Mon, 30 Jan 2017 07:50:43 +0100
Message-ID: <20170130065043.GB3585@ulmo.ba.sec>
References: <20170127083939.20393-1-thierry.reding@gmail.com>
 <20170127083939.20393-2-thierry.reding@gmail.com>
 <20170127221857.GA15715@mithrandir.ba.sec>
 <8841854b-d058-1a8d-3e40-955bf3546cef@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8841854b-d058-1a8d-3e40-955bf3546cef-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2017 at 10:42:27PM -0700, Stephen Warren wrote:
> On 01/27/2017 03:19 PM, Thierry Reding wrote:
> > On Fri, Jan 27, 2017 at 09:39:38AM +0100, Thierry Reding wrote:
> > > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > In Tegra186, the BPMP (Boot and Power Management Processor) owns cert=
ain
> > > HW devices, such as the I2C controller for the power management I2C b=
us.
> > > Software running on other CPUs must perform IPC to the BPMP in order =
to
> > > execute transactions on that I2C bus. This binding describes an I2C b=
us
> > > that is accessed in such a fashion.
> > >=20
> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 42 ++++++++++++=
++++++++++
> > >  1 file changed, 42 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegr=
a186-bpmp-i2c.txt
> >=20
> > Rob, sorry for not Cc'ing you earlier on this, but I had thought this
> > binding had already been reviewed and acked since it is merged in
> > U-Boot.
>=20
> I'm pretty sure all the DT binding patches for Tegra186 that I submitted
> were ack'd by Rob. They were certainly all posted to relevant Linux lists
> and discussed and ack'd by someone before I pushed them into U-Boot.
> Probably 2nd quarter last year, or maybe 3rd.

Yes, I thought I had seen an Acked-by myself, and I know that you're
very diligent about this. And true enough, it's in patchwork. I probably
missed it because I was cherry-picking it directly from U-Boot where the
Acked-by wasn't present.

Thierry

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliO4kMACgkQ3SOs138+
s6GpahAAl2S3JF3zkrBREMa5gVLVfsBpO6Z+5RYFwSs68QI4h+xs8lGhm+uOxkV/
+kkVS/LGlDBo3VLcsLD1N4S3MZiLRe9dNM+GoMr709OEvnzDAv+jwxLi/IFacet9
M6ChRN0m+jrPgHtG30j7VYgvuTL6LshKwNiifyFQPqs6pjCQH+GN+QPaVwcn7uSr
hlP3hbNOAGwHU1jv07l/965674SistYI/Dlbc75ItY4Aa/iXJg53oxZcMtVd9EyQ
zwBHW6gBeuKQ3YQz9AMM5tcQGzh5wL9igyzX345n+9ww1NamwAHH/l5P4ihcW/Rt
Lk6Tiffrni2JMGiwewQxZIgNea06Vfynkcztmfqn8Liobe/EK/fIvEkPvJaJs5vc
h3aql4m4li2g1vCUxP0AsUEFBnVunLJwJbRTJ/TRuqZmEh4WLm3U49HVfD47XKcp
odG5ag9GN1TSsToZ0QsS4MyYfGINZqQgdJnz/ZueWx9dnzWdqEeiUF4F/pod+vLg
TthMTmABob8bYoX985h3HEhhf6PqA4kWntAQZDPIqzEMI3cOYcxSYAxp6XIF5qTU
rPqsCM5r5tJ1TOoK/j+w49ftt8ccnpN2Oby5EQeygXh29msSM6OmUxTurMc4cz5c
pAsKEfW665NB+L6hM93OCuinDzcGWhuSulgnpEPj0YPzmLfGFOk=
=NJai
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--

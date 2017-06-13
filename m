From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add bindings for
 nvidia,tegra186-ccplex-cluster
Date: Tue, 13 Jun 2017 16:10:44 +0200
Message-ID: <20170613141044.GJ16758@ulmo.fritz.box>
References: <1496304245-24024-2-git-send-email-mperttunen@nvidia.com>
 <1497262984-2346-1-git-send-email-mperttunen@nvidia.com>
 <20170613124239.GC16758@ulmo.fritz.box>
 <9ecb973e-ee57-8c89-df21-4ed0bff4bb38@kapsi.fi>
 <a7417c4f-d7d4-e11e-a23c-cd0f2fc4adee@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HcccYpVZDxQ8hzPO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a7417c4f-d7d4-e11e-a23c-cd0f2fc4adee-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--HcccYpVZDxQ8hzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 03:47:39PM +0300, Mikko Perttunen wrote:
>=20
>=20
> On 13.06.2017 15:46, Mikko Perttunen wrote:
> > On 13.06.2017 15:42, Thierry Reding wrote:
> > > On Mon, Jun 12, 2017 at 01:23:04PM +0300, Mikko Perttunen wrote:
> > > > The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
> > > > registers that initiate CPU frequency/voltage transitions.
> > > >=20
> > > > Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > ---
> > > >  .../arm/tegra/nvidia,tegra186-ccplex-cluster.txt     | 20
> > > > ++++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-=
cluster.txt
> > > >=20
> > >=20
> > > The ARM SoC maintainers don't like to pick up device tree bindings, so
> > > I'd prefer this to go through the cpufreq tree that also contains the
> > > driver patches. Presumably this wasn't merged through that tree becau=
se
> > > of the missing Acked-by by a device tree maintainer? Given that Rob's
> > > acked it now, maybe you can resend this to Viresh, who I think had
> > > picked up the driver?
> >=20
> > Sure, I'll do that.
>=20
> > I guess the .dts change should then also go in that
> > way?
>=20
> Or I guess not, since you applied it :)

So the rule of thumb is that .dts changes should go through ARM SoC and
device tree binding changes should be going through the same tree as the
driver changes that implement the binding.

Thierry

--HcccYpVZDxQ8hzPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/8mQACgkQ3SOs138+
s6GzHA/9EyxRCzwqOESOqmN8RCEDYIAe2OBBP6UR9grx9ELwV+1KqLhrUDK22w8h
F04NUUVHhEMhLMxIVfv62HUV5X69O57GqgVQAa2V/2PNgmAAvFJRmNyAhrmSrDEJ
rxtBpNq1R6geALKO/2dzJSn8Sgw+sbJrU1KPcwLaZdHjLS+FqGyPz5QbyW5RSHRf
ntryV3aHQYSrFN3yyzcKZ/HgOac5aHxMzVrOyJwBau8g4a8Fd51qphqHeWPqhmxs
wjGanQq31XYLlDoFhq54OGEQ4tOqKcepJmQgFSygxiF7rNZxKcsCDC81HnkCn+qF
/AFIE8f7nWo28ENlJKA2WQwLSKpSn539/AN5Bcc2baEBTtmuEu5KpIZXmAWGukax
SdG6o6AXIPr7pOZdPu7j+mONpiwovY7I+6svlyWu3sZjaLGF4/hZBZJUgn/J1LyD
VN1hHBhmcvLtWBzRrpqMfsOgxJ4qQS00FZZjpVXM4PZk5VPorU+kgk2io6bjKhH4
qq7D1dRm0+lfVBkPlzVUb96HtmGO6HPZcj7gDQyDpEVrTItnmlfiD70Z8SZ6AHxe
oCdzOC8HQi+zp4lYqjHe6gJSu++kT9fUeXJmvo7ZVVAI8B60Bra+IslbJucU4AR7
r8QJtGG1zkna4p9WR2azQkjb1vK7pRyeWvArFax55dVK9VRJh0Y=
=VK7J
-----END PGP SIGNATURE-----

--HcccYpVZDxQ8hzPO--

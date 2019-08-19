From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
Date: Mon, 19 Aug 2019 15:33:27 +0200
Message-ID: <20190819133327.GA23089@ulmo>
References: <20190301192017.39770-1-dianders@chromium.org>
 <20190404145957.GA25912@fuggles.cambridge.arm.com>
 <4754bcf1-6423-f1fe-64d4-da4a35b164ad@free.fr>
 <20190424115231.GA14829@fuggles.cambridge.arm.com>
 <20190502105912.GA943@ulmo>
 <20190502110821.GD30966@fuggles.cambridge.arm.com>
 <20190502124525.GA3579@ulmo>
 <94cf6d56-5dcb-051a-06da-5edfacde1655@arm.com>
 <20190819112856.GA28102@ulmo>
 <20190819120917.hysyc6l3ckkwcx25@willie-the-truck>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7991773559265030706=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190819120917.hysyc6l3ckkwcx25@willie-the-truck>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will@kernel.org>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org


--===============7991773559265030706==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 01:09:18PM +0100, Will Deacon wrote:
> On Mon, Aug 19, 2019 at 01:28:56PM +0200, Thierry Reding wrote:
> > Perhaps an alternative would be to add a property to the SMMU node that
> > lists a set of stream IDs for which to enable bypass by default. We
> > could let the firmware set that when the display hardware has been set
> > up. That way when the kernel boots we can keep scanning from the
> > reserved memory and the ARM SMMU driver would not disable bypass for the
> > display hardware. Only when the display hardware is actually attached to
> > the IOMMU domain, and the 1:1 mappings have been created would bypass be
> > disabled, and at that point there should be no SMMU faults anymore, so
> > we have cleanly transitioned to the kernel.
> >=20
> > Any thoughts?
>=20
> There is currently an extension to IORT under discussion which should
> address this problem, so it would make a lot of sense for the DT solution
> to follow the same approach. I think it will end up being along the lines
> that you suggest, although we won't just enable bypass because that leaves
> memory wide open if the device driver doesn't probe and it also creates
> an issue because device attach typically happens before the endpoint
> driver has probed.
>=20
> So the flow would look something like:
>=20
> 	- Firmware describes a physical region of memory which must be
> 	  reserved by the OS.
>=20
> 	- Additionally, firmware describes a master -> reserved memory
> 	  linkage as part of the IOMMU description.
>=20
> 	- When the IOMMU probes, these reserved memory regions will be
> 	  mapped 1:1 for the relevant master.
>=20
> This is similar to RMRR on x86, except that the mappings are intended to
> be less rigid and can be torn down if the endpoint driver decides to do
> that or for things like device passthrough.
>=20
> If we get that working, we should update our booting.txt so that DMA is
> allowed during boot in the limited cases which this covers.

Hi Will,

that sounds very interesting. Is this extension being publicly
discussed? If so, do you have any pointers for me to read up on this? As
for device tree, I wonder if perhaps we can achieve this without going
through extra properties. We could, for example, just do a "reverse
lookup" of IOMMU masters by walking the device tree and looking for
nodes that link to an ARM SMMU in their iommus property. Granted, that's
not going to be very efficient, but it would remove the need to
duplicate information in DT. It's also going to be a one-time cost, so
perhaps it would be negligible.

I'm happy to help out with hashing out or implementing something on the
DT side of things. I don't currently have access to any systems with
ACPI, but I've got a bunch of systems that are DT based and that I would
like to see this implemented on.

Thierry

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1apSIACgkQ3SOs138+
s6EZAhAAhoAonoH3j2JXNmpfoZ7M7qBVsTZxkGA84nLUZ2qLpMPW8oG6PHyWXFXy
UNbzxS4P5+EeIBBV1y/qd/TzJWM+ZSPUXKjbXzvVSrA7RkLaveWFBlPA02n38c3p
voDzckbCtd7IkFEIMrU567P8IlyimT2mcUjqL40v+fD/i0+JHgNBpl2des++zB7R
FSwRodRkfF+ZBZhRagLw/B04rygIpSqbo4JQNS3+MWNCXCsxA0Bgr9KGFggfpweZ
qE7iU14KIz0LbGMvII1kxjX4tFo7ciR2KdIM2C08cD4vPO1wUqoaGpH589HYOnuc
KU5cWJjT826k+c9r/iOXcfNscV7EdAEDkEU7JmI8ZuQPFWUuHgjDBm5q23j6pBSi
AbM6rDgIti2cdBtNfGA6t5GKxycYR/kJZYMupbXzN2hoG44rvH7MWvX2kL36K5nV
PRSNjg+Ak3waqlUMNKH4xILjUZ/kCtOQhDZmCgXZebqwRJ9IhUrftJG0lBd0rMsz
rRETX3efVWzHUX3H0SI6PmLHudeeny9YJs+Mfn6AkwZF50Pm6tQZ/N89LKumR8wq
X0PA08XvZQ7rP95t+sJ2IqlH7kDvXsnlsDSGYO3rj41n38rtb90Q97eo3EGRiHsz
4lOaKilx2mbXUVloLDJXdLVV+zfke48CMniwLVbQn2rBIEwJS6E=
=gCaK
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--


--===============7991773559265030706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7991773559265030706==--

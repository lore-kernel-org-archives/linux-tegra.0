From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Date: Mon, 27 Jan 2020 13:21:15 +0100
Message-ID: <20200127122115.GA2117209@ulmo>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ffc22502-0e7e-522c-543d-0e74cc25f4b1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
> 21.01.2020 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
> >> On 1/21/20 16:10, Thierry Reding wrote:
[...]
> >>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
> >>> going to be the same and it's arbitrarily defined, so it's effectively
> >>> useless. But other than that it looks good.
> >>
> >> Well, in most cases the target would be the EMEM, so that's fine. I ha=
ve seen
> >> that other vendors that may have an additional internal memory, especi=
ally
> >> dedicated to some DSPs and in such cases the bandwidth needs are diffe=
rent for
> >> the two paths (to internal memory and DDR).
> >=20
> > Most chips have a small internal memory that can be used, though it
> > seldomly is. However, in that case I would expect the target to be a
> > completely different device, so it'd look more like this:
> >=20
> > 	interconnects =3D <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
> > 			...;
> >=20
> > I don't think EMEM has any "downstream" other than external memory.
>=20
> The node ID should be mandatory in terms of interconnect, even if it's a
> single node. EMC (provider) !=3D EMEM (endpoint).

I don't understand why. An ID only makes sense if you've got multiple
endpoints. For example, a regulator is a provider with a single endpoint
so we don't specify an ID.

By its very definition an ID is used to identify something and we use it
with a phandle to create a unique pair that identifies a resource within
whatever the phandle represents, with the goal to differentiate it from
other resources within the same provider. However, if there's only one
such resource, the ID becomes redundant because the phandle without an
ID is already unique and there's no need to differentiate with an extra
ID.

Thierry

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4u1bYACgkQ3SOs138+
s6Gc9Q/xAbTzlbVUZDwoUkdCgx0LHuENIKE8SYi31wA3sfDcgTLs0sSih/Esx8cQ
FsHqpY2r+loug6SkIWG0nlZOiXEUmms/Em5r0oahW9lLMcP+Y5OpzJN4BTPZHoOM
uEHXdbJRs+NDdM6AUNpXbamcdvMST1DXpigjCkxTfFmGQQzrDrugSQvGpRtaO/WE
yYxxrxnzfUFhv8FVDtXlxS0KI5yb2TJmdI80abFfKV/sshPFH9tIeEDIwdKDRbUx
GuOYXFKBrK8S3A0PxJwlUJQa3yxc4700nnMdK4vUDNKtSTCfs2UB2vktYkJ+QpsR
24lKzwqeBG+XLJMAm6cOzmrSyiX72Iuw73qth8orFuZXeBWqQixN/fdTFoMXv9AY
dNo+190g0DXIGIrMayljP7R7oBI3NlnKYbc80DwjzdSf10KaXFjgYr1FONy84j7Y
hKLeN7NuDK+LliNBa/W6/s7YApcQf99RnuzaG3sBrIdDrQuvA/ldk8giCD71qO4+
ypE1ZyI6ec0a7Az0Xgsj/oW/HApiPcUs3f/rlv6cSTxb4+KtFvUmrkf6jaopmOxY
mL556GqiwB7h434VdAt7tLQdDflmDno8wIzxljL1slPllsjyhpQo1kyXZsrG6mMc
elQn4W7wy1O9AG6iIiCiXnnAyYEiNbDqaHaJTGFRjCFWrz3mXA==
=MdJR
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

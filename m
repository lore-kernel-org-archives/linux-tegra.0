From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Date: Mon, 27 Jan 2020 13:52:16 +0100
Message-ID: <20200127125216.GC2117209@ulmo>
References: <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
 <f915949a-b46e-26fe-f103-fbc8d1fa3bb1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f915949a-b46e-26fe-f103-fbc8d1fa3bb1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 01:03:57AM +0300, Dmitry Osipenko wrote:
> 27.01.2020 00:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> [snip]
> > Thinking a bit more about how to define the ICC, I'm now leaning to a
> > variant like this:
> >=20
> > interconnects =3D
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMP &emc TEGRA_ICC_EMEM>,
>=20
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMPR>,
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMPW>,
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW>;
>=20
> I forgot that each ICC path should have SRC and DST, but you got the idea.
>=20
> This should be a more correct variant:
>=20
> 	<&mc TEGRA186_MEMORY_CLIENT_BPMPR &mc TEGRA_ICC_MC>,
> 	<&mc TEGRA186_MEMORY_CLIENT_BPMPW &mc TEGRA_ICC_MC>,
> 	<&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &mc TEGRA_ICC_MC>,
> 	<&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &mc TEGRA_ICC_MC>;

This seems wrong again, because now we need to make up this TEGRA_ICC_MC
ID that doesn't exist anywhere in the hardware. So we're no longer
providing a hardware description, but instead are building hints for a
use by a Linux-specific framework into the DT.

Thierry

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4u3QAACgkQ3SOs138+
s6Ey4A//Ravurx17XVBLLytw2Ez2J5uO0PFw2M1G3FfEIq0n1cT2oye0vO1RhI2a
tvtP+tKkicx9DDJVCDEni3cAl/uoyIHJNCA8jHj5yaXQVdZSxsGai1dsiWzRk0Ff
aI3lazLfkCVWlGpXvtZG9bf2GOvFS6Y1mOxs/5OMhewSFp/iWCR6y/2yOk9+bJo6
zpZ41SnOFgg/BaDrn1eAApNm5Y3dxXdJ1y5+iDs4ZgdXA/gGJ2WRAbse1PoglmTB
wdL6p4ieSXbAaHiB38rQP7Xs9Mv5gZoaw+p9HOAiP2fsvSAol5S2rMq+MJuj9Bbc
zoVRnmFYAYDwKLRfj8opRhHp0CLN1v7nQaYuqRJXfSIPsawm7kgzf9c++etQD4H9
9rpDnQceLrORDUQxZUc6pjMAAWsRsxJtT04C4bodtTeT7shUZk9rs1SA8R6YvFf9
Ubb/PEa6tv1RF08a6rfaloEybZw0cnwe52Q/5ye0T5VyN2F6gM+sr66EyxG2CNDD
l/mlVkTz8f9k+Vil0KoBjyUAOx2pY8w3pATiLUA6ST5NjkPa3YMZVhAKuQVFEM4S
tygXspNRL9ZvhfJZR2pRfyO+pKUsBtOeXNCGaEtfw7kKKhrvab4ZnghA9vjsWMSu
AzeYasSvKdSAqo9SUHdT8aIAhCBr3AjRNxEwO5hB8xjOejejeeU=
=fese
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--

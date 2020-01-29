From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Date: Wed, 29 Jan 2020 10:36:02 +0100
Message-ID: <20200129093602.GC2479935@ulmo>
References: <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <20200127122115.GA2117209@ulmo>
 <d56618e1-8940-65ae-381e-796e44bcf537@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d56618e1-8940-65ae-381e-796e44bcf537-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 10:27:00PM +0300, Dmitry Osipenko wrote:
> 27.01.2020 15:21, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
> >> 21.01.2020 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
> >>>> On 1/21/20 16:10, Thierry Reding wrote:
> > [...]
> >>>>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's alwa=
ys
> >>>>> going to be the same and it's arbitrarily defined, so it's effectiv=
ely
> >>>>> useless. But other than that it looks good.
> >>>>
> >>>> Well, in most cases the target would be the EMEM, so that's fine. I =
have seen
> >>>> that other vendors that may have an additional internal memory, espe=
cially
> >>>> dedicated to some DSPs and in such cases the bandwidth needs are dif=
ferent for
> >>>> the two paths (to internal memory and DDR).
> >>>
> >>> Most chips have a small internal memory that can be used, though it
> >>> seldomly is. However, in that case I would expect the target to be a
> >>> completely different device, so it'd look more like this:
> >>>
> >>> 	interconnects =3D <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
> >>> 			...;
> >>>
> >>> I don't think EMEM has any "downstream" other than external memory.
> >>
> >> The node ID should be mandatory in terms of interconnect, even if it's=
 a
> >> single node. EMC (provider) !=3D EMEM (endpoint).
> >=20
> > I don't understand why. An ID only makes sense if you've got multiple
> > endpoints. For example, a regulator is a provider with a single endpoint
> > so we don't specify an ID.
>=20
> Because this is how ICC binding is defined, unless I'm missing something.

I don't think so. It's defined as "pairs of phandles and interconnect
provider specifiers", which is equivalent to what pretty much all of the
resource bindings define. The #interconnect-cells property defines the
number of cells used for the specifier. In the normal case this would be
1, and the value of the one cell would be the ID of the endpoint. But if
there's only a single endpoint, it's customary to set the number of
cells to 0, in which case only the phandle is required.

Thierry

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xUgIACgkQ3SOs138+
s6HhvA//QjDP9iHRZnLDv+FLgl58pyhW4dkxH9ZiiH+bUzB4Wn2j6Oq9MTsKB5Pf
FZcziCb5JgRqxzySzFR/MuJlad+riTX+wKkdTEUQIhgrBdfaVvP/ZVsdQtuo6RDm
SyLuAFL14gJBncJ2bO8i4AJ269LXuowJvJK8TxZaTdD1KqnkIh/jwSoqJyPa+ibi
XSDBtFYI+PtFeSsLhhvC5T3YTAHLFzV4sHO2WS5XvWjdvSWDEnxF/OV+bBLTZAWA
htUKUPaHDDdkc8uX/WYhTqsae5L7f6kw2HrkGHJiRu1dwKMP/C8u5mO4g5ItvpGs
dqEwG0DAuPbTJVsNKv4GE6T3QqCRHtWBSmz/NbUdj40v+jmNmcKp7vEwc4IL9cp+
sTY1yywWFP4NrcZqIqR/bHinGTs0sdhM8Z/V0oKd01sf4tu0UORKEv1wLN7F8Y84
l8D19oJ73bRKbodGuHa/zxFNHDGOWnUVTBCh+BCd+XtX/jPaoFAs6y838WIP2oAC
RB4r8hyeQcIo1Up5B1rIhJxaIORR2/f6z+OqmzVsNsu6HO+ELQScW9vuOTgQqgbT
iO8qEYfRzNWibSUeZ20sCb+Qp8Ei15va+RtYZ7X2+4lAjjS+wk8Rsemksm6L8/mY
R6egPQm6XfsP4PTySBK1F6r/nLuMaj06p8yH9U7Vc/iq8aL3NoA=
=xa9N
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--

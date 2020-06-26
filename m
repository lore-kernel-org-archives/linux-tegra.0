From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Date: Fri, 26 Jun 2020 13:40:40 +0200
Message-ID: <20200626114040.GA3143884@ulmo>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 01:06:58PM +0200, Karol Herbst wrote:
> On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> wrote:
> >
> > # Host1x/TegraDRM UAPI proposal
> >
> > This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> > the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> > many ways.
> >
> > I haven't written any implementation yet -- I'll do that once there is
> > some agreement on the high-level design.
> >
> > Current open items:
> >
> > * The syncpoint UAPI allows userspace to create sync_file FDs with
> > arbitrary syncpoint fences. dma_fence code currently seems to assume all
> > fences will be signaled, which would not necessarily be the case with
> > this interface.
> > * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> > Not sure if they are still needed.
> >
>=20
> Hi, as this wasn't addressed here (and sorry if I missed it): is there
> an open source userspace making use of this UAPI? Because this is
> something which needs to be seen before it can be included at all.

There's a set of commits that implement an earlier draft here:

    https://github.com/thierryreding/linux/tree/for-5.6/drm-tegra-destage-a=
bi

and corresponding changes to libdrm to make use of that and implement
tests using the various generations of VIC here:

    https://cgit.freedesktop.org/~tagr/drm/log/

Before actually jumping to an implementation we wanted to go over the
design a bit more to avoid wasting a lot of work, like we've done in
the past. Turns out it isn't easy to get everyone to agree on a good
ABI. Who would've thought? =3D)

I expect that once the discussion around the ABI settles Mikko will
start on implementing this ABI in the kernel and we'll update the
libdrm patches to make use of the new ABI as well.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl713rQACgkQ3SOs138+
s6HnQQ/9HkD1MHHeapEcnLVFgLiBum365fmqgGgJ5efaTwGtbES9Wet4idqD0wgz
9ARttZ3MLezzzJZWKolNI27ja+MPYnb8UyroITDTseXrVEiLR3/L6t0jeekX6zXA
0sbFZiv33cO9rkgD+z4hYAgadpCvZOOsKb7SciZFqYS6LMxPv6AQ6chX4s3/AXcA
ZSEUCoAesUWopKTsLSHtmBor0VKOaJdSWj4ei3POTBS7LQnhZCIGdZDy+i+Hlmsd
53LW21zaSECPxfSM6ibmhPv9+mvd1QSqBQXryXs8Bohj3/WfYPY6MLVj6Z+2XenQ
hpuXwsAtRJtdi5uJ+l+6N/X9zel1p0RqBXioCU409Gotzn7zbvAYQ2aAvFD8Y1fh
XwTpOMhU8zS16yBsCpFotc9igFeSULuMPt/GcLwnAjspHIoWE2yX5DII/mx/XCmc
IeTnKTlZ8WmWoJJAB/8lnypoMwatDA4ZAYbqgIOPN65dWlXdHxCGkayYN5xj1QRL
f3fBLHsiSXHJ54NhMj50wGMEFjBOq3NdFij7i3z8Zo6Y1UT18L3fuvszJuz0Qk7t
/IqCfN0Fgoc03sj8c9OH00+aMaGg9YxLaOYq06rox87fBD1xPpP7CbLxPbJuSLhf
lBUnIoQKS77gx5cEudEKrqYSSpCUllsxUBcGjhK/9E35MJ/YrTI=
=Ejbg
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

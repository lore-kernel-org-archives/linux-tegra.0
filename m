From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 15/27] gpu: host1x: Add support for Tegra114
Date: Tue, 15 Oct 2013 10:05:57 +0200
Message-ID: <20131015080556.GE7856@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-16-git-send-email-treding@nvidia.com>
 <525877F3.9070004@wwwdotorg.org>
 <20131012112443.GC22284@mithrandir>
 <525B8174.4000907@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525B8174.4000907-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 08:30:28AM +0300, Terje Bergstr=C3=B6m wrote:
> On 12.10.2013 14:24, Thierry Reding wrote:
> > Yeah, I don't like very much how this is currently done. I mean about
> > half of this is actually duplicate code because of the static inline
> > functions used for register defines. As discussed elsewhere this was
> > originally meant to be used for coverage testing, but nobody's done
> > anything like that as far as I know. I'm also not convinced that these
> > would be very useful in coverage testing, but adding Terje on Cc and
> > unless he or anyone else has any (strong) objections I'll go and remove
> > the duplicate definitions and while at it see if I can come up with a
> > way to share more code/definitions between versions of host1x.
> >=20
> > Do you see this as a blocker for 3.13 or can I do the cleanup after
> > that? As far as I know Tegra124 has a more heavily modified version of
> > host1x so implementing Tegra124 support might be a good opportunity to
> > clean this up anyway.
>=20
> For Tegra114 the register level changes are small (one channel added,
> wait bases, expanded fifo, etc) but for Tegra124 they're bigger. So
> let's keep the long term in mind.

I agree with Stephen here. We should really be working together with HW
to prevent as many incompatibilities as we can.

> I'm ok with removing the inlines. Just the energy spent in discussing it
> over and over again is more than the benefits that a proper compiler
> gives over the preprocessor (type checking, real syntax checking,
> coverage, gdb breakpoints, etc). For some reason (which escapes me)
> preprocessor magic seems to be the norm in Linux kernel.
>=20
> Parameterized code gets easily really ugly, difficult to debug and
> difficult to port to new chips. There's much less work and opportunity
> of mistake in maintaining data in a couple of files than subtle
> algorithms all over the driver. If we don't have inlines in hw headers,
> the headers become tiny and any benefits of parameterized code versus
> per-hw version headers vanish.

I'll keep that in mind when I revisit this.

Thierry

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXPdkAAoJEN0jrNd/PrOh9vkP/1Mb7MesjxVkX6c2UGcSfRcp
2JebDlOtJmUUAEEdrQ3pgyP3QoN9C0KhyZA3K83B9TOYlpSnQ98tc7Ypl5X1Ftqb
Scb67gxWs9bULQcDqRUH4AnbgclLuYuEMT7xPFKieCcD9qoEwCqGwGWq9rwunL8a
UoIFRoEv2SMWYLgcuYpqvogBiQcryYIB84Ixt91cVqkPR+svfuMIjh05Ri4UKLGh
GI3HI6PVY1t/1eTcmIyi6yRNcc5hmv7F3zgcvLHgiDArCI0zMmVpL5ZBG8bDq2xF
L6Y4bxEkwaleIdZIVRwmFqtbA+dFnbSnd348BwfYAlQhbf1aISkv0CpSNEcmCxh0
lDN3n987YZXz0OLiv1gNjalYqewPfhYs8aSdahbsGZ3ofWDZ30RR0dVplWISRJkG
V9/sMuc+x6vs42pOh4cYY08jUPn0xt0Tyd8iOTEG2J0X1HnGPf4d0QT5cHsfBQkv
lvokj6KV7+xZUpohSNGqS+W4Qsgg3xjr5R+q3vdzkdAOMW5kwcGaJYT406DQlxj3
0YB610VUejpHqPKq63XW8lHqZ+lbShsy9sw/nVUhPT1Bih7lvoPHFCK0MmdzX+le
rK/r8sQFNsQM4iitSwvjurehz/w6HwFh0VstHusLJWqrhNgxIxV0nTxYCaQAFsKP
IPb8s/zsjZxiS3W2/dcv
=LfkI
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--

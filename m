From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/3] gpu: host1x: Reduce host1x job allocation size
Date: Thu, 9 Apr 2015 10:53:49 +0200
Message-ID: <20150409085349.GF12103@ulmo>
References: <1425606712-15986-1-git-send-email-davidu@nvidia.com>
 <0e36c4295adc4f2daae9715cd0dde87d@HQMAIL102.nvidia.com>
 <CAAVeFuK4NOrfCcX846rgPdViR6Ur4pSrrVihiV7KP1kRf15kdw@mail.gmail.com>
 <2253e92cd45c4b33913a45011c4ce823@HQMAIL102.nvidia.com>
 <CAAVeFuLZOJdOtpuSqdRzGa0rK3WZWURz-pn2tXhqTv58J0R_NA@mail.gmail.com>
 <4ca2d661eab54c3eb861680ebc24a430@HQMAIL102.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ca2d661eab54c3eb861680ebc24a430-wO81nVYWzR5xWE4FnwvcdlaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: 'Alexandre Courbot' <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2015 at 11:13:38PM +0000, David Ung wrote:
> > -----Original Message-----
> > From: Alexandre Courbot [mailto:gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> > Sent: Monday, March 30, 2015 11:30 PM
> > To: David Ung; thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > Cc: airlied-cv59FeDIM0c@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; Arto Merilainen; Terje Bergstrom
> > Subject: Re: [PATCH V2 1/3] gpu: host1x: Reduce host1x job allocation s=
ize
> >=20
> > On Tue, Mar 24, 2015 at 4:39 AM, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > >
> > >> -----Original Message-----
> > >> From: Alexandre Courbot [mailto:gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> > >> Sent: Monday, March 23, 2015 12:09 AM
> > >> To: David Ung
> > >> Cc: airlied-cv59FeDIM0c@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > >> thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; Arto Merilainen;
> > >> Terje Bergstrom
> > >> Subject: Re: [PATCH V2 1/3] gpu: host1x: Reduce host1x job allocation
> > >> size
> > >>
> > >> The series looks ok to me, the only problem I see is that we are
> > >> lacking means to thoroughly test host1x patches across all the
> > >> supported Tegra chips.
> > >>
> > >> Could you detail what kind of testing this patch series has
> > >> undergone, and which chips/boards have been tested?
> > >
> > > Tested the host1x channel tests for T132 on A44.
> > > Also ran Paul's EIMT set up which only tests booting kernel to console
> > > for T20/T30/T114/T124 and QEMU
> >=20
> > Thierry, what do you think?
> >=20
> > I know we are lacking proper testing infrastructure for host1x, but the=
se
> > patches really looks harmless to me.
>=20
>=20
> Thank you Alex for the review.
> It would be good to have closure to this patchset.=20

We'll get closure on this once the testing infrastructure appears. I
won't apply these patches before then.

Thierry

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVJj4cAAoJEN0jrNd/PrOhqIMQALfLYQT2jfwN1FzUhkvqVuwi
bNe+9NY0eRlfN3dWpC1XFqbxyuKK75hVjep4PSM8LMFycyjr2dwK8GMux1HEIyq4
DLpKpKgdMqzr8NobLj8S+pAW61Kli6jqUtl6jHGD4Ii46w5jj8kQYgtF4oZko15n
d7N92AT1Z63TGi08irrl6N9jkmtNgOPNKi/oqsoiI5AUnEthGH7NQyW77De/JQlb
vxTedzkgTDBONXfiPzJJsg61i2D2gTNxvBIx+Y0fzxo1vaohIrDTJYTBfncPS0rZ
qbUph2flgWPqSphVaZcwICmUweAvWeMMlNF6lff0WipguHU1t75I5HnTxjpv/POt
2PnMxsdpAveJmT7/MQojmzQA7lNh9IODFzehRO1Mj1/+uOqApOKsL05fiYqIjnEK
2NxoVPBkcXHzRUsIv5fAfGkEGFqrLap13WooTDxBFMPr+IpMu20/2sRv0r9PPU4m
EtgkIuqjFHDv5pWKyM47JbDo275YYdIGV9Qr7iEkulMKumuVS16jxjVcIvGoRSbf
j3LWTULh3DVkEn6Wa0mx+2hzTbyBuHvQvD3kxUH7Z14FPMzLHd+yaWwUwd4bjCaH
7f854ngeDy7XffF8Hszo9bP5TKsSuD6Nr5DOb99lb4fE6OGBL1+DJMH/vUo91CJS
WKxM/PIzd4NB83x0mh5v
=Ut8S
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--

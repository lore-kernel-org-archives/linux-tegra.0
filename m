From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Tue, 8 Nov 2016 18:58:03 +0100
Message-ID: <20161108175803.GA12994@ulmo.ba.sec>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <CACRpkdZpPHLDGeBb8kb=LYmuT0PKPf_quK+OF2peaV+8dxr5vQ@mail.gmail.com>
 <20161107132127.GE12559@ulmo.ba.sec>
 <CAOesGMgJUepmq2JTT7imKh74BsnGobcpBWFuNp94WnX1WtzEjA@mail.gmail.com>
 <20161108155548.GC2244@ulmo.ba.sec>
 <08947785-2e7f-0117-2392-b6b1a774bbb8@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <08947785-2e7f-0117-2392-b6b1a774bbb8-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 09:49:27AM -0700, Stephen Warren wrote:
> On 11/08/2016 08:55 AM, Thierry Reding wrote:
> > On Mon, Nov 07, 2016 at 05:42:33PM -0800, Olof Johansson wrote:
> > > On Mon, Nov 7, 2016 at 5:21 AM, Thierry Reding <thierry.reding@gmail.=
com> wrote:
> > > > On Mon, Nov 07, 2016 at 08:53:37AM +0100, Linus Walleij wrote:
> > > > > On Wed, Nov 2, 2016 at 11:48 AM, Suresh Mangipudi <smangipudi@nvi=
dia.com> wrote:
> > > > >=20
> > > > > > Add GPIO driver for T186 based platforms.
> > > > > > Adds support for MAIN and AON GPIO's from T186.
> > > > > >=20
> > > > > > Signed-off-by: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > >=20
> > > > > Stephen/Thierry/Alexandre:
> > > > > Can I get your review on this Tegra thing?
> > > >=20
> > > > Can we hold off on this for a bit? I've got my own implementation of
> > > > this in my Tegra186 tree because I thought nobody else was working =
on
> > > > it. From a brief look they seem mostly similar but there are a coup=
le
> > > > of differences that I need to take a closer look at (and do some mo=
re
> > > > intensive testing on).
> > >=20
> > > Be careful about discouraging other developers internally from
> > > participating upstream, Thierry.
> >=20
> > That was certainly not my intention. I do welcome any contributions,
> > internal or external.
> >=20
> > > Please don't become a bottleneck for your company's contributions.
> > > Rewriting stuff on your own isn't a scalable model.
> >=20
> > Like I said, I didn't rewrite this, I merely wrote the GPIO driver
> > because there wasn't one at the time and I wasn't aware of anyone else
> > working on one. Waiting for a GPIO driver to emerge would've prevented
> > me from making progress on other fronts.
>=20
> One issue here is that there are lots of patches destined for upstream in
> your own personal tree, but they aren't actually upstream yet. I think
> pushing more of your work into linux-next (and further upstream) faster
> would help people out. linux-next and other "standard" repos should be
> easily discoverable by anyway following any upstreaming HOWTOs, but those
> HOWTOs aren't going to mention your personal trees, so patches there
> effectively don't exist. Making the already extant work more discoverable
> will help prevent people duplicating work.

I had assumed that I had properly communicated what the canonical
temporary location for Tegra186 patches would be, but you're right that
it's probably easy to miss, and linux-next would be a more obvious
target.

> Related to this, I've been waiting rather a while for the Tegra186 DT
> binding patches I sent to be applied. I'd love to see them go in ASAP even
> if there's no kernel driver behind them. The bindings have been reviewed,
> ack'd, and they're in use in U-Boot already.

It's true, I've been promising this for weeks now. I'll get around to it
within the week. Please do prod me in case I don't. I promise I won't
get mad =3D)

> A thought on Tegra186: For a older supported SoCs, we obviously don't want
> to push changes upstream that aren't too well baked. However, for a new S=
oC
> that doesn't work yet, I'm tend to prioritize getting as much early work
> upstream as fast as possible (to try and unblock people working in other
> areas) over getting those patches perfect first. Release early, release
> often will help unblock people and parallelize work. Pipeline your own wo=
rk
> rather than batching it all up to release at once.

I'm always hesitant to merge code that isn't functional or tested, but
perhaps I'm being a little overzealous here, and I'm evidently not doing
so great, so let me try to be more aggressive.

> P.S. don't take this email too personally or anything; I'm not trying to =
be
> complaining/critical or anything like that. It's just a few mild thoughts.

No offense taken, thanks for being constructive about it.

Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIhInAAoJEN0jrNd/PrOhiJQP/3Z//d5Ni9vqFc9LA3RbhRje
GwJYxDK2ka7+1GUWUOKmW8OKgyxyWCKSeGWtNqECP+uIN82XQFvYmoEjyYCDZ0N+
F9L36oSAMcAJTMEjumHc+9ec+K+Kl3RqJcBfdBIf/wPE6UQJiBZzorK+sJ05koiL
SAzCnwpSloVr6XEh//ZJinKweoV2W90lvR9MTSWFmdd+Ku69OqrsjkjtaABWJIYt
QNz8FJxzanPn5r9sVI0HZII9g0MZpizlV+6W5MP4lMsF0wIj0z42l/L67Opof/Pu
gddhP/tpLYudSeTn4h0U/gc/g0vLg7n3kZvUXEvvif8xq80x2WTqdDi9wkI9EMRo
5aO3km5ApjTJ/Y+LAv0BUUH5ExRpdcJkTpzmZIs2DBzSAPB0kJqVH6cYyFwtvZN4
TvL19zMLX98LpruouKGPffCBx9ApU6hOhXKJy+8uk/DTfUtjyg9pzje2QDPeesVJ
O2GijHVm/o7JHBhHeYIxqyIOXW3QJe+7MJjvgBwwgyMD4B5WiphbrCKP7TrWxUq5
AoyLE11TTWnvJn3MF4c4tlGVBmVDsmhS1Ycdl3Ni1+zfk0j8sWwdHJS41jXG7Gw2
BqVa758k57+6hkFeBsNDAqaCck0SRGomTnlAYa2u/YN4eNGBbm74XLJKXCOACPLI
NVTy8zjDScp76slZaDar
=fzAp
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--

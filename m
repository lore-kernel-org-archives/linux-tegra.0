From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] ARM: tegra: add DT binding for Tegra186 GPIO
 controllers
Date: Fri, 22 Apr 2016 13:41:10 +0200
Message-ID: <20160422114110.GC9047@ulmo.ba.sec>
References: <1460483197-5130-1-git-send-email-swarren@wwwdotorg.org>
 <CACRpkdYmcEQBN5QwjLa-Wyorv-otPdJh5C1KgKwUjUBWXvnb_w@mail.gmail.com>
 <570FB459.8090802@wwwdotorg.org>
 <CACRpkdbazmBE6rMO0EKmK6qxqL7uaWNQmf=SNEDBJPCTVteFiA@mail.gmail.com>
 <57111107.8060309@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57111107.8060309@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2016 at 10:04:23AM -0600, Stephen Warren wrote:
> On 04/15/2016 03:17 AM, Linus Walleij wrote:
> > On Thu, Apr 14, 2016 at 5:16 PM, Stephen Warren <swarren@wwwdotorg.org>=
 wrote:
> > > On 04/14/2016 06:42 AM, Linus Walleij wrote:
> > > > On Tue, Apr 12, 2016 at 7:46 PM, Stephen Warren <swarren@wwwdotorg.=
org>
> > > > wrote:
> >=20
> > > > I suspect that the Tegra definition of a "port" is close to what ot=
her
> > > > people
> > > > call a "bank" like I try to define in this patch?
> > > > http://marc.info/?l=3Dlinux-gpio&m=3D145941547420164&w=3D2
> > >=20
> > > There are similarities, but the concepts are quite different. In that
> > > thread, the term "bank" actually refers to an instance of a standalon=
e HW IP
> > > block. Here, "port" is definitely something internal to a single HW b=
lock.
> >=20
> > OK I get it. I wonder if we can make that common terminology as well.
> >=20
> > GPIO bank :=3D unique instance of a common IP block
> > GPIO port :=3D unique line range inside an IP block
>=20
> I think this would be hard, and in some places potentially confusing.
>=20
> Various HW documentation likely uses the terms bank and port, without reg=
ard
> to how those terms are used in documentation for other chips. I'd like the
> binding for any particular chip to use the same terminology as the HW
> documentation for that chip, even if it's inconsistent with other bindings
> (or at least contain an explicit terminology translation table). That's
> because the binding is intended as HW documentation.
>=20
> Within the Linux code, we could certainly attempt to use consistent
> terminology. If so, I suggest we use terms that are quite unlikely to be
> used by any HW documentation, or could only realistically be used to mean
> the same thing. If we decided to use "GPIO bank" and "GPIO port" as you
> defined above, yet some HW documentation already used "GPIO bank" to mean=
 a
> subset of GPIOs within a single IP block, and "GPIO port" to mean a single
> GPIO (both of which I think are quite likely/possible), then that's going=
 to
> make matters worse not better.
>=20
> Perhaps "HW module"m "IP block" or perhaps "device" would be a reasonable
> term for "GPIO bank" as you defined that above. Of course, bikeshedding:-)
>=20
> I'm not sure of a reasonable term for "GPIO port" as you defined it.
>=20
> ...
> > It's cool.
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >=20
> > I assume you want to merge this through the Tegra tree, or
> > should I apply it to the GPIO tree?
>=20
> I'm happy either way. If through the Tegra tree, Thierry would be applying
> it so I'll let him make the call.
>=20
> I suspect that both this patch and my earlier "ARM: tegra: fix naming in
> GPIO DT binding header" should be applied through the same tree for
> consistency.

Applied (to the same tree as that other patch), thanks.

Thierry

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGg3TAAoJEN0jrNd/PrOhcbEP/2hffZ6MBcIaPX1093qhZRs/
LZl299cOWZiRjcSV2DCDokgwEr7oerJ1u29qJBerlvQevslPoSUkFzfbyd6JCigq
TEs6TJR5Ci4mFq1CUy1bQgxBRKfY0WPtvdYYNP3FC/ZMpk55FG+tcntJMx/ZCaRO
xsiABPZWFJBwQDffmcr4Ukjox1DqvKYceQkYRwMHPK89RKJzsCC11Yx+hmM/w2/4
Id3U7fTevK8Co+xPDXPaXDWYaKugtCkOi6vgUgGfNDRiMJeMffQpTsZfQ6voeSSw
kA6AL6pjZNDb/QXxu3fLTPtCvoDwpqIMfzd3TPAVEaDtt8MOY41Pu79+SvUJqQE8
Ai/zTTkEvb3cI5BibuNi8wMp0yu1MjTG+NNJ/0aQaktjhuTw7WJ88MDStcVxclHW
iRdQvBuAip4G0t9m/H4+D+afAM/CC+93RNs75u3N53fC5V0GpN68lU3BigPdQHAe
x5wQhJ6szut4tMAYD53+viz/ypFSsvrYJfEfjinOt/TlOfzmXu0a4UgzX1Z1Rd+q
vPo/JRz0a/12SJ1V2S+Yj5EUT4+T5pUEG97UdzS64j2GZMREOegMRGHYkXQ9AiVM
/TYg9QmqjRfOJaYOuLMSgEHpLPVGaExFAsGUo9Y3relyNyXbAj98XgnwJG7tWac1
VxLW0C69CM6PeiNRRBlJ
=kciN
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--

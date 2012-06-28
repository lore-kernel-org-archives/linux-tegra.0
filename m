From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Thu, 28 Jun 2012 14:07:05 +0200
Message-ID: <20120628120704.GE15137@avionic-0098.mockup.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <4FE9FB22.1090902@wwwdotorg.org>
 <20120626195108.GB5308@avionic-0098.adnet.avionic-design.de>
 <4FEA3C2E.3030109@wwwdotorg.org>
 <20120627050733.GA7177@avionic-0098.mockup.avionic-design.de>
 <4FEB47B7.4080104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FEB47B7.4080104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2012 at 11:49:43AM -0600, Stephen Warren wrote:
> On 06/26/2012 11:07 PM, Thierry Reding wrote:
> > On Tue, Jun 26, 2012 at 04:48:14PM -0600, Stephen Warren wrote:
> ...
> > I actually like what you proposed above a lot, so if you don't
> > mind either way I'll go with that proposal. Keeping the connector
> > nodes as children of the outputs has the advantage of being able to
> > reference them if we need it at some point. But it is also
> > redundant in that a single output doesn't usually (never?) driver
> > more than one connector.
>=20
> Yes, I believe that each output is 1:1 with (the video portion of) a
> connector. The display controllers obviously aren't 1:1.

Yes, the display controllers are only 1:1 for the RGB outputs. I'll
merge your proposed changes and see if I can come up with some code to
parse it.

> > The same issue will have to be addressed for the CSI and VI nodes,
> > but as I currently use neither of those I don't feel qualified to
> > propose a binding for them. Also for the VI part we're completely
> > missing documentation. Maybe somebody could push this to be
> > released as well?
>=20
> I did file a bug noting the request for VI documentation. At this
> point in time, it's too early to say what, if anything, will come of that.

I think we have some raw register documentation for VI but it's next to
impossible to really understand the hardware block just by looking at
the registers.

> > If I understand correctly, most of the host1x children can also be=20
> > chained in a processing pipeline to do postprocessing an video
> > input for example. I suppose that's generic and doesn't need to be
> > represented in DT either, right?
>=20
> Yes, I believe that's something internal to the driver.

Okay. So I think apart from the carveout topic in the other subthread I
think we've settled on solutions for the remaining points. I'll try to
find some time to work all the changes into a new binding proposal and
get working on the code.

Thierry

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP7EjoAAoJEN0jrNd/PrOhmiAP/27BVwLsv4k4ssV0wr6a9IZy
o9nk8tNVDXitWYEQqCjB8SXt+53MDTkhhVe9BqGX/c5dJP8Jy0K0tVkmThS7HYSz
u1hPrhMkZmdWFGUPHTK5VYBzS9wVTTNG2h3swV3sIhJr2FM/jJ4CFEOiIV8WzD4a
DlW8PwV7NlUouhp7iGE1BiNhVdSryMD0bIeD5V8yJhYLeMiddDy+aDP6RScC1xyP
TjI69d5GwvwK4E1NhKR9AKUgohIGySu1O6L4VCZZewkYTqE0yHF6ZvTiCsQjuVkr
QIbFYpfsXGT/GgQD2YitMvpL1bZeFAzmF2VIlueaDsXDJ7th8ohy7Og9x0bEvJBa
+6tCYBEg1QG41Atoj+C3Jlu1g4A8uPyVJ/rVZLaeTaqFcqct4NY56vtpHHpxm9lO
sJGG1VLxyFO5Wula+saW/eppYyu4+EN7VUI2qysPbq08HHrGqP3eg0ajc3W7r/Ha
TeoEpzYSgLGWEPoBbKXn6v6l8vdZcX6or1xbSZvUVN6SJRmg+mecs7tfIbyNytvB
BDdR17rxreFN4HK7wEwOXiRSJsPW+tJkuU7wyUOP4TjmM60JE5vI0mC+bb2rCkfE
jm1PDA0gbbiJnumQGAEJlTwu/yQ9LD0ieUoDbP0oa55Ft5aCIlAmBqtdeftWGifT
TjHuuMA9Aw/RGNRYqaXV
=xCK0
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--

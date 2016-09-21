From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH 2/4] ARM: tegra: nyan: Use external control for bq24735
 charger
Date: Wed, 21 Sep 2016 09:56:59 +0200
Message-ID: <1474444619.1239.13.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
 <20160828173246.32621-2-contact@paulk.fr>
 <00697eef-0b36-1ff5-9c7a-43c1b53b52bc@nvidia.com>
 <1474394567.1215.14.camel@paulk.fr>
 <90828c8d-e46d-0956-d6b3-e88fc90f3049@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3026202353772032508=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <90828c8d-e46d-0956-d6b3-e88fc90f3049@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============3026202353772032508==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5S6UJB3TYnDbUsluiEEb"


--=-5S6UJB3TYnDbUsluiEEb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 21 septembre 2016 =C3=A0 08:30 +0100, Jon Hunter a =C3=A9crit=
=C2=A0:
> On 20/09/16 19:02, Paul Kocialkowski wrote:
> >=20
> > * PGP Signed by an unknown key
> >=20
> > Le mardi 20 septembre 2016 =C3=A0 18:40 +0100, Jon Hunter a =C3=A9crit =
:
> > >=20
> > > On 28/08/16 18:32, Paul Kocialkowski wrote:
> > > >=20
> > > > =C2=A0
> > > > Nyan boards come with an embedded controller that controls when to
> > > > enable and disable the charge. Thus, it should not be left up to th=
e
> > > > kernel to handle that.
> > > > =C2=A0
> > > > Using the ti,external-control property allows specifying this use-c=
ase.
> > > =C2=A0
> > > So the bq24735 is populated under the EC's 'i2c-tunnel' property whic=
h
> > > is there to specifically interface it's child devices to the host. So=
 I
> > > am a bit confused why this is expose to the host if it should not be =
used?
> >=20
> > Well, it needs to access the information in the read-only registers pro=
vided
> > by
> > the chip, which is allowed by the setup in place that you described.
>=20
> Is this to expose the current state to the kernel so we can monitor the
> battery state?

Yes, that is correct.

> > However, the EC has its internal state machine that decides when to sta=
rt
> > charging, etc and so should be the only one to write registers, to avoi=
d
> > conflicts.
> >=20
> > >=20
> > > Again you may right and I did find the original series [0] for this
> > > which specifically references the Acer Chromebook that needs this.
> > > However, I am not sure why this was never populated? Is there any oth=
er
> > > history here?
> >=20
> > I am also confused about why it wasn't applied earlier. However, the cr=
os
> > kernel
> > is using the very same scheme.
>=20
> Do you have a reference?

Sure thing, there's a similar commit for the dts[0] and one for the driver[=
1]
(which was already merged in mainline).

> > > What is the actual problem you see without making this change?
> >=20
> > There is a risk of conflict (even though it's probably not that
> > significant),
> > given the low variety of possible cases here. The idea is simply to say=
 that
> > the
> > EC is in charge and to let it do its job without interfering.
> >=20
> > >=20
> > > The original series states ...
> > > =C2=A0
> > > "On Acer Chromebook 13 (CB5-311) this module fails to load if the
> > > charger is not inserted, and will error when it is removed."
> >=20
> > I'm confused about that comment. At this point (and with this patch), i=
t
> > works
> > normally.
>=20
> Ok, I think Thierry prefers to only apply fixes for problems that can be
> reproduced. Is there a simple way to check the battery status and
> charging status via say the sysfs? If I can test that this has no
> negative impact may be it is ok.

Sure, this is exported at: /sys/class/power_supply/bq24735@5-0009
Also, note that the power-supply next branch[2] has some more fixes for the
bq24735 driver.

Cheers,

[0]:=C2=A0https://chromium.googlesource.com/chromiumos/third_party/kernel/+=
/e25a91f87af41e29012a4e2dd7a9ab725efd308e
[1]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/6b34=
e53d506b44f911d0fd246ccdc8b4e942e4ae
[2]: https://git.kernel.org/cgit/linux/kernel/git/sre/linux-power-supply.gi=
t/log/?h=3Dfor-next

--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-5S6UJB3TYnDbUsluiEEb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4j1LAAoJEIT9weqP7pUMn2IP/R0h8Bb4/bEzEcA6+uIjyO3y
ORHsWZtPsPcOIr93UH/5JPoZInCpt2KUMMV2y4fBxXzxNYiO0C34AqVA+X7IPkTO
i3M6N7cCRqrHVjH4ptTXxS62hm1Y4F7l8PkeRN+QNrDrsW9sv6FkLp7W6rB2lbSE
c0Mr187Yd49uK+WGw2+j3UZQ4h81d9BstGNkwahAKw9RZo2dNWybh2zjZ2ki99dN
BCH9K8v+LvZ9jMYj3EHZNEf3W8vgFNdwo04+cpi7ZBMgTGHxIg8abVxFKcsYr4tF
6JtShB5YEmtwQ1fzD+uWDmdzsvzmk/cvNE8NwNYpqh87kLAdjaSVwKDylTobrgv9
KE5G7eTHe97BX3nPAY2uIn857FZRWJC29A/52l20qMMRuDR+F0K17yMc3EZsF4VP
9aMsRB7Ti5DoXJC0fbXRqlikqiyR4tNJVFq1u1pZc8EhmB2l5RfjWo06DbIWmdf2
vwlPSDUFMwSHU1/K4/eupkfvc2CyoyIo9tevLf/rtT83f/IINrjd4dFkM25EjL4W
Q7uFQ1YZnrlREZyEgJXzxxCsQFYcUZeu1GdtV2vZqokxswJRR+YlN7Vs5zP/IDx4
6CDhM1wgtuY6APlsKgl/snORuEteHERiYfWtwjwNakKbz2ZRss2eXn/Et/ni86OD
JAeY9b+jX/jZUAsG/kgi
=bY9k
-----END PGP SIGNATURE-----

--=-5S6UJB3TYnDbUsluiEEb--



--===============3026202353772032508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3026202353772032508==--

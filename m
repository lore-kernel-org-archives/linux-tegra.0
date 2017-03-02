From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [Outreachy kernel] [PATCH] staging: nvec: cleanup
 USLEEP_RANGEcheckpatch checks
Date: Thu, 02 Mar 2017 15:57:01 +0100
Message-ID: <1935856.5rv8sDmiv7@fb07-iapwap2>
References: <20170302142418.GA16773@singhal-Inspiron-5558>
 <alpine.DEB.2.20.1703021535500.3414@hadrien>
 <b90bc602-cf06-4abb-bea2-6386d4976864@googlegroups.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2661183195696116190=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <b90bc602-cf06-4abb-bea2-6386d4976864@googlegroups.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: SIMRAN SINGHAL <singhalsimran0@gmail.com>, linux-tegra@vger.kernel.org
Cc: devel@driverdev.osuosl.org, outreachy-kernel <outreachy-kernel@googlegroups.com>, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
List-Id: linux-tegra@vger.kernel.org

--===============2661183195696116190==
Content-Type: multipart/signed; boundary="nextPart1664136.sEJSSsdfrg"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1664136.sEJSSsdfrg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

Hi Simran,

Am Donnerstag, 2. M=E4rz 2017, 15:48:13 CET schrieb SIMRAN SINGHAL:
> On Thursday, March 2, 2017 at 8:06:40 PM UTC+5:30, Julia Lawall wrote:
> > On Thu, 2 Mar 2017, simran singhal wrote:
> > > Resolve strict checkpatch USLEEP_RANGE checks by converting delays and
> > > sleeps as described in ./Documentation/timers/timers-howto.txt.
> > >=20
> > > CHECK: usleep_range is preferred over udelay; see Documentation/
> > > timers/timers-howto.txt
> > >=20
> > > Signed-off-by: simran singhal <singhal...@gmail.com <javascript:>>

I prefer not to change this. The whole interrupt routine is very wonky, and=
=20
changing some delays might break the communication with the i2c master. Als=
o=20
this is in interrupt context, so a change to usleep_range may not by=20
justified.

Marc



> > > ---
> > >=20
> > >  drivers/staging/nvec/nvec.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > > index c1feccf..cd35e64 100644
> > > --- a/drivers/staging/nvec/nvec.c
> > > +++ b/drivers/staging/nvec/nvec.c
> > > @@ -631,7 +631,7 @@ static irqreturn_t nvec_interrupt(int irq, void
> >=20
> > *dev)
> >=20
> > >                  break;
> > >         =20
> > >          case 2:                /* first byte after command */
> > >         =20
> > >                  if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD)) {
> > >=20
> > > -                        udelay(33);
> > > +                        usleep_range(33, 100);
> >=20
> > How did you choose the upper limit.
> >=20
> > I believe that Greg previously suggested not to make these changes if y=
ou
> > have no way to test them.
> >=20
> > Julia, After going through the reply given by Nicholas Mc Guire
>=20
> https://www.mail-archive.com/kernelnewbies@kernelnewbies.org/msg16464.html
> in this reply he has mentioned that even the range of 10 microsecond is
> enough,
> so I prefer to take 100 as upper limit.
>=20
> Simran
>=20
> julia
>=20
> > >                          if (nvec->rx->data[0] !=3D 0x01) {
> > >                         =20
> > >                                  dev_err(nvec->dev,
> > >                                 =20
> > >                                          "Read without prior read
> >=20
> > command\n");
> >=20
> > > @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void
> >=20
> > *dev)
> >=20
> > >           * We experience less incomplete messages with this delay th=
an
> >=20
> > without
> >=20
> > >           * it, but we don't know why. Help is appreciated.
> > >           */
> > >=20
> > > -        udelay(100);
> > > +        usleep_range(100, 200);
> > >=20
> > >          return IRQ_HANDLED;
> > > =20
> > >  }
> >=20
> > Groups "outreachy-kernel" group.
> >=20
> > > To unsubscribe from this group and stop receiving emails from it, send
> >=20
> > an email to outreachy-kern...@googlegroups.com <javascript:>.
> >=20
> > > To post to this group, send email to outreach...@googlegroups.com
> >=20
> > <javascript:>.
> >=20
> > > To view this discussion on the web visit
> >=20
> > https://groups.google.com/d/msgid/outreachy-kernel/20170302142418.GA167=
73%
> > 40singhal-Inspiron-5558.>=20
> > > For more options, visit https://groups.google.com/d/optout.


--nextPart1664136.sEJSSsdfrg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEySF+t0C8+8jyqfBvrJ5Hf0cUG2gFAli4Mr0ACgkQrJ5Hf0cU
G2jSzQf/e5s+HPVWQ4IK/5hwmAmr3vqiJeLCq8yyP7LWgwlA0yZas9DYeLiqM/EC
qbJQmpmNBVcB+SQSOD7VUblb/VuoovWryI605lx09osNnIzNbpMscbxTDU3jRFEF
POhAKLKayJ86jVr85He2lwAhZ2Eb18AVAqqTeh65g9xHoit2FYNlAQeRpmDOaFOW
ulDs0HNekHDY37LV2gqBOnE8OfmhrulTD8K1Ra9m7CTEugEelqGnCoFponS/MsPL
KBJZN7cOUpK75jSxb+zeV3znRC1gdplpK3AgrNLZMN1KnyUJsjuTZM8fkzaDxNRU
UssuSiA9F6iarcj+RiiE9F2zq8c9pw==
=WFMG
-----END PGP SIGNATURE-----

--nextPart1664136.sEJSSsdfrg--


--===============2661183195696116190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============2661183195696116190==--

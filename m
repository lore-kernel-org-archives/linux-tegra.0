From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: nvec: cleanup
 USLEEP_RANGEcheckpatch checks
Date: Wed, 8 Mar 2017 13:46:42 +0100
Message-ID: <20170308124642.GC29118@ulmo.ba.sec>
References: <20170302142418.GA16773@singhal-Inspiron-5558>
 <alpine.DEB.2.20.1703021535500.3414@hadrien>
 <b90bc602-cf06-4abb-bea2-6386d4976864@googlegroups.com>
 <1935856.5rv8sDmiv7@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6101351976500480550=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1935856.5rv8sDmiv7@fb07-iapwap2>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, outreachy-kernel <outreachy-kernel@googlegroups.com>, linux-tegra@vger.kernel.org, SIMRAN SINGHAL <singhalsimran0@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--===============6101351976500480550==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline


--bAmEntskrkuBymla
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 03:57:01PM +0100, Marc Dietrich wrote:
> Hi Simran,
>=20
> Am Donnerstag, 2. M=C3=A4rz 2017, 15:48:13 CET schrieb SIMRAN SINGHAL:
> > On Thursday, March 2, 2017 at 8:06:40 PM UTC+5:30, Julia Lawall wrote:
> > > On Thu, 2 Mar 2017, simran singhal wrote:
> > > > Resolve strict checkpatch USLEEP_RANGE checks by converting delays =
and
> > > > sleeps as described in ./Documentation/timers/timers-howto.txt.
> > > >=20
> > > > CHECK: usleep_range is preferred over udelay; see Documentation/
> > > > timers/timers-howto.txt
> > > >=20
> > > > Signed-off-by: simran singhal <singhal...@gmail.com <javascript:>>
>=20
> I prefer not to change this. The whole interrupt routine is very wonky, a=
nd=20
> changing some delays might break the communication with the i2c master. A=
lso=20
> this is in interrupt context, so a change to usleep_range may not by=20
> justified.

Yeah, I think this is going to trigger a WARN_ON from somewhere in the
scheduler because of the interrupt context. I suppose checkpatch could
be made smarter about this, though I doubt my perl skills would be up
to it.

Thierry

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAli//TAACgkQ3SOs138+
s6H2+w/9GjyvkehnVlfFgHn7KnxHQ3Yo1pH9TC2rui0WcXPQFuNNDBdu454LKPox
D25qJ3YFaj3YCU9i6p49tphquMStGNDCc06o1rK/JxyMPJar/5+e0xzXAQlT0gIQ
qc6vCKW9gzCdmuuytCV4OA0f4iwNCOJXBelknTQJJaemcc+Le1JSvuINH1ZJJUlL
gS/Jbw628+vvOskFNeoIGhK4zKS/MJDMzOl/EtyKuKh8pBc57um3/cV5eaabsq8d
wGIDRohy4T+JEmyYBskI6wDBedWtRlI2HhzdKmQTzWKQFVzhqEaW8Ka2WtblH33o
1YDNnvfFqdCwoxYYMZbgq+TPIkHvAJRinYPcasFJH6B2s3ADx//1WrHj4+rEc+KL
hr83nAmOccF3QX/NMppl9sMoPU0UvI83DDO8yPTVcEFr1CsR26ev5d7Er6fGfzZF
LwNio5UzYdBqFFZsecsUvVFQpaB2EFIlDAo0B4NJOKtrhT9YEZ8StqInN4OZtzoM
gYmnrNImVYIYKrQP41zwto2mqfGI2+XK+hdbu/YxIayrhRVXciQgAXUawLKTE7Nn
XrAedRhSUWP1RRZN2GnVr/cT1jqI1A1Pi0A1ybNfIHpNb6DbQaVeCFgNm0czfCiR
pWhMEHFDD+PmTeyjIQ9Lk4jvZcKowWamWa9NQaTXgMmFQjGIAaU=
=9FfQ
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--

--===============6101351976500480550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============6101351976500480550==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] arm: tegra124: remove commas from unit addresses
Date: Mon, 20 Jun 2016 19:11:24 +0200
Message-ID: <20160620171124.GA6333@ulmo.ba.sec>
References: <1466298275-15753-1-git-send-email-marcel.ziswiler@toradex.com>
 <576810C2.1030401@wwwdotorg.org>
 <20160620164057.GD6175@ulmo.ba.sec>
 <57681DC3.9090801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5720521201923215701=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <57681DC3.9090801@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============5720521201923215701==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 10:45:55AM -0600, Stephen Warren wrote:
> On 06/20/2016 10:40 AM, Thierry Reding wrote:
> > On Mon, Jun 20, 2016 at 09:50:26AM -0600, Stephen Warren wrote:
> > > On 06/18/2016 07:04 PM, Marcel Ziswiler wrote:
> > > > Remove commas from unit addresses as suggested by Rob Herring upon =
me
> > > > posting initial Apalis TK1 support:
> > > >=20
> > > > http://article.gmane.org/gmane.linux.ports.tegra/26608
> > >=20
> > > Acked-by: Stephen Warren <swarren@nvidia.com>
> >=20
> > I'm confused now. I posted almost exactly the same patch a while ago and
> > we agreed that we couldn't do this because the node names were to be
> > considered part of the ABI.
> >=20
> > Is it or is it not?
>=20
> The particular case where it matters is the GPU node, which U-Boot
> manipulates. This revised patch version no longer renames the GPU node and
> so in practice avoids any issues that I'm aware of.
>=20
> If there's a more general rule that node names are part of the ABI, then
> indeed we shouldn't take this patch.

I'm somewhat uncomfortable with this notion. Just because we don't know
of any other cases doesn't mean there aren't any. My understanding is
that it's fairly common to look up device tree nodes by name, however
brittle that may be.

There's also the matter of consistency to consider here. I suspect that
if we make this change somebody will notice the odd one out and send
patches to "fix it up". So if we get confirmation about this change
being okay, I'd request that a comment be added to the GPU node as to
why it is not converted.

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaCO6AAoJEN0jrNd/PrOhv6UP/Rk67Ma34Eox35v/oQnAeNqC
OINwCTT5cu3197i0erM8QqsqO65umqp2U7759XpWlQ5fAK1me7K9+LzooC5qYXPC
KBsbY05x4LPF1qq48PWDQUmP4z5FayCzsBSGbbg9Hnrza8Zw0lL3N5YO4AJTN+1Y
TObGH2KmGDlxL68RBkO7ZYUYFelb6IK09E/6LZU8Ol5IluHBsH8hRMRBzwBOttfO
JE5vqcic4YmobtipK/B293Em6IM/+MbgdaI2XyQObtS2bu56+X/mPlciYjrgmY3Y
Bdz31VBwbS6to89YtqFLF/SpZGkqI8f5sE3IoTT0v5w+C+8LJ4ctas/7llVv86Qr
BxhNx6jxHYr2A5ofMa9PhAu2BKJSD2prpN+icpyI2qqrmh2n4MLvF+Z6l/TNHfcs
B1RwrBpbMZwmuzJKwRraqdfvfEUXmc710X9X0HpXTlXvcTjpPoM9EkdJmKmYJQUY
SYl+J1oGX0yYwJIdTs8uSvIRG9rZ+O0FOzAyv41/Bps3C8byStPR41Brub/CJuZ6
dIKqYL6GXFYwnQs/FT+9jQ+woj4A7APuYT8Teza9hnlJOnLL4sTp8PSW8MZe/l/l
aidRM0L7CoJV/4twZIXwxt+RZ0qwAXL7LXyDu/6Fzv/xWpH9FbiCKizl5IGoKxNw
RRVIrB+4reX2aDf1cI1t
=nqgV
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--


--===============5720521201923215701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5720521201923215701==--

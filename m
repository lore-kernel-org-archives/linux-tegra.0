From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock
	handling
Date: Tue, 17 Dec 2013 22:39:57 +0000
Message-ID: <20131217223957.GO28455@sirena.org.uk>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
 <1387277564-4774-2-git-send-email-dev@lynxeye.de>
 <20131217140017.GI3185@sirena.org.uk>
 <1387291793.1783.3.camel@tellur>
 <20131217214352.GF28455@sirena.org.uk>
 <52B0CE33.7080605@wwwdotorg.org>
 <20131217222847.GK28455@sirena.org.uk>
 <52B0D152.2060504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8123354323237342573=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <52B0D152.2060504@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Lucas Stach <dev@lynxeye.de>
List-Id: linux-tegra@vger.kernel.org


--===============8123354323237342573==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="68uOmRXIw+u8y5pO"
Content-Disposition: inline


--68uOmRXIw+u8y5pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 03:33:54PM -0700, Stephen Warren wrote:
> On 12/17/2013 03:28 PM, Mark Brown wrote:

> > How does doing this in the machine driver help here?  The machine driver
> > isn't going to be any more coordinated with other machine drivers than
> > the controller is.

> There would only be one machine driver loaded at a time. It should
> provide top-level control over all the audio paths in the Tegra audio
> subsystem.

OK, so that's not how everyone else has done these isolated
controllers...  to be honest I'm not convinced that this is something
worth worrying about for AC'97 - the clocking is fixed in the spec
unless you're being fancy and the chances of anyone being fancy are
minimal these days.  It's probably more likely to make life miserable
for people trying to get AC'97 working than anything else.

But like I say the big thing is a comprehensible changelog.

--68uOmRXIw+u8y5pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsNK6AAoJELSic+t+oim9+uMQAJ0lVMfoNniUiLQnz7zR2xgy
pOfAjCCXums97KZwpPNEc4hrvijt0sJ7xK7ewjKcT+2TH8z1SDJXftlcjuplhh/F
o/POUyQR03Ot7oi2PgEdULILl1zGYfeND7e9QLLY2B3weDo67+/1FUapDs29P9Iy
274Ucc6RY8gUF7i9lFatQ/zvy+wUEz7TYB6flr6C1E0woxgHtqsZReowmge8Evud
s/NqfN99cpZwkmbYdikOlBI327/8q+ryJxeIlZ1UII/UIbyMndpUKPztC4vvO7Dw
pEQRqIgdrykuESmG7JtbiFAcsiclcrRmnxAKqtvI8r9fxVTq/T6x6TI898g6SXya
l8Cy7fNQvi43v0vCfaDCyawzXfMiqDVAUYEwC6m9jQhYEx+XflocHAfb6W0DrFUY
vxOtlf77qXO3nQ4z691kyev3md5r4B98zTxh5Vh1e0xAXHfCgTiLHvDXUjGkqLw5
fY/bLK5UXBk6rsjF9Il+M2yJAu46nLqYGbh0KpHT5IWaDgILOFhD1NpGVWkmOFt4
529Y7rYHlhpuz4WvkHGzMrh4m2pGPrbgv11q9YBzWi8BNOK0d5HOgsU7k4TEGhsi
sMDewPTqEF+9AsIl58ZQy3Fb8PH9TU+KRCNgzjA4J7QLLXov8xModupqPNETCDb+
UCemw4roguOPKCxyqK2F
=02uB
-----END PGP SIGNATURE-----

--68uOmRXIw+u8y5pO--

--===============8123354323237342573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8123354323237342573==--

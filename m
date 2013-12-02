From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: tegra: fix blink clock rate
Date: Mon, 2 Dec 2013 10:37:56 +0100
Message-ID: <20131202093755.GA18060@ulmo.nvidia.com>
References: <1384991242-13596-1-git-send-email-swarren@wwwdotorg.org>
 <20131129152241.GM9712@ulmo.nvidia.com>
 <529B8C2D.3000300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529B8C2D.3000300-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2013 at 12:21:17PM -0700, Stephen Warren wrote:
> On 11/29/2013 08:22 AM, Thierry Reding wrote:
> > On Wed, Nov 20, 2013 at 04:47:18PM -0700, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>=20
> >> The blink clock rate needs to be configured, or it will run at
> >> ~1Hz rather than the desired 32KHz. If it runs at the wrong rate,
> >> e.g. the SDIO WiFi on Seaboard and Cardhu will fail to be
> >> detected.
> >=20
> > How is this related to WiFi?
>=20
> The "blink" clock output from Tegra is connected to the WiFi module,
> which then uses it for something; it probably has a PLL connected to
> it that drives all the internal circuitry.

Okay, thanks for explaining.

Thierry

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnFTzAAoJEN0jrNd/PrOheG0QAMMsg5qfeIm+rjF7/z9s/vTj
UbLCtWAYAH6QfzPk+GFZinbBluV3ftlmRoYvDame8NecKcFDmpL3tHC5mtV/RbDn
QKV2+JgDaQQBdx7GZOREaM5Hx65hHttyJdYvUJZ4oVlWjB4ENLiXeg1LucXAea7r
jELeAgJ6rb0ElYndMQhNhZFHC4AtkdVQO0x/dQTJrRg5bEFz+bAq5DrnhJG3aBrZ
kj+uFTWA0V1TOgiDiAJxpnCU3zS1/6ss48LMaSdGqvpB0uhYH6DXx2u52eT4/2xh
VhT2C93mS8/3th5nDQWhgIlkXr+SLQEjYWSYz2jaNXRsqLB93z3vry/tt55Jcoa9
x3Vps6pAVLDFYZax8Yf4XEttBv/kp4ntytiIILkswhK5NiwVyzEklg247PC10mLE
hIymb80EkidNEt6S3lQvIUmXplwxewsQBWGH9gXMQ3Am9fb2CBHIk1Rw8kA6IbOm
b73SAXlFPVeTDmMjJHKVXjob8M2X1t4ndC93z3Le/kCb8dR0q/9EpgZse3LX3QOy
09hOI6UTDSV+pt9giUN7RHXNN3tW8cVLDPJDUPIEsL4l487caS8iFBKC2dSOqwVj
t0p4nlDwvFr6uE2JDmLPhgRqFkuABdZvBVVMh9WlHWakOGQdNhBCTP6dmUF8HQPC
OSmoAd/3aBke+0ZG353/
=iqIZ
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--

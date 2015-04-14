From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL v2 1/2] ARM: tegra: Core code changes for v4.1-rc1
Date: Tue, 14 Apr 2015 09:06:50 +0200
Message-ID: <20150414070649.GA11715@ulmo>
References: <1427710333-13472-1-git-send-email-thierry.reding@gmail.com>
 <1428675733-23523-1-git-send-email-thierry.reding@gmail.com>
 <20150411015201.19585.59549@quantum>
 <201504140109.56537.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201504140109.56537.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2015 at 01:09:56AM +0200, Arnd Bergmann wrote:
> On Saturday 11 April 2015, Michael Turquette wrote:
> > > Tomeu Vizoso (8):
> > >       of: Document long-ram-code property in nvidia,tegra20-apbmisc
> > >       of: Document timings subnode of nvidia,tegra-mc
> > >       memory: tegra: Disable ARBITRATION_EMEM interrupt
> > >       of: document new emc-timings subnode in nvidia,tegra124-car
> > >       of: document external-memory-controller property in tegra124-car
> > >       clk: Expose clk_hw_reparent() to providers
> >=20
> > ... this patch! I'd prefer to not do this. Let's see if
> > .set_rate_and_parent solve the problem for you.
>=20
> Not pulling this for 4.1 then. Even without the objections, it was basica=
lly
> too late for the amount of changes now.

For my education, when do you expect pull requests with "this amount of
changes" to be sent?

Thierry

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVLLyHAAoJEN0jrNd/PrOhjfMP/AmoURL5YwU1G/xwItCu4NHb
4hIKTAwF35F+/eisvRVZw8PIQFeSUA0bMgJvZTo8+ViDvgOpHneZJrGY88V+6g5z
3pmrTHlxvx3f0ntn9m8ifTiIUwdH3WWFWZNYTWTdQyyxxy42VuM3VFFtp1fXuQ12
qfRh/Dxfgu0WKXcdbi2iQY/yZ5K8+t9WjRfiWJVd5CHl256I6K7LK2kXNnRsm8dE
kGKb8vZpL3hERpj86aVa6Hlyv6DTsfxn1f9mBNBgsHZafSoqRjjZd0C7pVoVM9Q9
kTGbbrJkchmljKZqcWL/iJ6gN0p2HSStvaPd9x86iylG42OERpCK/FGdxE0llcpb
my1+fao7EPbqczLy+nlupqalu38xKjPukgvs3e5CLUoaKoi9xCfgqDo8VG5EmPJH
EEnwbH1EHkZ4FugZeJIRv8aZfBH/eOlK9H3aLLw0/Fa5VsZqN9RH22xLtvxV2uXP
GOm76rpucPipvWXgH4UV1yfFxm/VRYBBJGMwkqnLcZgaC9qu0Cx6FhUSTZZcKfyA
z5qyFr24Z6kW8J1yTKl63gI42qONRGJW28VT0+RtcXp1soudUZA7G6f/wAlhR2IV
xJgtHu3poAYXJZ/IbaeZ7jXB1za+BAuLhYQ/MhpbKbGWScKjEFtdFKujzEBwsgtB
tEWCd0MN9OMuScrb3nug
=Mve4
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

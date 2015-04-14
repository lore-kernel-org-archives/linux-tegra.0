From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL v2 1/2] ARM: tegra: Core code changes for v4.1-rc1
Date: Tue, 14 Apr 2015 13:14:26 +0200
Message-ID: <20150414111425.GB15878@ulmo.nvidia.com>
References: <1427710333-13472-1-git-send-email-thierry.reding@gmail.com>
 <201504140109.56537.arnd@arndb.de>
 <20150414070649.GA11715@ulmo>
 <2204375.plVGQ25v9Q@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2204375.plVGQ25v9Q@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2015 at 10:30:30AM +0200, Arnd Bergmann wrote:
> On Tuesday 14 April 2015 09:06:50 Thierry Reding wrote:
> > On Tue, Apr 14, 2015 at 01:09:56AM +0200, Arnd Bergmann wrote:
> > > On Saturday 11 April 2015, Michael Turquette wrote:
> > > > > Tomeu Vizoso (8):
> > > > >       of: Document long-ram-code property in nvidia,tegra20-apbmi=
sc
> > > > >       of: Document timings subnode of nvidia,tegra-mc
> > > > >       memory: tegra: Disable ARBITRATION_EMEM interrupt
> > > > >       of: document new emc-timings subnode in nvidia,tegra124-car
> > > > >       of: document external-memory-controller property in tegra12=
4-car
> > > > >       clk: Expose clk_hw_reparent() to providers
> > > >=20
> > > > ... this patch! I'd prefer to not do this. Let's see if
> > > > .set_rate_and_parent solve the problem for you.
> > >=20
> > > Not pulling this for 4.1 then. Even without the objections, it was ba=
sically
> > > too late for the amount of changes now.
> >=20
> > For my education, when do you expect pull requests with "this amount of
> > changes" to be sent?
>=20
> Generally speaking, we want large patch series to come early after -rc1,
> followed by smaller subsequent updates. We often don't get around to
> applying stuff before -rc3, which is a problem on our side, but it helps
> to have patches available by then.
>=20
> Also, if you have a large series (100+ patches) early on, we'd be more
> likely to take a 20-patch series later than if the 20-patch series comes
> at rc6 and is the first thing we see from you: after around rc5 or rc6,
> what we want to see are mostly patches that directly result from work
> that we merged earlier for the same merge window, like regression fixes
> or wrapping up a larger series that was started but incomplete at -rc2.

That's not generally what we've done on Tegra. We usually keep things in
linux-next until around -rc6 to make sure whatever gets pulled into the
arm-soc tree is stable.

With what you said above I'm pretty much forced to either send you pulls
that aren't well tested (linux-next isn't supposed to get new code until
after -rc1) or I have to plan for an extra release cycle for anything
that is "big", which would mean that many new features would potentially
take 6 months to get merged.

I don't like either of those choices.

Thierry

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVLPaRAAoJEN0jrNd/PrOhXnwP/0o5BWXQsj1DUthPM+07EHM1
i2aoNDYSccnRMSVvlfHlMG51v7Zw5wG46hGUGUWwmc/PD4LQhUQjwDUG2Vd7VCZC
2mWMmOzrVpzdE1ZMBnJGzcwNRGMtOENybyE+e47V2qb6zCaFEMpFLzLyt3TMx9Mx
9cuyWjv7JCEq/dX+bg/fjJEoYK6sKYP9TYfyxBjTmHui3+AwCZ43YFNk6eIG3bB+
/KAYQihcnKLEUz6Ccj3HCn5sNI6kKaZGpuHwnQKBtgk1ufVPsfzyXtvbR0C6UJOx
WhEfMdOavE8TI/ZdDc8v5gRji234jH5oZj8PzK0RjVtZ5pcoUiusHPuCmplaeOsH
bI9Y/jSGdh3AHTIaX6vfKHJsfUW9GOcba6vC4RCaXqRR8XFNSkwpVaQLHIvrJUs7
dQDaqpmTSx71BqOydWawP6+IHlbDqmIACw6BLHfdYENk+RCGjRMfEPRPgPBkaaSC
tfjaa7HlEwxb5secwNnAkznTflp6sODHinhTYBVxSJFxLN8xSw6K+bKmfSNAMlRN
Ye2nNG0ZHtpOOv/qCUKk4OUyJ+sE3Nkytgx357YpttNHDBUP+I8S/nPXA1LMARXi
dtlSDgebdtzYlthi9zpz1HJ7m4NaFuQizc8Qnv7pJzrhFPG9r6iEBUULGKD8FKKC
hET98xXphiBDi2qJp956
=zAap
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--

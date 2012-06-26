From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra: paz00: add regulators
Date: Wed, 27 Jun 2012 00:02:36 +0100
Message-ID: <20120626230235.GX30406@opensource.wolfsonmicro.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
 <1340406842-27135-3-git-send-email-swarren@wwwdotorg.org>
 <1963397.cqAXgGafFs@ax5200p>
 <20120624110306.GA16455@sirena.org.uk>
 <4FEA3942.9040906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zvmqw4jX2vbPsMQB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FEA3942.9040906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zvmqw4jX2vbPsMQB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 26, 2012 at 04:35:46PM -0600, Stephen Warren wrote:

> So I think this sm0 (and the sm1) entry might actually be correct; sm0
> feeds vdd_core and sm1 feeds vdd_cpu. These rails have DVFS and hence
> the voltage can vary. I guess I should change the regulator-name in
> these cases to something more useful than the very first signal name on
> the schematics too.

Even if they feed these supplies are they capable of varying on this
board if they're shared with other things?  This is one of the common
issues with constraints...  But generally if the supply covers more than
one thing the idiomatic thing is to list them all separated by / or
something.

> That said, we don't actually have DVFS in the mainline kernel yet, and
> correlating the regulator limits in our downstream kernels against the
> DVFS tables we use is ... challenging; I'm not sure they're consistent
> anyway:-(

Well, if you're using the regulator API the regulator API limits will
win if they're more constrained.  But this is half the problem with
these silly constraints that just copy the regulator limits, you've no
idea what the board is actually supposed to do.

> However, it probably doesn't make sense to vary sm2, since all that is
> used for is to feed the TPS6586x's input pins for the the LDO regulators.

Actually if we get clever then there's some fun to be had there.  If we
can have all the LDOs specify the headroom they need then we should be
able to arrange to vary the DCDC depending on what the needs of the
currently active LDOs are which would improve power efficiency as the
goal here is to drop the voltage as much as possible using the more
efficient DCDC then regulate on from there with the LDOs.

I keep considering doing this but don't have any real need for it
myself, it's just amusing.  Might fall out of (or be similar to) some
work I'm going to be doing soon for bypass modes though.

> Likewise, all the LDO regulators are used for various peripherals in
> general, and in the main it probably makes no sense for those rails to vary.

This is typically very unusual, the devices on the rails are normally
heavily constrained when active.

> So, what I think I'll do for any regulators where the downstream board
> files specify a voltage range, is boot the kernel and find out what
> voltage is selected by default, and program both min-/max-microvolt to
> that specific value. That way, there will be no behaviour change. We can
> expand the ranges on the regulators later if/when we add DVFS etc. Does
> that sound like a reasonable approach?

Yes.

--zvmqw4jX2vbPsMQB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP6j+FAAoJEBus8iNuMP3dDlgP+wVg8liZP0nfQIkHLiOx1zBU
WCTrMvkzshvGt3Fg9rvmG7sYPDP+QkfXJcytwhlS2f2Ke4Paoz0++CTg8+knUW9b
jGa/V4DsMekJ2Why9rklHFaYR+ogEiUvt7SXri9daxSsmXmM2bHSoi21GCsuCsr7
PZ4lN0f1AxROhTsRnJIJxi3tKGuT+47CukC/ImQfjkdvoUE3KvuppfvD+hW7sOGR
tGgbDmqFcamlWHAp/NhW+bAJJKkIym5UOdpVpcY6mnqDb69A6dDbT28GSRkIMegO
inxbonquh1E/RdefZit420kKVzTiXzHcQEZ9XOQpb/6bKyV2yJwGdk6RjOMaworx
VBQb1pjgNNm/octUcaIvbsiwGvskV/v54AqvMaK+AmBGtxRzSMinxPuH3z8+A3w0
Y1g67Q1R1g3MTWjIvE/qCA8T7X9UPSkg5eY33XDFpIT7w+qDSARvKM1Z7PoI7m5F
ZmKMD9qfsPdc7U4hi6/0UmCz2OtIpy2ChwQjx6NIFWSVKvD98awhSw20vLaxJXdw
9wjeKFFBaFX1H4AJPIXhqGpp1wan9C688TvXjJYbLbWFHd9PrFOD/AfCQH1UYSQk
apzcPh0mfSmUiVIKWjtMj1+cf+cMTtkSziRTGwEg/EU+a80vPHNpx2nkC4h4qInC
88QFut29qv1LguRg3ACm
=OSKX
-----END PGP SIGNATURE-----

--zvmqw4jX2vbPsMQB--

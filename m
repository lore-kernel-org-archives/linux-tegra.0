From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: tegra: set up audio clocks for tegra30 dt
Date: Sat, 31 Mar 2012 21:28:07 +0100
Message-ID: <20120331202807.GO5012@opensource.wolfsonmicro.com>
References: <1333149097-17894-1-git-send-email-swarren@wwwdotorg.org>
 <1333149097-17894-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAr+fMtvBxbbbkvl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333149097-17894-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--bAr+fMtvBxbbbkvl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 30, 2012 at 05:11:34PM -0600, Stephen Warren wrote:

> +	{ "i2s0",	"pll_a_out0",	11289600,	false},
> +	{ "i2s1",	"pll_a_out0",	11289600,	false},
> +	{ "i2s2",	"pll_a_out0",	11289600,	false},
> +	{ "i2s3",	"pll_a_out0",	11289600,	false},
> +	{ "i2s4",	"pll_a_out0",	11289600,	false},

While you chose 48kHz as the default in the utils code this is using
44.1kHz (which like I said is more what I'd expect).  Not a problem but
inconsistent.

--bAr+fMtvBxbbbkvl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPd2eGAAoJEBus8iNuMP3dikwP/0yk3aeIBAhigHvcZ4jaFUOg
DpB/hG2PMxXHXVc1vGc6hUsbW9cNw+1fneHfhJms2WcrtwqLMaMUbvwvzUzyQdKQ
WWyduEcCYVZtyWLI4o53mR7BoPMons6aZBmuXHr9SQmyDsO8nqlANt7oATYy6kjE
AN8JjkEiPKRb6BC2LO32ac2JkHYmmIu02NcQbYNgg5GJttj6lkLxE6eJkrBhjGrg
cEWtvCx3+vHQ3H+Ms8bSCGAOQlxffvlJdCcGqyYaNM5WuhwrqqwGOCmWGHnYw06H
yGhw4S/nDNba4vuTVoJf5MujKDiUuT4q2sQCgRntApUQknCTEtfPEch/R+GPD7ig
SJglRmJcfz3PG+IDbB+B0cLtM8Ze46MBJUtHWWZGAUNPoc82WivBGU4H4JLQPYl3
k8ekj2OZ8JhhfoJaVmWSiyqIfgvIq0APvBgBr45x7K9tVnZ7KG3n1iu4bao69FyO
e/RjFLYWV6bHXLe8XuMmdPU7N3ls2PDShqhhJL3aJYQKwvkC6FeF63XMW/0LTysS
8v5pfFmD8CWuUAVrkkWjCHp+I6sW9OlRo5RwFCBbgwGh4Yq7HK+0w4YhyJDia10m
mLllSLS/HlRikt+4YWVRv4A4yAZoaRBpOBtRSjcyaqIasGF7FrsHVY2uopMZntJl
N6KbIlLDBJ5JffFBPHeO
=gTSp
-----END PGP SIGNATURE-----

--bAr+fMtvBxbbbkvl--

From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: About [PATCH 1/2] regulator: core: Provide a dummy regulator
 with full constraints
Date: Thu, 17 Oct 2013 10:37:01 +0100
Message-ID: <20131017093701.GH2443@sirena.org.uk>
References: <5253A17E.10503@nvidia.com>
 <20131008090910.GW21581@sirena.org.uk>
 <5253D489.7010900@nvidia.com>
 <20131012121412.GJ2443@sirena.org.uk>
 <525E17DE.6080301@nvidia.com>
 <20131016103942.GG2443@sirena.org.uk>
 <525F6A1B.70505@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JnfXrmBFCAcKdhDT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525F6A1B.70505-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--JnfXrmBFCAcKdhDT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2013 at 12:39:55PM +0800, Wei Ni wrote:

> So do you mean it should call the regulator_has_full_constraints() in
> the .init_machine for all machines? If so, this will affect all boards,
> for example, in arch/arm/mach-tegra, if we set full constraints in the
> shared board file tegra.c, all tegra boards will be set, is it right?

Yes, but this is currently the case anyway for every system using DT -
all we'd be doing is moving this call earlier in init.

--JnfXrmBFCAcKdhDT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSX6+6AAoJELSic+t+oim9Gw4P/iN90WW0Wn+/x5h8ETqum0/r
m5yCm8vN7EYh2WUmrEUIjl3d3JXuNRqpZplzf6sTLwXd94d8yekDR9Kldc2uat3Q
CUAtYKOqMGjf36YD1pFQ4Gc4dAjJuyd+2Br0j17yL9xprtPM+EEt70i0rrF4VdTe
NqVoIaj1YFIzCO27HiKF9oSrtHsxET5JtMpAqnZmIeOdfCkjsAVSSwB5lD2AnHmE
S5EftI6+pg4vdEKG/U3QbS+I27F8N33QBwGXYDmomVZMCb0sV1BS/mKuUyEeVXnT
94DIZiEcnzIHf/mSSVuzaeLmdmZyEws4iZkG1Y8CZDfsTHqwL9SdAW0dH8A/HWCs
kvsxqCCNY9BxvLRUuOE2jsR6Ahmt42L8BNjIDzV7M93buVj5pmoEe4S56JIdlPnk
fuj7AQi4plQOqDpxN3S0mLwAytLSD1UnoMGfP8JGWkTetGuXTqY0alpBhBlmT4Xo
AOvJHf/oGkmTvna892oVwhv7YEMbFhnUrqtzvq/9ffEjISITZFb4xJGCaNLAXOEb
zzrLyxK15CcHO5sVxj/0gp9kGFd0CosiM6yLUAhPDi46uMfNI3QhcNRAo78RNV/6
qCVYrsTud7Ul/r1PKMcwEjHoNwm1H0Se5Q/rGIy5D6+lU0eCOmIEtI3kF7maT9jT
YWTfeqWJVb55giCZsCEe
=+rKC
-----END PGP SIGNATURE-----

--JnfXrmBFCAcKdhDT--

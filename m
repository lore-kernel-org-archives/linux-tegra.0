From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 4/8] clk: tegra: Changes for v4.2-rc1
Date: Mon, 29 Jun 2015 10:54:51 +0200
Message-ID: <20150629085450.GC5431@ulmo>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com>
 <1431524980-13599-5-git-send-email-thierry.reding@gmail.com>
 <20150520195459.GU31753@codeaurora.org>
 <555D7A5B.1070901@nvidia.com>
 <20150527195021.GA24204@codeaurora.org>
 <5566BDA5.5080104@nvidia.com>
 <20150618234126.9112.80705@quantum>
 <20150620204104.9112.83328@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150620204104.9112.83328@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2015 at 01:41:04PM -0700, Michael Turquette wrote:
[...]
> I've decided to pull this in the interest of fairness. I'm taking the
> Exynos cpu clock patches, which will need to be updated in the future to
> use some new infrastructure for coordinating rate changes across
> multiple clock nodes. I'm merging the EMC stuff with the same
> expectation that it will need to migrate to the new infrastructure when
> it becomes available and we'll get rid of clk_hw_reparent.
>=20
> Sound good?

Sounds good, thanks Mike. I'm sure we'll find someone to update this
when the framework changes are ready.

Thierry

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVkQfaAAoJEN0jrNd/PrOhxQAP/RA1EazKXWgt7DQJJb3wohSf
MUG+jDG0RM3TTpMZXDWBxC2UFnaRTwCeKHJuI0/GhuHOoWXCDS/wtKGVmzitrG9P
QPGbFMMGXVmjlFUOIqexDCptpcGCVp+ysbuuzVbroT8cTxzLhVGKtcd6/i2VYf0X
iGmKVQyE8Uz29QiODIF9lPWBSQFm0f349iwDy8YNHx5550nrK8QBHQI7bHwBSsiv
crpLakMehgO49vE4N+PdQWhhhm5/rU/HMfXFWETz5YC/dCwHMEfF32FzIj9ovyxO
aWtLbxbZcusiAGqu5gJqj37i9GaK2WQ9MgI4yquW9bq1bCCc777AixH7we8c/4uQ
HIxZh9unJLfcqdCueAUA/xVnsNvQxEQY9oXcsBEjPnLKdtocT7H4BmkCj8amQSw8
c3n/CYjImYfgp35LJBJC31x/kLBbIyVH6/jMORW+o2HhHzcN2Du2ruXgASgRtQwg
4/+wHv2mS+Iwn5IjifHULZBjJe50sNL3O/2LGNXGzI3IaN1SKWiZmtZYRNfH3ciG
Q6Lhyxp0L29p8Fe7RnT8kCUJff7/yO+fIowU5dzxtMwIVd8MqNge802wxO920Z7A
cAzRJWaCQRFw+bzbFzA6WDqXou1xilZzHio1+AwHq2zc4FjsPm5qCne5vTDaf98W
sUDB7j1hyAnR9yAp0X+a
=rMgc
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--

From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: Remove unused variables
Date: Mon, 15 Apr 2013 11:12:43 +0200
Message-ID: <20130415091243.GA19448@avionic-0098.mockup.avionic-design.de>
References: <1366011121-7858-1-git-send-email-thierry.reding@avionic-design.de>
 <516BC08F.6030405@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <516BC08F.6030405-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 10:55:43AM +0200, Daniel Lezcano wrote:
> On 04/15/2013 09:32 AM, Thierry Reding wrote:
> > Commit 0697598 ("ARM: tegra: cpuidle: remove useless initialization")
> > removes the last usage of the drv variable from the Tegra20, Tegra30 and
> > Tegra114 cpuidle drivers but forgot to remove the variable.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
>=20
> Hi Thierry,
>=20
> thanks for the cleanup. Actually, that has been already fixed by the
> patches:
>=20
> http://www.spinics.net/lists/arm-kernel/msg237945.html
> * [V3 patch 15/19] ARM: tegra: cpuidle: use init/exit common routine for
> tegra3
>  http://www.spinics.net/lists/arm-kernel/msg237945.html
>=20
> * [V3 patch 11/19] ARM: tegra: cpuidle: use init/exit common routine
>   http://www.spinics.net/lists/arm-kernel/msg237956.html
>=20
> * [V3 patch 14/19] ARM: tegra: cpuidle: use init/exit common routine for
> tegra2
>   http://www.spinics.net/lists/arm-kernel/msg237965.html

I didn't see those for some reason. They apparently didn't make it to
the linux-tegra mailing list and I wasn't watching the others too
closely. Sorry for the noise.

Thierry

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRa8SLAAoJEN0jrNd/PrOhZggP/1stSXwSWftQ4s0l7j6up8z5
PNcEMZxLjlJOKY9I/bBpSsqp8rjNDRKcqwiO6qMZsYVERVZsoz0T5bSs2i6QLojl
kQ7b+GWoVKQSuxbAhHAgbrJM2t6yN5uXJ6k6so6vosnnnyo7VrN4KjmSzyPvcOzD
HFuR3dXWuAqUgeAYdwV4EaRfKhJka4VFG8EuteaXM3nHWs9kEH+332Mng0G/BF3F
Tak3rX1LewoxEtKZ1LMDSwX4SV2Dl1CaRdN3q6dsMXrK39WM04CwJ+cK7BiJMA4n
pMtrFROWhFabVTnMWTEdZxVVpdlX8a8Y/DAqtQgzm6iS1ShrdZm/cVV5Y0k5Qfov
c2YUxkStM27hL5fmD85p1Cecw5t/cCXza70ce5GPhCeHpq+u6fmcYo5PrWmsxsLC
MGhsXVJpieHRVb4LVLaCMNR3W2fk2RI2/n5/sx8NROvSStmiz2O46LC8HkpawtbU
gMsqtg4twb6TSvjhUVHD1nasAcyWu44r6uUTKX6I6KKCZ4CNWFKT7oMy5eSa++1f
nCZoCZZyq5vkpQeWb+OfPcpgh/6iubQS6ng7163W7BA8931Nk0jJfj8Y4DNVQTIK
xcd72H4wF6zt+RsmkCZKGkMFE/fHnPjzBxTEaWIHsxWyVgp3VGNymavHS4fHXwKO
0pIKE7cefDGdhrU7xmZz
=pfXb
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra: paz00: add regulators
Date: Sat, 30 Jun 2012 12:45:17 +0100
Message-ID: <20120630114517.GV28922@opensource.wolfsonmicro.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
 <1340406842-27135-3-git-send-email-swarren@wwwdotorg.org>
 <1963397.cqAXgGafFs@ax5200p>
 <20120624110306.GA16455@sirena.org.uk>
 <4FEA3942.9040906@wwwdotorg.org>
 <20120626230235.GX30406@opensource.wolfsonmicro.com>
 <4FEDE6AE.4080409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xVUAO+xN0VJlKSe3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FEDE6AE.4080409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xVUAO+xN0VJlKSe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 29, 2012 at 11:32:30AM -0600, Stephen Warren wrote:

> Just FYI, the particular choice of "/" as a separator doesn't work
> well, because then /sys/kernel/debug/regulator/${regulator-name} can't
> be created. I guess I'll use a comma. I assume it's not worth fixing
> the regulator core to s@/@,@ when generating the debugfs filenames?

I don't think that's sensible, no.

--xVUAO+xN0VJlKSe3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP7ubHAAoJEBus8iNuMP3dU88P/0cbUpDxeRrePqmtutkY3wpV
fGeP9dRrxT054qUlSOSQS+LPr++ahSoVtE43xi/2o4SvQB9DUt02DOe2Jd9Gbc7K
KlJnONE7dOeswMMth5EikburZ/3YlNGH9ZaXHE6SvneJOdc8t0l389sL/pXEbatO
xGTch4uTt5vaSH/61pW4CPEbsJHz5LaSJcGBEK+Q+mOPncWAyBQl2sQiPHhI76Gu
eU+4MUN2eAbVjNFN1ZvVidtVeLtybZmELoDANQSZu5X3TYFj+aT+XviIU/MV+Wlr
mJtDM59KllfB4iytlE0Ml5QQNQ5oJtMxf4PsjE8mfAvGV9LyGkldbITFBHrOP4zu
TrWHP5cWp9qqyL84at8YDFX7NFABXOKkVWZZgna+l0KZwqRwAxdw22fM2WoK4mMa
kOqHT8c1WUgHIaQdH0wXsrEolPtd0RvS7abvjQ4FBDWkaMwVpeEP2uO8jg8DR2Nh
GvNNccTtN+986mjf+hjyz9ZCoyduOCsHLvSuiKsBPcDAmAQmQuBVf591OF3fDuG4
cVXBmtjEHhW/HFFOQWwyntJn4sYu13qxPG2z+TQ1sLhnqZhej0vjwa1RT8CVE26a
GgtWeK490x2VIp3miGYSFlwcYsMVYk5btuaW21TtypuW1rKISHKDRPWTD0KvvoBf
z9TS5XDCZUuyVxULpDyd
=YbMo
-----END PGP SIGNATURE-----

--xVUAO+xN0VJlKSe3--

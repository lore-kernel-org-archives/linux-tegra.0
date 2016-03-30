From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: Fix deadlock during regulator registration
Date: Wed, 30 Mar 2016 09:18:31 -0700
Message-ID: <20160330161831.GE2350@sirena.org.uk>
References: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1+kiJ7gFzGEgD6MU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1+kiJ7gFzGEgD6MU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 05:09:13PM +0100, Jon Hunter wrote:

>  INFO: task swapper/0:1 blocked for more than 120 seconds.
>  Not tainted 4.6.0-rc1-00001-g5e3ca2b-dirty #290
>  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>  swapper/0 D c07daeac 0 1 0 0x00000000
>  [<c07daeac>] (__schedule) from [<c07db454>] (schedule+0x50/0xc0)
>  [<c07db454>] (schedule) from [<c07db6b0>] (schedule_preempt_disabled+0x24/0x40)

Please don't paste entire backlogs into changelogs, they're *enormous*,
mostly noise and obscure any actual content that's in there through
denial of service.  If they're useful then include edited subsets that
highlight the relevant sections of the backtrace so your changelog is
more legible.

--1+kiJ7gFzGEgD6MU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW+/xXAAoJECTWi3JdVIfQ2sIH+wWxI+kYPvuq/yus+vSvIae8
/QwzEvrCPmPFS/YCiTzy2IInzCU9bjxPNQh92j6GGrMJz5bRnxaI1CW60V3kUiwh
yPusR17EeYCKNexvb0E3ips6uVWoR5wMnI3fnzHKWb6N+w5un38/YQ4HLchE7v5d
2n32h47u8wqAX/w81ATLaVeDBD6Ct5rpC2YyUArTusQXSvjQx6I0FLNZnSlUTAFC
nVEWoh0EbAd4eTEGWTPwOACeqRRJHZkcSAe5h0P7Oz8xiwQG1Q8z9rhfNmYBD1Qr
qWBx4vLA7mNcT1+EFYd4nEdoElgri280kxwU1WN6pq3HNMQ2AQPmhmTOreg39vI=
=AtgQ
-----END PGP SIGNATURE-----

--1+kiJ7gFzGEgD6MU--

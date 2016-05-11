From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v7 2/4] i2c: tegra: calculate timeout for config load
 when needed
Date: Wed, 11 May 2016 16:42:31 +0200
Message-ID: <20160511144230.GC1716@katana>
References: <1461591519-24602-1-git-send-email-smohammed@nvidia.com>
 <1461591519-24602-2-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461591519-24602-2-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 25, 2016 at 07:08:37PM +0530, Shardar Shariff Md wrote:
> Instead of calculating timeout for the config load during init,
> calculate it after config load register is written by using
> readx_poll_timeout().

I don't understand this description. You replace the open coded timeout
routine with readx_poll_timeout. But I don't see any calculation moved?

> +		err = readx_poll_timeout(readl, i2c_dev->base +
> +					 tegra_i2c_reg_addr(i2c_dev,
> +					 I2C_CONFIG_LOAD), val, val == 0,
> +					 1000, I2C_CONFIG_LOAD_TIMEOUT);

readl_poll_timeout? And probably assign the address to a variable to
make the above code block more readable.

Thanks,

   Wolfram


--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXM0TWAAoJEBQN5MwUoCm2+SsP/jJ/MZ7vnawSbtuP6Q3sp9xH
qbdiL3yOEQgRKnslt6SaGvLrZ57srdSp12vlVd8J0ZozBD7jUa0JNfNwLsxeKg0p
TVcS0usAMwppSQ0cv6+olCSE3bUge522x8DtqQVmjt+hQkh+7/SWCVtFGQZjP2ed
saq1S1nAc3RVLCxRc98BARCt7O8aTe6ABtSB3akdkhKwbYZhn87aOl8uo9xM2RPB
zTVigtiHt9TnQMh39whTwm6dK4Cw37H1iJfwzaZvZrQg4E3PSsmOxU8UlXdQVEYf
ybUNlTl8sg3yYJcml1HInPA1teKr1V/G3JIlydRq3ytIo43/INYJZcvaci7oYQNM
LwWwjidOtx3xkvCcB3ZG7YxOvw/G5bEjVQ3hxWNnt3yIzhRAIcE0r30WZltAjymD
pDg8faUwhPJEFVNcTkOihPe3FOXS0DY7iqXdo3+/Hl8q4XaQ9Les0fmomFpXMrQZ
gFWbpxzOi8ScI3/dBaIEoAvg2vFL87rw2illSLGk4fqxboeWla0EY2g/b8PIxuFW
3YbMpkoQWxozb3zZeIyCP58KiXmdkubDjqaj+1mUXS9OyBFc56oWe+pWo88UlVkd
Iz649J6OLe6W/HqX7Lole60yIY8jODSVfNct1PqwJFi2bAIsepJxlAx5V9YCiCzP
Ihn+zDfhj4Pdza7OzcHn
=6ic2
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--

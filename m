From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v8 1/3] i2c: tegra: use readx_poll_timeout after
 config_load reg programmed
Date: Fri, 26 Aug 2016 17:53:54 +0200
Message-ID: <20160826155354.GC1608@katana>
References: <1464356224-10339-1-git-send-email-smohammed@nvidia.com>
 <20160619172136.GE2933@tetsubishi>
 <6d21b4bd199844e3a359cc52823045db@bgmail102.nvidia.com>
 <20160825193952.GC1614@katana>
 <362fc8af7f8d411c8af36b34c6165c1b@bgmail102.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <362fc8af7f8d411c8af36b34c6165c1b-7W72rfoJkVlxWE4FnwvcdlaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Mohammed <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > Still interested? Should be an easy change, but I am reluctant to fix it here
> > with no testing.
> [Shardar] Will push the change by tomorrow.

Thanks. If possibe, could you rebase it on top of this series?

[PATCH V2 0/9] Some Tegra I2C Updates

Or is it easier to rebase Jon's series on top of yours?

CCing Jon, too...


--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwGYSAAoJEBQN5MwUoCm20tsP/1v8bZIva3GhZxDGYnCKv4zZ
RP8eQBF1PLhfRnUYbP1bokmy1aDG974hK8qzm9HHqbxpWf57NY2l0mHE6+tb2mIX
N430WZqkd3rIKNlJ51cr6k9GcPsH2cfX1GI6rTR6b8K2UDXVZGXX9lyHqaYeS/xr
Wen4Pbb6k02kf1DDIQO7LIgm0JTGHMgVrXYgkbVm8o3FXjLRVOJFCgvPs8KOFBOd
0tP1ZS2f7TUhvDfTQrYK1YqlmlV58+7LYad4RsckSX4Y5EhycUR+dNIRHC/YiD3v
TJ1zaDHhojVdwj3CQAeQqUuvGAmALVSQUefIuz8/gTfmqZbxtO0mQY+3d92yv3pz
orWGW9NjtlbuMynzpiAu3xuVR88oc8zkTAyFfb2HU8F7dakkGGJXHh1uREfgc92e
1ZfcdGfXvNVy9DUgxEC5vir2hV0+eEMqiQb9LrNMmO+6nSlRHAFAFLeE+vzeRtFm
05Yle+ZtCruy6W2VW11i8aSZ3qehZvV4yqftS6uLJqKu3ighm+3cN0Rp1eHkba2x
9K9mZ2WZJyI+hQACuYUHyC1SY57wPVmzTlT7m39gJcAFH2HJQqiY9fsAGqp/krnn
Ue5sRpO9G7Ue92jaNHwYjctlKiaPcLpLKMkABNAbVoyVy5yW8q7CeEGj2ke+JrfH
Fe8f0WZcLDg+ud0cdpyN
=z7JP
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--

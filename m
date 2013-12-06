From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [flasher PATCH 3/4] Allow overriding environment variables
 during flashing
Date: Fri, 6 Dec 2013 16:16:34 +0100
Message-ID: <20131206151633.GC32372@ulmo.nvidia.com>
References: <1386281582-18561-1-git-send-email-swarren@wwwdotorg.org>
 <1386281582-18561-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386281582-18561-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2013 at 03:13:01PM -0700, Stephen Warren wrote:
[...]
> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
[...]
> @@ -279,6 +281,8 @@ parser_flash.add_argument('--flash-image', type=str,
>      help='The flash image to write, instead of U-Boot itself')
>  parser_flash.add_argument('--gen-only', action='store_true',
>      help='Just create the work-dir; don\'t actually flash the image')
> +parser_flash.add_argument('--env', type=str, nargs=2, action='append',
> +    help='Set a U-Boot environment variable after flashing')

Perhaps this could mention that a key/value pair is expected and that
the option can be repeated? Or perhaps Python is clever enough to say so
given the nargs=2 and action='append' arguments?

Thierry

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoepRAAoJEN0jrNd/PrOhUpsP/jzsC9dXP5YP3ljRPfjlGu+Q
iDxYHt9cirUt3aly4hECAbYXeEQ2w5U+9G4vElUqw3gwO/MMENTf5BVHPD43//FY
zq6UCS1lyFFj/lvLfTvXrd6LqmIiC3vqHOLsaf0TH6PJfaQs/BgFQzMOu/SmgBlc
zfiYrJU/r6rZ56JSfS+QuQ46mpb0PVXLSD5T/XEGz6ZKNG3BuzOP8b4onwB/O2NI
+fyZsu2C43pJ1q+swQq1lqUCmhG9wbtSI56hNDSIbCeuL93kQqIqs+cT6vII161W
Jn9FKsZtn9KyubXjYaGGoW9q172zN6dgiEHl+RAc1sl3/5QwVRJhUAaFyj2Zk+d8
pEG8vs223kmRxf8gh5rMKRR+z9o24WrfAbw5xuX7Je7cZGlGa20qs0Sg4Ejhv16Q
l7grd9rc70QlQC/iAMKxlrd/GrEi2xVp5UvuAGRxmO3ZW+PCEnEPdKoEABuVl9Ac
Et2nUuhTwVTUr54Vk6qjcbEGqpLYvG8NiVL8LFAMweid0n4guFsLF3JSHWhqvV6n
sllWmZG43+8fQ+BKQ7yDQYYZvFJ4j9VHDqcXcHZMny/WusBiXlyDiBb3NYnGsTJd
QuhK50TzN/DdeeYdRmowFp+/aQZErPU40bpfmbkQ43QL84U14UbZUbDuIthlUfrf
TTnoI+yHh0gKzBzyXrQk
=e7Fs
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--

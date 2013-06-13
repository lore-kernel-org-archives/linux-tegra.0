From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [[PATCH flasher] 2/6] Separate out validation of config name
Date: Thu, 13 Jun 2013 20:36:23 +0200
Message-ID: <20130613183622.GD32574@mithrandir>
References: <1371079807-16541-1-git-send-email-swarren@wwwdotorg.org>
 <1371079807-16541-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371079807-16541-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2013 at 05:30:03PM -0600, Stephen Warren wrote:
[...]
> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
> index 447ff37..ef73e2f 100755
> --- a/tegra-uboot-flasher
> +++ b/tegra-uboot-flasher
> @@ -75,6 +75,17 @@ gen_flashcmds =3D {
>      'spi': gen_flashcmd_spi,
>  }
> =20
> +def find_config_dir():
> +    if not configs.has_key(args.configname):
> +        print 'Unknown config "%s"' % args.configname
> +        sys.exit(1)
> +
> +    global boardname, socname, out_board_dir

Python supports returning touples, so maybe globals can be avoided here?

> +
> +    boardname =3D configs[args.configname]['board']
> +    socname =3D boards[boardname]['soc']
> +    out_board_dir =3D os.path.join(args.data_dir, boardname)
> +
>  parser =3D argparse.ArgumentParser(description=3D'Write an image to a Te=
gra board\'s flash')
>  parser.add_argument('--debug', action=3D'store_true',
>                     help=3D'Turn on debugging prints')
> @@ -122,14 +133,7 @@ if args.list_confignames:
>          print configname
>      sys.exit(0)
> =20
> -if not configs.has_key(args.configname):
> -    print 'Unknown config "%s"' % args.configname
> -    sys.exit(1)
> -
> -boardname =3D configs[args.configname]['board']
> -socname =3D boards[boardname]['soc']
> -
> -out_board_dir =3D os.path.join(args.data_dir, boardname)
> +find_config_dir()

So this'll turn into something like:

	boardname, socname, out_board_dir =3D find_config_dir()

Thierry

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRuhElAAoJEN0jrNd/PrOhWxYP/A+I0S0g9Sq46161VyS6Rec7
vC4i8d+HIR49NxZ7WQ+HJDai4/ut8wulz8uxMhzAEBbQdR5AWkkZS1OWGZzo6w+g
XkeVdT3X/0s3tx5UIwlC2pEynrK+uYuAzdV05MnxSSWbyOw2vwIdfnnYwkA2ZI9O
h6/Bh7g6xH6Icvup5FJG2+J43UG9cGjjEgDpMlJDq9IO/d30dKahjHwYoHaB7eP3
8sg8vmrx3XuNsnmAwZKXCPWTxK1Yd19IPETGGOB8sDroo8seExP0C2QurqfUjlYx
hpgDdXf5bfzuGNEns9apVRMK+W7PavQsdIokfg6BS/R2LDqBZHKeNbM3H2/cUE14
0SrVw90GxdVSRL0lb9WYckMANgKIW65MlMbBDYON8wit/AmeLvu6wcaGQNHC1Q8h
IIiVKKmR/0eL832rAhAKhpOMP28DuLYQb4j79DphxTtp4pw6Yn21RRkinnhLzmxS
BoLh4KhRhFz+Q7dctshNge0+jvC6z2AFg8NollpkI8mhur2dLXsLC1UHUuF1w3k8
Pa1TsUXNlpLqvncUPH/SMVvPgS0pbzU+nN1Di0P01MCbRlcPyP1aq81+6Q8BYUei
polZ99nAkIi4e+kp0+HoKv4hoaz9Vm3mMa10dKqh+GSvhKVkqjAXLoqIK68sXqn9
gBlgMWSLAU/ynhMC24Kk
=o9Vx
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--

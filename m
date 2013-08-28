From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [cbootimage PATCH] Implement --soc command-line option
Date: Wed, 28 Aug 2013 08:35:20 +0200
Message-ID: <20130828063519.GA5141@ulmo>
References: <1377628344-24984-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377628344-24984-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 12:32:24PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Implement command-line option "-s tegra20" and "--soc tegra20". These
> mirror the existing -t/--tegra option, but require the full chip name
> (tegra20) rather than an abbreviated name (-t20). This is more consistent
> with just about everything else upstream.
>=20
> Suggested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  src/cbootimage.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/src/cbootimage.c b/src/cbootimage.c
> index 336b169..259e6e7 100644
> --- a/src/cbootimage.c
> +++ b/src/cbootimage.c
> @@ -48,6 +48,7 @@ struct option cbootcmd[] =3D {
>  	{"generate", 1, NULL, 'g'},
>  	{"tegra", 1, NULL, 't'},
>  	{"odmdata", 1, NULL, 'o'},
> +	{"soc", 1, NULL, 's'},
>  	{0, 0, 0, 0},
>  };
> =20
> @@ -68,9 +69,12 @@ usage(void)
>  	printf("    -d, --debug           Output debugging information.\n");
>  	printf("    -gbct                 Generate the new bct file.\n");
>  	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
> -	printf("    [-t20|-t30|-t114|-t124]\n");
> -	printf("                          Select one of the possible target dev=
ices,\n");
> -	printf("                          -t20 if unspecified.\n");
> +	printf("    -t|--tegra NN         Select target device. Must be one of:=
\n");
> +	printf("                          20, 30, 114, 124.\n");
> +	printf("                          Default: 20. This option is deprecate=
d\n");
> +	printf("    -s|--soc tegraNN      Select target device. Must be one of:=
\n");
> +	printf("                          tegra20, tegra30, tegra114, tegra124.=
\n");
> +	printf("                          Default: tegra20.\n");
>  	printf("    configfile            File with configuration information\n=
");
>  	printf("    imagename             Output image name\n");
>  }
> @@ -82,7 +86,7 @@ process_command_line(int argc, char *argv[], build_imag=
e_context *context)
> =20
>  	context->generate_bct =3D 0;
> =20
> -	while ((c =3D getopt_long(argc, argv, "hdg:t:o:", cbootcmd, NULL)) !=3D=
 -1) {
> +	while ((c =3D getopt_long(argc, argv, "hdg:t:o:s:", cbootcmd, NULL)) !=
=3D -1) {
>  		switch (c) {
>  		case 'h':
>  			help_only =3D 1;
> @@ -100,6 +104,14 @@ process_command_line(int argc, char *argv[], build_i=
mage_context *context)
>  				return -EINVAL;
>  			}
>  			break;
> +		case 's':
> +			if (strncmp("tegra", optarg, 5)) {
> +				printf("Unsupported chipname!\n");
> +				usage();
> +				return -EINVAL;
> +			}
> +			optarg +=3D 5;
> +			/* Deliberate all-through */

"fall-through"? =3D)

Other than that:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHZonAAoJEN0jrNd/PrOhvp8P/A7PFQ80d6SrTFBl8IH4UEUT
V/9GTocOmhw9eBmXDqERir5QOrim4vPAlR/BHL/xt0g2ItGKYNeM/lMmxe4C41Tc
/Cqr0wt85zlODyOUlkcOelxPp+Ut5tg7XfmYOm99F9bj13lK+pR1GStQctr2Yi1a
qu3SAzCtgg4P/CmVNpwPOS7/hdvTteiVD9kis7vJyeTORquMwgVlaKHW1KcyZSi1
Oe3Gkz30eEeR7W6qWB4j2GTdNLYtsFxVVWTnaNKWjm5kzWbppUPjphRt8Kp8cqaP
WPyENgiBVjARVOw7gULJCK8N8JpGUDfcHQYDSmxgrbx3NFmYWe7MOeUiQtlgscFz
p7RxtblacTpCsQD8SCyeY2UqMjRiGzQSYqj8ueR2CI4wRziY/Qc3QwxHcAutP7Fw
beXr75A7tUUKRozSLmefLZPzeFnrCgfsRBRx9u4HydrU++wtifHugSl6WEMroBag
iwPOTuPiv1M5+5LzSUWgYPrFlid0PbSAe9lx0l48OXidMledRpYCr+ZBRVlU6g38
Ol+QAOMc840gq2l1ugNWiahYKBfbDjXtGAiJJ4Lji15Ab6+BG+XC//5PgT5VhfIT
kf8/wUGM87701KUM6FRwXDmjxAvcAg+TxslzDCriLk5idErOZq6qhxBlpgKLetOm
Yud/tetvwlFrhVot5jRm
=36KN
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

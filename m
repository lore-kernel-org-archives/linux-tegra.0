From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [cbootimage PATCH 1/1] Add Tegra124 support
Date: Mon, 26 Aug 2013 09:47:01 +0200
Message-ID: <20130826074700.GA31726@ulmo>
References: <1377229591-21235-1-git-send-email-pchiu@nvidia.com>
 <5217B267.3030205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5217B267.3030205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 01:05:11PM -0600, Stephen Warren wrote:
> On 08/22/2013 09:46 PM, Penny Chiu wrote:
> > Add the Tegra124 chip support to cbootimage. User can use "-t124" as
> > option to parse .cfg and generate BCT/image for Tegra124.
>=20
> This looks fine to me at a quick glance. Just one small comment below:
>=20
> > diff --git a/src/cbootimage.c b/src/cbootimage.c
>=20
> >  	printf("Usage: cbootimage [options] configfile imagename\n");
> >  	printf("    options:\n");
> > -	printf("    -h, --help, -?        Display this message.\n");
> > -	printf("    -d, --debug           Output debugging information.\n");
> > -	printf("    -gbct                 Generate the new bct file.\n");
> > -	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
> > -	printf("    [-t20|-t30|-t114]     Select one of the possible target d=
evices,\n");
> > -	printf("                          -t20 if unspecified.\n");
> > -	printf("    configfile            File with configuration information=
\n");
> > -	printf("    imagename             Output image name\n");
> > +	printf("    -h, --help, -?              Display this message.\n");
> > +	printf("    -d, --debug                 Output debugging information.=
\n");
> > +	printf("    -gbct                       Generate the new bct file.\n"=
);
> > +	printf("    -o<ODM_DATA>                Specify the odm_data(in hex).=
\n");
> > +	printf("    [-t20|-t30|-t114|-t124]     Select one of the possible ta=
rget devices,\n");
> > +	printf("                                -t20 if unspecified.\n");
> > +	printf("    configfile                  File with configuration infor=
mation\n");
> > +	printf("    imagename                   Output image name\n");
> >  }
>=20
> To avoid continually re-formatting that text when adding new SoCs, why
> not start the description of the -tNN options on a separate line, and
> leave the indentation as-is for all the unmodified lines. i.e.:
>=20
> >> +	printf("    [-t20|-t30|-t114|-t124]\n");
> >> +	printf("                          Select one of the possible target =
devices,\n");
> >> +	printf("                          -t20 if unspecified.\n");

Perhaps in the long run it would be better to turn this into something
like:

	printf("    -t, --target SOC      Select target device. Must be one of:\n"=
);
	printf("                          20, 30, 114, 124 (default: 20)\n");

Thierry

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSGwf0AAoJEN0jrNd/PrOh55MQAL14miUzoLl+GR2URMYWuHin
xPR/S945kN5wvGViVycnwXes05iLdDr1Dh/E5sRxAkPtQIou4A0PphN3+X1uJ9cT
pQV1+nW/U2+9FeFZWpFOwSarHcOEvO+4gnhulumVvOv8ncje/iB38p7XiUdgE1Bf
sri7HohFCvjLeX11AFOlFkxV2noQaTwdZMPjUfxWpq1SpV9o8xG/BlcqFPkHFdmX
GjpWhpzefAvFT/kXSn5SZbmSzmw3WBo4txdL50bg2zxEZq5r5Zh4q3tTHC1tNhop
SURND+jYx/KUTktfXfzW0n9sWh+kiebps5khVmnzUUWWvIQRkyX0GjzoT3TxQhSk
OKxqbCM9INWGHSprp9fpfR+sMA6PQyEWVIxWt7O+KMlgl2eqlSSDZf7wdnEPKgol
VEitpd9VvNzCqmMYdznWozRi2cDJxndALktvmBhpJq/KN7qNR1ZEndC8WxTjRQus
PIHdFO5rJ8oxtoN/BdzI3nFe40/3wUam7NLSJEP3MIN/xo6yDi1bq4N5hWolGcj5
DX/neBOJgXVhYMNYL9Gc3fs30PCzYWRKNHmZgI9JmsC1B9kwnHSXmfMWzcnMNRL2
11SjGFlqqSoW5XSh2NkrD5FCWE35RYUUFtjXnZrwQvRG65eLybo0a5bzlE1Lsqg+
MqI9LIuD1N5K75R1hvtr
=+6+K
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

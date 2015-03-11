From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegrarcm PATCH 2/2] tegrarcm: Add support for loading MTS
Date: Wed, 11 Mar 2015 11:46:29 +0100
Message-ID: <20150311104624.GP19577@ulmo.nvidia.com>
References: <1421194802-28198-1-git-send-email-jimmzhang@nvidia.com>
 <1421194802-28198-3-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IihjUyvzd0n5Ehsu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421194802-28198-3-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IihjUyvzd0n5Ehsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2015 at 04:20:02PM -0800, Jimmy Zhang wrote:
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The Denver CPU in Tegra132 requires microcode to be loaded before CPU
> initialization.  There are two microcode files required, "preboot" MTS
> and MTS proper.  Add support for loading MTS from either the binary
> versions checked in or from the command line.
>=20
> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  src/Makefile.am                       |  14 +-
>  src/bin2h.sh                          |   9 ++
>  src/main.c                            | 241 ++++++++++++++++++++++++++++=
++++--
>  src/miniloader/tegra132-mts.h         |  13 ++
>  src/miniloader/tegra132-preboot-mts.h |  13 ++
>  src/nv3p.c                            |  19 +++
>  src/nv3p.h                            |   9 ++
>  src/rcm.h                             |   1 +
>  src/tegrarcm.1.in                     |   7 +
>  9 files changed, 314 insertions(+), 12 deletions(-)
>  create mode 100755 src/bin2h.sh
>  create mode 100644 src/miniloader/tegra132-mts.h
>  create mode 100644 src/miniloader/tegra132-preboot-mts.h
>=20
> diff --git a/src/Makefile.am b/src/Makefile.am
> index d0d45cad4fee..0e9ff1bbd7f3 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -1,6 +1,14 @@
>  AM_CFLAGS =3D -Wall -std=3Dc99
>  AM_CPPFLAGS =3D -isystem /usr/include/$(CRYPTOLIB) $(LIBUSB_CFLAGS)
> =20
> +MTS_FIRMWARE_DIR ?=3D ../../mts-firmware
> +
> +miniloader/mts_si.h: $(MTS_FIRMWARE_DIR)/mts_si bin2h.sh
> +	./bin2h.sh $< $@
> +
> +miniloader/mts_preboot_si.h: $(MTS_FIRMWARE_DIR)/mts_preboot_si bin2h.sh
> +	./bin2h.sh $< $@
> +
>  bin_PROGRAMS =3D tegrarcm
>  tegrarcm_SOURCES =3D \
>  	main.c \

Given that these binaries now live in an external repository I think it
makes sense not to generate them in this fashion. The problem is that a
future chip might also require MTS files, in which case it becomes very
unclear where to put which, what version of the binaries to use, etc.

To avoid all that I'd just go with the command-line options and rely on
them exclusively for specifying the MTS binaries to use. In fact I think
we should make that the default for the miniloader as well going forward
to avoid having to further bloat the tegrarcm binary with every new SoC
generation.

> @@ -117,6 +131,16 @@ static void usage(char *progname)
>  	fprintf(stderr, "\t\tminiloader\n");
>  	fprintf(stderr, "\t--miniloader_entry=3D<mlentry>\n");
>  	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
> +	fprintf(stderr, "\t--preboot=3Dpbfile\n");
> +	fprintf(stderr, "\t\tRead the preboot mts ucode from file instead of us=
ing built-in\n");
> +	fprintf(stderr, "\t\tpreboot mts\n");
> +	fprintf(stderr, "\t--preboot_entry=3D<pbentry>\n");

Can we please change this to --preboot-entry...

> +	fprintf(stderr, "\t\tSpecify the entry point for the preboot mts ucode\=
n");
> +	fprintf(stderr, "\t--mts=3Dmtsfile\n");
> +	fprintf(stderr, "\t\tRead the mts ucode from file instead of using buil=
t-in\n");
> +	fprintf(stderr, "\t\tmts\n");
> +	fprintf(stderr, "\t--mts_entry=3D<mtsentry>\n");

and this to --mts-entry? I know we've used underscores in the past, but
they are very unconventional in command-line options and I mistype them
every time.

I have local patches to convert the existing command-line options from
underscores to dashes as well. I'll send those out after these patches
have been applied.

There are a couple of other nitpicks, but since I have changes in my
tree (among other things Tegra210 support) that I need to rebase on this
anyway, how about I take over these two patches and resend them as part
of another series?

Thierry

--IihjUyvzd0n5Ehsu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVAB0AAAoJEN0jrNd/PrOh1O4QAJDGQnJq3Zu6pasv/lblbNxP
3u48/z6vNAglp9PX3qsUdxafdl/Yf4pkJkM6e+4Ed1T5SzewcS1ZujaqVcoplm8B
he129v/nlN3Rn7qKhehITsNpXtIYL1/oVY4cDnxAvf9zHf2kf2RM1qP9tsGMu83d
loZkbKrSlVC+DdW9CjjWvvy+/+iOgQ0JgP2d6oqkCWsTundoBhBvJ/wDlth0ZKwn
crmQNeRJWUBJWI3h7Fa7ssbLGGZVX+I622mdpvxkMNs7mdZtIR2FLJerfineIbHz
kBWOi+XIPDnFtSfXbAbVP+L7q8G1guxBy1hgAj9IifFizTlhKFGusdVWabyfSI+x
KmuZJbOkJUfkA0PSJDaD85rUssuzlDZWPc0wYGy1wPR0ImvH6grMSpz3E6kOJLnk
RJvDKrU/Rz10SxE+xNXx10Oozf8wyfurC6rAVKTtTTfnG0sAHGL9k0EPggP98VKx
QB92A7pRdx0qgV69aGcZmKUq0JijYtFvXqOlx2FNNma1+jZt9ioLWEytMSAeSAFf
xV59XfFb2xncXmTGSU5AxmTS4w86OAtPuls7LLFd88RjdZrXEmWygjElzlJRNEWi
WzcnWlyxhtjg6Zy7T9vwvcaO1qd5TtJ0U0xhQgdaNXXZWE26H6jT9oNrtVaiad7q
m0kndfo0OUVv8Gh7kgTW
=HVg5
-----END PGP SIGNATURE-----

--IihjUyvzd0n5Ehsu--

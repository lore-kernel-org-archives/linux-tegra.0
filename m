From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 2/8] tegrarcm: Add support for loading MTS
Date: Mon, 23 Mar 2015 10:21:06 +0100
Message-ID: <20150323092106.GC11268@ulmo>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
 <1426639141-12060-4-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426639141-12060-4-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 05:38:55PM -0700, Jimmy Zhang wrote:
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The Denver CPU in Tegra132 requires microcode to be loaded before CPU
> initialization. There are two microcode files required, "preboot" MTS
> and MTS proper.  Add support for loading MTS from either the binary
> filenames or binary directory with default filenames from the command lin=
e.
>=20
> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  src/Makefile.am                       |   2 +
>  src/main.c                            | 294 ++++++++++++++++++++++++++++=
++++--
>  src/miniloader/tegra132-mts.h         |  12 ++
>  src/miniloader/tegra132-preboot-mts.h |  11 ++
>  src/nv3p.c                            |  19 +++
>  src/nv3p.h                            |   9 ++
>  src/rcm.h                             |   1 +
>  src/tegrarcm.1.in                     |   7 +
>  8 files changed, 344 insertions(+), 11 deletions(-)
>  create mode 100644 src/miniloader/tegra132-mts.h
>  create mode 100644 src/miniloader/tegra132-preboot-mts.h
>=20
> diff --git a/src/Makefile.am b/src/Makefile.am
> index d0d45cad4fee..ba167f0dcc6c 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -19,6 +19,8 @@ tegrarcm_SOURCES =3D \
>  	miniloader/tegra114-miniloader.h \
>  	miniloader/tegra124-miniloader.h \
>  	miniloader/tegra132-miniloader.h \
> +	miniloader/tegra132-preboot-mts.h \
> +	miniloader/tegra132-mts.h \
>  	usb.h
> =20
>  man_MANS =3D tegrarcm.1
> diff --git a/src/main.c b/src/main.c
> index 24d3bf81191f..b173675d3944 100644
> --- a/src/main.c
> +++ b/src/main.c
> @@ -63,16 +63,26 @@
>  // tegra132 miniloader
>  #include "miniloader/tegra132-miniloader.h"
> =20
> +// tegra132 preboot mts
> +#include "miniloader/tegra132-preboot-mts.h"
> +
> +// tegra132 mts
> +#include "miniloader/tegra132-mts.h"
> +

I don't think we need this. We can already specify the path to a file
and the entrypoint for these, so including them in the binary doesn't
add any value in my opinion.

> @@ -117,6 +132,20 @@ static void usage(char *progname)
>  	fprintf(stderr, "\t\tminiloader\n");
>  	fprintf(stderr, "\t--miniloader_entry=3D<mlentry>\n");
>  	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
> +	fprintf(stderr, "\t--preboot=3Dpbfile\n");
> +	fprintf(stderr, "\t\tRead the preboot mts ucode from file instead of us=
ing built-in\n");
> +	fprintf(stderr, "\t\tpreboot mts\n");
> +	fprintf(stderr, "\t--preboot-entry=3D<pbentry>\n");
> +	fprintf(stderr, "\t\tSpecify the entry point for the preboot ucode\n");
> +	fprintf(stderr, "\t--mts=3Dmtsfile\n");
> +	fprintf(stderr, "\t\tRead the mts ucode from file instead of using buil=
t-in\n");
> +	fprintf(stderr, "\t\tmts\n");
> +	fprintf(stderr, "\t--mts-entry=3D<mtsentry>\n");
> +	fprintf(stderr, "\t\tSpecify the entry point for the cpu ucode\n");
> +	fprintf(stderr, "\t--mts-dir=3Dfull_mts_directory\n");
> +	fprintf(stderr, "\t\tRead the mts ucode from indicated location with pr=
e-defined\n");
> +	fprintf(stderr, "\t\tfile name and entry point. mts-dir will take prece=
dence\n");
> +	fprintf(stderr, "\t\tover mts and preboot options\n");

I don't think this option makes much sense. If we can already specify
the exact file that we want to use for preboot MTS or MTS proper, why
have extra heuristics in tegrarcm to let it select an "appropriate"
variant from some directory? I think it'd be better if tegrarcm kept
providing the means to talk to the device but let other scripts (such
as the flasher scripts) handle the details of which files are passed
in.

> +		// download the mts_preboot ucode
> +		if ((devid & 0xff) =3D=3D USB_DEVID_NVIDIA_TEGRA132) {
> +			ret2 =3D initialize_preboot(usb, pbfile, pbentry, mtsdir);
> +			if (ret2)
> +				error(1, errno, "error initializing preboot mts");
> +		}

Just as a heads-up, I plan on reworking the tegrarcm code a little to
make it easier to add new support. Currently we need to hardcode these
checks for the device ID in various places and it's easy to miss. It
also makes the code hard to read in my opinion, and it's going to get
worse with each new generation.

Unfortunately the patches that I have locally conflict with your changes
here quite a bit, so I will probably wait for a new version of your
series and rebase on top of that.

> +static int initialize_preboot(usb_device_t *usb, char *pbfile, uint32_t =
pbentry,
> +			char *mtsdir)
> +{
> +	int fd;
> +	struct stat sb;
> +	int ret;
> +	uint8_t *preboot, *_preboot =3D NULL;
> +	uint32_t pb_size;
> +	uint32_t pb_entry;
> +	char *_mtsdir =3D NULL;
> +
> +	if (!mtsdir && !pbfile) {
> +		mtsdir =3D _mtsdir =3D (char *)malloc(strlen(TEGRA132_MTS_DIR) + 1);

You never need to cast the return value of malloc(). It returns a void *
and C will cast that for you automatically.

> +static int download_mts(nv3p_handle_t h3p, char *filename,
> +			uint32_t loadaddr, uint16_t devid, char *mtsdir)
> +{
> +	int ret;
> +	nv3p_cmd_dl_mts_t arg;
> +	int fd;
> +	struct stat sb;
> +	uint8_t *buf;
> +	char *_mtsdir =3D NULL;
> +
> +	if (!mtsdir && !filename) {
> +		mtsdir =3D _mtsdir =3D (char *)malloc(strlen(TEGRA132_MTS_DIR) + 1);
> +		sprintf(mtsdir, "%s", TEGRA132_MTS_DIR);
> +	}

All the more reason to get rid of MTS_DIR. We'll need more checking of
the device ID to concatenate the proper directories here...

> +
> +	if (mtsdir) {
> +		filename =3D (char *)malloc(strlen(mtsdir) + 2
> +					 + strlen(TEGRA132_MTS_FILE));
> +		sprintf(filename, "%s/%s", mtsdir, TEGRA132_MTS_FILE);
> +		loadaddr =3D TEGRA132_MTS_ENTRY;
> +	}

=2E.. and the right filenames here.

> +	if (filename) {
> +		// send the mts file
> +		ret =3D send_file(h3p, filename);
> +		if (ret) {
> +			dprintf("error downloading mts\n");
> +			goto done;
> +		}
> +	} else {
> +		ret =3D send_buf(h3p, buf, arg.length);
> +		if (ret) {
> +			dprintf("error downloading mts\n");
> +			goto done;
> +		}
> +	}

This path seems to be completely unused. And as far as I can tell
send_buf() will be unused once you remove this.

> diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
> index e0c2cc38d656..23e484e1a4cd 100644
> --- a/src/tegrarcm.1.in
> +++ b/src/tegrarcm.1.in
> @@ -81,6 +81,13 @@ built-in one.
>  .TP
>  .B \-\-miniloader_entry \fImlentry\fP
>  Specify the entry address of the miniloader.
> +.TP
> +.B \-\-preboot \fIpbfile\fP
> +Read the preboot mts ucode from the specified file instead of using the
> +built-in one.
> +.TP
> +.B \-\-preboot_entry \fIpbentry\fP
> +Specify the entry address of the preboot mts ucode.

Isn't this missing documentation for the other new options?

Thierry

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVD9r/AAoJEN0jrNd/PrOhAjkP/0BlnKimp5E6S0eNIy+1zvDo
7+vqQgogQJet8tnruqMQJ5M1t4HxB93pilQZaGwI61Kup9fZwbGq1dKUUE6aRiyt
z44zyYP28eh2Mot/gEJ645YkYFTgiwhhHy9wK59HSzekGjN34ShGMSkCdfiP0cfS
7EB51pgnIfg3iyjGsdAgeziXGaPvU+sOUib4UVEn0mPgLCN2/lO20wE4ncGoYNQJ
7snUcfKA2o5SxqTwNXFj1atG/e19keCA3N5nGm3Q5Nfg5lxhNs1RzNl+1d8tTK1G
oG4TkQTahUtWzar/C1BZyh34/cDuciyyerjByfpisFMpWWdNrf/z79w/NAO2WWWe
v/aidxEbY8CNyOkAk4/qehxEHe+h00MoyZRozGMjpjSWEO4O4fm1hwWcgWWOzEHB
smcCX3Qh9DvFRzNbxxncNuvnGus2Fb1KM1m1+UY20qx0g+j/h5kMqqez7zUk8lod
AumL4NJ+rIB8NzeBuMawfc6nvA77bvms2zmv5dz7SJ1ala8EgUH0/weRC5dpj1UG
/HIibr3VcDsgKJh6bVtbfaOFZJrDD6+053dskqVHZDA5+x+riaUrX+0hERQ5wMCs
eMzyXfcz3GCuJ4aM78FYM24Z7sBjzfA6Np/1u0UfMXDDHc1UcPZQ8l+NmZyjBe7T
sKNlv+cJnbmvNCGtOv+R
=Gors
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--

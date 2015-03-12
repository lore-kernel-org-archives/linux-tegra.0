From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegrarcm PATCH 2/2] tegrarcm: Add support for loading MTS
Date: Thu, 12 Mar 2015 08:51:51 +0100
Message-ID: <20150312075150.GB30344@ulmo.nvidia.com>
References: <1421194802-28198-1-git-send-email-jimmzhang@nvidia.com>
 <1421194802-28198-3-git-send-email-jimmzhang@nvidia.com>
 <20150311104624.GP19577@ulmo.nvidia.com>
 <b7c1cba9c31042d4a8be3756f5f78455@HQMAIL105.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b7c1cba9c31042d4a8be3756f5f78455-wO81nVYWzR5AOoK4uxnQ11aTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2015 at 03:37:44PM +0000, Stephen Warren wrote:
> Thierry Reding wrote at Wednesday, March 11, 2015 4:46 AM:
> > On Tue, Jan 13, 2015 at 04:20:02PM -0800, Jimmy Zhang wrote:
> > > From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > The Denver CPU in Tegra132 requires microcode to be loaded before CPU
> > > initialization.  There are two microcode files required, "preboot" MTS
> > > and MTS proper.  Add support for loading MTS from either the binary
> > > versions checked in or from the command line.
>=20
> > > @@ -117,6 +131,16 @@ static void usage(char *progname)
> > >  	fprintf(stderr, "\t\tminiloader\n");
> > >  	fprintf(stderr, "\t--miniloader_entry=3D<mlentry>\n");
> > >  	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
> > > +	fprintf(stderr, "\t--preboot=3Dpbfile\n");
> > > +	fprintf(stderr, "\t\tRead the preboot mts ucode from file instead o=
f using built-in\n");
> > > +	fprintf(stderr, "\t\tpreboot mts\n");
> > > +	fprintf(stderr, "\t--preboot_entry=3D<pbentry>\n");
> >=20
> > Can we please change this to --preboot-entry...
> >=20
> > > +	fprintf(stderr, "\t\tSpecify the entry point for the preboot mts uc=
ode\n");
> > > +	fprintf(stderr, "\t--mts=3Dmtsfile\n");
> > > +	fprintf(stderr, "\t\tRead the mts ucode from file instead of using =
built-in\n");
> > > +	fprintf(stderr, "\t\tmts\n");
> > > +	fprintf(stderr, "\t--mts_entry=3D<mtsentry>\n");
> >=20
> > and this to --mts-entry? I know we've used underscores in the past, but
> > they are very unconventional in command-line options and I mistype them
> > every time.
> >=20
> > I have local patches to convert the existing command-line options from
> > underscores to dashes as well. I'll send those out after these patches
> > have been applied.
>=20
> I think it makes sense to accept dashes instead of underscores, but we
> shouldn't remove support for the existing cmdline options, so that the
> tool remains backwards-compatible with any scripts anyone has, and
> their muscle memory.

Of course. My local patches simply add a variant of the option with a
dash while keeping the original with the underscore. Not sure we should
proliferate the practice of supporting underscores in new options. I
suppose consistency would be an argument, but I'd rather have us use
dashed variants consistently and only keep the underscore ones for
backwards-compatibility.

Thierry

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVAUWWAAoJEN0jrNd/PrOhlO8P/2HoQlBje7C8A71Ir3IdyrF5
YUYACAYJ3EOf2QolNKOW1BbFfXmbO/TN90r3wAvVm/BLgQjsm83rwHulPFvRpHDy
c7Xk28TA8I0WsYGVFyo9n9U/laiDrMUT22zFXAxVT0kYo8aNI6/xCf4WAGCUpmjv
N1hRelgtBvHLEDeGcXVXo/BWmDTCVpCo9ntKATqcjlJg7TAsHBNMyqSuaks6AVR7
yP/9VYeCagJH4bge7RA7Dp+qhJr6VGq/I2r/IkIdhDwCOJyMD8sWWzRIT1kZvwaD
J5OsSa4NnCVT8eywKmanTX0cqRG5fs7NESoZKL1RzoYtPCghcJRlgkJeY26B6u82
NRR6neEbTkAkeSjpGqPzf6J4Pk3c6bDD8tv9G+buJjyg57SGxuFyI7gd49cpZlY0
gjRoAtY9ApMEl2N7VekYKZPgUeiAEfDf+xHEixrpvX00ROrBJ9LMWdbPbw1zCGfK
YRq8MnFtsGiu8R1elBSzR/wfRwNuHjJVjSKs3rIPAqaBUisjStwhjBtWe6pU7i5r
cXncHpiwc+HoLpkI1u3qiPW7aqMBEAoNw/KA9HlMCTq4FGqqkVH4LHFj8ZuunwVT
sdxdpEjbzpIXq+L9hFRjTnso0COvQU7ZYzWQklvv27o+g3J5JnMyj+esFoRU+EpH
U1QoFV5g7eQAb7eSYB4l
=sSmV
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--

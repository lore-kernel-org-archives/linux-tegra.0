From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 0/3] Add support for Tegra210
Date: Mon, 23 Mar 2015 22:13:38 +0100
Message-ID: <20150323211336.GB30637@mithrandir.nvidia.com>
References: <1426897221-20307-1-git-send-email-jimmzhang@nvidia.com>
 <551076E2.9000408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <551076E2.9000408-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2015 at 02:26:10PM -0600, Stephen Warren wrote:
> On 03/20/2015 06:20 PM, Jimmy Zhang wrote:
> >Four t210 specific supporting files are added under src/t210 diretory.
> >Comparing T210 bct to T132 bct, the main changes include the size increa=
sed
> >to 10240 from 8704. The number of boot devices that can be specified in =
bct
> >is reduced from 4 to 1. And many new fileds are added to nvboot_sdram_pa=
rams.
> >
> >v1: Initial changes
> >v2: Fix some minor issues found in v1
> >     Removed files src/t210/nvboot_config.h and src/t210/sdram_param.h
> >             that were added unintentionally in v1.
> >v3: Remove "deprecated" from help -t option help text.
>=20
> I think this version looks fine. Barring any objections, I'll apply it Tue
> my time sometime.

I wasn't able to successfully dump a BCT using this series. I'm not sure
if that's actually caused by a bad BCT or by the patches not being
correct. Do we have canonical BCT sources somewhere for something like
Foster?

The problem I'm seeing is that bct_dump reports that the BCT contains 0
SDRAM sets, whereas I'm pretty sure I've used the same BCT to bootstrap
a device with tegrarcm, so it's got to have valid SDRAM sets defined. I
can dig deeper, but it'd be good to have a reference BCT source and
image to verify that converting to BCT and back to source actually is an
idempotent operation.

Thierry

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVEIH9AAoJEN0jrNd/PrOhHsQP/RRC2j0uD6xyl0O0IVwMMRy6
5RuRnsKG9n3e9V71byq25af/X/4dwiuTTACBGj8sioYdsqiAJyD67Or999b0AXwU
AQrD5YvOSrWYAsgFjLzN6oWMR1TiM4PRra3cDQlsQRX/Q1smPrcTmEuyXButn/Bw
eQhiVkE3G98PFjAwfK8bb+BkAhOWRWGvSbxNFPRQ/O2ogR58j/+N9H5YwIUQV6fn
teahrUmUxPTtXUjsn7pNRIEoszm+WHB6BSDyBxsjmpxASAWzYb3GwweOrs1bZkFK
rgujAGO8ZeUu8mCRS8mitFQti33SwzawDUXLfCF2Z+T5jZYbd8bgdBuJynGzBYAa
yL4xeyVsDqHsyo2W8mgeGHb/PyolafNOj9Y527226weZi3sK8H3G/wg9Z9qOrdIf
3qHC+mNBtDxAaBXv4fWnY6CuYnHD792jJVuIANKiJMfCRazvp6rQObHQR76jjNSH
bKY3kY4jS1uoVa5bK4Ga/0nKww5NqzGJSLJDgaGhbwpdjj3S3VHZc2pt+CsUwHRq
HkzNPR/rFMxlXh7XVN/snrDAAj/J+oLKyZmc803UCCHPmA4pHXK6QR5xsp0lOS9Z
suUjguNV3UglrXGDhJTu2te1Xd9+B/hGFTAwHf6XVozNrjPKREYVHPm8beoqaTWy
NTZMfSxDEKJ52/VjaiC9
=x3cL
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--

From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: simplify Kconfig dependencies
Date: Tue, 22 May 2012 11:02:48 +0100
Message-ID: <20120522100248.GF21999@opensource.wolfsonmicro.com>
References: <1337635343-16613-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337635343-16613-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2012 at 03:22:23PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The Tegra ASoC machine drivers only depend on Tegra architecture support
> to compile, not specific board support. Remove Kconfig dependencies on
> any particular board. This is required since Kconfig options for boards
> are going away given the migration to device tree.

Please merge this as part of the Tegra tree as it's going to conflict
with the removal of the machine Kconfig entries anyway.

Acked-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPu2Q/AAoJEBus8iNuMP3dT2oP/1ihrUUtCtu8RFSvZv5M8K5E
IP1ttnyqLdUoFZpBgJ2b7XdQPetaHaUC2VQV8O5fSC7EfHnJtmPdboGREPnwESWr
Mmah8o3aesGSbIjWl4OlIB0Ww5jSBhjJ3cvEt4JHK53LQxoIlb7trIwwcemg9v+1
3kwiNsQUk5Vu/w9jqvhGf2vJREwCh/Pd8JB1glDW/94kURxKeQIPDkaNSnhZz8hL
XqJPtiwHnaBYTluLPcndE23V29Gr2gi8RIFqFyka8zfNoTjhagTwtoOPFUXWiGUq
24ef4T+2it72fBrvHAaVPhApiOTHpoxJDOfpBxW9BRUgoJA0F3jnH2KLsGWRPSvD
bDz7wPrtMoVAmWMIH0A2tGiIik0RUKA2ss1+/BvIQ5KxDg+xUx9fjNRF0tTPpdOy
osXM9CxONoV1xvb/3YN0zTNoyx/23QfKjsq8eVGCLSMvWkG7ZVe+s7IpguPCGGW1
cUj6r/x+y9o4myW3cy9X3sIcy6AQWQtbT0ExnXIcRt6YvyeocHEZX8y0HYDl2ZEI
Lwr7xTtYc9rSlrW1dJbJZq/okuxmZWIOagLsAD58iRm6TkSkQ8lHjn0q6IXOBO61
aFFzpSFpXIVPVkrC7ntSNCSrmiB5xHHQEbLEGEMjbXhtgqft+6PDoNb5zR+MzSH5
tOPwffTLH39E3ac/MTXJ
=zas8
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--

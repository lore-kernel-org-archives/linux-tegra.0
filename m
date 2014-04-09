From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ALSA: hda - Add driver for Tegra SoC HDA
Date: Wed, 9 Apr 2014 12:37:15 +0200
Message-ID: <20140409103714.GB9527@ulmo>
References: <1396984533-13900-1-git-send-email-dgreid@chromium.org>
 <20140409092211.GD9886@ulmo>
 <s5hfvlmvo19.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <s5hfvlmvo19.wl%tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 11:40:34AM +0200, Takashi Iwai wrote:
> At Wed, 9 Apr 2014 11:22:13 +0200,
> Thierry Reding wrote:
> >=20
> > > +
> > > +static int probe_mask[SNDRV_CARDS] =3D {[0 ... (SNDRV_CARDS-1)] =3D =
-1};
> > > +module_param_array(probe_mask, int, NULL, 0444);
> > > +MODULE_PARM_DESC(probe_mask, "Bitmask to probe codecs (default =3D -=
1).");
> >=20
> > Is this really necessary? Do we need this with Tegra? Can't we simply
> > assume that there's always only one codec? Or always use a probe_mask of
> > -1? Alternatively, wouldn't this be better off in DT?
>=20
> This is an option rather for debugging.  Usually the codec is
> recognized automatically in the case of HD-audio.
>=20
> But, another point is, suppose this is really specific to Tegra and
> nothing else, whether we need multiple instances.  If there is only a
> single controller, we can omit the arrays.

Yes, I think it's reasonable to assume that there will only ever be a
single HDA controller on Tegra SoCs.

One other thought: I can see how this option would be useful for
debugging things on a PC for instance, where the configurations can vary
fairly drastically, but I'm having a hard time to imagine this ever
being necessary for Tegra.

But if people prefer to keep this I have no strong objections.

Thierry

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTRSLaAAoJEN0jrNd/PrOh2jwQAKIEmIGxpVMV6+PIATQai5/O
VZvMDuUhPeTxuKq4eTkYG6O7rqZKxC2voxSBnO6a/ya+MrjxuygJg3WRWmjosZgA
IsBoFgW50FaWQ6UiYm26sIsgnzwJJowUlLEJFZAAC8LX6YUGoU7GEDz88u813pEd
y8806Wp0MTXfpIvrtOykqsOYg0NcVKOuncP9Irz+5+1C4QzVVkgdFgovcam0q9uT
Q/9/XijCnbywsxGBAWV82NKbtC1skXnPh9BI69wT9qF+aQLWNRiymlsbcpSprz9t
IqF4Si1Z/PGiP4c9eFhmskwfZoxX14dH8m798HG3ArY33z0K1ZkQduo6upa0+DBH
um+2xxCdB0eZv9AWZcnRDMsWT97iumxwC+kY4BEOBS2wWhL/q2sj6UL0zBffLJWY
rmZLrSgTuL6iFY9z8paAXAvlYkNUyYcGG49xqfDRkwN7PW077YtlnXqbRY4cCjBX
k7BIvD2jrobPiAsga789DsKs43Fx0xJWlEBHgI9ePLXQ/W4cHTSAKiTnaztpADtD
wr818BDIZkU+nAil6c4lBZxz4YIKgmkfRmDRnu90Y62NVFGJiNmDib+uNI5okLUY
OsspbVDezVUFDt77FEoHCR5vbQE2uqN7knoLqGPBJ0MbG26frN+PdtsS+TfbyLEo
lH7wA89nqp05HPHbHPWg
=ZPx7
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--

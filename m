From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] remgap: Fix possible sleep-in-atomic in
 regmap_bulk_write()
Date: Tue, 18 Mar 2014 12:22:18 +0000
Message-ID: <20140318122218.GQ11706@sirena.org.uk>
References: <1395143914-26929-1-git-send-email-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7//HIyYuZny8+TsE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395143914-26929-1-git-send-email-tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7//HIyYuZny8+TsE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2014 at 12:58:33PM +0100, Takashi Iwai wrote:

>  		wval =3D kmemdup(val, val_count * val_bytes, GFP_KERNEL);
>  		if (!wval) {
> -			ret =3D -ENOMEM;
>  			dev_err(map->dev, "Error in memory allocation\n");
> -			goto out;
> +			return -ENOMEM;
>  		}
> +		map->lock(map->lock_arg);
>  		for (i =3D 0; i < val_count * val_bytes; i +=3D val_bytes)
>  			map->format.parse_inplace(wval + i);
> =20
>  		ret =3D _regmap_raw_write(map, reg, wval, val_bytes * val_count);
> +		map->unlock(map->lock_arg);

If we're reducing the locking region here then we should take the lock
after doing the parse_inplace() to reduce the locked region.  Nothing
else can be referring to the data since we only just allocated it.  I'll
fix that by hand and apply.

Please also send things to the list for the subsystem (linux-kernel if
there's not a specific one).

--7//HIyYuZny8+TsE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKDp3AAoJELSic+t+oim9Y3cP/irMS4WnHiwDD0cG50Wg38ZD
MINxVu8ThekEFCzZ5SaWwCcYKW2XM58NG0bqXEZsrfT2bpnQWn+F1ju0wKW+uMGe
R/nHCxX240K23da+AbjtvfbLenBZjhXMaxFjrN5SVp3vbD/zX8EmNDN8Kfia9Cd2
NDUBllYThayXHvO6BjzbhGCE1kSilYGCiYuhI7CRBthLE9KG7RSxo3kwvbZd1TOu
u/5rvM9JTFMpNsO+hl2Pa20Y+8Iz0N6bArAdEenGOgyKAbuAiLUdUGeELoulOFy7
54Nl9hd5DZxKW42wPMN8HsSEJMVAit00xgLBsX5P6kUemS5qD00dGw/OEobProBf
AXD1heQsscTToa5Mo8hsZC9vdz9FVZeZTnJs7SBWqCTafpAZ3zt2qvBpT8zyqiU/
Bd6pS6N9vUvS1S6UDjS/g/LVA70RDkGuLRq/BCPlPoXsEteq8bCfjL8bSDOEPS0I
egldycVBKu1SzA0kX/xgVGtFEifyohlXz7ltR0nTnn7DcKfQlP/1Oa+I5I8yKWuT
HDSeunFvPmytPnyjjsAYORL0nyJno7TEnzbmpNP1ZJWVLechQ6sFR//yuOnu1T3+
yL3UM+kyEFUCx7soTBsFlZZBicnc/mKwSfK5XFIUqIA/uCGZf3RVHyjdRi+77LRO
ZMx/sezMsamXPTTQvxyw
=kL8K
-----END PGP SIGNATURE-----

--7//HIyYuZny8+TsE--

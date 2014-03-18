From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: tegra: Use flat regcache.
Date: Tue, 18 Mar 2014 10:44:09 +0000
Message-ID: <20140318104409.GG11706@sirena.org.uk>
References: <1395115139-22243-1-git-send-email-dgreid@chromium.org>
 <s5hha6wdmxa.wl%tiwai@suse.de>
 <20140318102858.GE11706@sirena.org.uk>
 <s5h4n2vssnu.wl%tiwai@suse.de>
 <53282262.2030300@metafoo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oocIzbZBDVZKHAzi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53282262.2030300-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oocIzbZBDVZKHAzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 18, 2014 at 11:39:30AM +0100, Lars-Peter Clausen wrote:
> On 03/18/2014 11:33 AM, Takashi Iwai wrote:

> >Right.  OTOH, it's still better than papering over with GFP_ATOMIC, I
> >think.  We can just give a proper note in the function description,
> >for example.

> We should still hold the log over the _regmap_write portion of
> regmap_register_patch(), but I think we should otherwise be fine if we make
> it a API requirement that the caller needs to make sure that
> regmap_register_patch() is not called concurrently to itself or to
> regcache_sync().

Yes, it's just the (re)alloc I was talking about there.

--oocIzbZBDVZKHAzi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKCN2AAoJELSic+t+oim9fkwP/AqLACQ2BduOpQwxmBFdcQ8S
YHQfq2oN9sMPZbdmGORBxmA3AxKTlIAc4Iv5uMLFMkDcwBI/O2DqI2ru6sVyf/yC
nq+9blm/dd6ht3lqZEV51bRP1Py2mPlfefV2m6KhfTt2K/xsyZT5yhV6CEEXVg+n
6tiO7b7T1SUPU4Uwpt7/Zwr3wvNKarOuch0RKNaVjZu1VP27ys8zv0vQprsYeW9M
ZFB595KLpmZfhWRDGyLDCxKvDufT2o8x85FO0rmdIx8JzFZvN4ZHMYAJTyEG45vj
nzomCHQzE00zT3sXxdb0rOwyJyONZJDwemzAPw0f1ILvswxuZ1ktW3kBj2xFNUp5
SbAZHxShwL3erLfIEgNzAqRyq7RzP1EuXkaQ6QeFteEpL0ijXBXED0SvPQi0UsJ0
7nrUFw/cgCJ25ghdJ9NEgwRMA66nlv3nX40Rzp8YdLVbL4G7+zdr/EoH6J5LlhVm
vtxkKPm728WfiNxX0mfth0M8aujtCYPdzEfGOEoG0i1Pcu38s8ap8FO4SU8Wytxs
kz+W48fRInnO3iRI7riYdTVB7HQytWVUqCnCpy0Vbbop6FZmEfQCyJEwvLoG4lzw
y+ZjfIuPC3Rxz3AoLMShHxlDr+eXIGa7kpSRpniaeSfsGEwsnUwe3Ehd6MjEVlWO
CIKXcOfk4HWlBzgOODEK
=OgfN
-----END PGP SIGNATURE-----

--oocIzbZBDVZKHAzi--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 17:41:07 +0200
Message-ID: <20200414154107.GO3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <fae8e1f5-753b-b2ce-d14f-c6e8b2061fdd@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TMgB3/Ch1aWgZB1L"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fae8e1f5-753b-b2ce-d14f-c6e8b2061fdd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TMgB3/Ch1aWgZB1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 11:46:25PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > ---
> > Changes in v6:
> > - use __maybe_unused instead of #ifdef'ery for suspend/resume callbacks
> > - take exclusive control of EMC clock during suspend/resume
> > - move EMC driver changes from clk patch to this patch
> > - make the driver buildable as a module
> > - remove unnecessary suspend tracking
> > - remove duplicate register defines
> > - add tegra210-emc.h for Tegra210-specific registers
> > - detect number of channels, number of devices and DRAM type at probe
> >   time and store them in struct tegra210_emc, remove the corresponding
> >   function parameters where no longer needed
> > - properly clean up on failure
> >=20
> > Changes in v5:
> > - major rework and cleanup
>=20
> I happened to notice that the patches have an individual changelog only
> by accident :)
>=20
> Next time will be nice if at least you could mention about this in the
> cover-letter, or move (or duplicate) the whole log in the cover-letter.

Given the amount of changes that seemed a little impractical. I can try
to give a high-level overview of the changes and perhaps mention in the
cover letter that there will be individual changelogs for each patch.

Thierry

--TMgB3/Ch1aWgZB1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V2ZMACgkQ3SOs138+
s6FVCw/+MTxlJhCzaf3mRbl2CqipZNHLKX5jAJK8K1SPWAv0fTVLuIKTFNVz1KY3
wuxrgDZT+97eeXS8w7J0B83iLgKEeX5hCepqnOzb716x9sU95XgAfQUZsHsJhBYQ
hjQycXgvlRXLMpEsbHuA87JT4ILV2DsxSngVdbK8GaKCZSkfj0g5Ov8g2H8SghAs
Tv4POtJpUnDWR0ypK8+1o0OzFS7vuy6ctew+8wTAnEqTW8I4bd/RCFMCBqhD+4oS
JuchrTdRRy23tQ3h+QxXhXHxXA3IsZiGzaQ5PL+/AKkebj6k5UR3GgnowBnJyB5m
/i8TQDHGGrw2MPW3VrTKKI5gKqpUYPBKOZirL+MEdY02jOmaUcCkA9cSfKyFPidf
pOfGPi5LhuNmkEAChJItWNJaRALrNcKjcKqV38xeMT94ji/1jAA8cjVPukMs/Clr
kfKba0UOAWTVDZDp1MnxQrNK1E+LJN+hE2qPpKLB2ZI4H9UaKR9uATh/JhmxcnJp
wJB25m9eHTUymsuAfenvL2nwBoato1jHeYiitEkntbfD6ybAjq0PDCotq4/2bBWU
VwoMjKVEW6FgL+LYTAbLAyDva0ckCp07aEVZzXBeOhFVtd2BuQP0PLvfDbDcsBnV
37mhZq5lYyKiL93hNyb/GGwm47r+bcNMl+zRvGTHXQf/ifMdrqo=
=l66T
-----END PGP SIGNATURE-----

--TMgB3/Ch1aWgZB1L--

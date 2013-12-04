From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/31] ARM: tegra: add missing clock documentation to DT
 bindings
Date: Wed, 4 Dec 2013 09:48:12 +0100
Message-ID: <20131204084811.GF19943@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-2-git-send-email-swarren@wwwdotorg.org>
 <20131129114900.GN22771@ulmo.nvidia.com>
 <529B8888.3010801@wwwdotorg.org>
 <20131202085257.GA17834@ulmo.nvidia.com>
 <529E2364.6000205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529E2364.6000205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 11:31:00AM -0700, Stephen Warren wrote:
> On 12/02/2013 01:52 AM, Thierry Reding wrote:
> > On Sun, Dec 01, 2013 at 12:05:44PM -0700, Stephen Warren wrote:
> >> On 11/29/2013 04:49 AM, Thierry Reding wrote:
> >>> On Fri, Nov 15, 2013 at 01:53:56PM -0700, Stephen Warren wrote:
> >>>  [...]
> >>>> @@ -60,6 +81,12 @@ of the following host1x client modules: -=20
> >>>> compatible: "nvidia,tegra<chip>-dc" - reg: Physical base
> >>>> address and length of the controller's registers. -
> >>>> interrupts: The interrupt outputs from the controller. +  -
> >>>> clocks : Must contain an entry for each entry in clock-names.
> >>>> +    See ../clocks/clock-bindings.txt for details. +  -
> >>>> clock-names : Must include the following entries: +    -
> >>>> disp1 or disp2 (depending on the controller instance)
> >>>=20
> >>> I'm not sure if this makes sense. The name could be the same=20
> >>> independent of which controller uses it. If it isn't then the=20
> >>> driver would need additional code to find out which instance it
> >>> is and construct a dynamic string.
> >>>=20
> >>> Any objection to just make this entry "disp", or "dc"?
> >>=20
> >> This patch simply documents the binding that the various drivers=20
> >> already require and/or whatever is already in the DT files if
> >> there are any clocks the drivers don't currently use. I did
> >> consider fixing up all the current usage to actually be sane, but
> >> that would require even more driver changes (in addition to those
> >> required for the reset framework patches).
> >=20
> > Okay, I understand. I still think we should change the usage for
> > this particular use-case subsequently. In retrospect the entry in
> > clock-names wasn't thought out very well. It seems like the reason
> > for using disp1 and disp2 respectively was so that it would match
> > the system-wide clock name, rather than the clock's label within
> > the display controller's context.
> >=20
> > Just to clarify what I mean, if we stick to the above, then we'll
> > need to add code to the driver along the lines of:
> >=20
> > char clock_name[6];
> >=20
> > if (regs->start =3D=3D 0x54200000) index =3D 1; else index =3D 2;
> >=20
> > sprintf(clock_name, "disp%u", index);
> >=20
> > clk =3D devm_clk_get(&pdev->dev, clock_name);
> >=20
> > rather than the much more simple and elegant:
> >=20
> > clk =3D devm_clk_get(&pdev->dev, "disp");
> >=20
> > The whole purpose of the clock consumer ID is to be generic and as
> > such independent of the specific IP block or instance thereof.
>=20
> I think if the code needs this clock, I'd be tempted to do the following:
>=20
> clk =3D clk_get(dev, "disp1");
> if (IS_ERR(clk) && PTR_ERR(clk) !=3D -EPROBE_DEFERRED)
>     clk =3D clk_get(dev, "disp2");
> if (IS_ERR(clk))
>     return PTR_ERR(clk);
>=20
> That avoids having to hard-code IP block base addresses and construct
> clock names at run-time.

I think perhaps we're getting our wires crossed. What I've been trying
to say is that I think the binding should define the first clock to be
named simply "disp".

The reason why I think "disp" is a better choice than "disp1" and
"disp2" is that it merely encodes the purpose of the clock for the
display controller, and doesn't contain knowledge about the particular
instance of the display controller. That's analogous to I2C or SPI nodes
where the clock isn't named "i2c1", "i2c2", ... or "spi1", "spi2", ...
but simply "i2c" or "spi" respectively.

I know that existing DTS files use "disp1" and "disp2", respectively,
but I think that was a wrong choice back at the time and therefore I
suggest that we change it while we still can (DTS files are changing in
3.14 anyway because of the reset and DMA binding updates).

Is that any clearer than what I was saying before?

Thierry

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnuxLAAoJEN0jrNd/PrOhyhMP/0/fWpWDesUZ+UgTN0eaUuMy
WWB44RdWk28xAHKmX0N1o0TJhV//YKD5MH8jkyF0YY4SIB7ZxwN3Kpq2kY97+05s
WgSd+2/6345VXqiZtvFjVRq2LvAauRkhNhEgY2r5gKksq4rnkxyA2cZksZfcX3JI
A6gAcYiY3PIHFpZ3uPs6dLGzYRLmNj2McDPdS9ohPHfPEiXxwhASsypnQKfkjaHS
wWaLSCEhfFBoJzEGcotvJhgVPvExJ5jd27vMYB9Fx+tg/CqaoR1CzXqecD+PwHlF
/g9N9PFLV0IkGyd/ImMk7s6ou7F0JMN2A3x+Rp4UQdmqCP92EFkSwZkwHKZKouKr
oZ2ZcPJMYoclMSwYjpgG8IcncPe9TSOxNOWzF+J9dFHO9CoPn/GfdH2QSalQdCHY
O1d7WE7IEoIYHs1CSgXoApZchBuYb/Gq6VNJ8Z6u8SM5h7qWwSEjM1OROF4thhfq
gq4YtxXhpoGz6Uc0fs/KTmQlOToObxMAD10YaRFY229FJcrqDO3ybcXIv1pVLJKD
OAPIqzL5hLcCmHimmUVVgAN2Ym2IQje+rX99htHXdTPiZpv4u6X9V4CtO/2NKrK8
VuZusFsfjVVWHeIZl/GZz0I6+v6x1kRGXO/rR+4I3nmiYHQNMtBnSRAe6wS44rgr
TbKAQ/Z51fLuCQBNvA1A
=u8Fb
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--

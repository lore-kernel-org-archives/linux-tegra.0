From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 17:02:19 +0200
Message-ID: <20200414150219.GK3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fLj60tP2PZ34xyqD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--fLj60tP2PZ34xyqD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 02:56:53AM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC		0x19c
> ...
> > +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL		0x664
>=20
> I'd suggest to double check all the macros and remove everything unused,
> to not pollute the code.

I recall checking most of these, but I'll make another pass to see if I
can spot more that I can drop.

> ...
> > +#define TRIM_REG(chan, rank, reg, byte)					\
> > +	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> > +	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
> > +	   next->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##		\
> > +				 rank ## _ ## reg ## _INDEX]) >>	\
> > +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> > +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
> > +	 +								\
> > +	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> > +	    byte ## _DATA_BRLSHFT_MASK &				\
> > +	    next->trim_perch_regs[EMC ## chan ##			\
> > +			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
> > +	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> > +	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
> > +
> > +#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
> > +	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
> > +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT) =
& \
> > +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> > +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
> > +	 |								\
> > +	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
> > +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT) =
& \
> > +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> > +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))
>=20
> My eyes.. :P

Heh... yes, this is pretty bad. At least the code at the callsites is
clean.

Thierry

--fLj60tP2PZ34xyqD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V0HsACgkQ3SOs138+
s6FXCg/7B0bMQSGWtJXVBNJfMTn8M0O+JF56fTgGvLoz+9OjrduZ3flJ5t1MVTvp
o+MoMG4zK2JjlnMcMLG5o/6hSbLU0kAKJ7BlHbwgV252liWGABe3h0xV8923aWRi
vbm8f1v9sab2U/KJGUdZxeSZ9NfrVzCzGzBlZmynLF6fKhnymS1usyKChKqwlvv2
PZAZKF4hNDizXxy1ZpmSJHoZRsZ94qSj2NuAvLxMjx0Hmv6jJ8D7AZuY/GKeCZPN
ByuGMahGXXaE8JaOzgxsfHx0TEC1hKb4Y017xgHpZzMU50ck4eqFJb/nHXBVddPH
KjYmaDzYIfSqtYRrmPVmloUBVjb9Y1EDspe+5TbQvpSwSLjNFPeM0z5dZXrZU4w0
W4bvghLzaZvgvC9thmTZur7QTcOOco3BRTIxv8hzA/2FO/oWX9p1CGbR6Ddsg/ly
SzhUu5CUKCrKdob6YRTpfT+5CN+zCzR7dt+XJ2LcR1lg0UnCCMnmyf2kJUNdkwZp
lWQQTm4pFrHNRv0a8DNN6ma4fK0yyS//7bJQVM/sGJZ8hnloT6skT8hUyfre9d9f
AzpQypnVyqMv2PTFYthPYkF6CaLHHgE/NU4yUyQHyNIBCQT4OHZZZXBlS42azM10
6/79zjdxTiIR6C0mHgIWY6kgTNiL7RiU9ctwpI9vnCrp+YzPfy0=
=SSdO
-----END PGP SIGNATURE-----

--fLj60tP2PZ34xyqD--

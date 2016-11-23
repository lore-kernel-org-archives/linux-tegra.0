From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: Add Tegra186 support
Date: Wed, 23 Nov 2016 20:44:23 +0100
Message-ID: <20161123194423.GA26733@ulmo.ba.sec>
References: <20161122173042.GA3239@ulmo.ba.sec>
 <20161122175539.3897-1-thierry.reding@gmail.com>
 <CACRpkdYs3WoBPCiuuuka_DQz5KP0Sxc_wT57Zd3c4MF+9xH1+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYs3WoBPCiuuuka_DQz5KP0Sxc_wT57Zd3c4MF+9xH1+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 02:30:45PM +0100, Linus Walleij wrote:
> On Tue, Nov 22, 2016 at 6:55 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Tegra186 has two GPIO controllers that are largely register compatible
> > between one another but are completely different from the controller
> > found on earlier generations.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> I would prefer if you could try to convert this driver to use
> CONFIG_GPIOLIB_IRQCHIP and install a chained interrupt
> handler with gpiochip_irqchio_add() + gpiolib_set_chained_irqchip().
> It would save us so much trouble and so much complicated
> code to maintain for this custom irqdomain.
>=20
> I suggest you to look into the mechanisms mentioned in my
> previous mail for how to poke holes in the single linear
> irqdomain used by this mechanism.
>=20
> As it seems, you only have one parent interrupt with all
> these IRQs cascading off it as far as I can tell.

Like I said in other email, I don't think this will work because the
GPIOLIB_IRQCHIP support seems to be limited to cases where a single
parent interrupt is used. We could possibly live with a single IRQ
handler and data, but we definitely need to request multiple IRQs if
we want to be able to use all GPIOs as interrupts.

Thierry

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNfGXAAoJEN0jrNd/PrOh2lUQAIYSZpgFwGqcRv39tbzBkpwq
77+6eV+YkOvgaDf43xRNxLyh6hzwKPRtAitpS/GU1Bn+YQlyAVRwzS6qVioSSSN1
ziuBUswQvOX0mI/vzfeP/HSD/SxKWfvPkvE0tMqYMpUZyZ1+Xagh+MncS6fDrJX/
ERbrlzYjcI9GcztRQlyY/Pod+ZJVUTpYfn7DKmkkFed+MCgc65ifoWT6eEbM781t
oY5km5d93lXQX8PyMz8BVfgDk9gFytfemi6XhnvJAHuq7JEURL/JOZNmghr2cm/w
IZlmA4idzlR8NKo2pUnknVYY/32H5LfbvNlzHDV51J4VtZZPOXY2bCRwOOCQIvOd
/ASMQVx7mQKG9TiJ/xxt+2SCW6Ua+2aXI9cozkwxpArY19ErRyklX+GxcsJB3K1T
hlyURuaTs3GnCVaATdS25++1QuP9bpt2pexbVt3fsN70oAjv3p/AClsqeoIYJ8xy
B7LW6Y+0Uh3PuxPAgMuu4w4BkNjtE+47xZTLyENQi5eOoVSVnilwSpIQYKGXx5bf
a4MBcR8/4xCWFDqkvU2Kd21TKD9JQUOksCvT8L644SJ6wVd4nn8NXUHipXIOkiUR
fbANil11qMCdtu7GC5Cen5dAMyZxvitjY2KBVezi3E3k/XO56ri5BFsjR+WTvdd9
hPf9Ta/aziPmnAazCJKs
=NgdS
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--

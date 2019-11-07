From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 07/22] clk: Add API to get index of the clock parent
Date: Thu, 7 Nov 2019 16:21:15 +0100
Message-ID: <20191107152115.GA2580600@ulmo>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
 <1565984527-5272-8-git-send-email-skomatineni@nvidia.com>
 <20191106231005.F2CD820869@mail.kernel.org>
 <fcc43ccb-8c6e-d518-4c70-503501706ffd@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fcc43ccb-8c6e-d518-4c70-503501706ffd@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2019 at 03:54:03AM +0300, Dmitry Osipenko wrote:
> 07.11.2019 02:10, Stephen Boyd =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Quoting Sowjanya Komatineni (2019-08-16 12:41:52)
> >> This patch adds an API clk_hw_get_parent_index to get index of the
> >> clock parent to use during the clock restore operations on system
> >> resume.
> > =20
> > Is there a reason we can't save the clk hw index at suspend time by
> > reading the hardware to understand the current parent? The parent index
> > typically doesn't matter unless we're trying to communicate something
> > from the framework to the provider driver. Put another way, I would
> > think the provider driver can figure out the index itself without having
> > to go through the framework to do so.
>=20
> Isn't it a bit wasteful to duplicate information about the parent within
> a provider if framework already has that info? The whole point of this
> new API is to allow providers to avoid that unnecessary duplication.
>=20
> Please note that clk_hw_get_parent_index is getting used only at the
> resume time and not at suspend.

I agree with this. All of the information that we need is already cached
in the framework. Doing this in the driver would mean essentially adding
a "saved parent" field along with code to read the value at suspend time
to the three types of clocks that currently use this core helper.

That's certainly something that we *can* do, but it doesn't sound like a
better option than simply querying the framework for the value that we
need.

Thierry

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3ENmgACgkQ3SOs138+
s6HBehAAoWy2oqQjgS7Lk2yJnxhX9j8cHmxS30B66WKwZ/Enod8p3/tHOIreOs7Q
na8sE7nhvDP6ULJjCNNjrBtZ+rm9EfK9n4jUV6Y10wH8PVpFyN8Xnobp5yipT4uD
V65DF1MPG1xYfG7ksHXFJRpXlWPuVWQzaxTKSVpQuzbqRtpyoXCYTy50u68TUz5X
Qs8XOQAmrcG2DqflYdDdra1OVqjPlL6gShB9nrzkIoCg41mqnQ/j6iqC9yPa0rXv
k765USRxiD9gdYPksBVf5WJx7Bf3oECYEkhxP6XalKDp/b/USIEOElTqwe7uFSW6
oL5MhWWlM/aOGvtR5lt8cawc2Z9oGzg7Ts2Z6Ot1iDV8Un+NPobcGBXFIw5y6zP2
pEKbHMCxSBx8X86zlMxhIg2g0NGZu3xkKWTa+9KnANa8MRGDCfacHPoRy/XA2qGh
ufM4+hfz8fFJk1ODxS/f4RbMp6XwXfL3X5UvVVhiKNBm44H3ZpD8398RolwT6yQS
rFMpF8SC00/t5f34ZPU2gZkBDZheqFfX/d94EVUXUxcJ7xndVVqXgGrWlFjKnYVw
hovXum6/3HTiMjyVQW3HfgaU8fa+Oazny1okGE0rXkrV5Ii/XFtAQyVv2Q7oGNOK
TrfKd5/oJr6Eu1zqpToS+HmUhTZGQp0NL1QF9BrUd4+WvLNmsWs=
=PNuJ
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 16:54:42 +0200
Message-ID: <20200414145442.GJ3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <a9afb1b5-3141-4923-c7fa-194228081e1b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QxN5xOWGsmh5a4wb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a9afb1b5-3141-4923-c7fa-194228081e1b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--QxN5xOWGsmh5a4wb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 10:16:46PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static int tegra210_emc_set_rate(struct device *dev,
> > +				 const struct tegra210_clk_emc_config *config)
> > +{
> > +	struct tegra210_emc *emc =3D dev_get_drvdata(dev);
> > +	struct tegra210_emc_timing *timing =3D NULL;
> > +	unsigned long rate =3D config->rate;
> > +	s64 last_change_delay;
> > +	unsigned long flags;
> > +	unsigned int i;
> > +
> > +	if (rate =3D=3D emc->last->rate * 1000UL)
> > +		return 0;
>=20
> Couldn't all the rates be expressed in Hz? Then you won't need all these
> multiplications by 1000.

The EMC table is generated with kHz and I'd rather not change the values
in those entries. There's only a few cases where we need to convert from
one to the other, and they are always only when we compare a CCF rate to
the EMC rate, so I think it's fairly explicit when it's needed.

> > +	for (i =3D 0; i < emc->num_timings; i++) {
> > +		if (emc->timings[i].rate * 1000UL =3D=3D rate) {
> > +			timing =3D &emc->timings[i];
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!timing)
> > +		return -EINVAL;
> > +
> > +	if (rate > 204000000 && !timing->trained)
> > +		return -EINVAL;
> > +
> > +	emc->next =3D timing;
> > +	last_change_delay =3D ktime_us_delta(ktime_get(), emc->clkchange_time=
);
> > +
> > +	/* XXX use non-busy-looping sleep? */
> > +	if ((last_change_delay >=3D 0) &&
> > +	    (last_change_delay < emc->clkchange_delay))
> > +		udelay(emc->clkchange_delay - (int)last_change_delay);
> > +
> > +	spin_lock_irqsave(&emc->lock, flags);
> > +	tegra210_emc_set_clock(emc, config->value);
> > +	emc->clkchange_time =3D ktime_get();
> > +	emc->last =3D timing;
> > +	spin_unlock_irqrestore(&emc->lock, flags);
> > +
> > +	return 0;
> > +}
>=20
> I'd suggest to check how much time invocation of ktime_get() takes, at
> least it came to a surprise to me in a case of the tegra-cpuidle driver.
>=20
> It may be well over the emc->clkchange_delay.

I assume that at least each invocation would take roughly the same
amount of time? Since we only use the value to compute the time since
the last clock change the result should always be valid. In the worst
case if ktime_get() really takes that long we may be waiting longer
than we need to, but that wouldn't be all that bad either. Changing
the EMC clock rate isn't something that you want to do a lot.

> ...
> > +static int tegra210_emc_probe(struct platform_device *pdev)
> > +{
> ...
> > +	emc->clkchange_delay =3D 100;
> > +	emc->training_interval =3D 100;
>=20
> Not sure why these aren't a constant with the code.. ?

The idea is to make them easily tunable without having to go hunt for
them later on. We don't use them in a lot of computations, so making
them constants isn't going to buy us a lot. Also, none of these code
paths are really hot, so I like the flexibility that this gives us in
being able to quickly tweak if we ever need to without having to worry
that we'll forget a location.

Thierry

--QxN5xOWGsmh5a4wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VzrIACgkQ3SOs138+
s6FSURAAuHIkM76l/aW376GVZabPFaDTft8S6fSnvsPAacz3OhBF4M0kAK/SjSoq
ce97F/3HY63ernpSMN5gvmnWUi9KU7xdFYUrn3xdRGMk9art6jtN4yzut8Q8oaec
iu6lXrNqDGY9NzngDbmz0GBLjQSxg8oA67TJ5Cl4mL8TWwFFfkUO8+VZzO/xkc3k
rNQgmFbMOKKMecFlDRSHHXBEVOFzLfduRplsi+7bm6S2Qb0Cw2KQvAFBCgKEXgRi
zfz17e3hP03jD3wkmW58MswKBnqvj2aDunaU+rbSxYKQVwen4M81KKt7pryc2V+z
XzBD9DJDjmkW5Cn4AGs3oYuDfzgojT9eoS/I3HshHbACqeIIpIauUpLxtYMEsF2A
KCcHLwZ1G8XUDG1uD8f54eJkL7VidI+vecLpiR069NfDpF6wg1jq4RFWKorUeUd9
05wT5ZfHmzy+aOHh738jOfI6ddmNUTygueMzQKmKCUCLPeq+lxL3Yg5FVkYiQVQu
/rqOlEZNolYcfU2x5C32i0qf0Tx4Dwzsad66wgvC0QpJmMqrVWKEXySGHF76tvvQ
7VdSm6ThYSQNQ4Xhz71+g2hCNNu2/1U+gkpBarP+crQ7nt8zAxR6jZl9hgfDfYq5
S0hZ8vQvEwGMLv/qXWdlQzycOFUl0dNe81DcENQGt7HMCAdRXBs=
=NhUM
-----END PGP SIGNATURE-----

--QxN5xOWGsmh5a4wb--

From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 5/7] ASoC: tegra: add ac97 host driver
Date: Thu, 20 Dec 2012 20:23:51 +0000
Message-ID: <20121220202350.GB26183@opensource.wolfsonmicro.com>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de>
 <1355959056-6009-5-git-send-email-dev@lynxeye.de>
 <50D36A98.7090204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50D36A98.7090204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 20, 2012 at 12:44:24PM -0700, Stephen Warren wrote:
> On 12/19/2012 04:17 PM, Lucas Stach wrote:

> > +	/* reset line is not driven by DAC pad group, have to toggle GPIO */
> > +	gpio_set_value(workdata->reset_gpio, 0);
> > +	udelay(2);

> I'm not quite sure what that implies. Might some (Tegra) HW designs use
> a dedicated signal from the AC'97 HW to reset the CODEC and others not?
> That would make the GPIO optional. Or, does the comment mean that Tegra
> doesn't ever have a dedicated CODEC reset signal, so we always have to
> use a GPIO? If so, this comment might be more appropriate inside probe()
> where I asked my related questions.

The traditional approach, pioneered by almost everyone who made an AC'97
controller, is to fill the thing with bugs.  Failing to drive the reset
line correctly is just one of the common bugs.

> > +static const struct snd_soc_dai_ops tegra20_ac97_dai_ops = {
> > +	.trigger	= tegra20_ac97_trigger,
> > +};

> No .set_fmt or .hw_params? Does the AC'97 ASoC core code handle that
> somehow? I guess that's what soc_ac97_ops is for?

There should be no controller side configurations for these things.
AC'97 defines the clocking format completely and variable sample rates
are done by the CODEC flagging when data is present in a given timeslot.

> > +	ac97->reset_gpio = of_get_named_gpio(pdev->dev.of_node,
> > +					     "nvidia,codec-reset-gpio", 0);
> > +	if (gpio_is_valid(ac97->reset_gpio)) {
> > +		ret = devm_gpio_request_one(&pdev->dev, ac97->reset_gpio,
> > +					    GPIOF_OUT_INIT_HIGH, "codec-reset");

> Shouldn't this get the flags from the GPIO specifier, and deal with
> active-high/active-low resets, or is the polarity set by the AC'97 spec?

Spec.

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ03POAAoJELSic+t+oim9R9EP/Ro/O+tNTtoLcJukfX4pC8H3
/0f4bhLukbDtk/G0P7DUYnwUqys0WyuaJ9waMrlnuiRE61EAkb86S5iEUbJPRXeI
mY0KKisWik7HIWsm9CawLtZeIP05JtWfDrTpEAxewYHVSRul6s9viJ9GYU7epc1z
qtTs5zLXhpnwCQG113cj+mEn9OFHtwhQSF/MClCtA1UE1xtetVHjsdte94wpsILV
MTNJjxx4o44T35tF0/5++I/uuely43+tyKtxepoWm7B9YPaXmG6Kao7ABzTdFBob
nVOlRBXo0Z3Z0ShkJ5rmorHirU/DNIXObXFKL2f6oeJr87chJmNDeVdLOtaR3zVh
AZgT0hvV4iH2AbmtUCaqeuE5/OPI8MrXt1Ce3QvbtnkMA9biPHpmJXLwgu6e7+wz
5ZhvYRT/wJOM5fGOK+hJiuTpM1mfmM+6a3796+vRH8vq/8NmfFV8g4oD/o/Zm+RA
2oV6Ygnygur7KCjMNxOMKf/vVYwjdcHi1ya1hx9SyFBSL0fs9rCTmtXJEebZGETu
C1xIJsd8Jg1cP7VWXlv3zLyU3hLKqgwEfpAncRQTPp9Xsho8AebCoCnssldRDO+m
dVQeOhbDyO+fyZVqXg2mZ1lDUuHhmEDnB5sUBb30EhsgHc34ZbZU/wZJFxdI2NAd
4rxUs/VG22rlBI4EgCVs
=rl2H
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--

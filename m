From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: T114: add DFLL DVCO reset control
Date: Fri, 7 Jun 2013 17:06:29 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1306071703050.7753@utopia.booyaka.com>
References: <20130607121505.21868.72360.stgit@dusk.lan> <20130607121901.21868.65416.stgit@dusk.lan> <51B21105.1080301@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="843723315-1307264298-1370624789=:7753"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51B21105.1080301-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--843723315-1307264298-1370624789=:7753
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Stephen,

On Fri, 7 Jun 2013, Stephen Warren wrote:

> On 06/07/2013 06:19 AM, Paul Walmsley wrote:
> > Add DFLL DVCO reset line control functions to the CAR IP block driver.
> >=20
> > The DVCO present in the DFLL IP block has a separate reset line,
> > exposed via the CAR IP block.  This reset line is asserted upon SoC
> > reset.  Unless something (such as the DFLL driver) deasserts this
> > line, the DVCO will not oscillate, although reads and writes to the
> > DFLL IP block will complete.
> >=20
> > Thanks to Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> for identifying this and
> > saving hours of debugging time.
>=20
> > diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>=20
> >  void tegra114_clock_tune_cpu_trimmers_high(void);
> >  void tegra114_clock_tune_cpu_trimmers_low(void);
> >  void tegra114_clock_tune_cpu_trimmers_init(void);
> > +void tegra114_clock_assert_dfll_dvco_reset(void);
> > +void tegra114_clock_deassert_dfll_dvco_reset(void);
>=20
> Where/what is the code that will call these new APIs? If it's going to
> be something in drivers/clk, that seems fine.

That's correct - they'll be used by the DFLL clocksource code, which will=
=20
live in drivers/clk/tegra.  You've seen the patches already ;-)

> The reset assert/de-assert functions at least might be worth exposing
> using the new generic module reset API. I believe Prashant Gaikwad is
> working on converting the Tegra clock driver to be a module reset
> provider, hence removing the existing custom
> tegra_periph_reset_{de,}assert() APIs.

OK, will take a look to see if this can be done without getting in the way=
=20
of Prashant's work.  I'd na=C3=AFvely assume that it might be best to conve=
rt=20
these as part of his series - that way we won't duplicate effort.

Prashant, what stage are you at in the conversion?  If you're close to=20
completion, maybe we can just add this functionality in with your patches?


- Paul
--843723315-1307264298-1370624789=:7753--

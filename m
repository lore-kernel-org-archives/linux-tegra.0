From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] clk: tegra: Mark HCLK, SCLK, EMC,
 MC and PLL_P outputs as critical
Date: Tue, 19 Dec 2017 14:15:58 -0800
Message-ID: <151372175856.45969.11728164366457295655@resonance>
References: <10b27ad57c959b6a87f339cc2237cfe45865771d.1513655733.git.digetx@gmail.com>
 <151371340146.45969.1875712520168365873@resonance>
 <6e09f1cb-cb89-55a5-b7ea-52cb9f0efaf2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6e09f1cb-cb89-55a5-b7ea-52cb9f0efaf2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2017-12-19 12:20:56)
> On 19.12.2017 22:56, Michael Turquette wrote:
> > Quoting Dmitry Osipenko (2017-12-18 19:59:06)
> >> Machine dies if HCLK, SCLK or EMC is disabled, hence mark these clocks
> >> as critical. Currently some of drivers do not manage clocks properly,
> >> expecting clocks to be 'always enabled', these clocks are MC and PLL_P
> >> outputs. Let's mark MC or PLL_P outputs as critical for now and revert
> >> this change once drivers would be corrected.
> > =

> > Are the drivers that do not manage their clocks correctly merged
> > upstream? If so can we fix those drivers instead of marking clocks as
> > critical?
> =

> All the drivers are in upstream for a quite long time already. We should =
be able
> to correct them, but I haven't tried yet.
> =

> > If not can we annotate the flags below with a comment stating to remove
> > the critical clock flag once the consumer driver gets a clue?
> I'll try to take a look at how much effort it would take to correct the d=
rivers
> during the next few days and will send v3 with either the comment being a=
dded or
> 'always enabled' clocks being dropped from the patch.

Great, thanks for looking into it. Critical clocks are an easy-to-abuse
feature and we should really be using the clk.h api as much as possible
in place of the critical clocks mechanism.

Best regards,
Mike

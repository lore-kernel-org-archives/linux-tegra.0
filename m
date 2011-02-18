From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3] ARM: Tegra: Add pll_d table entries for 252MHz
Date: Fri, 18 Feb 2011 15:48:43 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A58DE@HQMAIL01.nvidia.com>
References: <1298071093-23865-1-git-send-email-swarren@nvidia.com>
	<1298071093-23865-2-git-send-email-swarren@nvidia.com>
 <AANLkTimp==gtU2jvCYExqoV6tv-_dgvsF0yAf_k-F7CX@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimp==gtU2jvCYExqoV6tv-_dgvsF0yAf_k-F7CX-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Erik Gilling wrote at Friday, February 18, 2011 4:46 PM:
>
> These look good.  Have you run these through a CTS tester at 720x480
> and 1280x720?  We pass those now and I want to make sure there's not
> regressions.  We're supposed to be getting one in a week or two.  If
> you haven't run it by then, I'll run a pass with these then merge.

Unfortunately, I don't have one available, so no.

(although I don't believe I made any changes to clocking, CTS, or N
for those two modes, just 640x480).

Thanks for the review and offer to test!

>=20
> Cheers,
>    Erik
>=20
> On Fri, Feb 18, 2011 at 3:18 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> wrote:
> > This rate is required for correct generation of 640x480 HDMI video;
> > see subsequent patches.
> >
> > Note: I tested the entry with 12MHz input. The other entries are un=
tested,
> > but appear logically correct. However, I'm not familiar enough with=
 PLLs
> > to know if they perhaps exceed the PLL VCO frequency, nor whether t=
he
> > cpcon values are strictly correct.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 =A05 +++++
> > =A01 files changed, 5 insertions(+), 0 deletions(-)

--=20
Nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

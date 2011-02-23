From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:35:10 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5D95@HQMAIL01.nvidia.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
	<AANLkTimffVNK2EmTqypQcrWHLisf3c8_dMsHwSbv-nWi@mail.gmail.com>
	<AANLkTi=tDJvfEFFvXGEkZswRWekRLuz4rBoT-0hgobgn@mail.gmail.com>
 <AANLkTinzVinbW_rDt5Rqe7i68P2u_XvDvRWA8R2mq0_9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinzVinbW_rDt5Rqe7i68P2u_XvDvRWA8R2mq0_9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, February 23, 2011 2:25 PM:
> On Wed, Feb 23, 2011 at 1:21 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wro=
te:
> > On Wed, Feb 23, 2011 at 1:08 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wr=
ote:
> >> Stephen,
> >>
> >> Since this depends on i2c, and registers one of the adapters to do=
 it,
> >> we should just get the adapters registered separately (all of them=
)
> >> before this. I was holding off that part of board code since the i=
2c
> >> driver went up that maintainer path instead, but if Colin pulls it
> >> into tegra for-next, then I'll go ahead with those peices as well.
> >
> > I'll merge the i2c-tegra branch into for-next (assuming Ben doesn't
> > object to it), and you can put all the i2c devices in your pull
> > request. =A0That way we can get everything except this patch into t=
he
> > first pull request to Linus, and just put this patch into a second
> > pull request once the ASoC branch is merged.
>=20
> Sure, that works. I'll stage the i2c changes tonight.

OK, so just so I'm clear:

Patches 1..4 are all going in as-is.

I should re-post patch 5 once the merge window is open, having rebased
it on Olof's i2c registration changes, and
s/GPIO_WM8903/HARMONY_GPIO_WM8903/. Or, should I repost as soon as Olof
has updated his branch with the I2C changes, and you'll just hold off
applying it until the merge window?

Thanks.

--=20
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

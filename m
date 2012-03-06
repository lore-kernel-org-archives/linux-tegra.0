From: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
Subject: Re: [PATCH/RFC 2/2] arm/tegra: add timeout to PCIe PLL lock
 detection loop
Date: Tue, 6 Mar 2012 15:19:51 +0400
Message-ID: <20120306111951.GA8494@rainbow>
References: <1331023544-6439-1-git-send-email-mad_soft@inbox.ru>
 <1331023544-6439-3-git-send-email-mad_soft@inbox.ru>
 <CANndwHav6JcqNOuOXcD1dSNUmVYAV=MJ+y+ud6202q6Dh42Vgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANndwHav6JcqNOuOXcD1dSNUmVYAV=MJ+y+ud6202q6Dh42Vgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi <andi.shyti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10:38 Tue 06 Mar     , Andi wrote:
> Hi,
>=20
> On Tue, Mar 6, 2012 at 9:45 AM, Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org> =
wrote:
> > =A0 =A0 =A0 =A0/* Wait for the PLL to lock */
> > + =A0 =A0 =A0 timeout =3D 2000;
> > =A0 =A0 =A0 =A0do {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0val =3D pads_readl(PADS_PLL_CTL);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(1);
>=20
> why are you using an mdelay? If you need to sleep 1ms just use
> usleep_range or similar

This driver uses mdelay(1) in other places, so I just used it for the s=
ake
of consistency. And as this code runs just one time on boot, there's no=
t
really much harm in doing delay with busy loop instead of sleeping.

Anyway, I agree that sleeping is better than busy waiting in general, s=
o
I can respin this patch using usleep_range, or else prepare incremental
patch on top of this, which will change all mdelay in driver to usleep_=
range.

--=20
Best regards,
Dmitry "MAD" Artamonow

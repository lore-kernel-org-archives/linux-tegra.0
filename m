From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/4] drivers: create a pinmux subsystem
Date: Mon, 9 May 2011 08:25:47 -0700
Message-ID: <20110509152547.GD11410@atomide.com>
References: <1304363786-30376-1-git-send-email-linus.walleij@stericsson.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0497F1B201@HQMAIL01.nvidia.com>
 <BANLkTimKU-=GXzrn8=MQn-GAmKHOvKmuNQ@mail.gmail.com>
 <20110504092219.GW2092@atomide.com>
 <BANLkTin9-aKZjEGdBeZqDwHwADXCYERErg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTin9-aKZjEGdBeZqDwHwADXCYERErg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Martin Persson <martin.persson-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [110507 12:03]:
> On Wed, May 4, 2011 at 12:22 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wro=
te:
> > * Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> [110502 14:26]:
> >> On Mon, May 2, 2011 at 1:52 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
> >>
> >> * Drive strength is also controlled through groups of pins, but
> >> different groups than pinmux. =C2=A0Most of the drive strength gro=
ups are
> >> collections of pad mux groups, but there are a few pins that are i=
n
> >> the same pad mux group but a different drive strength group.
> >> * Setting a pin as a GPIO overrides its group's mux setting, excep=
t
> >> for the group's tristate. =C2=A0You must untristate the entire gro=
up to use
> >> a single pin as a GPIO.
> >> * Each group has a "safe mode", but which mux id to select to ente=
r
> >> the safe mode is completely random.
> >
> > Just posted something in this thread regarding using standard data =
and
> > standard read and write functions, then allow setting platform spec=
ific
> > custom flags as needed. Care to see if that works for you too?
>=20
> Tegra does not allow pin muxing on the pin by pin basis. And,
> registers that define mux config differ from those that define flags
> (pull, driver strength, safe mode etc).

Hmm well the separate config register could be added easily. But the
grouping of pins might be tricky then :)

Tony

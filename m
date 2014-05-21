From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Wed, 21 May 2014 22:55:40 +0200
Message-ID: <20140521205538.GA6237@mithrandir>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com>
 <537BCF39.6050909@wwwdotorg.org>
 <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2014 at 04:28:45PM -0700, Dylan Reid wrote:
> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> w=
rote:
> > On 05/20/2014 02:37 PM, Dylan Reid wrote:
> >> On Tue, May 20, 2014 at 11:31 AM, Stephen Warren <swarren-3lzwWm7+WeqIh2JisoIxyg@public.gmane.org=
g> wrote:
> >>> On 05/20/2014 12:24 PM, Stephen Warren wrote:
> >>>> On 05/19/2014 08:35 PM, Dylan Reid wrote:
> >>>>> Add a device node for the HDA controller found on Tegra124.
> > ...
> >>> Even after fixing that, I can't play audio on Venice2:
> >>>
> >>> root@localhost:~# speaker-test -Dhw:0,3 -c 2
> >>>
> >>> speaker-test 1.0.27.1
> >>>
> >>> Playback device is hw:0,3
> >>> Stream parameters are 48000Hz, S16_LE, 2 channels
> >>> Using 16 octaves of pink noise
> >>> Rate set to 48000Hz (requested 48000Hz)
> >>> Buffer size range from 64 to 16384
> >>> Period size range from 32 to 8192
> >>> Using max buffer size 16384
> >>> Periods =3D 4
> >>> was set period_size =3D 4096
> >>> was set buffer_size =3D 16384
> >>>  0 - Front Left
> >>> Write error: -32,Broken pipe
> >>> Write error: -32,Broken pipe
> >>> Write error: -32,Broken pipe
> >>> ^C 1 - Front Right
> >>> Time per period =3D 1.799791
> >>>
> >>
> >> Thanks for checking Stephen.  I'll fix the reset name.
> >>
> >> This is the state of the tree I used when I tested on Venice2 just now:
> >> * ae57dbf - (HEAD) ARM: tegra: venice2 - Enable HDA (2 minutes ago)
> >> * 6224524 - ARM: tegra: Add Tegra124 HDA support (2 minutes ago)
> >> * 468ca57 - ALSA: hda - Add driver for Tegra SoC HDA (2 minutes ago)
> >> * 928099e - ALSA: hda/hdmi - Add Nvidia Tegra124 HDMI support (2 minut=
es ago)
> >> * 701eac4 - clk: tegra124: Enable hda to hdmi clocks (3 minutes ago)
> >
> > Ah, I was missing that clock patch. Hopefully Peter will pick it up for
> > the Tegra clock tree soon.
> >
> > Now I have the same results as Thierry; speaker-test looks like it
> > should be working, yet I don't hear any audio from the monitor. I know
> > the monitor works, since I've used it extensively for testing GeForce
> > GPU HDMI audio.
>=20
> Probably a silly question: Is it un-muted?
> amixer -c0 cset name=3D'IEC958 Playback Switch' on

Dylan, can you provide more detail about the setup that you're running?
There have been similar issues in the past where a driver would work if
it was run on an identical upstream kernel but with a different version
of the bootloader (or a different bootloader altogether). Can you give
further details about your setup? Also perhaps providing a dmesg log or
the clock tree from /sys/kernel/debug/clk/clk_summary could help
determine the diff between a working and a non-working setup.

Thierry

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfRLKAAoJEN0jrNd/PrOhzeQP/R/uQcStB9cNZWr9e81EPtkc
lbMbClXU4A6IR5ADonVaDl+ygUHqVgnAs5QQYarPaq+7DMlosch/3SKpxkPewIAW
rObDhrNgVroOj6SKq+EM+z+PnhOwPgTUPGeYPsixOBsuDla5ROs8pcbr2xeQvyfj
BuLboT0nDnZBW/Eyl+dp4+FYfU2Z32kKA2Udn+5K47pcKuclPOcZSjY6xKtq2+Mt
ZAgacFbjZ/hvH+W5Iks1Zw0cC6wC32zqUr7pwuxidKAyFIjErrMgpAEWJrPES6c9
JLqoMbdt3v3H3qEMayZHC1iG0d7q2NON3wv4q4BlsyXmIfc0wyTnN2byz+V7PeJ6
uU0lVo3SSTB7aMBMEJjqCoLZkODs0MZLf54GkIDec6QbXb4fWhe9GdDDaCMq2kBO
GDwBiyffr06ayDZVW2lhGWVorBpSpzHxvmjI/XJG7ryHHcMBvB6H/Va44NDoUKz3
DEPKFRx9WdTjhUQjumZlVZ/RUcXRkAhqBuRr/rMRX1/H2x2D40Xxy/yg9eo/7Mv8
sgvz56dcQdHVLCzINsLVUoy4BuftVMmrSeuWCxQUhenvtlp5lnJ00bAo/Prv5ZM9
jymT5EzTxeKndCDlDad1cOL0suJu6pIgXtJtHemwlYHA1DDdCudBQnMxfENpwRPe
CZVl5aVe7W1Ps1PvlGX7
=nnt8
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

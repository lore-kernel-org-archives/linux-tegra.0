From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Thu, 22 May 2014 11:50:00 +0200
Message-ID: <20140522094958.GA11585@ulmo>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com>
 <537BCF39.6050909@wwwdotorg.org>
 <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com>
 <20140521205538.GA6237@mithrandir>
 <CAEUnVG7tDjw_6wHc=FN0KsOKsSS1u8H8SzYdxt9VCwUsARRTeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEUnVG7tDjw_6wHc=FN0KsOKsSS1u8H8SzYdxt9VCwUsARRTeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 02:10:09PM -0700, Dylan Reid wrote:
> On Wed, May 21, 2014 at 1:55 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, May 20, 2014 at 04:28:45PM -0700, Dylan Reid wrote:
> >> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> >> > On 05/20/2014 02:37 PM, Dylan Reid wrote:
> >> >> On Tue, May 20, 2014 at 11:31 AM, Stephen Warren <swarren@wwwdotorg=
=2Eorg> wrote:
> >> >>> On 05/20/2014 12:24 PM, Stephen Warren wrote:
> >> >>>> On 05/19/2014 08:35 PM, Dylan Reid wrote:
> >> >>>>> Add a device node for the HDA controller found on Tegra124.
> >> > ...
> >> >>> Even after fixing that, I can't play audio on Venice2:
> >> >>>
> >> >>> root@localhost:~# speaker-test -Dhw:0,3 -c 2
> >> >>>
> >> >>> speaker-test 1.0.27.1
> >> >>>
> >> >>> Playback device is hw:0,3
> >> >>> Stream parameters are 48000Hz, S16_LE, 2 channels
> >> >>> Using 16 octaves of pink noise
> >> >>> Rate set to 48000Hz (requested 48000Hz)
> >> >>> Buffer size range from 64 to 16384
> >> >>> Period size range from 32 to 8192
> >> >>> Using max buffer size 16384
> >> >>> Periods =3D 4
> >> >>> was set period_size =3D 4096
> >> >>> was set buffer_size =3D 16384
> >> >>>  0 - Front Left
> >> >>> Write error: -32,Broken pipe
> >> >>> Write error: -32,Broken pipe
> >> >>> Write error: -32,Broken pipe
> >> >>> ^C 1 - Front Right
> >> >>> Time per period =3D 1.799791
> >> >>>
> >> >>
> >> >> Thanks for checking Stephen.  I'll fix the reset name.
> >> >>
> >> >> This is the state of the tree I used when I tested on Venice2 just =
now:
> >> >> * ae57dbf - (HEAD) ARM: tegra: venice2 - Enable HDA (2 minutes ago)
> >> >> * 6224524 - ARM: tegra: Add Tegra124 HDA support (2 minutes ago)
> >> >> * 468ca57 - ALSA: hda - Add driver for Tegra SoC HDA (2 minutes ago)
> >> >> * 928099e - ALSA: hda/hdmi - Add Nvidia Tegra124 HDMI support (2 mi=
nutes ago)
> >> >> * 701eac4 - clk: tegra124: Enable hda to hdmi clocks (3 minutes ago)
> >> >
> >> > Ah, I was missing that clock patch. Hopefully Peter will pick it up =
for
> >> > the Tegra clock tree soon.
> >> >
> >> > Now I have the same results as Thierry; speaker-test looks like it
> >> > should be working, yet I don't hear any audio from the monitor. I kn=
ow
> >> > the monitor works, since I've used it extensively for testing GeForce
> >> > GPU HDMI audio.
> >>
> >> Probably a silly question: Is it un-muted?
> >> amixer -c0 cset name=3D'IEC958 Playback Switch' on
> >
> > Dylan, can you provide more detail about the setup that you're running?
> > There have been similar issues in the past where a driver would work if
> > it was run on an identical upstream kernel but with a different version
> > of the bootloader (or a different bootloader altogether). Can you give
> > further details about your setup? Also perhaps providing a dmesg log or
> > the clock tree from /sys/kernel/debug/clk/clk_summary could help
> > determine the diff between a working and a non-working setup.
>=20
> Sure.  I'm running this u-boot:
> https://chromium.googlesource.com/chromiumos/third_party/u-boot
> on commit ddde3e9 of the chromeos-v2013.06 branch.
>=20
> I haven't had a chance to flash swarren's u-boot yet it's been one of
> those days...
>=20
> I attached dmesg and clk_summary.
>=20
> I don't have many modifications to the ubuntu-core rootfs.
>=20
> Thanks for looking at this,

Also perhaps you can share any change to tegra_defconfig that you have
for this. Perhaps Stephen and I are simply missing some required option
to make it work.

Thierry

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfchGAAoJEN0jrNd/PrOhI6EP/381txkOGAGwx1wksTg3t3YS
/avCyVyjnL51Qes3xs5OnvH9uQhEVS5dHrwiSJrDUafOYFtdS+E0bUAjuGtBFlBj
ipJ2M+z+sXw+fpTDMvVmAT26q4ZD+WAyr2wBv5WPuFEallV0CzQc7vjmiwS3enLL
bMGJaETU5kBSSPugUMqpns8AkY5JLQ4p7VjP6bGdTvbj0jc4n8QwQzgAXgKTVXXc
E8mXsJrPCAD/819ZLBJvCeCflFj417dFyAgkAQErjz7Z9lNdrbqwKcOuFWNPK4HT
/N3kS4HqkjQzyCbZ5n/+HJtyWhOHjLym6Bq8ircKEf5uoVhE4UvoQkkASIzrLS++
zGCxF6ATF4aS67jAXD0gsCc6sEvBrWIKW2mafN2MDFjr23YnjZ4upBzw1cuXox3p
IqgGabeUIAszCbNnKonlf5QGVMfvcSk+gg6tNNuC70gTNIA96f+7cjyxwT1NCABp
o6I6zL+iI9J+VAwzJ0vQGTtJTtRKEZ5n+BYqWLC+ycdA1QaVLgaoLng4G/a6Md5b
FqxKZr5IyYzxKqTRl3QGpog0WF/LWPv8+6mn0eTnNb6eZJMIYze+O6BrZQ5nWyJA
jTADuLM6oMccsBWFzOvYhvb9wsG30xLtfq6odnOnVKJWqrpDqWnzZqsX9jtIfrGL
HXhNxBQPn5sIRJGmFFtQ
=6C3T
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--

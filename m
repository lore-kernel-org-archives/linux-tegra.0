From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Wed, 4 Jun 2014 22:43:33 +0200
Message-ID: <20140604204330.GA18710@mithrandir>
References: <CAEUnVG5pNMzDoXGso+UiAWPpD0hNPhBPyGr8KfV587AuU70QPQ@mail.gmail.com>
 <537E39D9.2000304@wwwdotorg.org>
 <CAEUnVG4UettOj0xDy+f6qEhUbhNs=u-wgyCf_Prsd2JpnmFfLw@mail.gmail.com>
 <CAEUnVG42Fmn4QOu-jObpoyViscmfKn35oDmb=WR8t=X7YVSB=Q@mail.gmail.com>
 <537F9BEB.5020102@wwwdotorg.org>
 <CAEUnVG63BCgpGuo+qcYkvpnVSSguBy9xwSC_AoZqCt1RgBqm7w@mail.gmail.com>
 <CAEUnVG52fJhd9213fdydoUW11N0yZ31T2MZ2BPmd5Q2xkZ8XeQ@mail.gmail.com>
 <538F5848.1050803@wwwdotorg.org>
 <CAEUnVG7bbcPjRcGxn_GAJ7rKJy4g_5veEsRnU2yCDVWFY3ncUQ@mail.gmail.com>
 <538F6DA5.9040608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <538F6DA5.9040608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2014 at 01:04:05PM -0600, Stephen Warren wrote:
> On 06/04/2014 11:51 AM, Dylan Reid wrote:
> > On Wed, Jun 4, 2014 at 10:32 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:
> >> On 05/30/2014 07:45 PM, Dylan Reid wrote:
> >>> On Fri, May 23, 2014 at 1:34 PM, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wro=
te:
> >>>> On Fri, May 23, 2014 at 12:05 PM, Stephen Warren <swarren@wwwdotorg.=
org> wrote:
> >>>>> On 05/22/2014 09:55 PM, Dylan Reid wrote:
> >>>>> ...
> >>>>>>>>>>>>> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren@ww=
wdotorg.org> wrote:
> >>>>> ...
> >>>>>>>>>>>>>> Now I have the same results as Thierry; speaker-test looks=
 like it
> >>>>>>>>>>>>>> should be working, yet I don't hear any audio from the mon=
itor. I know
> >>>>>>>>>>>>>> the monitor works, since I've used it extensively for test=
ing GeForce
> >>>>>>>>>>>>>> GPU HDMI audio.
> >>>>> ...
> >>>>>> Took all day, but I did get to try this.
> >>>>>>
> >>>>>> on U-Boot commit d7782d0, flashed with Stephen's u-boot flasher fr=
om github.
> >>>>>>
> >>>>>> And kernel at 81d0207 - ARM: tegra: enable HD-Audio controller in =
defconfig
> >>>>>> plus the addition of the hda node "okay"  to the jetson-tk1 DT.
> >>>>>>
> >>>>>> I can hear the jetson's audio on the TV.  This is currently a samp=
le
> >>>>>> size of one TV, I'll set up the Quantum Data tomorrow and check th=
at
> >>>>>> it works there as well.
> >>>>>
> >>>>> I tried that same U-Boot commit (with a few device-mode USB patches=
 on
> >>>>> top that shouldn't affect anything since I didn't use USB device mo=
de)
> >>>>> and have the same results.
> >>>>>
> >>>>> My monitor is a Dell U2410 with sound bar.
> >>>
> >>> I found one of these.  I also didn't hear any audio.  In fact I
> >>> couldn't get audio out of most monitors, TV sets worked fine.
> >>>
> >>> hdmi.c couldn't configure audio for the pixel clock generated for the
> >>> monitor.  Luckily I found a patch in our downstream tree that fixes
> >>> it.
> >>>
> >>> video: tegra: Calculate HDMI audio CTS/N/AVAL values -- 7/25/11 author
> >>> swarren =3D)
> >>>
> >>> Thanks for fixing this for me!
> >>>
> >>> I can send this up unless you'd rather send it yourself.
> >>>
> >>> I appended the patch moved to the new location of hdmi.c:
> >>
> >> That wouldn't apply for me since all the TABs were spaces in the email.
> >> I tracked down the original and manually ported it over. You can find =
it
> >> in my github if you're interested:
> >>
> >> git://github.com/swarren/linux-tegra.git tegra_dev
> >>
> >> That patch does make things a bit better, but there are still some iss=
ues.
> >>
> >> When my (Venice2) system boots, the login screen is displayed at native
> >> LCD resolution, and my HDMI monitor displays a 1920x1200 chunk from the
> >> top-left of the LCD. At this point, I can play 44.1KHz audio without
> >> issue. 48KHz doesn't work due to hdmi->audio_freq not being updated, as
> >> I mentioned in my previous mail.
> >=20
> > Do you have a good idea how to convey this information from the audio
> > driver over to HDMI?
> > Downstream I see we have a hideous if CONFIG_TEGRA_DC in patch_hdmi.
>=20
> The only way of avoiding that would be to create some kind of common
> infra-structure where video drivers can register for notifications from
> arbitrary audio devices. Then, the HDA code could always call this, and
> there'd be no direct references between the two drivers. To be honest
> though, this feels like creating a whole bunch of overhead for something
> that's very simple and likely not a maintenance issue, so I'm not sure
> there's much benefit doing that.

FWIW, there's currently a discussion going on about this on alsa-devel:

	[RFC] set up an sync channel between audio and display driver (i.e. ALSA a=
nd DRM)
	http://mailman.alsa-project.org/pipermail/alsa-devel/2014-May/076800.html
	http://mailman.alsa-project.org/pipermail/alsa-devel/2014-June/077371.html

Some of the ideas discussed there seem to be overengineered, but in
light of this thread it might be good if you guys could join in and
share some of your insights.

Thierry

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTj4TyAAoJEN0jrNd/PrOhx3QP/0GivfujKYeghDII4b/4P4R1
Q5M5cR7I9GaDYahNYQdwgmYYJDG10sDU+r3cz6ytO5+Glt4qupsJwx42pYj9sZsi
HfYadBmUvqkvrZ66yiY20YhbJvqIehfkMvzdXYlBjf22bs7nl912M0GkgZ3V/zhx
Z4c8aPbivKGMG14JdlW3yt7i1AZurqrBeY9xZF0e5dZbYUb/9FsHdfCnFhhmQYWr
Fl00vVsJ6dd1GZIZ5n/+4wrPV482nGITtCLejxApACUDyEvz0g8DhkZ/jlu4Eo0M
bq8X1X3QHUlDySlnKk7kJBR5seci3aKu2sXR430E4cX1Gr+fcfTADxnp9oPz9p3R
0t/XuyKpzMdDuYX33Wr3mc5SG26dAZvALfDyGaqRA7IWVFLYnlo3DQlIyaKLZ7gA
zeI3qcsc49b7FhWY047KQpgBVm3TQ4HxDHL/Pp9H00RQdPa8JpW9ydMZVUFTFyyH
SV+MbLF7VopI1oXSEkGQI8Bc0XierllSt5K13qeP1Lw7zK55sAmRhkAvWwu9kPxs
4mtA9j3tuO2FfylRwNMS/qPVKWJUeNWsjKbG1vG//cld1GQZtWIRemEW5RS6LFsZ
ZPaYZtZ/cVdChpdLddhqtHdi0jo/iIWwVEm1EUhdF3baBy3/etfRX+B4DJgv+Cho
3M9RdjNOCxEMRq61YS+G
=J0HQ
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--

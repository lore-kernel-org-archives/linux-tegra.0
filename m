From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 9/9] ARM: tegra: Default configuration updates for
 v4.3-rc1
Date: Fri, 11 Sep 2015 15:57:40 +0200
Message-ID: <20150911135738.GA23109@ulmo.nvidia.com>
References: <20150819091358.GA26627@ulmo>
 <1439977724.4135.90.camel@collabora.co.uk>
 <20150819103305.GF26627@ulmo>
 <CANMBJr6DSXW-h8P8__LKBu-Xv77T35JwxHWvarvqy1keVrtVQQ@mail.gmail.com>
 <CAMAWPa_rus4z+Sg3Uff7ndqrpB8dF1c1rQBVQ9r7vXh6PFcVkQ@mail.gmail.com>
 <55F2AF45.5040706@nvidia.com>
 <20150911123759.GA8473@ulmo>
 <55F2D3D4.5090608@nvidia.com>
 <20150911132113.GA21673@ulmo>
 <55F2D995.50906@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F2D995.50906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 02:39:33PM +0100, Jon Hunter wrote:
>=20
> On 11/09/15 14:21, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Sep 11, 2015 at 02:15:00PM +0100, Jon Hunter wrote:
> >>
> >> On 11/09/15 13:38, Thierry Reding wrote:
> >>>> Old Signed by an unknown key
> >>>
> >>> On Fri, Sep 11, 2015 at 11:39:01AM +0100, Jon Hunter wrote:
> >>>> Hi Kevin,
> >>>>
> >>>> On 10/09/15 22:29, Kevin Hilman wrote:
> >>>>
> >>>> [snip]
> >>>>
> >>>>> Since there is no movement on this, and jetson hasn't been boot for
> >>>>> multi_v7_defconfig for a while[1], I think it's time to undo the
> >>>>> option causing this problem[2] so that v4.3 will actually boot on t=
he
> >>>>> jetson.
> >>>>>
> >>>>> Unless I hear a good reason otherwise, I'll be posting a patch to
> >>>>> disable the HDA related options in multi_v7_defconfig.
> >>>>
> >>>> So curiosity got the better of this cat, as to why we are not seeing
> >>>> this ;-)
> >>>>
> >>>> The main difference I see between the tegra_defconfig and=20
> >>>> multi_v7_defconfig is all the sound drivers are modules (including=
=20
> >>>> this one).
> >>>>
> >>>> So trying a quick modprobe of the hda-tegra driver I do see it hang =
=2E..
> >>>>
> >>>> / # modprobe snd-hda-tegra
> >>>> [  625.213864] snd_hda_tegra: Unknown symbol azx_probe_codecs (err 0)
> >>>> [  625.220215] snd_hda_tegra: Unknown symbol azx_init_streams (err 0)
> >>>> [  625.226480] snd_hda_tegra: Unknown symbol azx_stop_all_streams (e=
rr 0)
> >>>> [  625.233168] snd_hda_tegra: Unknown symbol azx_bus_init (err 0)
> >>>> [  625.239062] snd_hda_tegra: Unknown symbol azx_free_streams (err 0)
> >>>> [  625.245314] snd_hda_tegra: Unknown symbol azx_init_chip (err 0)
> >>>> [  625.251321] snd_hda_tegra: Unknown symbol snd_hda_set_power_save =
(err 0)
> >>>> [  625.258081] snd_hda_tegra: Unknown symbol azx_stop_chip (err 0)
> >>>> [  625.264078] snd_hda_tegra: Unknown symbol azx_codec_configure (er=
r 0)
> >>>> [  625.270607] snd_hda_tegra: Unknown symbol azx_interrupt (err 0)
> >>>> [  840.117528] INFO: task modprobe:137 blocked for more than 120 sec=
onds.
> >>>> [  840.124192]       Not tainted 4.2.0-next-20150909-40826-gb799053 =
#1
> >>>> [  840.130584] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" di=
sables this message.
> >>>> [  840.138540] modprobe        D c09ac3a4     0   137     82 0x00000=
000
> >>>> [  840.145123] [<c09ac3a4>] (__schedule) from [<c09ac838>] (schedule=
+0x34/0x98)
> >>>> [  840.152310] [<c09ac838>] (schedule) from [<c09acaac>] (schedule_p=
reempt_disabled+0xc/0x10)
> >>>> [  840.160734] [<c09acaac>] (schedule_preempt_disabled) from [<c09ad=
eec>] (__mutex_lock_slowpath+0x9c/0x150)
> >>>> [  840.170458] [<c09adeec>] (__mutex_lock_slowpath) from [<c09adfec>=
] (mutex_lock+0x4c/0x50)
> >>>> [  840.178807] [<c09adfec>] (mutex_lock) from [<c062999c>] (__driver=
_attach+0x44/0x90)
> >>>> [  840.186627] [<c062999c>] (__driver_attach) from [<c0627fcc>] (bus=
_for_each_dev+0x54/0x88)
> >>>> [  840.194966] [<c0627fcc>] (bus_for_each_dev) from [<c0628f88>] (bu=
s_add_driver+0xe4/0x1f0)
> >>>> [  840.203305] [<c0628f88>] (bus_add_driver) from [<c062a1d0>] (driv=
er_register+0x78/0xf4)
> >>>> [  840.211475] [<c062a1d0>] (driver_register) from [<c020ac04>] (do_=
one_initcall+0x80/0x1d0)
> >>>> [  840.219818] [<c020ac04>] (do_one_initcall) from [<c02c8abc>] (do_=
init_module+0x58/0x354)
> >>>> [  840.228081] [<c02c8abc>] (do_init_module) from [<c02afae8>] (load=
_module+0x17e0/0x1d8c)
> >>>> [  840.236258] [<c02afae8>] (load_module) from [<c02b016c>] (SyS_ini=
t_module+0xd8/0x138)
> >>>> [  840.244260] [<c02b016c>] (SyS_init_module) from [<c0210b00>] (ret=
_fast_syscall+0x0/0x3c)
> >>>>
> >>>> Adding some debug it appears to hang on snd-hda-codec-hdmi  (the fol=
lowing show
> >>>> the order in which modules are being loaded) ...
> >>>>
> >>>> / # modprobe snd-hda-tegra
> >>>> [   22.450276] snd_hda_tegra: err =3D -2
> >>>> [   22.484535] soundcore: err =3D 0
> >>>> [   22.488964] snd: err =3D 0
> >>>> [   22.493242] snd_timer: err =3D 0
> >>>> [   22.498380] snd_pcm: err =3D 0
> >>>> [   22.502479] snd_hda_core: err =3D 0
> >>>> [   22.508337] snd_hda_codec: err =3D 0
> >>>> [   22.513386] snd_hda_tegra: err =3D 0
> >>>> [   22.740216] snd_hda_codec_hdmi: err =3D 0
> >>>>
> >>>> [hangs here]
> >>>>
> >>>> However, if I do the following, this works ...
> >>>>
> >>>> / # modprobe snd-hda-codec-hdmi
> >>>> / # modprobe snd-hda-tegra
> >>>>
> >>>> So it implies that snd-hda-codec-hdmi needs to be loaded first other=
wise it hangs.
> >>>>
> >>>> Thierry, any thoughts?
> >>>
> >>> I can't reproduce this. Booting multi_v7_defconfig on my setup works
> >>> just fine. I don't ever see snd-hda-codec-hdmi being probed, but then
> >>> probing it manually works fine. No hangs.
> >>
> >> To be clear, booting multi_v7_defconfig works just fine for me too and
> >> has been working fine for months. However, the reason I am not seeing
> >> the issue Kevin and Tyler are reporting is because I never attempt to
> >> "modprobe snd-hda-tegra" after boot. If I do then I see a hang. So I
> >> believe the only reason we don't see this is because their setup is
> >> loading modules.
> >=20
> > snd-hda-tegra is auto-loaded on boot for me as well and I don't see any
> > hangs either. I can also unload and reload the module just fine. I've
> > tested this on next-20150911.
>=20
> What else are you auto-loading? For my testing there appears to be a
> sensitivity to order outside of the depmod order.
>=20
> Can you try unloading all the sound modules and then do a "modprobe
> snd-hda-tegra"?

Here's the list of loaded modules right after boot:

	-sh-4.3# lsmod
	Module                  Size  Used by
	snd_hda_tegra           4764  0=20
	snd_hda_codec_hdmi     35010  1=20
	snd_soc_tegra30_i2s     5380  2=20
	snd_soc_tegra_pcm       1184  1 snd_soc_tegra30_i2s
	snd_soc_tegra_rt5640     3960  0=20
	snd_soc_rt5640         56972  1=20
	snd_soc_tegra_utils     2825  1 snd_soc_tegra_rt5640
	snd_soc_rl6231          1897  1 snd_soc_rt5640
	snd_soc_core          107271  4
	snd_soc_tegra_pcm,snd_soc_rt5640,snd_soc_tegra_rt5640,snd_soc_tegra30_i2s
	snd_hda_codec          75955  2 snd_hda_codec_hdmi,snd_hda_tegra
	snd_compress            7363  1 snd_soc_core
	snd_hda_core           26603  3
	snd_hda_codec_hdmi,snd_hda_codec,snd_hda_tegra
	snd_pcm_dmaengine       2943  1 snd_soc_core
	snd_pcm                69108  7
	snd_soc_rt5640,snd_soc_core,snd_hda_codec_hdmi,snd_hda_codec,snd_hda_tegra=
,snd_pcm_dmaengine,snd_hda_core
	snd_timer              17264  1 snd_pcm
	snd_soc_tegra30_ahub     8299  1 snd_soc_tegra30_i2s
	snd                    42248  7
	snd_soc_core,snd_timer,snd_hda_codec_hdmi,snd_pcm,snd_hda_codec,snd_hda_te=
gra,snd_compress
	nouveau              1302185  0=20
	soundcore                858  1 snd
	tegra_devfreq           5375  0=20
	ttm                    65238  1 nouveau

Then I went and unloaded a couple of modules until I was left with this:

	-sh-4.3# lsmod
	Module                  Size  Used by
	nouveau              1302185  0=20
	tegra_devfreq           5375  0=20
	ttm                    65238  1 nouveau

Then I did the following:

	-sh-4.3# modprobe snd-hda-tegra
	[ 2243.786143] hdaudio hdaudioC0D3: Unable to bind the codec
	-sh-4.3# lsmod
	Module                  Size  Used by
	snd_hda_tegra           4764  0=20
	snd_hda_codec          75955  1 snd_hda_tegra
	snd_hda_core           26603  2 snd_hda_codec,snd_hda_tegra
	snd_pcm                69108  3 snd_hda_codec,snd_hda_tegra,snd_hda_core
	snd_timer              17264  1 snd_pcm
	snd                    42248  4 snd_timer,snd_pcm,snd_hda_codec,snd_hda_te=
gra
	soundcore                858  1 snd
	nouveau              1302185  0=20
	tegra_devfreq           5375  0=20
	ttm                    65238  1 nouveau
	-sh-4.3# modprobe snd-hda-codec-hdmi
	-sh-4.3# modprobe -r snd-hda-tegra
	-sh-4.3# modprobe snd-hda-tegra
	[ 2263.934328] input: tegra-hda HDMI/DP,pcm=3D3 as /devices/soc0/70030000.=
hda/sound/card0/input4

So all worked just fine.

Thierry

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV8t3PAAoJEN0jrNd/PrOhrFQQAJh0VZTW62W651GzXFt0eFj6
JVjigaGSgyJZQpaj2rWVB1Vj9z9HMKZxrELqXPYd/T5ORrGk0Qj+IVuCxIQfdgUt
8RtxnOJSAOMEsZe83cQX39+B2GW5/4hc4hj1nnVIcsNOmgno1LjBTDelSW4FeBCi
iCqRS5k1ia549IbY99Yn2tDzwCZdRPOWKFHLhPSaE1wzEVU+cMaLR+D0Eccchd/6
hX9mr8eoxzcjlcR8At9EefieW9bGfUg22HphckasbTc2I2q3Mnoc+oVL1O3kPRbA
5nOugGDtuYpVDQxYFdyB2OGi59eHOn2QD5A8MkjXI40lvwVI2C12a0j4E8zCxbna
5P6cEOdCE1FPQIu+ZASizD/TOtDMU6Y3L/vmBH1TaHvVA5+mxwQ4v1J6m4TsPfFm
7jVAuaWgxsFgXNyocuuP6XgVqzObH6Dpf1hfXrgoyeA3QixsyLqINDnQooAv9w9L
/uiuOAhLfjcuvFnhiuf6WCROThVjYTz1fDKdk95HqsxGgul8xx4R9rWRVkMQBmQt
Lj3pAatavhLlgP8dx9q3hnOH5Jw8ynwdB0ndh3/TpHYWvVr1cKoOA+IWg3HAbogZ
G2SXhoOHtyZGqkJUplJv9ObG0sKSpyg4XnEeJufsL1K0fswjOy0GZKH19HFD5zc8
wDlSFGsfGwlDC7ESFJlC
=ttjB
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

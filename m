From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 9/9] ARM: tegra: Default configuration updates for
 v4.3-rc1
Date: Fri, 11 Sep 2015 14:38:01 +0200
Message-ID: <20150911123759.GA8473@ulmo>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
 <1439563720-13189-10-git-send-email-thierry.reding@gmail.com>
 <CANMBJr7PKy-eCcB3HiBajpApHS_BYPa7xfKjTqV4o8Z1hwY99A@mail.gmail.com>
 <20150819091358.GA26627@ulmo>
 <1439977724.4135.90.camel@collabora.co.uk>
 <20150819103305.GF26627@ulmo>
 <CANMBJr6DSXW-h8P8__LKBu-Xv77T35JwxHWvarvqy1keVrtVQQ@mail.gmail.com>
 <CAMAWPa_rus4z+Sg3Uff7ndqrpB8dF1c1rQBVQ9r7vXh6PFcVkQ@mail.gmail.com>
 <55F2AF45.5040706@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F2AF45.5040706-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 11:39:01AM +0100, Jon Hunter wrote:
> Hi Kevin,
>=20
> On 10/09/15 22:29, Kevin Hilman wrote:
>=20
> [snip]
>=20
> > Since there is no movement on this, and jetson hasn't been boot for
> > multi_v7_defconfig for a while[1], I think it's time to undo the
> > option causing this problem[2] so that v4.3 will actually boot on the
> > jetson.
> >=20
> > Unless I hear a good reason otherwise, I'll be posting a patch to
> > disable the HDA related options in multi_v7_defconfig.
>=20
> So curiosity got the better of this cat, as to why we are not seeing
> this ;-)
>=20
> The main difference I see between the tegra_defconfig and=20
> multi_v7_defconfig is all the sound drivers are modules (including=20
> this one).
>=20
> So trying a quick modprobe of the hda-tegra driver I do see it hang ...
>=20
> / # modprobe snd-hda-tegra
> [  625.213864] snd_hda_tegra: Unknown symbol azx_probe_codecs (err 0)
> [  625.220215] snd_hda_tegra: Unknown symbol azx_init_streams (err 0)
> [  625.226480] snd_hda_tegra: Unknown symbol azx_stop_all_streams (err 0)
> [  625.233168] snd_hda_tegra: Unknown symbol azx_bus_init (err 0)
> [  625.239062] snd_hda_tegra: Unknown symbol azx_free_streams (err 0)
> [  625.245314] snd_hda_tegra: Unknown symbol azx_init_chip (err 0)
> [  625.251321] snd_hda_tegra: Unknown symbol snd_hda_set_power_save (err =
0)
> [  625.258081] snd_hda_tegra: Unknown symbol azx_stop_chip (err 0)
> [  625.264078] snd_hda_tegra: Unknown symbol azx_codec_configure (err 0)
> [  625.270607] snd_hda_tegra: Unknown symbol azx_interrupt (err 0)
> [  840.117528] INFO: task modprobe:137 blocked for more than 120 seconds.
> [  840.124192]       Not tainted 4.2.0-next-20150909-40826-gb799053 #1
> [  840.130584] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [  840.138540] modprobe        D c09ac3a4     0   137     82 0x00000000
> [  840.145123] [<c09ac3a4>] (__schedule) from [<c09ac838>] (schedule+0x34=
/0x98)
> [  840.152310] [<c09ac838>] (schedule) from [<c09acaac>] (schedule_preemp=
t_disabled+0xc/0x10)
> [  840.160734] [<c09acaac>] (schedule_preempt_disabled) from [<c09adeec>]=
 (__mutex_lock_slowpath+0x9c/0x150)
> [  840.170458] [<c09adeec>] (__mutex_lock_slowpath) from [<c09adfec>] (mu=
tex_lock+0x4c/0x50)
> [  840.178807] [<c09adfec>] (mutex_lock) from [<c062999c>] (__driver_atta=
ch+0x44/0x90)
> [  840.186627] [<c062999c>] (__driver_attach) from [<c0627fcc>] (bus_for_=
each_dev+0x54/0x88)
> [  840.194966] [<c0627fcc>] (bus_for_each_dev) from [<c0628f88>] (bus_add=
_driver+0xe4/0x1f0)
> [  840.203305] [<c0628f88>] (bus_add_driver) from [<c062a1d0>] (driver_re=
gister+0x78/0xf4)
> [  840.211475] [<c062a1d0>] (driver_register) from [<c020ac04>] (do_one_i=
nitcall+0x80/0x1d0)
> [  840.219818] [<c020ac04>] (do_one_initcall) from [<c02c8abc>] (do_init_=
module+0x58/0x354)
> [  840.228081] [<c02c8abc>] (do_init_module) from [<c02afae8>] (load_modu=
le+0x17e0/0x1d8c)
> [  840.236258] [<c02afae8>] (load_module) from [<c02b016c>] (SyS_init_mod=
ule+0xd8/0x138)
> [  840.244260] [<c02b016c>] (SyS_init_module) from [<c0210b00>] (ret_fast=
_syscall+0x0/0x3c)
>=20
> Adding some debug it appears to hang on snd-hda-codec-hdmi  (the followin=
g show
> the order in which modules are being loaded) ...
>=20
> / # modprobe snd-hda-tegra
> [   22.450276] snd_hda_tegra: err =3D -2
> [   22.484535] soundcore: err =3D 0
> [   22.488964] snd: err =3D 0
> [   22.493242] snd_timer: err =3D 0
> [   22.498380] snd_pcm: err =3D 0
> [   22.502479] snd_hda_core: err =3D 0
> [   22.508337] snd_hda_codec: err =3D 0
> [   22.513386] snd_hda_tegra: err =3D 0
> [   22.740216] snd_hda_codec_hdmi: err =3D 0
>=20
> [hangs here]
>=20
> However, if I do the following, this works ...
>=20
> / # modprobe snd-hda-codec-hdmi
> / # modprobe snd-hda-tegra
>=20
> So it implies that snd-hda-codec-hdmi needs to be loaded first otherwise =
it hangs.
>=20
> Thierry, any thoughts?

I can't reproduce this. Booting multi_v7_defconfig on my setup works
just fine. I don't ever see snd-hda-codec-hdmi being probed, but then
probing it manually works fine. No hangs.

What I do see is that after a little while network stops working. I
noticed primarily because I boot with an NFS root, so the kernel started
complaining about the NFS server not responding. Being on an NFS root
could be one reason why this works for me, not sure what the kernelci
labs are running. I don't see the network issues with tegra_defconfig.
I've also tried a tegra_defconfig with all of sound support built as
modules and that all works perfectly.

I'll investigate the multi_v7_defconfig network issues, perhaps that'll
give me some clues, or perhaps even allow me to reproduce the original
issue.

Thierry

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV8sskAAoJEN0jrNd/PrOhvrAQAIS6uPMY9ARBb4SfRA6gyTiA
ga42ZU8gpTVO8hPPYq/qyGoV0mtfofihQ5tlQCgJfI6CbQuHgOYqE5UuNLJrqW0F
PIhg2FyDAkwlUALJD6wD98hQEEI2hOa7TgK6qz0weUqf0JcBplvTYWQbFJT3V1A1
20iS5kq3WJ3VAemXDNIbyT5SF+zWBPM3Aq2/91T1uS9AonZUBpWbosWsqT7VwD3v
dIzLsHbIew7yckZjBQVU6oHgSNA+rQmOXEeFonL1sv1V9iM5aq0B42GlKLid75Hs
inU+/Velbas1KnnV9rJxt/JvMs4cY1HTxzki7VKmaXpk2tSK1QHuEOB9+DZnuHdQ
aHvQyGlbPlI3LwR++VzLTiaNActyU/A6tb/W5cPRZWTZ+v8EW001zTutCE4txXrh
r3StwVei5KUBkWYCH4FN0j/Ck3j8laA4dPN+LKsCNOxjsImGxZ7aPsczK+kI5ozE
ZVknToXn/AUMtLoaqxc81Fzx5O6GQQgCV7SJKs5WpjW8wI9WYB7sHzLg3aN5Q7F7
eM0Wq8J+xN5QgmsEZZwazL1G9lkoTNA7LnOJpi3dHKHNTsExYz0KHOtMOmzPOImi
9MPdquHcpzu2y82OF37FMcg2VdFA++oD6qLkBv/LQsxgmzMROb8ElRvoKd2LdaNu
AV/rJLdXNkok4QE8OdMR
=wYqO
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

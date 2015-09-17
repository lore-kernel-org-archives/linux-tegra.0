From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 9/9] ARM: tegra: Default configuration updates for
 v4.3-rc1
Date: Thu, 17 Sep 2015 12:26:14 +0200
Message-ID: <20150917102613.GA9804@ulmo>
References: <CANMBJr6DSXW-h8P8__LKBu-Xv77T35JwxHWvarvqy1keVrtVQQ@mail.gmail.com>
 <CAMAWPa_rus4z+Sg3Uff7ndqrpB8dF1c1rQBVQ9r7vXh6PFcVkQ@mail.gmail.com>
 <55F2AF45.5040706@nvidia.com>
 <20150911123759.GA8473@ulmo>
 <55F2D2E3.4010906@nvidia.com>
 <20150911132526.GB21673@ulmo>
 <55F2F895.5040704@nvidia.com>
 <20150911155946.GA13945@ulmo.nvidia.com>
 <20150911163346.GA20235@ulmo.nvidia.com>
 <7h7fnw3mvd.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7h7fnw3mvd.fsf-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 10:08:06AM -0700, Kevin Hilman wrote:
> Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>=20
> > On Fri, Sep 11, 2015 at 05:59:48PM +0200, Thierry Reding wrote:
> >> On Fri, Sep 11, 2015 at 04:51:49PM +0100, Jon Hunter wrote:
> >> >=20
> >> > On 11/09/15 14:25, Thierry Reding wrote:
> >> >=20
> >> > [snip]
> >> >=20
> >> > > Works for me 100% of the time. Unloading and reloading isn't a pro=
blem
> >> > > either. What revision of the Jetson TK1 do you have? Mine is a C.2
> >> >=20
> >> > Unfortunately, I am not sure it is whatever is in Paul's automation =
rig
> >> > [0]. However, I have also reproduced this on a tegra124 nyan-big in =
the
> >> > office.
> >>=20
> >> I was able to reproduce this using a busybox initial ramdisk. Just to
> >> make sure I built a separate one from git and it exposes the same
> >> behaviour. I suspect that this is some sort of weird interaction betwe=
en
> >> mdev and async probing and nobody's noticed so far because async probi=
ng
> >> isn't very common (at least in the ARM world).
> >>=20
> >> I'll be off for the weekend soonish, but I'll try to find some more ti=
me
> >> next week to track this down.
> >
> > Before I head into the weekend, here are my findings: looks like this
> > might be some sort of recursive locking problem. Here's the output with
> > a lot of debug messages:
>=20
> FWIW, in kernelci we use a buildroot initramfs[1] with eudev enabled for
> module loading.  Before booting, modules are injected into the ramdisk
> so they are loaded during boot by eudev.
>=20
> The source is on github[2] and can be rebuilt using './configs/frags/buil=
d armel'

This turned out to be rather interesting. The reason why I wasn't seeing
this on my setup was because request_module() ends up directly calling
the /sbin/modprobe userspace helper. On my setup I had these files
installed in /usr/bin (because that's the default installation path that
kmod uses) and I was missing a symlink from /sbin to /usr/bin, therefore
causing request_module() to return with -ENOENT. Unfortunately the HDA
core code completely ignores errors from request_module() so didn't give
any indication at all. Thanks to Jon Hunter who put me on that trail.

After fixing the root filesystem I was seeing the deadlocks as well. But
the root cause of this was now clearly the request_module(). It turns
out that this causes the driver for the HDA codec to be bound to the HDA
codec device immediately, from within the HDA controller's ->probe()
callback, hence leading to the deadlock.

That's a known problem in HDA land and for Intel this has been worked
around rather creatively by deferring HDA codec probing to a work queue
that runs asynchronously to the controller's probe. To be fair there
seem to be other reasons why this is necessary on Intel (the HDA codec
and i915 display drivers interact weirdly). It's possible that a work-
around isn't necessary on Intel anymore either because the recursive
locking of HDA controller vs. HDA codec is gone and the i915 device
should be relatively far removed to not cause any deadlocks. I haven't
invested any time in fixing this because I don't have a setup where I
could test this.

The solution I came up with, and I've sent patches earlier with a couple
of people from this thread Cc'ed, is to get rid of the explicit calls to
the request_module() function and use existing infrastructure instead. I
implemented a uevent callback in the HDA bus that reports the MODALIAS
information to the userspace helper, which can then use it to auto-load
the proper module. That gets rid of the recursive locking because both
devices are now probed from different contexts.

This should work just fine with any relatively modern distribution. Both
systemd and eudev implementations of udev should support loading modules
when they see a MODALIAS environment variable. For busybox this doesn't
work out of the box, but you can enable it by adding the following line
to /etc/mdev.conf:

	# support module loading on hotplug
	$MODALIAS=3D.*    root:root 660 @modprobe "$MODALIAS"

Make sure you have /etc/passwd and /etc/group entries for root, or else
mdev will fail to parse this file. mdev still doesn't automatically load
modules on boot (mdev -s isn't quite the same as udevadm trigger), but
that's only a minor inconvenience and maybe even expected when you use
mdev.

Given that the patches are somewhat invasive and probably need more
testing on Intel, I'm not sure if they'll make it into v4.3. If not I
suggest we go ahead and remove the problematic Kconfig option for now
(or make it built-in) and enable it again when the fixes have landed
(if not for v4.3 then hopefully for v4.4). Perhaps give it a week or so
to give the sound tree maintainers a chance to look at the patches and
evaluate whether or not they should go into v4.3.

Does that sound reasonable?

Thierry

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV+pVDAAoJEN0jrNd/PrOhmlUQAIIs23y7tL+7EaKKIJMYVHIM
SLGZxNmSG7uXuSKclGb3V5BHO1WQFgT+16Y+1mWdYsQuU8bgD5d51o8A09uPtXWS
/iVQrO0hAYREErx6EoyHwQk3m0nmNkLciYj8iXd6T9r9BALzBGxA285xT2xYnqny
vA+0cqALk9RGC0i3Fzb/tkHhF0DeCIQgfdH3PgYIFTV6nzogdRwKxZS59Ej3SPgI
x1Hmm6iWtRTcWViRJ9vFv6jMVz0MnU8dcgxXqheiTSQU34YMfkvY41Eai42v67lb
HGDCN2NFPFgClwX9jrlodGTKwHisUe9iQgxOtGprvK2OCh0TlPA4K/SObsRP+0iv
ZqKLIXZpgez/MnM0/A3GZ155R+EXAoZcw9XiERINWslIB2ikD6D/alI4UJXVamXV
rpEBjRMl0L5ltndGUfD4HMYZex3D3sAmcYqifLtASa28hnfRFASgpWB4NJYxUZHN
0H5IUG9qWRAlkfGQYsK3ESVOGDWvrV8rWZQJ5syuvUTpm9FFFb39I2ulAyYf5Nj1
Ix6v9nivM3YzY1LHwRCeoFEb5kRrSPdpcy3DhR1qC2PZAGgkFJTbgpvZHTeeJGGr
Atfa9N2S6XWZ/4wybizFELfz0r+xwsnPq8y/sRpynfJTwdkf8jZ4/qp81Jn6RGNf
dQEW9W3s7g2r2OA7Le/F
=qtzt
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--

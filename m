From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 4/8] gpu: host1x: Add debug support
Date: Fri, 8 Feb 2013 07:54:43 +0100
Message-ID: <20130208065443.GA15429@avionic-0098.mockup.avionic-design.de>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
 <1358250244-9678-5-git-send-email-tbergstrom@nvidia.com>
 <20130204110339.GA28134@avionic-0098.mockup.avionic-design.de>
 <51108D75.9030302@nvidia.com>
 <20130205091555.GC20437@avionic-0098.mockup.avionic-design.de>
 <5112C3EB.7020205@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5112C3EB.7020205-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 12:58:19PM -0800, Terje Bergstr=C3=B6m wrote:
> On 05.02.2013 01:15, Thierry Reding wrote:
> > On Mon, Feb 04, 2013 at 08:41:25PM -0800, Terje Bergstr=C3=B6m wrote:
> >> This is used by debugfs code to direct to debugfs, and
> >> nvhost_debug_dump() to send via printk.
> >=20
> > Yes, that was precisely my point. Why bother providing the same data via
> > several output methods. debugfs is good for showing large amounts of
> > data such as register dumps or a tabular representation of syncpoints
> > for instance.
> >=20
> > If, however, you want to interactively show debug information using
> > printk the same format isn't very useful and something more reduced is
> > often better.
>=20
> debugfs is there to be able to get a reliable dump of host1x state
> (f.ex. no lines intermixed with other output).
>=20
> printk output is there because often we get just UART logs from failure
> cases, and having as much information as possible in the logs speeds up
> debugging.
>=20
> Both of them need to output the values of sync points, and the channel
> state. Dumping all of that consists of a lot of code, and I wouldn't
> want to duplicate that for two output formats.

I'm still not convinced, but I think I could live with it. =3D)

> >> I have another suggestion. In downstream I removed the decoding part a=
nd
> >> I just print out a string of hex. That removes quite a bit bunch of co=
de
> >> from kernel. It makes the debug output also more compact.
> > I don't know. I think if you use in-kernel debugging facilities such as
> > debugfs or printk, then the output should be self-explanatory. However I
> > do see the usefulness of having a binary dump that can be decoded in
> > userspace. But I think if we want to go that way we should make that a
> > separate interface. USB provides something like that, which can then be
> > fed to libpcap or wireshark to capture and analyze USB traffic. If done
> > properly you get replay functionality for free. I don't know what infra-
> > structure exists to help with implementing something similar.
>=20
> It's not actually binary. I think I misrepresented the suggestion.
>=20
> I'm suggesting that we'd display only the contents of command FIFO and
> contents of gathers (i.e. all opcodes) in hex format, not decoded. All
> other text would remain as is, so syncpt values, etc would be readable
> by a glance.
>=20
> The user space tool can then take the streams and decode them if needed.
>=20
> We've noticed that the decoded opcodes format can be very long and
> sometimes takes a minute to dump out via a slow console. The hex output
> is much more compact and faster to dump.
>=20
> Actual tracing or wireshark kind of capability would come via decoding
> the ftrace log. When enabled, everything that is written to the channel,
> is also written to ftrace.

Okay, I'll have to take a closer look at ftrace since I've never used it
before. It sounds like extra infrastructure won't be necessary then.

> >>>> +static void show_channel_word(struct output *o, int *state, int *co=
unt,
> >>>> +		u32 addr, u32 val, struct host1x_cdma *cdma)
> >>>> +{
> >>>> +	static int start_count, dont_print;
> >>>
> >>> What if two processes read debug information at the same time?
> >>
> >> show_channels() acquires cdma.lock, so that shouldn't happen.
> >=20
> > Okay. Another solution would be to pass around a debug context which
> > keeps track of the variables. But if we opt for a more involved dump
> > interface as discussed above this will no longer be relevant.
>=20
> Actually, debugging process needs cdma.lock, because it goes through the
> cdma queue. Also command FIFO dumping is something that must be done by
> a single thread at a time.
>=20
> > Okay. In the context of a channel dump interface this may not be
> > relevant anymore. Can you think of any issue that wouldn't be detectable
> > or debuggable by analyzing a binary dump of the data within a channel?
> > I'm asking because at that point we wouldn't be able to access any of
> > the in-kernel data structures but would have to rely on the data itself
> > for diagnostics. IOMMU virtual addresses won't be available and so on.
>=20
> In many cases, looking at syncpt values, and channel state
> (active/waiting on a syncpt, etc) gives an indication on what is the
> current state of hardware. But, very often problems are ripple effects
> on something that happened earlier and the job that caused the problem
> has already been freed and is not visible in the dump.
>=20
> To get a full history, we need often need the ftrace log.

So that's already covered. Great!

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRFKEzAAoJEN0jrNd/PrOhddgP/1tKXhxVASarq5Vs7R7j0ONr
LrWOM4KVaLhkRimXnbAjA4DFmF0PfG7asOSEJU7dWP6+0D8rPB2/v4vae/l58CDw
67ntMDsKxUOVenB/L/j638UxdpAFJqsoKBuudxG0zdokfl8+iAlh60sklulAzp0h
PjAMxZVyqulqMkcL3bsDvN/03iS/NdPxXDEBTSAJ82XTEHi5KC4bQ+PnvSpIS2Bt
dg1GJ733zLLyZUySyTIl2KjCLXvN7vto8CyO2yVHeDm7UDMEyb5x7h/boK12IpQW
qQJFIe7wl2FaW+JTCfADYItizS/DWX+wG7iLid3XRbtOJU9x3wy3/Ov1kaSro85T
tldw8Ik8azgD0oE4fK2OvX91TFrEicHG+vVRvEqD8nKtN2MfX+F5J/77ZpM42+t/
gVVAgmwbTIA2r+Ru3ghdmlw/JSdyx+nOz0HcovDx2nJ1C8XFLSeUxswTf8CG+f3D
vSUU+TGyvXsoGmHOWTbC5UgV4N1yq60JFsRIglyeK6eHVQVmR83cYS8PRggUlpuv
rH2NFsFgGd8x9ipkXLh6bXBHtL9VVDGDewGrNj+a9MjpPyZC0im3JkJpqViw/TbN
8f51UokGcPPWjleJTGujTkRHOh4UAxvK+bL2XToIORwOQHbgMfY8hg879P0fH+xu
RQelmTrD27jI+FPU7mCa
=oNEv
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

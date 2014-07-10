From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 1/3] ARM: tegra: rework PCIe regulators
Date: Thu, 10 Jul 2014 12:15:28 +0200
Message-ID: <20140710101527.GC21583@ulmo>
References: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org>
 <20140707003854.GD8469@quad.lixom.net>
 <20140707055211.GA15216@ulmo>
 <CAOesGMjwE=xThuUwmBF02YaQ32_uFogryW5anNoGc8yfkuN_Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjwE=xThuUwmBF02YaQ32_uFogryW5anNoGc8yfkuN_Pg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 07, 2014 at 09:45:46PM -0700, Olof Johansson wrote:
> On Sun, Jul 6, 2014 at 10:52 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Sun, Jul 06, 2014 at 05:38:54PM -0700, Olof Johansson wrote:
> >> On Mon, Jun 23, 2014 at 03:23:44PM -0600, Stephen Warren wrote:
> >> > This branch reworks the set of regulators that the Tegra PCIe driver
> >> > uses, so that the driver and DT bindings more correctly model what's
> >> > really going on in HW.
> >> >
> >> > I've made this a separate branch in case it needs to be pulled into =
the
> >> > PCIe tree to resolve any conflicts. Any branch that adds Tegra124
> >> > support to the PCIe driver will need to be based on this branch, and
> >> > such patches might show up for 3.17, and be taken through the ARM tr=
ee
> >> > so we can manage our own dependencies.
> >>
> >> Isn't PCI broken if you boot with an older device tree now?
> >
> > Yes.
> >
> >> I would like to see this as two branches: One to the PCI driver, and o=
ne
> >> modifying DT contents. The PCI driver should remain working for old DT=
s,
> >> so the last couple of commits on this branch can't be there.
> >
> > This is one of my main gripes with device tree these days. We have many
> > situations where device tree bindings got rushed with the result that
> > many of them describe hardware in a *completely* wrong way.
> >
> > The Tegra PCIe binding was designed with an incomplete understanding of
> > the hardware (I wonder how many other cases there are like this in
> > mainline) and it just happens to work by accident on existing platforms.
> >
> > So this really boils down to one question: how do we fix bugs in device
> > tree bindings?
> >
> > I suppose we could keep some sort of backwards-compatible shim inside
> > the driver to cope with the existing, wrong device tree binding. However
> > that means an additional maintenance burden and I'm not convinced that
> > there's a need in this particular case.
>=20
> It's really unfortunate, and this is very likely not the last time
> we're going to see something like this.
>=20
> Backwards compatibility is only needed where there actually are users
> of it. Are you absolutely 100% sure that there will not be such a
> case?

Of course not. Nobody can be absolutely sure about that.

> Trimslice users?

I think there are two categories here: people that use non-upstream
kernels provided by Compulab (because you get all the hardware
acceleration goodness) and those that use upstream kernels. Those that
use the downstream kernels likely use bindings (if DT at all) that are
not supported upstream. And everybody that uses upstream almost
certainly uses an upstream U-Boot where it's trivial to update kernel
and DTB in one go.

And this brings me back to another complaint about DTB: we keep saying
things are stable ABI based on the rationale that somebody may have
shipped some DT version in a read-only ROM and therefore can't be
replaced and thus can't be broken. Today more people are likely to have
some version of a downstream DTB in their device that was never
supported upstream. And by the above argument we're giving downstream
users the finger because it's impossible to update to an upstream
kernel. So there's a lot of hypocrisy in that whole argument.

> Out-of-tree DTS:es that now need to be fixed up or they will break?

Yes, any out-of-tree DTS'es would need to be updated or things will
indeed break. There at least one case where an out-of-tree DTS was
already updated updated during the process of getting the support
upstream (Toradex).

> This isn't the same thing as in-kernel interface changes where we say
> "out of tree, out of mind".

That's exactly the problem. When we started out with the DT conversion
this was never mentioned. Maybe some people always took this for granted
but certainly not all. Most of the device tree bindings back at the time
were pulled out of a hat. Many were subsequently changed because they
didn't work out as expected. Until the big discussions around ABI
stability started.

> If you have to stay compatible, then I suggest you try to fill in
> local driver variables with derivatives of the old properties (and
> directly from the newer properties where you can). I haven't looked at
> the specifics here so I don't know how hard it might be.
>=20
> If you are 100% sure that you don't have to stay compatible, then you
> can remove the code handling the old bindings. Still, even then I am a
> little worried about dependencies (and more importantly conflicts)
> between these dtsi changes and others done by tegra platform code for
> this release. I suppose that can be resolved by having this as a base
> of any DT changes for tegra if needed.

To be honest, I'm very much tempted to just drop this series. Even if
that means keeping a totally broken DT binding. But frankly I don't have
any energy left to debate DT stability.

Thierry

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTvme/AAoJEN0jrNd/PrOhiUUQAIR5xfXqsQTCMddafnw5W4IY
/6t+SeU2mQWtMf4eLy0USsoxwHV5dbU2d9HYr+7dLCIGNzNqeH6mvOu2EbN245ej
eVwv9CpALsgjdqz8s6TmZYakcvE4J+aNsLlq91Cq+WDUtNhdxNdOQxsbymYDX1RU
YbLpKrB1z23B1MUMLImcTA2v6PNDmJLWrpbobkO3A8JA/vta+2oznS0SDeMvXvrM
te5dREGUE9yZqj8/4my4ntQL+JaZYliaYjOXTUGtBEPWOwzItpj5abJ79OcJ9Y3d
xKWCJs8OXrAUXOriR//Sni+J1JqG2ITCT8mHaouAmpu7RPTGQ7eiRD1WVOSXf9En
S7WLp/kXpdpao36K6vJHKn2FpsKgvIMV9eAarc4lf7rQumbJJYpF3I4PlJKGiIgV
38KiOsf3vYxiT3UHiHFQgrTGkDoPJaEH8j5p8EbeP14jxzJ0UONB2k3hyb6VIQ1N
vIIzErbNoNrt09GT6fV+yjO7kEtJcN1FSV5sXexP5RQ1fl9vvTUz5vOo8eLxOTJ3
wTw/9Pf9HJfE1G36UwDTrbeBvTIEdTgZk/4Fpsibavg5SeZDVL9+yJESX330VVBc
ivRpUVs1CJNK9gXqURoHgiVE53Ga22FQgYQSOJpjVCPAM5m1YbM27aqpe4823lWj
GlZymlvNIR1FO4KPnhcf
=DrWR
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] of: reserved-memory: Various improvements
Date: Mon, 6 Apr 2020 12:04:11 +0200
Message-ID: <20200406100411.GB475759@ulmo>
References: <20200403185640.118569-1-thierry.reding@gmail.com>
 <CAL_JsqLsCHJOuYBdh33eouu3VhwYzv5XR5wop8QAAi4jXP2xcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLsCHJOuYBdh33eouu3VhwYzv5XR5wop8QAAi4jXP2xcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04, 2020 at 07:24:25PM -0600, Rob Herring wrote:
> On Fri, Apr 3, 2020 at 12:56 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Hi Rob, all,
> >
> > this is a set of patches that I've been working on to allow me to use
> > reserved memory regions more flexibly. One of the use-cases that I have
> > is an external memory controller driver that gets passed one or two
> > tables from firmware containing a set of EMC frequencies and the
> > corresponding register values to program for these frequencies.
> >
> > One of these tables is the "nominal" table and an optional second table
> > is "derated" and is used when the DRAM chips are overheating. I want to
> > be able to pass these tables as separate memory-region entries.
> >
> > So what this small patchset does is make the reserved-memory code adapt
> > to this situation better. On one hand, while the DT bindings currently
> > support multiple regions per device tree node, it's slightly unintuitive
> > to specify them. The first patch adds a memory-region-names property
> > that allows the DT to specify a "consumer" name for these regions much
> > like we do for things like clocks, resets or the reg property. At the
> > same time, a new alias for memory-region, named memory-regions, is
> > introduced to make this more consistent with other bindings.
>=20
> It's just not worth supporting both flavors (forever). I don't want to
> repeat gpio vs. gpios. Let's just stick with 'memory-region' and allow
> that to be more than one entry.

Alright, I'll drop the corresponding changes from the bindings and the
OF core then.

> I'm not a fan of *-names, but fine.

I suppose I could work without them, but I like the descriptiveness that
they add to the device tree. There are also cases where they can be very
essential. For example, what if a device can take two separate memory
regions. One case that we have on Tegra is the display controller that
can have a framebuffer and a color-conversion lookup table assigned to
it on boot. I think in this particular case both are actually always
there, but what if either of them was optional. Without -names it would
be impossible to describe the context if only one is provided in device
tree.

Thierry

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6K/pgACgkQ3SOs138+
s6EcBBAAknv2wjVaLqK8Fv5noZrIB4XtpJNVRyHSCdzsZ32kDSogdVHbSGnmgqdb
sGP6hAF8i6wZan9ZfAm3ZGcYTngPZPJVMI5EszlVW1WXtiXjpA963KSuVwg930H+
h8oPvchZ6DKOiHy90RaVt3wIyZA0CQwpCDukYMxjj7o2xzx+Ig7ywmaP+GkV6lUF
utXr68/po507c5JsgB9xc8THDnM1dOazLPrb3O0nG+WcmGeLuqZx8AVZnGZsM5Bb
khjmisr6O2YpATkGWO7ZJbRMKSQZOVgmkFxJB2NpuOKSU0z5PdlopYAh8OgCOjy0
e9HKoAaF0Ip7dlMaCKrEg3tifMCPQZ3o5UroATrDfVQagRCzing/UGqGSaftNkif
+yh8DiwKpttDEdsKK5Oipa6oCwViqCANXIFe443lYdlSH1qUMO2ow7Oi/DEIFeTB
6NjOKi2HQxrhqQ3BOc7PvAG/eUH+yBH3P9mUEwctFdTLvlQgsmIo97vA+wAnkL6o
nYP+wQLkehEV2WsHFJFFVZZbbATX0UjXyQH0QGCFGXK1vYw0KwJcwDU5V1k/+HFh
o0TonpcG28IksxcDuw4CcuH3MZbB0a+AvAPjjfewmCbx+L3hDWULJK2dl3YPRYtP
o1wNwBsuUDtHNREgj3KcZMBj3YgBEdryxTM6dHDtOa25Ze8SacM=
=98ej
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--

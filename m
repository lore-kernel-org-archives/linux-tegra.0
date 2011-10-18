From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Tue, 18 Oct 2011 14:01:50 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173CA2CCA9@HQMAIL01.nvidia.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB@HQMAIL01.nvidia.com>
	<CAOesGMh387Oghyd_TobnTOja6tU2uU5kt-86_HwQe7nFiL+svw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CC18@HQMAIL01.nvidia.com>
 <CAOesGMghu6Bn3RrFKEUBKkUNS_K8Y0ho3Y2uFZh_LXbfT80hFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMghu6Bn3RrFKEUBKkUNS_K8Y0ho3Y2uFZh_LXbfT80hFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Tuesday, October 18, 2011 2:54 PM:
> On Tue, Oct 18, 2011 at 11:54 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
> > Olof Johansson wrote at Tuesday, October 18, 2011 12:43 PM:
=2E..
> >> Compatible is still needed, in my opinion -- otherwise there will =
be
> >> no way to tell if the node is there to describe emc timings or if =
it's
> >> some new node used to describe something else (such as SDRAM chips=
 as
> >> mentioned above).
> >
> > Can't you go by node name; enumerate all nodes with a particular na=
me.
> > Or define another intermediate node that will always contain tables=
 and
> > nothing else, then just enumerate all child nodes of that node:
> >
> > emc@xxxxx {
> > =A0 =A0emc-tables {
> > =A0 =A0 =A0 =A0table-333@0 {};
> > =A0 =A0 =A0 =A0table-666@0 {};
> > =A0 =A0};
> > };
> >
> > The Tegra pinmux bindings I proposed certainly used this technique;=
 a
> > main node with a well-known name, followed by enumeration of all ch=
ild
> > nodes of that, and nobody /said/ anything about that being a bad id=
ea.
>=20
> I'm not really picky on this, but I think I would rather use a
> compatible field than rely on naming.
>=20
> That being said, doing a two-level approach will probably make it
> easier than the flat structure I initially had. So:
>=20
> emc@xxx {
>     nvidia,use-ram-code;
>     emc-table-ram-code-0 {
>         nvidia,ram-code =3D < 0 >;
>         table-166 { compatible =3D "tegra20-emc-table"; ... };
>         table-333 { ... };
>     };
>=20
>     emc-table-ram-code-1 {
>         nvidia,ram-code =3D < 1 >;
>         ...
>     };
> };
>=20
> ... and for none-ram-code, just leave out the emc-table-ramcode-x lev=
el.
>=20
> So, for nvidia,use-ram-code case, it'll be one intermediate step of
> finding the right subnode, the rest of the table setup code will be
> common. None of it will be bound to actual node names though -- first
> step is iterating child nodes looking for nvidia,ram-code properties
> to match, and second step iterates by matching compatible fields.

I only suggested the well-known-named sub-nodes in order to eliminate
the need for a compatible property.

My inclination is that if we use compatible to distinguish the tables
from anything else, there's little point having the extra level of node=
s;
we may as well lay it out as in your original patch, just with an expli=
cit
nvidia,ram-code property in each table (or omitted/ignored when not usi=
ng
it) instead of reg?

--=20
nvpublic

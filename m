From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 10/20] tegra: fdt: Add additional USB binding
Date: Thu, 19 Jan 2012 09:33:19 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB0D4@HQMAIL01.nvidia.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-11-git-send-email-sjg@chromium.org>
	<4F174C3E.2090403@nvidia.com>	<20120119053523.GB27447@quad.lixom.net>
	<CAPnjgZ0JAyV8+0kLv=EcM-AhBxE-YSyG-Y7rYPS8PhOAOnq6dw@mail.gmail.com>
	<CAOesGMjCxryS+3yQZqCP3JYeHpCbUuNHM+rtDBoOQjF6rwLv5g@mail.gmail.com>
	<CAPnjgZ10mwQJ7RubrO_VFdHF+39cHOjLPmQNbYBeERjTWJMU4Q@mail.gmail.com>
 <CAOesGMhOe6enf9BFgpCbvEgtT3F-p5rEsxp8=PG57sxBaQvawQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhOe6enf9BFgpCbvEgtT3F-p5rEsxp8=PG57sxBaQvawQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Thursday, January 19, 2012 12:13 AM:
> On Wed, Jan 18, 2012 at 10:59 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrot=
e:
> > Hi Olof,
> >
> > On Wed, Jan 18, 2012 at 10:41 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> w=
rote:
> >> Hi,
> >>
> >> On Wed, Jan 18, 2012 at 9:55 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wr=
ote:
> >>
> >>>> fsl-usb.txt uses "dr_mode" here, which might make sense to reuse=
 given some of
> >>>> the shared IP in question for device mode:
> >>>>
> >>>> =A0- dr_mode : indicates the working mode for "fsl-usb2-dr" comp=
atible
> >>>> =A0 controllers. =A0Can be "host", "peripheral", or "otg". =A0De=
fault to
> >>>> =A0 "host" if not defined for backward compatibility.
> >>>
> >>> What does 'dr' mean?
> >>
> >> After some searching, it looks like it means "dual-role", which se=
ems
> >> appropriate terminology for the tegra SoC as well.
> >
> > Thanks for looking that up.
> >
> > Well maybe, but it could mean data reverse mode or distinctive
> > ring...I like Stephen's nice device-tree-friendly naming and
> > explanation :-) Are we stuck with this?
>=20
> I think there's value in staying common with similar bindings on othe=
r
> platforms, yes. Sorry. :)

Ack from me too. If there's an existing convention, I'd prefer to stick
with it. Sorry, I should have looked this up before coming up with
something new.

--=20
nvpublic

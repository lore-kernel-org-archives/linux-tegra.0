From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V3] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 15 Feb 2012 11:14:10 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178FACB8D6@HQMAIL01.nvidia.com>
References: <1329329667-26725-1-git-send-email-swarren@nvidia.com>
 <CAPnjgZ32TD_P4Pa650Y1MpxryxSOMtJHdJB28ZNFxv4hxqGMRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ32TD_P4Pa650Y1MpxryxSOMtJHdJB28ZNFxv4hxqGMRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Simon Glass wrote at Wednesday, February 15, 2012 11:45 AM:
> On Wed, Feb 15, 2012 at 10:14 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
> > The Tegra20 CAR (Clock And Reset) Controller controls most aspects =
of
> > most clocks within Tegra20. The device tree binding models this as =
a
> > single monolithic clock provider, which exports ~130 clocks. This r=
educes
> > the number of nodes needed in device tree to represent these clocks=
=2E
> >=20
> > This binding is only useful for Tegra20; the set of clocks that exi=
sts on
> > Tegra30 is sufficiently different to merit its own binding.
>=20
> It seems there is a large common element - they are almost backwards
> compatible. Should we not at least look at this now?

I don't believe there's any need for the clock IDs for the two chips to
align in any way. These are two different chips, with different sets of
clocks, different tegra*.dtsi files, different clock "drivers" that def=
ine
the available clocks, etc.

And while as you say, there are a lot of similarities, there are also a
number of differences within these first 96 clocks which make having
things completely aligned impractical. I imagine you'd rather that
Tegra30's binding follow Tegra30's CLK_OUT_ENB register layouts exactly=
,
rather than attempting to align with Tegra20 even in the face of
differences in HW.

> > + =A073 =A0 csite
>=20
> Would 'coresight' be better given that you have csi also?

The clock is named "csite" in the TRM; renaming it would make it harder
to correlate the binding with the TRM.

> > + =A076 =A0 la
>=20
> What is this one?

It's in the kernel's tegra2_clocks.c. It's undocumented, but I've
confirmed that it does exist.

> + =A096 =A0 uart2
> + =A097 =A0 vfir
> + =A098 =A0 spdif_in
> + =A099 =A0 spdif_out
> + =A0100 =A0vi
> + =A0101 =A0vi_sensor
> + =A0102 =A0tvo
> + =A0103 =A0cve
>=20
> These clocks follow on directly from the above numbers. What is your
> plan for T30? I think this has another 64 clocks. Should we reserve
> those spaces now so that the binding are compatible between the two?

=46or Tegra30, I imagine the first 160 clock IDs would be assigned in a
way that matches the CLK)OUT_ENB registers (since there are 160 bits in
them), and any other clocks would be assigned IDs starting with 160.

P.S. Your HTML mail was a little hard to quote.

--=20
nvpublic

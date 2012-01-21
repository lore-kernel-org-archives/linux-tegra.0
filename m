From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Fri, 20 Jan 2012 23:32:04 -0800
Message-ID: <CAOesGMh=i3EED-XhOpwGj8Vuma3xA0WehRL1iK1LSZfEuetP6Q@mail.gmail.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
	<1326932212-30346-1-git-send-email-swarren@nvidia.com>
	<20120119053143.GA27447@quad.lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF1780DAB0CA@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB0CA-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Jan 19, 2012 at 9:17 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Olof Johansson wrote at Wednesday, January 18, 2012 10:32 PM:
>> On Wed, Jan 18, 2012 at 05:16:52PM -0700, Stephen Warren wrote:
>> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra2=
0-car.txt
>> > +* NVIDIA Tegra20 Clock And Reset Controller
>> > +
>> > +This binding uses the common clock binding:
>> > +Documentation/devicetree/bindings/clock/clock-bindings.txt
>> > +
>> > +The CAR (Clock And Reset) Controller on Tegra is the HW module re=
sponsible
>> > +for muxing and gating Tegra's clocks, and setting their rates.
>> > +
>> > +Required properties :
>> > +- compatible : Should be "nvidia,<chip>-car"
>> > +- reg : Should contain CAR registers location and length
>> > +- clocks : Should contain phandle and clock specifiers for two cl=
ocks:
>> > + =A0the 32 KHz "32k_in", and the board-specific oscillator "osc".
>> > +- clock-names : Should contain a list of strings, with values "32=
k_in",
>> > + =A0and "osc".
>>
>> Hmm. I'd prefer to just ditch the notion of "clock-names" in the cas=
es
>> where it isn't strictly necessary. Just because some vendors don't w=
ant
>> to define an order between their clocks doesn't mean it's a good ide=
a
>> for everybody to use that model. In this case, just declaring that t=
he
>> two clocks refs have to be to those two clocks in that order should
>> be sufficient.
>
> OK, that seems reasonable. I'm happy using of_clk_get() rather than
> of_clk_get_by_name(). I guess that means we should just avoid any
> discussion of clock-output-names too.

Sounds good to me. Let's make sure Grant is OK with it too though.

>> > +- #clock-cells : Should be 1.
>> > + =A0In clock consumers, this cell represents the clock ID exposed=
 by the CAR.
>> > + =A0For a list of valid values, see the clock-output-names proper=
ty.
>> > +
>> > +Optional properties :
>> > +- clock-output-names : Should contain a list of strings defining =
the clocks
>> > + =A0that the CAR provides. The list of names and clock IDs is bel=
ow. The IDs
>> > + =A0may be used in clock specifiers. The names should be listed i=
n this clock-
>> > + =A0output-names property, sorted in ID order, if this property i=
s present.
>> > +
>> > + =A0The first 96 clocks are numbered to match the bits in the CAR=
's CLK_OUT_ENB
>> > + =A0registers. Later, subsequent IDs will be assigned to all othe=
r clocks the
>> > + =A0CAR controls.
>>
>> Aren't these names hardcoded per SoC? If so, they can be derived fro=
m the
>> compatible field + output number without having a table in the devic=
e tree.
>>
>> If anything, you might want to enumerate the allowed/expected values=
, but
>> actually putting them in a property seems overkill.
>
> Yes, the set of clocks is hard-coded per SoC, and the clock is unique=
ly
> identified by compatible+id.
>
> clock-output-names doesn't actually serve any functional purpose in
> Grant's common clock bindings patches; it's more of a documentation
> thing. As such, yes, I can remove the suggestion to actually put the
> table into the device tree, and rework the binding to simply define
> what the mapping is independently.

Again, sounds good to me.

>> > +Example:
>> > +
>> > +clocks {
>> > + =A0 clk_32k: oscillator@0 {
>>
>> If it has a unit addres (@<x>) it needs a reg property with the same=
 base
>> address.
>
> I thought everything needed a unit address period? Is the rule more l=
ike
> the unit address is optional, but if present must match reg, so I can
> simply remove @0 and @1 here? I guess that makes a lot more sense.

Nope, you only need a unit address to make a node unique, i.e. if you
have more than one with the same name. It's not something that's been
followed very well on ARM dts files, I have even seen review comments
asking for explicit unit IDs when none are needed.

So you can't remove @0 and @1 here, since there are two oscillator subn=
odes.

I'm not 100% sure if you have to have the unit address represented as
"reg" or not, but it should probably be represented by _something_ in
the properties of the node. Mitch? Segher? :)


>> > + =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
>> > + =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
>> > + =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <32768>;
>> > + =A0 };
>> > +
>> > + =A0 osc: oscillator@1 {
>> > + =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
>> > + =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
>> > + =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <12000000>;
>> > + =A0 };
>> > +};


-Olof

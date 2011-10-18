From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Tue, 18 Oct 2011 13:53:49 -0700
Message-ID: <CAOesGMghu6Bn3RrFKEUBKkUNS_K8Y0ho3Y2uFZh_LXbfT80hFw@mail.gmail.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB@HQMAIL01.nvidia.com>
	<CAOesGMh387Oghyd_TobnTOja6tU2uU5kt-86_HwQe7nFiL+svw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CC18@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173CA2CC18-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2011 at 11:54 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Olof Johansson wrote at Tuesday, October 18, 2011 12:43 PM:
>> On Tue, Oct 18, 2011 at 11:30 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>> > Olof Johansson wrote at Monday, October 17, 2011 11:53 AM:
>> > ...
>> >> +Embedded Memory Controller configuration table
>> > ...
>> >> +Properties:
>> >> +- name : Should start with emc-table
>> >
>> >> +- compatible : should contain "nvidia,tegra20-emc-table".
>> >> +- reg : only needed if nvidia,use-ram-code is present in the
>> >> + =A0parent. If so, the numerical representation of the selected =
ram code
>> >> + =A0as reported by the strap option APB misc register.
>> >
>> > I don't think the compatible or reg properties are needed; the EMC=
 tables
>> > aren't addressable objects on a bus, so no need for reg. I could s=
ee an
>> > argument that we'd want to version the emc-table format, and so th=
e
>> > compatible flag might be useful, yet AIUI, compatible is more for =
defining
>> > HW compatibility (and hence driver instantiation), rather than a p=
roperty
>> > of some configuration node.
>>
>> I was struggling with a good way to specify the selection of the
>> modules. I can definitely use a nvidia,ram-code property instead of
>> reg (with a similar definition to how reg was used here).
>
> Ah, so reg is the ram-code value. I missed that. Using an explicitly
> named property for this seems better to me, but I'll defer to DT expe=
rts
> on what's the standard practice for this.

Sounds like for these binding-specific things the rules are pretty
loose in general, but see below on my new proposal.

>> Compatible is still needed, in my opinion -- otherwise there will be
>> no way to tell if the node is there to describe emc timings or if it=
's
>> some new node used to describe something else (such as SDRAM chips a=
s
>> mentioned above).
>
> Can't you go by node name; enumerate all nodes with a particular name=
=2E
> Or define another intermediate node that will always contain tables a=
nd
> nothing else, then just enumerate all child nodes of that node:
>
> emc@xxxxx {
> =A0 =A0emc-tables {
> =A0 =A0 =A0 =A0table-333@0 {};
> =A0 =A0 =A0 =A0table-666@0 {};
> =A0 =A0};
> };
>
> The Tegra pinmux bindings I proposed certainly used this technique; a
> main node with a well-known name, followed by enumeration of all chil=
d
> nodes of that, and nobody /said/ anything about that being a bad idea=
=2E

I'm not really picky on this, but I think I would rather use a
compatible field than rely on naming.

That being said, doing a two-level approach will probably make it
easier than the flat structure I initially had. So:

emc@xxx {
    nvidia,use-ram-code;
    emc-table-ram-code-0 {
        nvidia,ram-code =3D < 0 >;
        table-166 { compatible =3D "tegra20-emc-table"; ... };
        table-333 { ... };
    };

    emc-table-ram-code-1 {
        nvidia,ram-code =3D < 1 >;
        ...
    };
};

=2E.. and for none-ram-code, just leave out the emc-table-ramcode-x lev=
el.

So, for nvidia,use-ram-code case, it'll be one intermediate step of
finding the right subnode, the rest of the table setup code will be
common. None of it will be bound to actual node names though -- first
step is iterating child nodes looking for nvidia,ram-code properties
to match, and second step iterates by matching compatible fields.


-Olof

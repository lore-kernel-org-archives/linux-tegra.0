From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Tue, 18 Oct 2011 20:28:10 -0700
Message-ID: <CAOesGMiDT1cY+n=94qr-0iDnUjLKCqWgYNYx_xMyNyDVyiDbGg@mail.gmail.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB@HQMAIL01.nvidia.com>
	<CAOesGMh387Oghyd_TobnTOja6tU2uU5kt-86_HwQe7nFiL+svw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CC18@HQMAIL01.nvidia.com>
	<CAOesGMghu6Bn3RrFKEUBKkUNS_K8Y0ho3Y2uFZh_LXbfT80hFw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CCA9@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173CA2CCA9-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2011 at 2:01 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Olof Johansson wrote at Tuesday, October 18, 2011 2:54 PM:
>> On Tue, Oct 18, 2011 at 11:54 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>> > Olof Johansson wrote at Tuesday, October 18, 2011 12:43 PM:
> ...
>> >> Compatible is still needed, in my opinion -- otherwise there will=
 be
>> >> no way to tell if the node is there to describe emc timings or if=
 it's
>> >> some new node used to describe something else (such as SDRAM chip=
s as
>> >> mentioned above).
>> >
>> > Can't you go by node name; enumerate all nodes with a particular n=
ame.
>> > Or define another intermediate node that will always contain table=
s and
>> > nothing else, then just enumerate all child nodes of that node:
>> >
>> > emc@xxxxx {
>> > =A0 =A0emc-tables {
>> > =A0 =A0 =A0 =A0table-333@0 {};
>> > =A0 =A0 =A0 =A0table-666@0 {};
>> > =A0 =A0};
>> > };
>> >
>> > The Tegra pinmux bindings I proposed certainly used this technique=
; a
>> > main node with a well-known name, followed by enumeration of all c=
hild
>> > nodes of that, and nobody /said/ anything about that being a bad i=
dea.
>>
>> I'm not really picky on this, but I think I would rather use a
>> compatible field than rely on naming.
>>
>> That being said, doing a two-level approach will probably make it
>> easier than the flat structure I initially had. So:
>>
>> emc@xxx {
>> =A0 =A0 nvidia,use-ram-code;
>> =A0 =A0 emc-table-ram-code-0 {
>> =A0 =A0 =A0 =A0 nvidia,ram-code =3D < 0 >;
>> =A0 =A0 =A0 =A0 table-166 { compatible =3D "tegra20-emc-table"; ... =
};
>> =A0 =A0 =A0 =A0 table-333 { ... };
>> =A0 =A0 };
>>
>> =A0 =A0 emc-table-ram-code-1 {
>> =A0 =A0 =A0 =A0 nvidia,ram-code =3D < 1 >;
>> =A0 =A0 =A0 =A0 ...
>> =A0 =A0 };
>> };
>>
>> ... and for none-ram-code, just leave out the emc-table-ramcode-x le=
vel.
>>
>> So, for nvidia,use-ram-code case, it'll be one intermediate step of
>> finding the right subnode, the rest of the table setup code will be
>> common. None of it will be bound to actual node names though -- firs=
t
>> step is iterating child nodes looking for nvidia,ram-code properties
>> to match, and second step iterates by matching compatible fields.
>
> I only suggested the well-known-named sub-nodes in order to eliminate
> the need for a compatible property.

Using compatible has one more benefit: It allows the data format to
change in the future if it has to, by bumping to a new compatible
string.

Also, since names have to be unique (due to lack of unit addressing),
the well-known-name is really a well-known-name-prefix. Using
compatible just seems cleaner.

> My inclination is that if we use compatible to distinguish the tables
> from anything else, there's little point having the extra level of no=
des;
> we may as well lay it out as in your original patch, just with an exp=
licit
> nvidia,ram-code property in each table (or omitted/ignored when not u=
sing
> it) instead of reg?

The main point of having one more level is to not have to iterate
through all tables to find which ones apply to the current ram-code
strapping. The cost of having another level is low, so it's not much
overhead.

I should revisit the pinmux patch, I suppose, and see if I agree with
the conventions there. :)


-Olof

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 13:39:08 -0600
Message-ID: <4FEA0FDC.9040703@wwwdotorg.org>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9B291.2020305@nvidia.com> <20120626134122.GA1115@avionic-0098.mockup.avionic-design.de> <4FE9F4CA.10907@wwwdotorg.org> <20120626193145.GB5247@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626193145.GB5247-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 01:31 PM, Thierry Reding wrote:
> On Tue, Jun 26, 2012 at 11:43:38AM -0600, Stephen Warren wrote:
>> On 06/26/2012 07:41 AM, Thierry Reding wrote:
>>> On Tue, Jun 26, 2012 at 04:01:05PM +0300, Terje Bergstr=C3=B6m
>>> wrote:
>>>> On 26.06.2012 13:55, Thierry Reding wrote:
>> ...
>>>>> status =3D "disabled";
>>>>>=20
>>>>> gart =3D <&gart>;
>>>>>=20
>>>>> /* video-encoding/decoding */ mpe { reg =3D <0x54040000=20
>>>>> 0x00040000>; interrupts =3D <0 68 0x04>; status =3D "disabled";
>>>>> };
>>>>=20
>>>>=20
>>>> The client device interrupts are not very interesting, so
>>>> they could be left out, too. Display controller related are
>>>> probably an exception to this.
>>>=20
>>> If the interrupts aren't used at all we should drop them.
>>=20
>> I disagree here; "used" is most likely something specific to a=20
>> particular OS's drivers. The HW always has the interrupts, and
>> hence they should be described in DT.
>=20
> Okay, I see. Does the same apply to the COP interrupts of the
> host1x node in your opinion? I don't know if it makes sense to
> describe something that's not reachable from the CPU. Yet it is
> defined in the GIC.

This probably applies to the interrupts too. The TRM does indicate
that git GIC has 4 interrupt IDs allocated to host1x. I recall Terje
saying that two of them weren't usable by the CPU though. Those two
points seem inconsistent. Terje, can you please explain further?

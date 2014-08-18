From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Mon, 18 Aug 2014 19:03:04 +0200
Message-ID: <53F231C8.5050309@suse.de>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org> <53EF76CF.9050808@suse.de> <53F2255E.7090208@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F2255E.7090208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am 18.08.2014 18:10, schrieb Stephen Warren:
> On 08/16/2014 09:20 AM, Andreas F=E4rber wrote:
>> Am 13.08.2014 21:14, schrieb Dylan Reid:
>>> +    pinmux: pinmux@0,70000868 {
>>> +        pinctrl-names =3D "default";
>>> +        pinctrl-0 =3D <&pinmux_default>;
>>> +
>>> +        pinmux_default: common {
>>> +            dap_mclk1_pw4 {
>>
>> Any need to have the nodes this way? Shouldn't this rather be
>> dap-mclk1-pw4 as node name by conventions, with a dap_mclk1_pw4 labe=
l
>> for referencing if needed? Same below, obviously.
>=20
> Underscores are consistent with at least all the other Tegra DTs, so =
I
> think this is best as is.
>=20
>>> +    pwm: pwm@0,7000a000 {
>>
>> Add the label to the .dtsi where the node is first declared? Then yo=
u
>> can override it the safer &pwm { ... }; way. Same for all other node=
s
>> being extended/overridden here - that's what your colleagues request=
ed
>> for Spring. It'll help with the 80 char limit further below by reduc=
ing
>> indentation.
>=20
> We certainly do have the pwm label in *.dtsi for other SoCs, so we
> should probably move the label there.
>=20
> Using the &pwm {} syntax would be inconsistent with all the other Teg=
ra
> DTs, and isn't really any safer; the HW isn't going to change, so onc=
e
> this is written, it should continue to "just work".

=46or exactly those consistency reasons I was asked to refactor the who=
le
set of exynos5250-*.dts files despite having no relation to them -
turning my 1 .dts patch into a large series that still isn't applied...

It's funny and disappointing that every Linux maintainer seems to have
their own conventions, and not even the Google Chrome people can agree
on a common style or live up to what they ask of others.

As for &pwm {}, I understood it's "safer" in that mismatches in the nod=
e
name will lead to compilation errors rather than silent runtime misbeha=
vior.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg

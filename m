From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 3/3] dt: tegra20: Add ehci nodes to Seaboard.
Date: Tue, 19 Jul 2011 17:14:04 -0700
Message-ID: <CAOesGMiOkMCzOxvK8jdYLPLbnH=7Wcf5E6qJ2tDDO+dRXeg9QQ@mail.gmail.com>
References: <1311115617-9697-1-git-send-email-achew@nvidia.com>
	<1311115617-9697-3-git-send-email-achew@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF049EBDED2A@HQMAIL01.nvidia.com>
	<643E69AA4436674C8F39DCC2C05F76383CF0DD2271@HQMAIL03.nvidia.com>
	<CAOesGMj247ekXj1FPmb-ZXqxTV4PsmAiCme005TGKm7cnBdOPQ@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F76383CF0DD2272@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F76383CF0DD2272-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 19, 2011 at 5:07 PM, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> > And since there are defaults specified in tegra20.dtsi,
>> does it really make sense to also have default values
>> assigned in ehci-tegra.c (for when a property is not
>> present)? =A0I worry that the information is now duplicated.
>> If those properties aren't present, then someone's mucked
>> with the tegra20.dtsi ehci properties.
>>
>> Once all platforms are cut over to devicetree-only, that can be the
>> case. Until that happens, there will be need for settings in the C
>> code too. Is Nvidia switching to device trees for android/fastboot?
>
> I'm not talking about the defaults in arch/arm/mach-tegra/usb_phy.c. =
=A0I understand that once we cut over to devicetree-only, the defaults =
there can go away.
>
> The question is, if a property is not present, what should we do? =A0=
The default value for that property SHOULD be present somewhere in the =
dts chain. =A0But if it's not, should we error out, spit out a warning,=
 or spit out a warning and assign a default? =A0If it's the latter case=
, then we now have a set of defaults in dts, as well as C code, regardl=
ess of whether we've switched over to devicetree-only or not.

If there are no safe/sane defaults, then there isn't much to be done
there. I'd say fail probe (i.e. error out) to avoid surprises.


-Olof

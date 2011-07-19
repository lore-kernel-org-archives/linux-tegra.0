From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 3/3] dt: tegra20: Add ehci nodes to Seaboard.
Date: Tue, 19 Jul 2011 16:53:40 -0700
Message-ID: <CAOesGMj247ekXj1FPmb-ZXqxTV4PsmAiCme005TGKm7cnBdOPQ@mail.gmail.com>
References: <1311115617-9697-1-git-send-email-achew@nvidia.com>
	<1311115617-9697-3-git-send-email-achew@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF049EBDED2A@HQMAIL01.nvidia.com>
	<643E69AA4436674C8F39DCC2C05F76383CF0DD2271@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F76383CF0DD2271-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 19, 2011 at 4:50 PM, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Although that said, since many of the USB properties are
>> board-specific
>> and determined by system characterization, they aren't generally
>> applicable to all Tegra devices. As such, should those values be moved
>> into tegra-seaboard.dts instead? Perhaps tegra20.dtsi should specify
>> the default values that the driver currently uses if not supplied with
>> platform data though... I think the Seaboard values are the defaults,
>> which still would make this patch obsolete.
>
> Turns out the ones I put in tegra20.dtsi are NOT the defaults. =A0The def=
aults are in arch/arm/mach-tegra/usb_phy.c, contained in "utmip_defaults[]".
>
> I think I'm going to put those utmip_defaults[] stuff into tegra20.dtsi, =
and override them in tegra-seaboard.dts. =A0How's that sound?

Sounds good to me, or if they for sure will need tuning on all boards
and there are no "safe" settings, leave them out from the generic
config alltogether.

> And since there are defaults specified in tegra20.dtsi, does it really ma=
ke sense to also have default values assigned in ehci-tegra.c (for when a p=
roperty is not present)? =A0I worry that the information is now duplicated.=
 =A0If those properties aren't present, then someone's mucked with the tegr=
a20.dtsi ehci properties.

Once all platforms are cut over to devicetree-only, that can be the
case. Until that happens, there will be need for settings in the C
code too. Is Nvidia switching to device trees for android/fastboot?


-Olof

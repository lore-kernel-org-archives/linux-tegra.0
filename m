From: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/3] dt: tegra20: Add ehci nodes to Seaboard.
Date: Tue, 19 Jul 2011 17:07:25 -0700
Message-ID: <643E69AA4436674C8F39DCC2C05F76383CF0DD2272@HQMAIL03.nvidia.com>
References: <1311115617-9697-1-git-send-email-achew@nvidia.com>
	<1311115617-9697-3-git-send-email-achew@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF049EBDED2A@HQMAIL01.nvidia.com>
	<643E69AA4436674C8F39DCC2C05F76383CF0DD2271@HQMAIL03.nvidia.com>
	<CAOesGMj247ekXj1FPmb-ZXqxTV4PsmAiCme005TGKm7cnBdOPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOesGMj247ekXj1FPmb-ZXqxTV4PsmAiCme005TGKm7cnBdOPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: 'Olof Johansson' <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> > And since there are defaults specified in tegra20.dtsi, =

> does it really make sense to also have default values =

> assigned in ehci-tegra.c (for when a property is not =

> present)? =A0I worry that the information is now duplicated. =A0
> If those properties aren't present, then someone's mucked =

> with the tegra20.dtsi ehci properties.
> =

> Once all platforms are cut over to devicetree-only, that can be the
> case. Until that happens, there will be need for settings in the C
> code too. Is Nvidia switching to device trees for android/fastboot?

I'm not talking about the defaults in arch/arm/mach-tegra/usb_phy.c.  I und=
erstand that once we cut over to devicetree-only, the defaults there can go=
 away.

The question is, if a property is not present, what should we do?  The defa=
ult value for that property SHOULD be present somewhere in the dts chain.  =
But if it's not, should we error out, spit out a warning, or spit out a war=
ning and assign a default?  If it's the latter case, then we now have a set=
 of defaults in dts, as well as C code, regardless of whether we've switche=
d over to devicetree-only or not.

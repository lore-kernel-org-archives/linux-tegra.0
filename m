From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 14:19:16 -0600
Message-ID: <CACxGe6tEEr11vd3tqDwQ00YhUi7tMzovmS2PZGW9jt1K6VBefg@mail.gmail.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
	<CACxGe6uDVdemjbjY_i-_M_-VT8HuLdtXP-R9V8kB+pSSin4dEw@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F76383CF0DD2277@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F76383CF0DD2277-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
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

On Wed, Jul 20, 2011 at 2:16 PM, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Can the driver use sane defaults for any of these values? =A0This patch
>> will be a lot smaller if there isn't the need to check all the return
>> values each time.
>
> The defaults are in the dt ehci node. =A0I'd really hate to duplicate the=
se defaults in C code as well, if that's what you're suggesting (they're al=
ready duplicated privately elsewhere, sadly, in mach-tegra, but I'm hoping =
those defaults can go away once we move over to dt for good). =A0By failing=
 probe if these defaults aren't present, I think it helps make sure the dt =
ehci node stays in sync with the code.

I'm saying that if the binding and the driver encode sane defaults for
those parameters, then the properties don't need to appear in the .dts
at all unless they are being overridden.  It is by no means a critical
issue though.  Do what makes the most sense to you.

g.

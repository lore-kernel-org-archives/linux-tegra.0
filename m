From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 06/10] arm/tegra: prepare pinmux code for multiple tegra
 variants
Date: Mon, 21 Nov 2011 09:24:38 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174F08C0EC@HQMAIL01.nvidia.com>
References: <1321546766-26770-1-git-send-email-pdeschrijver@nvidia.com>
 <1321546766-26770-7-git-send-email-pdeschrijver@nvidia.com>
 <20111118214116.GC31678@quad.lixom.net>
 <20111121142919.GN19069@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111121142919.GN19069-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
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
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Monday, November 21, 2011 7:29 AM:
> On Fri, Nov 18, 2011 at 10:41:16PM +0100, Olof Johansson wrote:
> > On Thu, Nov 17, 2011 at 06:19:20PM +0200, Peter De Schrijver wrote:
> > > This patch modifies the pinmux code to be useable for multiple tegra variants.
> > > Some tegra20 specific constants will be replaced by variables which will be
> > > initialized to the appropriate value at runtime.
...
> > > diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-tegra/board-harmony-pcie.c
...
> > > +#include <mach/pinmux-tegra20.h>
> >
> > Boards shouldn't have to include this. The idea is that you should only
> > have to do board code against the pinmux.h interface, which internally
> > abstracts it for tegra 20 vs tegra 30.
> 
> The pinmux naming is still SoC specific. Unless we move this to devicetree
> (which should be part of a different patchset), I don't see how we can solve
> this, except by renaming all the pingroups. That would cause a lot more
> changes though.

I believe that Peter's explanation makes sense.

BTW, re: the new pinmux API: I have a driver for both Tegra20 and Tegra30
now which should work for muxing. All the data is present for all the pin
configs too (tri-state, pull, ...) but we need to define the core pinctrl
API for this before I can expose that. Similarly, we need DT bindings for
all of this before we can make use of it; something I hope to start work
on in the near future.

-- 
nvpublic

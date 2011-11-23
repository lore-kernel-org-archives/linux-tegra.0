From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: convert tegra20 to GIC devicetree binding
Date: Wed, 23 Nov 2011 09:25:36 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174F08C6F0@HQMAIL01.nvidia.com>
References: <1321542430-17971-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1740D74C1E@HQMAIL01.nvidia.com>
 <20111118120352.GZ19069@tbergstrom-lnx.Nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1740D74E63@HQMAIL01.nvidia.com>
 <20111121122212.GL19069@tbergstrom-lnx.Nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174F08C0E5@HQMAIL01.nvidia.com>
 <20111123050012.GS19069@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111123050012.GS19069-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
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
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Tuesday, November 22, 2011 10:00 PM:
...
> I think we need to model the GPIO IRQs as a seperate interrupt controller.
> That way the WM8903 node can refer to the GPIO IRQ as an IRQ without
> hardcoding the global interrupt number, similar to the way we specify the
> SPI number in the device nodes and not the global interrupt number.

Yes, you're right.

I'd originally thought that the GPIO IRQs fed directly into the GIC, but
now that I read the docs, I see that the GPIO controller really is an
interrupt aggregator/controller.

-- 
nvpublic

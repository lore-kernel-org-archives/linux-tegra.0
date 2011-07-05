From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Tegra device name for device tree
Date: Tue, 5 Jul 2011 12:29:56 -0600
Message-ID: <CACxGe6tWC2bQ=cRp=odY+suJe5DVym1L6peurk_Ldu-mY_rTzA@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF049E21BE97@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049E21BE97-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 5, 2011 at 12:22 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Grant et. al.,
>
> It recently dawned on me that all the Tegra DeviceTree support is using a
> marketing name for the SoC ("tegra250"). NVIDIA would prefer that we use
> engineering names for the SoC (e.g. "tegra20" now, "tegra30" for an
> upcoming SoC). The primary motivation for this is that engineering names
> tend to be more stable and map more directly to the HW design.
>
> Is it still possible to make this change, if I submit the appropriate
> patches to do this?

Yes, please do.  I'm completely in support of that.

> So, far, I see devicetree/next only refers to the Tegra serial port,
> whereas devicetree/arm and devicetree/test refer to more Tegra devices in
> this way. I'm not quite sure how the flow of patches works between these 3
> trees. For the serial port, I obviously need to submit a patch against
> devicetree/next, but I'm not so sure about which of devicetree/arm or
> devicetree/test to target for the other devices.

devicetree/next is the stuff I'm actually merging.  devicetree/test is
stuff being experimented with, and devicetree/arm is stuff I expect to
get merged, but I'm not actually merging through my tree (or just
isn't quite ready yet).  You can use devicetree/test as a staging
ground for getting things ready for upstream.  Let me know if anything
you see in devicetree/test needs to get upstreamed ASAP because your
work depends on it, and we'll figure out how/when to get it done.

g.


>
> Sorry for bringing this up so late in the game.
>
> Thanks!
>
> --
> nvpublic
>
>



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

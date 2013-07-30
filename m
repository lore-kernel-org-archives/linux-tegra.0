From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] Documentation: devicetree: phy-tegra-usb: Add
 vbus-supply property for host mode PHYs
Date: Tue, 30 Jul 2013 09:10:12 +0300
Message-ID: <51F758C4.3020906@nvidia.com>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com> <1372422796-23524-3-git-send-email-mperttunen@nvidia.com> <51F6893E.6070604@wwwdotorg.org> <20130729211932.GA6901@radagast> <20130729212313.GB6901@radagast>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130729212313.GB6901@radagast>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/30/2013 12:23 AM, Felipe Balbi wrote:
> * PGP Signed by an unknown key
>
> Hi,
>
> On Tue, Jul 30, 2013 at 12:19:32AM +0300, Felipe Balbi wrote:
>> On Mon, Jul 29, 2013 at 09:24:46AM -0600, Stephen Warren wrote:
>>> On 06/28/2013 06:33 AM, Mikko Perttunen wrote:
>>>> Add vbus-supply as an optional property for host mode phy-tegra-usb PHYs.
>>>
>>> Felipe, I see that you didn't merge this one patch from this series. Was
>>> there a reason for that? At this stage, I would consider it reasonable
>>> for DT binding documentation changes to go through the same tree as
>>> driver changes.
>>
>> no reason, just missed it. Will apply now.
>
> actually, patch _is_ in my tree:
>
> https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=next&id=80bd8a94712a0a9f2baeb03ad0546dd70f27ac4e
>
> commit 80bd8a94712a0a9f2baeb03ad0546dd70f27ac4e
> Author: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Wed Jul 17 10:37:50 2013 +0300
>
>      usb: tegra: Add vbus-supply property for host mode PHYs
>
>      Document vbus-supply as an optional property for host mode phy-tegra-usb PHYs.
>
>      Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>      Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>      Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>      Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
>
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> index c4c9e9e..59c4854 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> @@ -48,5 +48,5 @@ Optional properties:
>         peripheral means it is device controller
>         otg means it can operate as either ("on the go")
>
> -Required properties for dr_mode == otg:
> +VBUS control (required for dr_mode == host, optional for dr_mode == otg):
>     - vbus-supply: regulator for VBUS
>

Oops, looks like I've made a typo there while making the v2. This should 
be, optional for dr_mode == host, required for dr_mode == otg instead of 
the other way around. Can this fixup still be made?

Thanks, Mikko

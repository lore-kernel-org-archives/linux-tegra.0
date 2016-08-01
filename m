From: Tomeu Vizoso <tomeu.vizoso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] i2c: device-tree: Handling child nodes which are not i2c devices
Date: Mon, 1 Aug 2016 11:19:37 +0200
Message-ID: <CAAObsKC-DGH4GedCcZdv2zvesaTSo6ugsHSQU=J0=P1cZeyCDA@mail.gmail.com>
References: <57110A35.2070509@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57110A35.2070509-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 15 April 2016 at 17:35, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi all,
>
> For Tegra we have an i2c device for display port, namely the display
> port auxiliary channel (or dpaux) as specified by the display port
> standard. If an design using Tegra does not utilise the display port
> interface, then the pads assigned to the dpaux can be re-assigned to
> another generic i2c controller (i2c6 for Tegra124/210). In other words,
> the pads can be re-used for a generic i2c interface.
>
> The registers that control whether the pads are mapped to the dpaux or
> i2c6 are located in the dpaux register space. Therefore, I am looking at
> adding pin controller support for dpaux so that i2c6 can request these
> pads if it is enabled and I was hoping to add a pinmux node the to dpaux
> device in device-tree to do this. For example, something like ...
>
>         dpaux@0,545c0000 {
>                 ...
>
>                 /* pinctrl node */
>                 pinmux {
>                         ...
>                 };
>         };
>
> Although the above works, when doing this I noticed that when the device
> booted, I would seeing the following error messages on boot ...
>
>  i2c i2c-5: of_i2c: modalias failure on ...
>
> These error messages being caused by the new pinmux node because it is
> not recognised as an i2c device. To avoid this error messages we have
> come up with a couple solutions but wanted to get some feedback on the
> best approach.

Hi,

I'm finding this issue as well on Rockchip SoCs, this is the specific
node that is raising this warning when an adapter is registered with
it:

edp: dp@ff970000 {
    compatible = "rockchip,rk3288-dp";
    ...
    ports {
        ...
    };
};

Has there been any agreement since this thread waned?

Thanks,

Tomeu

> 1. Add a i2c-bus sub-node to the dpaux binding (suggested by Stephen
>    Warren), so we would have something like the below. Then i2c devices
>    for dpaux would be place in the i2c-bus sub-node.
>
>         dpaux@0,545c0000 {
>                 ...
>
>                 /* pinctrl node */
>                 pinmux {
>                         ...
>                 };
>
>                 /* place-holder for i2c devices */
>                 i2c-bus {
>                         ...
>                 };
>         };
>
>    To make the above work ideally we would like to make the 'i2c-bus'
>    node a generic solution for all i2c devices, so the i2c core would
>    check for the presence of this node and if it is found then would
>    default to this node for looking for i2c-devices.
>
> 2. When registering i2c devices via device-tree, the function
>    of_i2c_register_devices() checks to see if OF_POPULATED flag is set
>    for a given node. If it is set, then the node is skipped. I believe
>    this was added for device-tree overlays (commit 4f001fd30145 i2c:
>    Mark instantiated device nodes with OF_POPULATE). Another option is
>    for the dpaux driver to mark the pinmux node as populated before
>    registering the i2c adapter and this will prevent the i2c core from
>    trying to parse the pinmux node. I am not sure if this would be
>    frowned upon in anyway or if we can guarantee that no future changes
>    to DT overlays would change this in a way where it would not work.
>
> Let me know your thoughts.
>
> Cheers
> Jon
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

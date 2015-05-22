From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] tegra: dpaux: pinctrl proposal
Date: Fri, 22 May 2015 13:17:02 +0100
Message-ID: <555F1E3E.7040500@nvidia.com>
References: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com>	<20150519144654.GG26748@ulmo.nvidia.com>	<555C901F.8090009@nvidia.com>	<20150520154022.GB7734@ulmo.nvidia.com>	<555CAE47.6070907@nvidia.com>	<555CDC82.1010104@wwwdotorg.org>	<555DD7B3.6020608@nvidia.com>	<20150521140356.GA28021@ulmo.nvidia.com> <CACRpkdYP5FN=4_pWxc1j=e_JfcjA3bXCPDRmZYHeiZ8HDyEaEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYP5FN=4_pWxc1j=e_JfcjA3bXCPDRmZYHeiZ8HDyEaEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 22/05/15 08:03, Linus Walleij wrote:
> On Thu, May 21, 2015 at 4:03 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>>>> I don't see any conceptual reason why the driver that binds to that node
>>>> can't register as both a pinctrl driver plus anything else it needs to.
> (...)
>>> Looking at it there should not be a problem here with regard to the
>>> driver_data member of the device struct and so I don't see why the
>>> tegra_dpaux_probe() could not call pinctrl_register() to register the
>>> device.
>>
>> Yes, I think that'd be the best solution.
> 
> I'm pretty much ready to go to any compromises to get DRM/GPU
> drivers to use internal kernel subsystems. The tendency there
> is to reimplement all kernel driver frameworks and hammer registers
> they need to access.

Thanks Linus, but after looking at this further I don't think this
approach will work after all. In order to call pinctrl_register() from
outside the pinctrl directory, also means exposing the pinctrl_dev and
pinctrl_desc structures and so this will get messy. Or at least a bigger
churn than I would have hoped for.

Thierry, what if we add a drivers/pinctrl/pinctrl-tegra-dpaux.c and then
simply call platform_device_register_data() from tegra_dpaux_probe() to
register the device? I could still use the parent of_node to match the
platform data for the dpaux pin controller.

Cheers
Jon

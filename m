From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] tegra: dpaux: pinctrl proposal
Date: Fri, 29 May 2015 16:50:12 +0100
Message-ID: <55688AB4.2030505@nvidia.com>
References: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com> <20150519144654.GG26748@ulmo.nvidia.com> <555C901F.8090009@nvidia.com> <20150520154022.GB7734@ulmo.nvidia.com> <555CAE47.6070907@nvidia.com> <555CDC82.1010104@wwwdotorg.org> <555DD7B3.6020608@nvidia.com> <20150521140356.GA28021@ulmo.nvidia.com> <CACRpkdYP5FN=4_pWxc1j=e_JfcjA3bXCPDRmZYHeiZ8HDyEaEQ@mail.gmail.com> <555F1E3E.7040500@nvidia.com> <20150522143706.GA19922@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150522143706.GA19922-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 22/05/15 15:37, Thierry Reding wrote:
> I'd still clearly prefer to have the pinctrl code live directly in the
> DPAUX driver, so I think we should at least give that a shot.

I have been working on this more this week and the good news is that by
using some of the pinconf-generic handlers I can simplify the code and
avoid moving headers and structures around.

However, I have ran into another issue. The current binding looks like
this ...

             dpaux: dpaux@0,545c0000 {
                     compatible = "nvidia,tegra124-dpaux";
                     reg = <0x0 0x545c0000 0x0 0x40000>;
                     interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
                     clocks = <&tegra_car TEGRA124_CLK_DPAUX>,
                              <&tegra_car TEGRA124_CLK_PLL_DP>;
                     clock-names = "dpaux", "parent";
                     resets = <&tegra_car 181>;
                     reset-names = "dpaux";
                     status = "disabled";

                     dpaux_state: dpaux_state0 {
                             dpaux {
                                     groups = "dpaux_io";
                                     function = "dpaux";
                                     nvidia,dpaux-drvi;
                                     nvidia,dpaux-drvz;
                                     nvidia,dpaux-cmh;
                             };
                     };

                     i2c_state: i2c_state0 {
                             i2c {
                                     groups = "dpaux_io";
                                     function = "i2c";
                             };
                     };

This all works well, however, because the display-port binding now has
child devices which are not i2c clients I see the following messages
during kernel boot ...

[    1.607606] i2c i2c-6: of_i2c: modalias failure on
/host1x@0,50000000/dpaux@0,545c0000/dpaux_state0
[    1.616658] i2c i2c-6: of_i2c: modalias failure on
/host1x@0,50000000/dpaux@0,545c0000/i2c_state0

In other words, i2c_add_adapter() (which is called by probing the dpaux)
then parses the child nodes looking for i2c client devices. However,
these child devices are not i2c client devices and hence the above error
messages. I can't find an easy way to avoid this. There is no
side-effect from these messages, but I would prefer not to see them.

Thierry, my understanding is the i2c-over-aux protocol is a simplified
version of the i2c protocol. From a DT perspective would a dpaux device
ever have i2c client devices as children like a normal i2c device has? I
am wondering if it would be valid in this case to tell the i2c-core not
to search for children. Although that sounds like a hack. I am not sure
if the i2c folks would allow us to make these dev_dbg() prints.

Cheers
Jon

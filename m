From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/4] mfd: max77620: add documentation for low battery monitoring
Date: Thu, 31 Jan 2019 15:05:46 -0600
Message-ID: <CAL_JsqK6z2NbJeRB48S-kmDrHj5B8H6hciR04+_Tzq4_V2jH_Q@mail.gmail.com>
References: <20190129085531.32364-1-markz@nvidia.com> <20190129085531.32364-5-markz@nvidia.com>
 <20190130195355.GA1652@bogus> <a6cd5f7c-d8a5-3f93-b1cf-4da3e4760dff@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a6cd5f7c-d8a5-3f93-b1cf-4da3e4760dff@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>, blaws05@gmail.com, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 30, 2019 at 8:29 PM Mark Zhang <markz@nvidia.com> wrote:
>
> On 1/31/2019 3:53 AM, Rob Herring wrote:
> > On Tue, Jan 29, 2019 at 04:55:31PM +0800, Mark Zhang wrote:
> >> Adding documentation for low battery monitor properties:
> >> - maxim,low-battery-dac-enable
> >> - maxim,low-battery-dac-disable
> >> - maxim,low-battery-shutdown-enable
> >> - maxim,low-battery-shutdown-disable
> >> - maxim,low-battery-reset-enable
> >> - maxim,low-battery-reset-disable
> >>
> >> Signed-off-by: Mark Zhang <markz@nvidia.com>
> >> ---
> >>  Documentation/devicetree/bindings/mfd/max77620.txt | 14 ++++++++++++++
> >>  1 file changed, 14 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> >> index 484b17e4fba5..5fed0a463b80 100644
> >> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> >> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> >> @@ -142,6 +142,20 @@ Optional properties:
> >>                      Device supports 100/1000/3000/6000 Ohms.
> >>                      Default will be set to 1000 Ohm.
> >>
> >> +Low-Battery Monitor:
> >> +==================
> >> +This sub-node configure low battery monitor configuration registers. Device has
> >> +support for low-battery monitor configuration through child DT node
> >> +"low-battery-monitor".

Missed this the first time, but there's not really any reason for
these to be in a child node.

> >> +
> >> +Optional properties:
> >> +    - maxim,low-battery-dac-enable: Enable low battery DAC.
> >> +    - maxim,low-battery-dac-disable: Disable low battery DAC.
> >> +    - maxim,low-battery-shutdown-enable: Enable low battery shutdown.
> >> +    - maxim,low-battery-shutdown-disable: Disable low battery shutdown.
> >> +    - maxim,low-battery-reset-enable: Enable low battery reset.
> >> +    - maxim,low-battery-reset-disable: Disable low battery reset.
> >
> > Do you really need 3 states with the 3rd being prop not present.
>
> Yeah, so I think we can just keep 3 of them and shorten the names a little bit
> (lbm stands for "low battery monitoring"):
> - maxim,lbm-dac-enable
> - maxim,lbm-shutdown-enable
> - maxim,lbm-reset-enable
>
> Does this look good to you?

Yes. However, are these 3 mutually exclusive? If so, then perhaps
'maxim,low-battery-mode = "<dac|shutdown|reset>"'?

Rob

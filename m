From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 1/2] pinctrl: tegra: Add devicetree binding document
 for Tegra124
Date: Mon, 09 Dec 2013 11:11:07 -0700
Message-ID: <52A607BB.60200@wwwdotorg.org>
References: <1386585140-1137-1-git-send-email-ldewangan@nvidia.com> <20131209105155.GC29303@e106331-lin.cambridge.arm.com> <52A6005E.3060506@wwwdotorg.org> <20131209174859.GC1809@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131209174859.GC1809@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "rob@landley.net" <rob@landley.net>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 12/09/2013 10:48 AM, Mark Rutland wrote:
> On Mon, Dec 09, 2013 at 05:39:42PM +0000, Stephen Warren wrote:
>> On 12/09/2013 03:51 AM, Mark Rutland wrote:
>>> On Mon, Dec 09, 2013 at 10:32:19AM +0000, Laxman Dewangan wrote:
>>>> This device tree binding document describes the Tegra124 pincontrol
>>>> DT bindings. This document lists all valid properties, names, mux
>>>> options of Tegra124 pins.
>>>>
>>>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>>>> ---
>>>> Changes from V1:
>>>> - Referred the dt-binding header file on describing the nodes.
>>>>
>>>>  .../bindings/pinctrl/nvidia,tegra124-pinmux.txt    |  147 ++++++++++++++++++++
>>>>  1 files changed, 147 insertions(+), 0 deletions(-)
>>>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
>>>> new file mode 100644
>>>> index 0000000..12ef772
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
>>>> @@ -0,0 +1,147 @@
>>>> +NVIDIA Tegra124 pinmux controller
>>>> +
>>>> +The Tegra124 pinctrl binding is very similar to the Tegra20 and Tegra30
>>>> +pinctrl binding, as described in nvidia,tegra20-pinmux.txt and
>>>> +nvidia,tegra30-pinmux.txt. In fact, this document assumes that binding as
>>>> +a baseline, and only documents the differences between the two bindings.
>>>> +
>>>> +Required properties:
>>>> +- compatible: "nvidia,tegra124-pinmux"
>>>> +- reg: Should contain the register physical address and length for each of
>>>> +  the pad control and mux registers. The first bank of address must be the
>>>> +  driver strength pad control register address and second bank address must
>>>> +  be pinmux register address.
>>>
>>> The wording here could be improved. The first sentence implies an entry
>>> for each individual register but I assume these are actually banks of
>>> registers (the sizes in the exanple imply this). The second sentence is
>>> more sepcific.
>>>
>>> How about something like:
>>>
>>> reg: Should contain a list of base address and size pairs for:
>>>  * first entry - the driver strength and pad control registers
>>
>> If this patch gets revised, please s/driver/drive/ here.
> 
> Whoops. I'm too used to typing the former.

Don't worry - I pointed it out because the same typo was in the original
patch, so I assumed that's where it came from.

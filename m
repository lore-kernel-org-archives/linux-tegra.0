From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: Remove 0, prefix from unit-addresses
Date: Fri, 15 Apr 2016 11:46:00 -0500
Message-ID: <CAL_JsqKy8QicB6k8_OSJ9-iJLa6tXujFyCdDMvnsXaYWLVGc-w@mail.gmail.com>
References: <1460473656-27209-1-git-send-email-thierry.reding@gmail.com> <20160415134102.GB3472@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160415134102.GB3472-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 15, 2016 at 8:41 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Apr 12, 2016 at 05:07:35PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> When Tegra124 support was first merged the unit-addresses of all devices
>> were listed with a "0," prefix to encode the reg property's second cell.
>> It turns out that this notation is not correct, and the "," separator is
>> only used to separate fields in the unit address (such as the device and
>> function number in PCI devices), not individual cells for addresses
>> with more than one cell.
>>
>> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt    | 2 +-
>>  Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt              | 2 +-
>>  .../devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt      | 6 +++---
>>  Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt  | 4 ++--
>>  .../devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt     | 6 +++---
>>  Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt      | 2 +-
>>  Documentation/devicetree/bindings/thermal/tegra-soctherm.txt        | 2 +-
>>  7 files changed, 12 insertions(+), 12 deletions(-)
>
> Hi Rob,
>
> Is this (and patch 2/2) something that you could pick up into the DT
> tree, or would you rather have me take it through the Tegra tree?

I have them queued up.

Rob
>
> Thierry

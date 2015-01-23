From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Add initial device tree support for Tegra132
Date: Fri, 23 Jan 2015 14:14:00 +0200
Message-ID: <54C23B08.6070503@nvidia.com>
References: <alpine.DEB.2.02.1501161139180.9776@utopia.booyaka.com> <20150121161313.GI5044@leverpostej> <alpine.DEB.2.02.1501231038130.5450@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1501231038130.5450-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

On 01/23/2015 01:31 PM, Paul Walmsley wrote:
> + Arto, Terje for comments on the host1x section
> + Stephen Warren for comments on the serial DT data
>
> Hi Mark,
>
> thanks for the review.
>
> On Wed, 21 Jan 2015, Mark Rutland wrote:
>
>> As mentioned in my reply to the DT list patch [1], there are a couple of
>> bits I'd like to see cleaned up first, but in the meantime I have some
>> comments from my first pass of the dtsi below. Some of these may equally
>> apply to existing dts(i) files.
>>
>> I see a few undocumented compatible strings (at least when comparing
>> against mainline). If there are other series or trees I should be
>> looking at, any pointers would be appreciated. If not, documentation
>> updates would be nice (checkpatch should complain otherwise).
>
> (discussed in the tegra132-pcie comments below)
>
>>
>> On Fri, Jan 16, 2015 at 11:45:29AM +0000, Paul Walmsley wrote:
>>> +       host1x@0,50000000 {
>>> +               compatible = "nvidia,tegra132-host1x", "nvidia,tegra124-host1x", "simple-bus";
>>
>> Regarding simple-bus, are the sub-nodes usable if this didn't probe as
>> "nvidia,tegra124-host1x" or "nvidia,tegra132-host1x"?
>> Do the subnodes require anything from this node?
>>
>> It looks like we expect/require the host1x node to be probed and
>> initialised before we probe the children. Which would imply the
>> simple-bus annotation is wrong.
>
> Haven't tried booting with just simple-bus here.  I believe these devices
> are accessible without the involvement of host1x.  In other words, host1x
> is not a bus; I believe it might be most accurately described as a type of
> DMA controller.  So in theory it should be possible for the CPU complex to
> read and write to these devices directly without the involvement of
> host1x, although I believe NVIDIA discourages this.
>
> Under the theory that DT data should be hardware-specific, not
> software-specific, in an ideal world I think we would list these devices
> outside the embrace of the host1x node.  However the existing Tegra124 DT
> file listed them together, and I am unsure whether that is required for
> the host1x code to function correctly.
>
> Arto may be able to comment further.

Placing the devices behind host1x is an accurate description of 
hardware: Despite the direct register access path (writel/readl 
targeting a host1x client device) is transparent to the CPU, the host1x 
hardware is internally handling the requests and passing them forward to 
the host1x client in interest.

Above implies also a strict parent-child dependency on hardware level: 
If the CPU tries to access a register in a host1x client before the 
host1x clock has been enabled, host1x will not be able to forward the 
requests and the access will fail. This also defines the importance of 
probe order (i.e. host1x must be initialized before client devices).

In addition, the host1x indirect register programming path ("channel 
path") is operational only for the host1x client devices and our current 
host1x driver relies on parent-child relationship in device tree.

- Arto

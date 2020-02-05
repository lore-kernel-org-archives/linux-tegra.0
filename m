From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Date: Thu, 6 Feb 2020 00:34:29 +0300
Message-ID: <4177818c-96dd-de75-2260-047236c129c0@gmail.com>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
 <20200127124903.GB2117209@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200127124903.GB2117209@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.01.2020 15:49, Thierry Reding пишет:
> On Mon, Jan 27, 2020 at 12:56:24AM +0300, Dmitry Osipenko wrote:
> [...]
>> Thinking a bit more about how to define the ICC, I'm now leaning to a
>> variant like this:
>>
>> interconnects =
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMP &emc TEGRA_ICC_EMEM>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW>;
>>
>> interconnect-names = "dma-mem", "read", "write", "dma-read", "dma-write";
>>
>> Looks like there is a problem with having a full MC-EMEM path being
>> defined for each memory client.. it's not very practical in terms of
>> memory frequency scaling.
>>
>> Take Display Controller for example, it has a memory client for each
>> display (overlay) plane. If planes are not overlapping on the displayed
>> area, then the required total memory bandwidth equals to the peak
>> bandwidth selected among of the visible planes. But if planes are
>> overlapping, then the bandwidths of each overlapped plane are
>> accumulated because overlapping planes will issue read request
>> simultaneously for the overlapping areas.
>>
>> The Memory Controller doesn't have any knowledge about the Display
>> Controller's specifics. Thus in the end it should be a responsibility of
>> Display Controller's driver to calculate the required bandwidth for the
>> hardware unit, since only the driver has all required knowledge about
>> planes overlapping state and whatnot.
> 
> I agree that the device-specific knowledge should live in the device-
> specific drivers. However, what you're doing above is basically putting
> the OS-specific knowledge into the device tree.
> 
> The memory client interfaces are a real thing in hardware that can be
> described using the corresponding IDs. But there is no such thing as the
> "BPMP" memory client. Rather it's composed of the other four.
> 
> So I think a better thing to do would be for the consumer driver to deal
> with all of that. If looking at only bandwidth, the consumer driver can
> simply pick any one of the clients/paths for any of the bandwidth
> requests and for per-interface settings like latency allowance the
> consumer would choose the appropriate path.

Will be good if we could avoid doing things like that because it doesn't
sound very nice :) Although, it should work.

On older Tegra SoCs Memory Controller has a hardware ID for each of the
clients module and we're using these IDs already for the MC resets.
Don't you think that we could use these IDs for ICC?

Are you sure that newer SoCs do not have these IDs too or maybe they are
kept private now?

>> The similar applies to multimedia things, like GPU or Video Decoder.
>> They have multiple memory clients and (I'm pretty sure that) nobody is
>> going to calculate memory bandwidth requirements for every client, it's
>> simply impractical.
>>
>> So, I'm suggesting that we should have a single "dma-mem" ICC path for
>> every hardware unit.
>>
>> The rest of the ICC paths could be memory_client -> memory_controller
>> paths, providing knobs for things like MC arbitration (latency)
>> configuration for each memory client. I think this variant of
>> description is actually closer to the hardware, since the client's
>> arbitration configuration ends in the Memory Controller.
> 
> Not necessarily. The target of the access doesn't always have to be the
> EMC. It could equally well be IRAM, in which case there are additional
> controls that need to be programmed within the MC to allow the memory
> client to access IRAM. If you don't have a phandle to IRAM in the
> interconnect properties, there's no way to make this distinction.

Could you please clarify what do you mean by the "memory client" here?
Do you mean the whole hardware module/unit or each memory client of the
hardware module that needs to be programmed for the IRAM accessing?

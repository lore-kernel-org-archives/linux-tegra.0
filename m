From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Date: Tue, 21 Jan 2020 09:53:48 +0300
Message-ID: <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200120150605.GA712203@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.01.2020 18:06, Thierry Reding пишет:
> On Fri, Jan 17, 2020 at 05:23:43PM +0200, Georgi Djakov wrote:
>> Hi Thierry,
>>
>> Thanks for the patch!
>>
>> On 1/14/20 20:15, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Document the interconnects property that is used to describe the paths
>>> from and to system memory from and to the BPMP.
>>>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> Rob, Georgi,
>>>
>>> after the initial RFC that I did for adding interconnect properties on
>>> Tegra, I realized that the description wasn't complete. This is an
>>> attempt at a more accurate description, but unfortunately I'm not sure
>>> if it's even correct in terms of the interconnect bindings.
>>>
>>> The problem here is that on Tegra, each device has multiple paths to
>>> system memory, and I have no good idea on what to pick as the default.
>>> They are all basically the same path, but each provides extra controls
>>> to configure the "interconnect".
>>
>> Are these multiple paths between a device and system memory used simultaneously
>> for load-balancing, or who makes the decision about which path would be used?
> 
> It varies. The vast majority of these paths are read/write pairs, which
> can be configured separately. There are also cases where multiple paths
> are used for load-balancing and I don't think there's any direct
> software control over which path will be used.
> 
> A third class is where you have one device, but two read/write pairs,
> one which is tied to a microcontroller that's part of the device, and
> another read/write pair that is used for DMA to/from the device.
> 
> Often in the latter case, the microcontroller memory client interfaces
> will be used by the microcontroller to read firmware and once the micro-
> controller has booted up, the DMA memory client interfaces will be used
> to read/write system memory with bulk data (like frame buffers, etc.).
> 
>> Is this based on the client/stream ID that you mentioned previously?
> 
> These are now all what's call memory client IDs, which identify the
> corresponding interface to the memory controller. Stream IDs are
> slightly higher-level and typically identify the "module" that uses
> the SMMU. Generally a stream ID is mapped to one or more memory client
> IDs.
> 
>> Looking at the the binding below, it seems to me like there are different
>> master/slave pairs between MC and EMC and each link is used for
>> unidirectional traffic only. In terms of the interconnect API, both read
>> and write paths have the same direction.

Yes, that definition should be incorrect.

> I'm not sure I understand what you mean by this last sentence. Are you
> saying that each path in terms of the interconnect API is a always a
> bidirectional link?

Please see more below.

>> Is the EMC really an interconnect provider or is it just a slave port? Can
>> we scale both EMC and MC independently?
> 
> The EMC is the only one where we can scale the frequency, but the MC has
> various knobs that can be used to fine-tune arbitration, set maximum
> latency, etc.

Yes..


EMC controls the total amount of available memory bandwidth, things like
DRAM timing and EMC-DRAM channel's performance. EMC is facing MC from
one side and DRAM (EMEM) from the other.



MC controls allocation of that total bandwidth between the memory
clients. It has knobs to prioritize clients, the knobs are per
read/write port. MC is facing memory clients from one side and EMC from
the other.


> I vaguely recall Dmitry mentioning that the EMC in early generations of
> Tegra used to have controls for individual memory clients, but I don't
> see that in more recent generations.

EMC doesn't have direct controls over memory clients on all Tegra SoCs,
but it may have some extra knobs for the MC arbitration config.

The MC bandwidth allocation logic and hardware programming interface
differs among SoC generations, but the basic principle is the same.

>>> Any ideas on how to resolve this? Let me know if the DT bindings and
>>> example don't make things clear enough.

I'm also interested in the answer to this question.

A quick thought.. maybe it could be some new ICC DT property which tells
that all paths are the "dma-mem":

	interconnects-all-dma-mem;

>>>  .../firmware/nvidia,tegra186-bpmp.yaml        | 59 +++++++++++++++++++
>>>  1 file changed, 59 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>> index dabf1c1aec2f..d40fcd836e90 100644
>>> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>> @@ -43,6 +43,24 @@ properties:
>>>        - enum:
>>>            - nvidia,tegra186-bpmp
>>>  
>>> +  interconnects:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    description: A list of phandle and specifier pairs that describe the
>>> +      interconnect paths to and from the BPMP.
>>> +
>>> +  interconnect-names:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>> +    description: One string for each pair of phandle and specifier in the
>>> +      "interconnects" property.
>>> +    # XXX We need at least one of these to be named dma-mem so that the core
>>> +    # will set the DMA mask based on the DMA parent, but all of these go to
>>> +    # system memory eventually.
>>> +    items:
>>> +      - const: dma-mem
>>> +      - const: dma-mem
>>> +      - const: dma-mem
>>> +      - const: dma-mem

Names should be unique, otherwise it's not possible to retrieve ICC path
other than the first one.

>>>    iommus:
>>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>>      description: |
>>> @@ -152,8 +170,43 @@ additionalProperties: false
>>>  
>>>  examples:
>>>    - |
>>> +    #include <dt-bindings/clock/tegra186-clock.h>
>>>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>      #include <dt-bindings/mailbox/tegra186-hsp.h>
>>> +    #include <dt-bindings/memory/tegra186-mc.h>
>>> +
>>> +    mc: memory-controller@2c00000 {
>>> +        compatible = "nvidia,tegra186-mc";
>>> +        reg = <0x02c00000 0xb0000>;
>>> +        interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>>> +        status = "disabled";
>>> +
>>> +        #interconnect-cells = <1>;
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        ranges = <0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
>>> +
>>> +        /*
>>> +         * Memory clients have access to all 40 bits that the memory
>>> +         * controller can address.
>>> +         */
>>> +        dma-ranges = <0x0 0x0 0x0 0x100 0x0>;
>>> +
>>> +        #memory-controller-cells = <0>;
>>> +
>>> +        emc: external-memory-controller@2c60000 {
>>> +            compatible = "nvidia,tegra186-emc";
>>> +            reg = <0x0 0x02c60000 0x0 0x50000>;
>>> +            interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
>>> +            clocks = <&bpmp TEGRA186_CLK_EMC>;
>>> +            clock-names = "emc";
>>> +
>>> +            #interconnect-cells = <0>;
>>> +
>>> +            nvidia,bpmp = <&bpmp>;
>>> +        };
>>> +    };
>>>  
>>>      hsp_top0: hsp@3c00000 {
>>>          compatible = "nvidia,tegra186-hsp";
>>> @@ -187,6 +240,12 @@ examples:
>>>  
>>>      bpmp {
>>>          compatible = "nvidia,tegra186-bpmp";
>>> +        interconnects = <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPR>,
>>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
>>> +                        <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
>>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;

I don't think this is a correct definition of the ICC paths because the
first node-MC_ID pair should define the source, second pair is the final
destination. Then the interconnect core builds (by itself) the path from
MC client to MC and finally to EMC based on the given source /
destination. Please see my v1 patchset for the example.

It should look somewhat like this:

interconnects =
    <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc TEGRA_ICC_EMEM>,
    <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc TEGRA_ICC_EMEM>,
    <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc TEGRA_ICC_EMEM>,
    <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc TEGRA_ICC_EMEM>;

interconnect-names = "bpmpr", "bpmpw", "bpmpdmar", "bpmpdmaw";

>>> +        interconnect-names = "dma-mem", "dma-mem", "dma-mem", "dma-mem";
>>> +
>>>          iommus = <&smmu TEGRA186_SID_BPMP>;
>>>          mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
>>>          shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
>>>

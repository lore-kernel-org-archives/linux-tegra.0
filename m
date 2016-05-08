From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: bus: Add documentation for Tegra210
 ACONNECT
Date: Sun, 8 May 2016 13:45:34 +0100
Message-ID: <572F34EE.8090404@nvidia.com>
References: <1461938027-23034-1-git-send-email-jonathanh@nvidia.com>
 <1461938027-23034-2-git-send-email-jonathanh@nvidia.com>
 <20160503182215.GA4341@rob-hp-laptop> <572B5B14.6060603@nvidia.com>
 <CAL_JsqL66dY-qatCpESqhpqHQ+g+419pk5cF266xT=Jhp4zSLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL66dY-qatCpESqhpqHQ+g+419pk5cF266xT=Jhp4zSLA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 05/05/16 17:48, Rob Herring wrote:
> On Thu, May 5, 2016 at 9:39 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> On 03/05/16 19:22, Rob Herring wrote:
>>> On Fri, Apr 29, 2016 at 02:53:45PM +0100, Jon Hunter wrote:
>>>> Add binding documentation for the Tegra ACONNECT bus that is part of the
>>>> Audio Processing Engine (APE) on Tegra210. The ACONNECT bus is used to
>>>> access devices within the APE subsystem. The APE is located in a
>>>> separate power domain and so accesses made to the ACONNECT require the
>>>> power domain to be enabled as well as some platform specific clocks.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>>  .../bindings/bus/nvidia,tegra210-aconnect.txt      | 45 ++++++++++++++++++++++
>>>>  1 file changed, 45 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
>>>> new file mode 100644
>>>> index 000000000000..e5e915f8fca7
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
>>>> @@ -0,0 +1,45 @@
>>>> +NVIDIA Tegra ACONNECT Bus
>>>> +
>>>> +The Tegra ACONNECT bus is an AXI switch which is used to connnect various
>>>> +components inside the Audio Processing Engine (APE). All CPU accesses to
>>>> +the APE subsystem go through the ACONNECT via an APB to AXI wrapper.
>>>> +
>>>> +Required properties:
>>>> +- compatible: Must be "nvidia,tegra210-aconnect".
>>>> +- clocks: Must contain the entries for the APE clock (TEGRA210_CLK_APE),
>>>> +  and APE interface clock (TEGRA210_CLK_APB2APE).
>>>> +- clock-names: Must contain the names "ape" and "apb2ape" for the corresponding
>>>> +  'clocks' entries.
>>>> +- power-domains: Must contain a phandle that points to the audio powergate
>>>> +  (namely 'aud') for Tegra210.
>>>> +- #address-cells: The number of cells used to represent physical base addresses
>>>> +  in the host1x address space. Should be 2.
>>>> +- #size-cells: The number of cells used to represent the size of an address
>>>> +  range in the host1x address space. Should be 2.
>>>
>>> Do you really need >4GB of child addresses?
>>
>> Sounds rather silly when you put it like that. No, its not needed. I
>> will fix that.
>>
>>>> +- ranges: 1:1 mapping of the aconnect address space to the CPU address space.
>>>
>>> Why 1:1 for 256KB of address space?
>>
>> No good reason. I have looking at what we did for host1x and ahub which
>> also have a ranges property and use a 1:1 mapping. For ahub this makes
>> sense because it is more of a cross-bar/switch. The aconnect bus is also
>> a switch and thought may be that is the easiest thing to do. What is
>> recommended here?
> 
> Use of non-empty ranges is preferred though there is not much benefit
> if the parent and child sizes are the same. However, it does also
> limit what is a valid address for those child nodes.

Thanks. Yes if I change the child sizes to be 1, then I guess I need to
have a non-empty ranges anyway.

Cheers
Jon

From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: bus: Add documentation for Tegra210
 ACONNECT
Date: Mon, 16 May 2016 09:12:32 +0100
Message-ID: <573980F0.2040301@nvidia.com>
References: <1462880140-5938-1-git-send-email-jonathanh@nvidia.com>
 <1462880140-5938-2-git-send-email-jonathanh@nvidia.com>
 <20160514142208.GA1462@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160514142208.GA1462@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 14/05/16 15:22, Rob Herring wrote:
> On Tue, May 10, 2016 at 12:35:37PM +0100, Jon Hunter wrote:
>> Add binding documentation for the Tegra ACONNECT bus that is part of the
>> Audio Processing Engine (APE) on Tegra210. The ACONNECT bus is used to
>> access devices within the APE subsystem. The APE is located in a
>> separate power domain and so accesses made to the ACONNECT require the
>> power domain to be enabled as well as some platform specific clocks.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../bindings/bus/nvidia,tegra210-aconnect.txt      | 45 ++++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
>>
>> diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
>> new file mode 100644
>> index 000000000000..81668f588eca
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
>> @@ -0,0 +1,45 @@
>> +NVIDIA Tegra ACONNECT Bus
>> +
>> +The Tegra ACONNECT bus is an AXI switch which is used to connnect various
>> +components inside the Audio Processing Engine (APE). All CPU accesses to
>> +the APE subsystem go through the ACONNECT via an APB to AXI wrapper.
>> +
>> +Required properties:
>> +- compatible: Must be "nvidia,tegra210-aconnect".
>> +- clocks: Must contain the entries for the APE clock (TEGRA210_CLK_APE),
>> +  and APE interface clock (TEGRA210_CLK_APB2APE).
>> +- clock-names: Must contain the names "ape" and "apb2ape" for the corresponding
>> +  'clocks' entries.
>> +- power-domains: Must contain a phandle that points to the audio powergate
>> +  (namely 'aud') for Tegra210.
>> +- #address-cells: The number of cells used to represent physical base addresses
>> +  in the aconnect address space. Should be 2.
>> +- #size-cells: The number of cells used to represent the size of an address
>> +  range in the aconnect address space. Should be 2.
> 
> You forgot to update these. With that,

Darn it, yes.

> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks!
Jon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

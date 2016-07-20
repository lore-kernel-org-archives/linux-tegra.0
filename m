From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 3/10] Documentation: dt-bindings: firmware: tegra: add
 bindings of the BPMP
Date: Wed, 20 Jul 2016 09:37:17 +0800
Message-ID: <6aafa2af-d9e9-cf7a-6c4f-b7a1f59914bf@nvidia.com>
References: <20160719091723.30919-1-josephl@nvidia.com>
 <20160719091723.30919-2-josephl@nvidia.com>
 <20160720012231.GA8522@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160720012231.GA8522@rob-hp-laptop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/20/2016 09:22 AM, Rob Herring wrote:
> On Tue, Jul 19, 2016 at 05:17:23PM +0800, Joseph Lo wrote:
>> The BPMP is a specific processor in Tegra chip, which is designed for
>> booting process handling and offloading the power management, clock
>> management, and reset control tasks from the CPU. The binding document
>> defines the resources that would be used by the BPMP firmware driver,
>> which can create the interprocessor communication (IPC) between the CPU
>> and BPMP.
>>
>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in V3:
>> - s/mmio-ram/mmio-sram/
>> - revise the file path of the reference binding documents and header files
>>   for more generic viem in different SW projects
>> Changes in V2:
>> - update the message that the BPMP is clock and reset control provider
>> - add tegra186-clock.h and tegra186-reset.h header files
>> - revise the description of the required properties
>> ---
>>  .../bindings/firmware/nvidia,tegra186-bpmp.txt     |  77 ++
>>  include/dt-bindings/clock/tegra186-clock.h         | 940 +++++++++++++++++++++
>>  include/dt-bindings/reset/tegra186-reset.h         | 217 +++++
>>  3 files changed, 1234 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
>>  create mode 100644 include/dt-bindings/clock/tegra186-clock.h
>>  create mode 100644 include/dt-bindings/reset/tegra186-reset.h
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
Rob, Stephen,

Thanks for your review.

-Joseph

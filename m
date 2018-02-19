From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v3 6/7] arm64: tegra: Add Tegra194 chip device tree
Date: Mon, 19 Feb 2018 11:32:01 +0200
Message-ID: <eb5cde8c-7d21-2542-261b-23f94bacf85e@kapsi.fi>
References: <20180215145206.24775-1-mperttunen@nvidia.com>
 <20180215145206.24775-7-mperttunen@nvidia.com>
 <CAOFm3uHvbut7w5eBuggNg0NnW-UvBsRjifsJxGuj3L34vCjEHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOFm3uHvbut7w5eBuggNg0NnW-UvBsRjifsJxGuj3L34vCjEHA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe Ombredanne <pombredanne@nexb.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, talho@nvidia.com, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 16.02.2018 14:33, Philippe Ombredanne wrote:
> Mikko,
>
> On Thu, Feb 15, 2018 at 3:52 PM, Mikko Perttunen <mperttunen@nvidia.com> wrote:
>> Add the chip-level device tree, including binding headers, for the
>> NVIDIA Tegra194 "Xavier" system-on-chip. Only a small subset of devices
>> are initially available, enough to boot to UART console.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>
>> Notes:
>>     v3:
>>     - added hypervisor-related apertures to GIC node
>>     - removed GPL boilerplate in favor of SPDX and harmonized
>>       copyright headers
>
> Thanks for this boilerplate removal! but see a few nits below.
>
> <snip>
>
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/tegra194-clock.h
>> @@ -0,0 +1,653 @@
>> +/*
>> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0
>> + */
>
> The proper style should be this for a .h header on the first line per [1]

I see -- I'll fix this in v4 (or if there are no further issues maybe 
Thierry can fix this while applying?:)

Mikko

>
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
>> + *
>> + */
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst
>
> <snip>
>
>> --- /dev/null
>> +++ b/include/dt-bindings/gpio/tegra194-gpio.h
>> @@ -0,0 +1,64 @@
>> +/*
>> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0
>> + */
>> +
>
> <snip>
>
> Same as above
>
>> --- /dev/null
>> +++ b/include/dt-bindings/power/tegra194-powergate.h
>> @@ -0,0 +1,38 @@
>> +/*
>> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0
>> + */
>
> <snip>
>
> Same as above
>
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/tegra194-reset.h
>> @@ -0,0 +1,155 @@
>> +/*
>> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0
>> + */
>
> <snip>
>
> Same as above
>

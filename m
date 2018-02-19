From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/7] arm64: tegra: Add Tegra194 chip device tree
Date: Mon, 19 Feb 2018 09:36:38 -0600
Message-ID: <CAL_JsqJXUDzrWJ+yKR7Ow6==j=k5yZgjrXehfHtDyOC0RAiGAw@mail.gmail.com>
References: <1517901757-15353-1-git-send-email-mperttunen@nvidia.com>
 <1517901757-15353-7-git-send-email-mperttunen@nvidia.com>
 <20180209225402.uexw7vlzwflo7zmr@rob-hp-laptop>
 <49fc21ac-4630-b90c-04fb-31740354b35b@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <49fc21ac-4630-b90c-04fb-31740354b35b@kapsi.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, talho@nvidia.com, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 14, 2018 at 5:56 AM, Mikko Perttunen <cyndis@kapsi.fi> wrote:
> On 10.02.2018 00:54, Rob Herring wrote:
>>
>> On Tue, Feb 06, 2018 at 09:22:36AM +0200, Mikko Perttunen wrote:
>>>
>>> ...
>>> index 000000000000..dcc6eea52684
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/tegra194-clock.h

>>> + */
>>> +
>>> +#ifndef __ABI_MACH_T194_CLOCK_H
>>> +#define __ABI_MACH_T194_CLOCK_H
>>> +
>>> +/** @file */
>>> +
>>> +/** @brief output of mux controlled by TEGRA194_CLK_SOC_ACTMON */
>>> +#define TEGRA194_CLK_ACTMON                    1
>>> +/** @brief output of gate CLK_ENB_ADSP */
>>
>>
>> These comments don't add much and make readability horrible.
>
>
> The comments allow mapping each define to the clocks defined in the chip
> technical reference manual.

If that's not obvious from the define name, then fix the define name.
Looks like in most cases it is.

> The file also comes as is from the firmware team
> so I'd prefer to keep changes to a minimum.

I can appreciate that and perhaps if this was something imported at
some frequency then it would be worthwhile to maintain formatting. But
this is an ABI and defined by the hardware (as opposed to BPMP
firmware) so it generally shouldn't ever change. And bindings should
be complete, so if you plan periodic additions to it, that's a
separate problem.

> We have done this previously
> with the BPMP ABI and device tree binding headers for the Tegra186.

Generally, we don't accept doxygen comments in the kernel tree.
There's only a handful of cases that seem to have sneaked in.

Rob

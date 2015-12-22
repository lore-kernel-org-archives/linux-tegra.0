From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH V2 1/8] irqdomain: Ensure type settings match for an
 existing mapping
Date: Tue, 22 Dec 2015 10:58:24 +0100
Message-ID: <CACRpkdbjRiW8gcZcifHLELjBukpsCKyTQ+NpP51+v3kYLDcPHA@mail.gmail.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
	<1450349309-8107-2-git-send-email-jonathanh@nvidia.com>
	<CACRpkdYPvMfqou7t9K_5=Ojx3U_sc8B2Zkxgeu=1JXxCUU_E2Q@mail.gmail.com>
	<5673DB87.6040106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5673DB87.6040106@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 18, 2015 at 11:10 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
> On 17/12/15 13:16, Linus Walleij wrote:
>> On Thu, Dec 17, 2015 at 11:48 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
>>> +               } else {
>>> +                       virq = irq_domain_alloc_descs(-1, 1, hwirq,
>>> +                                                     of_node_to_nid(of_node));
>>
>> What is this all of a sudden? Not even mentioned in the
>> commit. Plus I bet ACPI need something else than OF nid
>> passed here.
>
> Do you mean the else part of all of the above?

Yes

> So in the current code, the else part calls irq_create_mapping() (...)

No, not that... The fact that you all of a sudden have started
calling irq_domain_alloc_descs() which the function didn't do
before, totally changing the calling semantics for everyone in
the kernel, leading to the problem I then describe with this
potentially being called before the irqdomain for the irqchip
is initialized and descs getting "random" numbers.

Yours,
Linus Walleij

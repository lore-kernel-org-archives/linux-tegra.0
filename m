From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Mon, 16 Nov 2015 10:49:38 +0100
Message-ID: <CAMuHMdXazgRcw=+O-w+PsZpwiW8iCwZ8MmhNSjcOoZGRP45Y6Q@mail.gmail.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
	<1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
	<7hio56dctz.fsf@deeprootsystems.com>
	<5645A6F6.6020202@nvidia.com>
	<alpine.DEB.2.11.1511131456440.3987@nanos>
	<5649A603.6020308@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5649A603.6020308@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 16, 2015 at 10:46 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
> On 13/11/15 20:01, Thomas Gleixner wrote:
>> On Fri, 13 Nov 2015, Jon Hunter wrote:
>>> On 12/11/15 23:20, Kevin Hilman wrote:
>>>> If all the RPM devices in the domain go idle, it will be powered off
>>>> independently of the status of the irqchip because the irqchip isn't
>>>> using RPM.
>>>
>>> That's dependent on how the irqchip uses these helpers. If these helpers
>>> invoke RPM then that will not be the case.
>>
>> You need a very proper description of how that domain is working. If
>> all devices are idle, it's not necessary correct to power down the
>> irqchip as is might serve other devices as well.
>
> Agreed. The irqchip should only be powered down if there are no
> interrupts in-use/requested. Runtime-pm will keep a reference count for
> all requested IRQs.

That means the irqchip won't be powered down automatically when the
last user is powered down, unless all users release their irqs during
suspend.

Handling it automatically needs more bookkeeping than a simple reference
count.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

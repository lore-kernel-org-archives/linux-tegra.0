From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: Re: [PATCH] timekeeping: Move persistent clock registration code from
 ARM to kernel
Date: Mon, 10 Nov 2014 11:26:20 -0800
Message-ID: <CAOMFOmXpAm5iKCLFyorTW+n9YmgZMmrDGGe736tJX8C6BYQv-A@mail.gmail.com>
References: <1415388855-35074-1-git-send-email-anatol.pomozov@gmail.com>
	<20141110095325.GC12126@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141110095325.GC12126@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux@arm.linux.org.uk, "tglx@linutronix.de" <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

Hi

On Mon, Nov 10, 2014 at 1:53 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Fri, Nov 07, 2014 at 11:34:15AM -0800, Anatol Pomozov wrote:
>> ARM timekeeping functionality allows to register persistent/boot clock dynamically.
>> This code is arch-independent and can be useful on other plaforms as well.
>>
>> As a byproduct of this change, tegra20_timer becomes ARM64 compatible.
>>
>> Tested: backported the change to chromeos-3.14 kernel ran on tegra 64bit
>> board, made sure high-resolution clock works.
>
> Using this on an upstream kernel doesn't work, though, because 64-bit
> ARM doesn't implement struct delay_timer which the driver needs since
> v3.17.
>
> But I suppose the delay timer infrastructure could be moved into the
> core similar to the persistent and boot clock as this patch does.

Thanks. It makes sense, I will send it in a separate patch, once this
one will be reviewed. On our kernel I haven't seen this issue as we
still use 3.14.

In fact none of arch/arm/lib/delay.c code seems ARM32 related.

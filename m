From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] mfd: tps6586x: Handle interrupts on suspend
Date: Mon, 5 Nov 2018 11:24:29 +0000
Message-ID: <4f636dde-674a-1793-7798-c475065615a1@nvidia.com>
References: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Lee,

On 19/10/2018 14:22, Jon Hunter wrote:
> From: Jonathan Hunter <jonathanh@nvidia.com>
> 
> The tps6586x driver creates an irqchip that is used by its various child
> devices for managing interrupts. The tps6586x-rtc device is one of its
> children that uses the tps6586x irqchip. When using the tps6586x-rtc as
> a wake-up device from suspend, the following is seen:
> 
>  PM: Syncing filesystems ... done.
>  Freezing user space processes ... (elapsed 0.001 seconds) done.
>  OOM killer disabled.
>  Freezing remaining freezable tasks ... (elapsed 0.000 seconds) done.
>  Disabling non-boot CPUs ...Hi 
>  Entering suspend state LP1
>  Enabling non-boot CPUs ...
>  CPU1 is up
>  tps6586x 3-0034: failed to read interrupt status
>  tps6586x 3-0034: failed to read interrupt status
> 
> The reason why the tps6586x interrupt status cannot be read is because
> the tps6586x interrupt is not masked during suspend and when the
> tps6586x-rtc interrupt occurs, to wake-up the device, the interrupt is
> seen before the i2c controller has been resumed in order to read the
> tps6586x interrupt status.
> 
> The tps6586x-rtc driver sets it's interrupt as a wake-up source during
> suspend, which gets propagated to the parent tps6586x interrupt.
> However, the tps6586x-rtc driver cannot disable it's interrupt during
> suspend otherwise we would never be woken up and so the tps6586x must
> disable it's interrupt instead.
> 
> Prevent the tps6586x interrupt handler from executing on exiting suspend
> before the i2c controller has been resumed by disabling the tps6586x
> interrupt on entering suspend and re-enabling it on resuming from
> suspend.
> 
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Thierry and Dmitry have acked/reviewed this, let me know if you have any
comments.

Cheers
Jon

-- 
nvpublic

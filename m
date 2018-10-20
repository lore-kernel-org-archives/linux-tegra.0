From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] mfd: tps6586x: Handle interrupts on suspend
Date: Sun, 21 Oct 2018 00:18:02 +0300
Message-ID: <79285505-02de-5616-0c95-87586e4a8919@gmail.com>
References: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/19/18 4:22 PM, Jon Hunter wrote:
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
>  Disabling non-boot CPUs ...
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

Tested patch on linux-next and v4.14, works fine. Thank you!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>

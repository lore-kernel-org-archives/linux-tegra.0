From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: tps6586x: Handle interrupts on suspend
Date: Tue, 13 Nov 2018 07:52:56 +0000
Message-ID: <20181113075256.GE29388@dell>
References: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
 <4f636dde-674a-1793-7798-c475065615a1@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4f636dde-674a-1793-7798-c475065615a1@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 05 Nov 2018, Jon Hunter wrote:

> Hi Lee,
> 
> On 19/10/2018 14:22, Jon Hunter wrote:
> > From: Jonathan Hunter <jonathanh@nvidia.com>
> > 
> > The tps6586x driver creates an irqchip that is used by its various child
> > devices for managing interrupts. The tps6586x-rtc device is one of its
> > children that uses the tps6586x irqchip. When using the tps6586x-rtc as
> > a wake-up device from suspend, the following is seen:
> > 
> >  PM: Syncing filesystems ... done.
> >  Freezing user space processes ... (elapsed 0.001 seconds) done.
> >  OOM killer disabled.
> >  Freezing remaining freezable tasks ... (elapsed 0.000 seconds) done.
> >  Disabling non-boot CPUs ...Hi 
> >  Entering suspend state LP1
> >  Enabling non-boot CPUs ...
> >  CPU1 is up
> >  tps6586x 3-0034: failed to read interrupt status
> >  tps6586x 3-0034: failed to read interrupt status
> > 
> > The reason why the tps6586x interrupt status cannot be read is because
> > the tps6586x interrupt is not masked during suspend and when the
> > tps6586x-rtc interrupt occurs, to wake-up the device, the interrupt is
> > seen before the i2c controller has been resumed in order to read the
> > tps6586x interrupt status.
> > 
> > The tps6586x-rtc driver sets it's interrupt as a wake-up source during
> > suspend, which gets propagated to the parent tps6586x interrupt.
> > However, the tps6586x-rtc driver cannot disable it's interrupt during
> > suspend otherwise we would never be woken up and so the tps6586x must
> > disable it's interrupt instead.
> > 
> > Prevent the tps6586x interrupt handler from executing on exiting suspend
> > before the i2c controller has been resumed by disabling the tps6586x
> > interrupt on entering suspend and re-enabling it on resuming from
> > suspend.
> > 
> > Cc: stable@vger.kernel.org
> > 
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> 
> Thierry and Dmitry have acked/reviewed this, let me know if you have any
> comments.

Best thing you can do to regain attention on a potentially forgotten
submission is to collect any Acks you have accrued (if any) and submit
a [RESEND].

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

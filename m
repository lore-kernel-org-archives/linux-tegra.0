From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] i2c: busses: i2c-tegra: Using suspend_noirq()/resume_noirq()
 for suspend/resume
Date: Sun, 27 Mar 2011 23:34:07 -0700
Message-ID: <AANLkTincyBK2nF09hdK121m+uxgdVkVUg6qqc=q3=oU4@mail.gmail.com>
References: <1301293376-28224-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1301293376-28224-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, snanda-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 27, 2011 at 11:22 PM,  <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> When use rtc-tps6586x wakealarm to suspend/resume,
> it will show a lot error messages:
> "tps6586x 4-0034: failed to read interrupt status
> tps6586x 4-0034: failed reading from 0xb5"
> After resume, the system will call tps6586x_irq() because of the alarm
> interrupt. This irq handle will read tps6586x interrupt status (0xb5), but at
> that time the i2c driver didn't resume yet, the system didn't call the
> tegra_i2c_resume(), so the reading will be failed.
> I2C driver needs to be suspended late and resumed early than other drivers.
> So, I2C driver uses the suspend_noirq/resume_noirq callbacks of struct dev_pm_ops
> for early/late power management system.

This sounds like a bug in rtc-tps6586x.  I think you need to call
disable_irq in the rtc-tps6586x suspend function and an enable_irq in
the resume function, which will delay the delivery of the wake irq
until the rtc driver (and its parent, the i2c driver) has been
resumed.

From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v1] i2c: tegra: Remove suspend-resume
Date: Wed, 30 May 2018 16:29:45 +0530
Message-ID: <7b93f6b0-0e09-d8e0-b48e-4ef518c3bd9f@nvidia.com>
References: <20180513211347.7187-1-digetx@gmail.com>
 <20180514115933.GH18312@ulmo>
 <d83fc1f7-d5e5-4211-1cd8-babcabdd9c4b@nvidia.com>
 <5949e650-8ab5-b4bb-196d-5a0705383141@gmail.com>
 <20180529180659.f5s56nstykztvykr@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529180659.f5s56nstykztvykr@ninjato>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Shardar Shariff Md <smohammed@nvidia.com>, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On Tuesday 29 May 2018 11:36 PM, Wolfram Sang wrote:
>>> Our I2C driver is based on the interrupt. So we have converted the
>>> suspend/resume to suspend_noirq and reseume_noirq so that we will not allow the
>>> transfer when system interrupt disabled in downstream.
>>>            SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
>>>
>>> In shutdown path, where interrupt disabled and still need i2c, we use the
>>> bit-bang method via GPIO for i2c transfer.
>> In the current upstream kernel suspend/resume can't be simply moved to the
>> 'noirq' stage because resume invokes tegra_i2c_init() which uses runtime PM and
>> that doesn't work with the IRQ's being disabled. But things do not work even
>> with the tegra_i2c_init() changed to work with the disabled IRQ's, like I wrote
>> above the I2C transfer fails (due to timeout) and a "fix" for that failure was
>> to remove reset_control_assert/deassert from the tegra_i2c_init(). So I'd go for
>> a complete suspend/resume removal for now as it is causes problem.
> Laxman, are you convinced or do you have still objections?
Fine with me. Please add my Ack

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

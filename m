From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2] mfd: tps65910: Add wakeup support
Date: Sun, 19 Feb 2012 13:12:38 +0530
Message-ID: <4F40A7EE.8060805@nvidia.com>
References: <1327304775-12202-1-git-send-email-ldewangan@nvidia.com> <20120126105452.GB8041@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120126105452.GB8041@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, "jedu@slimlogic.co.uk" <jedu@slimlogic.co.uk>, "lrg@slimlogic.co.uk" <lrg@slimlogic.co.uk>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Samuel,
Can you please review this patch? This is require in order of enabling 
the wakeup from sub devices of this pmic device like  rtc/onkey.

Thanks,
Laxman

On Thursday 26 January 2012 04:24 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Mon, Jan 23, 2012 at 01:16:15PM +0530, Laxman Dewangan wrote:
>> Implementing irq_set_wake() so that device should able
>> to wakeup the system through different interrupt provided
>> by this device like gpios, onkey, rtc etc.
> Reviewed-by: Mark Brown<broonie@opensource.wolfsonmicro.com>
>
> It will have the side effect of making all interrupts on the PMIC wake
> if any of them does but I suspect this is actually going to be fine in
> practice.
>
> * Unknown Key
> * 0x6E30FDDD

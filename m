From: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] hwspinlock: core: support for TEGRA hardware spinlocks
Date: Tue, 15 Nov 2011 13:42:57 +0530
Message-ID: <4EC21F09.5050206@nvidia.com>
References: <1321334342-3283-1-git-send-email-vwadekar@nvidia.com> <20111115065104.GA5705@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111115065104.GA5705-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org" <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


>> TEGRA has a hardware spinlock block which is used
>> to get exclusive access to the hardware blocks either
>> from the CPU or the COP. The TEGRA hardware spinlock
>> block has the capability to interrupt the requester
>> on success. For this the core need not disable
>> preemption or interrupts before calling into the
>> actual driver. Add lock_timeout to the ops structure
>> to facilitate this working and to maintain backward
>> compatibility.
> You're using "TEGRA" in the patch description, but below it is spelled
> "Tegra". Should this be made consistent?
>
> Also, this patch should probably be paired with a patch that actually uses
> the new field. That would make it easier to understand the reason for this
> change.
>

Actually, the basic idea is to keep preemption and interrupts enabled
for SoCs similar to Tegra. Since the previous architecture is designed
for the OMAP line of preocessors, fitting the Tegra hwspinlock driver
was not possible. Instead of going about changing the framework and then
the OMAP drivers, I thought of adding another callback to the ops
structure which can sleep and does not need interrupts to be disabled.

From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/5] i2c: tegra: convert normal suspend/resume to *_noirq
Date: Thu, 12 Jul 2012 16:00:32 +0530
Message-ID: <4FFEA748.9080109@nvidia.com>
References: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com> <1341919244-23327-6-git-send-email-ldewangan@nvidia.com> <20120712103509.GF27520@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120712103509.GF27520-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 12 July 2012 04:05 PM, Wolfram Sang wrote:
> * PGP Signed by an unknown key
>
> On Tue, Jul 10, 2012 at 04:50:44PM +0530, Laxman Dewangan wrote:
>> To provide the late suspend and early resume for i2c
>> driver, convert the suspend/resume as
>> 	suspend->  suspend_noirq
>> 	resume ->  resume_noirq
>>
>> Signed-off-by: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Applied to next on top of Rafael's patches. Please have a look if I did
> the fixup right.
Thanks for taking care.
Can you please point me your git path so that I can verify it?

Thanks,
Laxman

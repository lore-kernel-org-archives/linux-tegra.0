From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] i2c: busses: i2c-tegra: Using
 suspend_noirq()/resume_noirq() for suspend/resume
Date: Mon, 28 Mar 2011 17:56:14 +0800
Message-ID: <6B4D417B830BC44B8026029FD256F7F1C2CB3DD494@HKMAIL01.nvidia.com>
References: <1301293376-28224-1-git-send-email-wni@nvidia.com>
	<AANLkTincyBK2nF09hdK121m+uxgdVkVUg6qqc=q3=oU4@mail.gmail.com>
	<6B4D417B830BC44B8026029FD256F7F1C2CB3DD493@HKMAIL01.nvidia.com>
 <AANLkTikkNCmWOjo=u1_1qdOkCq1QH6MAuEXC4KzjHORm@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikkNCmWOjo=u1_1qdOkCq1QH6MAuEXC4KzjHORm-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Colin Cross' <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "snanda-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <snanda-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi, Cross
Sorry, I made some confusion.
In my description for this upstream, I said the tps6586x_irq() will try to read register before i2c resume.
In here, the tps6586x_irq() is from drivers/mfd/tps6586x.c, not drivers/rtc/rtc-tps6586x.c
I had tried to add disable/enable in suspend/resume for this mfd tps6586x driver, it also can fix this issue.
So does there mean we should change the /drivers/mfd/tps6586x.c ?

Thanks
Wei.

-----Original Message-----
From: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org [mailto:ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org] On Behalf Of Colin Cross
Sent: Monday, March 28, 2011 3:05 PM
To: Wei Ni
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org; ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; snanda-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Varun Wadekar
Subject: Re: [PATCH] i2c: busses: i2c-tegra: Using suspend_noirq()/resume_noirq() for suspend/resume

On Sun, Mar 27, 2011 at 11:59 PM, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi, Colin
> The irq in rtc-tps6586x is the alarm interrupt, I had tried to disable/enable it
> as you said, but the system couldn't be resumed by wakealarm.
> I think it's better to change the i2c-tegra.c

Disabling an interrupt does not prevent waking from suspend on that
interrupt if enable_irq_wake has also been called.

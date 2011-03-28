From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] i2c: busses: i2c-tegra: Using suspend_noirq()/resume_noirq()
 for suspend/resume
Date: Mon, 28 Mar 2011 00:04:47 -0700
Message-ID: <AANLkTikkNCmWOjo=u1_1qdOkCq1QH6MAuEXC4KzjHORm@mail.gmail.com>
References: <1301293376-28224-1-git-send-email-wni@nvidia.com>
	<AANLkTincyBK2nF09hdK121m+uxgdVkVUg6qqc=q3=oU4@mail.gmail.com>
	<6B4D417B830BC44B8026029FD256F7F1C2CB3DD493@HKMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6B4D417B830BC44B8026029FD256F7F1C2CB3DD493-Q4EWCATADntDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "snanda-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <snanda-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 27, 2011 at 11:59 PM, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi, Colin
> The irq in rtc-tps6586x is the alarm interrupt, I had tried to disable/enable it
> as you said, but the system couldn't be resumed by wakealarm.
> I think it's better to change the i2c-tegra.c

Disabling an interrupt does not prevent waking from suspend on that
interrupt if enable_irq_wake has also been called.

From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1] mfd: tps65910: Initialize irq platform data properly
Date: Tue, 21 Feb 2012 11:08:12 +0530
Message-ID: <4F432DC4.1060508@nvidia.com>
References: <1326898156-11293-1-git-send-email-ldewangan@nvidia.com> <20120220164506.GZ5387@sortiz-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120220164506.GZ5387@sortiz-mobl>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thanks Samuel for taking care.

On Monday 20 February 2012 10:15 PM, Samuel Ortiz wrote:
> Hi Laxman,
>
> On Wed, Jan 18, 2012 at 08:19:16PM +0530, Laxman Dewangan wrote:
>> irq_base of the tps65910 irq platform data should be
>> initialized with the board provided irq_base data.
> Thanks, patch applied to both my for-next and for-linus branches.
>
> Cheers,
> Samuel.
>

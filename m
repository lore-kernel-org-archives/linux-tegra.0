From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFT PATCH 1/2] i2c: tegra: update CONFIG_LOAD for new conifiguration
Date: Thu, 16 Jul 2015 15:46:12 +0530
Message-ID: <55A7846C.6080208@nvidia.com>
References: <1435661667-11554-1-git-send-email-ldewangan@nvidia.com> <559D89D8.50500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <559D89D8.50500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrewc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Wolfram,

On Thursday 09 July 2015 02:06 AM, Stephen Warren wrote:
> On 06/30/2015 04:54 AM, Laxman Dewangan wrote:
>> Once the new configuration is set on the conifg register of
>> I2C controller, it is require to update the CONFIG_LOAD register
>> to transfer the new SW configuration to actual HW internal
>> registers that would be used in the actual logic.

Can you please review this series?

Thanks,
Laxman

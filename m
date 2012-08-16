From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: I2_M_NOSTART functionality not supported
 in Tegra20
Date: Thu, 16 Aug 2012 12:37:59 +0530
Message-ID: <502C9C4F.8090300@nvidia.com>
References: <1344935949-26709-1-git-send-email-ldewangan@nvidia.com> <502A817C.4000601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <502A817C.4000601-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 14 August 2012 10:19 PM, Stephen Warren wrote:
> On 08/14/2012 03:19 AM, Laxman Dewangan wrote:
>> Tegra20 i2c controller does not support the continue transfer
>> which implements the I2C_M_NOSTART functionality of i2c
>> protocol mangling.
>> Removing the I2C_M_NOSTART functionality for Tegra20.
>>
>> Signed-off-by: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Reported-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Stephen Warren<swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>
> Note that if I take Laxman's I2C driver clock patches through the Tegra
> tree, and Wolfram takes this patch through the I2C tree, there will be a
> very slight conflict, since adjacent lines are touched. However, the
> resolution is simple and obvious, so I think that's fine.

Stephen/Wolfram,
I have 2 more change to implement runtime PM and dynamic clock control 
for fast clock which I have planned for 3.7.
I think it will be better if this also goes on same tree where the clock 
related change are available to avoid the merge conflict.

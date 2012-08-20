From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/2] i2c: tegra: I2_M_NOSTART functionality not supported
 in Tegra20
Date: Mon, 20 Aug 2012 11:36:16 -0600
Message-ID: <50327590.1080700@wwwdotorg.org>
References: <1345317467-22258-1-git-send-email-ldewangan@nvidia.com> <503270B3.7000007@wwwdotorg.org> <50326F82.3050503@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50326F82.3050503-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/20/2012 11:10 AM, Laxman Dewangan wrote:
> On Monday 20 August 2012 10:45 PM, Stephen Warren wrote:
>> On 08/18/2012 01:17 PM, Laxman Dewangan wrote:
>>> Tegra20 i2c controller does not support the continue transfer
>>> which implements the I2C_M_NOSTART functionality of i2c
>>> protocol mangling.
>>> Removing the I2C_M_NOSTART functionality support for Tegra20.
>> Thanks, applied the series to Tegra's for-3.7/drivers-i2c branch.
>>
>> Note that I had to fix up patch 1 to remove const on the tegra*_i2c_hw
>> variable declarations to avoid compiler warnings when assigning pointers
>> into tegra_i2c_of_match[].data.
>
> Thanks for correction but
> I did not get this warning and when saw the structure, it is declared as
> const type only..

Ah. This is something new in linux-next but not in 3.6-rc2. It was
introduced by:

98d7bbb of: add const to struct *of_device_id.data

I'll revert the modifications I made to the patch, and ignore the
warnings in Tegra's for-next; they won't be present in 3.7 presumably.

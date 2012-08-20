From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] i2c: tegra: I2_M_NOSTART functionality not supported
 in Tegra20
Date: Mon, 20 Aug 2012 22:40:26 +0530
Message-ID: <50326F82.3050503@nvidia.com>
References: <1345317467-22258-1-git-send-email-ldewangan@nvidia.com> <503270B3.7000007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <503270B3.7000007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 20 August 2012 10:45 PM, Stephen Warren wrote:
> On 08/18/2012 01:17 PM, Laxman Dewangan wrote:
>> Tegra20 i2c controller does not support the continue transfer
>> which implements the I2C_M_NOSTART functionality of i2c
>> protocol mangling.
>> Removing the I2C_M_NOSTART functionality support for Tegra20.
> Thanks, applied the series to Tegra's for-3.7/drivers-i2c branch.
>
> Note that I had to fix up patch 1 to remove const on the tegra*_i2c_hw
> variable declarations to avoid compiler warnings when assigning pointers
> into tegra_i2c_of_match[].data.
Thanks for correction but
I did not get this warning and when saw the structure, it is declared as 
const type only..
struct of_device_id
{
         char    name[32];
         char    type[32];
         char    compatible[128];
#ifdef __KERNEL__
         const void *data;
#else
         kernel_ulong_t data;
#endif
};

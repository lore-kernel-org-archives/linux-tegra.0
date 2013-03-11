From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 2/5] rtc: tegra: Use struct dev_pm_ops for power management
Date: Mon, 11 Mar 2013 11:18:38 -0600
Message-ID: <513E11EE.1020405@wwwdotorg.org>
References: <1362991468-30226-1-git-send-email-ldewangan@nvidia.com> <1362991468-30226-3-git-send-email-ldewangan@nvidia.com> <20130311085132.GA7900@avionic-0098.mockup.avionic-design.de> <513D9C48.8090505@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <513D9C48.8090505-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/11/2013 02:56 AM, Laxman Dewangan wrote:
> On Monday 11 March 2013 02:21 PM, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Mon, Mar 11, 2013 at 02:14:25PM +0530, Laxman Dewangan wrote:
>> [...]
>>> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
>> [...]
>>> @@ -431,6 +430,8 @@ static int tegra_rtc_resume(struct
>>> platform_device *pdev)
>>>   }
>>>   #endif
>>>   +SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend,
>>> tegra_rtc_resume);
>> I should've been more explicit. Since you had this marked as static in
>> the previous patch, this needs to be static SIMPLE_DEV_PM_OPS.
> Yaah, I should keep the static.
> 
> I think I will need to respin this patch only in place of whole series.
> 
> Andrew,
> 
> Let me know if this is fine.

In general, it's much easier if you repost a whole series. Otherwise,
you make the maintainer manually piece together the series from bits of
V2 and bits of V3, which is harder than just grabbing all of V3.
